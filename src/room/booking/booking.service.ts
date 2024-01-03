import {
  Body,
  HttpException,
  HttpStatus,
  Inject,
  Injectable,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import {
  Between,
  LessThanOrEqual,
  Like,
  MoreThanOrEqual,
  Repository,
} from 'typeorm';
import { Booking } from './entities/booking.entity';
import { RedisService } from 'src/redis/redis.service';
import { EmailService } from 'src/email/email.service';
import { User } from 'src/system/user/entities/user.entity';
import { Meeting } from '../meeting/entities/meeting.entity';
import { CreateBookingDto } from './dto/create-booking.dto';
@Injectable()
export class BookingService {
  @InjectRepository(User)
  private userRepository: Repository<User>;

  @InjectRepository(Meeting)
  private meetingRepository: Repository<Meeting>;

  @InjectRepository(Booking)
  private bookingRepository: Repository<Booking>;

  @Inject(RedisService)
  private redisService: RedisService;
  @Inject(EmailService)
  private emailService: EmailService;

  async find(
    page_no: number,
    page_size: number,
    user_name: string,
    meeting_name: string,
    meeting_position: string,
    booking_time_range_start: number,
    booking_time_range_end: number,
  ) {
    const skipCount = (page_no - 1) * page_size;
    const condition: Record<string, any> = {};
    if (user_name) {
      condition.user = {
        user_name: Like(`%${user_name}%`),
      };
    }

    if (meeting_name) {
      condition.meeting = {
        name: Like(`%${meeting_name}%`),
      };
    }

    if (meeting_position) {
      condition.meeting.location = Like(`%${meeting_position}%`);
    }

    if (booking_time_range_start) {
      if (!booking_time_range_end) {
        // 如果没有传入结束时间，就自动在一小时后结束
        booking_time_range_end = booking_time_range_start + 60 * 60 * 1000;
      }
      condition.start_time = Between(
        new Date(booking_time_range_start),
        new Date(booking_time_range_end),
      );
    }

    const [bookings, totalCount] = await this.bookingRepository.findAndCount({
      // select: {
      //   id: true,
      //   start_time: true,
      //   user: {
      //     id: true,
      //     nickName: true,
      //   },
      // },
      where: condition,
      relations: {
        user: true,
        meeting: true,
      },
      skip: skipCount,
      take: page_size,
    });

    return {
      bookings: bookings.map((item) => {
        delete item.user.password;
        return item;
      }),
      totalCount,
    };
  }

  async add(bookingDto: CreateBookingDto, user_id: number) {
    const meeting = await this.meetingRepository.findOne({
      where: {
        id: bookingDto.meeting_id,
      },
    });
    if (!meeting) {
      throw new HttpException('会议室不存在', HttpStatus.BAD_REQUEST);
    }
    const user = await this.userRepository.findOne({
      where: {
        id: user_id,
      },
    });
    if (!user) {
      throw new HttpException('用户不存在', HttpStatus.BAD_REQUEST);
    }
    const booking = new Booking();
    booking.meeting = meeting;
    booking.user = user;
    booking.start_time = new Date(bookingDto.start_time);
    booking.end_time = new Date(bookingDto.end_time);
    booking.note = bookingDto.note;
    try {
      const res = await this.bookingRepository.findOneBy({
        meeting: meeting,
        start_time: LessThanOrEqual(booking.start_time),
        end_time: MoreThanOrEqual(booking.end_time),
      });
      if (res) {
        throw '该时间段内的房间已经被预定了';
      }
      await this.bookingRepository.save(booking);
      return '预定会议室成功';
    } catch (error) {
      throw new HttpException('预定会议室失败' + error, HttpStatus.BAD_REQUEST);
    }
  }

  async apply(id: number) {
    await this.bookingRepository.update(
      {
        id,
      },
      {
        status: '审批通过',
      },
    );

    return '审批通过';
  }

  async reject(id: number) {
    await this.bookingRepository.update(
      {
        id,
      },
      {
        status: '审批驳回',
      },
    );
    return '审批驳回';
  }

  async unbind(id: number) {
    await this.bookingRepository.update(
      {
        id,
      },
      {
        status: '已解除',
      },
    );
    return '已解除预定';
  }

  async urge(id: number) {
    const flag = await this.redisService.get('urge_' + id);
    if (flag) {
      return '半小时内只能催办一次，请耐心等待';
    } else {
      let email = await this.redisService.get('admin_email');
      if (!email) {
        const admin = await this.userRepository.findOne({
          where: { id: 1 },
          select: { email: true },
        });
        console.log(admin);
        email = admin.email;
        await this.redisService.set('admin_email', admin.email, 60 * 30);
      }
      this.emailService.sendMail({
        to: email,
        subject: '预定申请催发提醒',
        html: `id 为 ${id} 的预定申请正在等待审批`,
      });
      this.redisService.set('urge_' + id, 1, 60 * 30);
      return '催办成功，请耐心等待';
    }
  }
}
