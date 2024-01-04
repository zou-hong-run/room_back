import {
  BadRequestException,
  HttpException,
  HttpStatus,
  Injectable,
} from '@nestjs/common';
import { CreateMeetingDto } from './dto/create-meeting.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Meeting } from './entities/meeting.entity';
import { Like, Repository } from 'typeorm';
import { UpdateMeetingDto } from './dto/update-meeting.dto';

@Injectable()
export class MeetingService {
  @InjectRepository(Meeting)
  private repository: Repository<Meeting>;

  async find(
    page_no: number,
    page_size: number,
    name: string,
    capacity: number,
    equipment: string,
    location: string,
    description: string,
  ) {
    if (page_no < 1) {
      throw new BadRequestException('页码最小为 1');
    }
    const skipCount = (page_no - 1) * page_size;

    const condition: Record<string, any> = {};

    if (name) {
      condition.name = Like(`%${name}%`);
    }
    if (equipment) {
      condition.equipment = Like(`%${equipment}%`);
    }
    if (capacity) {
      condition.capacity = capacity;
    }
    if (location) {
      condition.location = location;
    }
    if (description) {
      condition.description = description;
    }

    const [meetings, totalCount] = await this.repository.findAndCount({
      skip: skipCount,
      take: page_size,
      where: condition,
    });

    return {
      meetings,
      totalCount,
    };
  }
  async create(mettingDto: CreateMeetingDto) {
    const meeting = await this.repository.findOneBy({
      name: mettingDto.name,
    });
    if (meeting) {
      throw new BadRequestException('会议室已经存在');
    }
    try {
      await this.repository.save(mettingDto);
      return '添加会议室成功';
    } catch (error) {
      throw new HttpException(`添加会议室失败${error}`, HttpStatus.BAD_REQUEST);
    }
  }
  async update(meetingDto: UpdateMeetingDto) {
    const meeting = await this.repository.findOneBy({
      id: meetingDto.id,
    });
    if (!meeting) {
      throw new BadRequestException('会议室不存在');
    }
    meeting.capacity = meetingDto.capacity;
    meeting.location = meetingDto.location;
    meeting.name = meetingDto.name;
    if (meetingDto.description) {
      meeting.description = meetingDto.description;
    }
    if (meetingDto.equipment) {
      meeting.description = meetingDto.equipment;
    }
    try {
      await this.repository.update(
        {
          id: meeting.id,
        },
        meeting,
      );
      return '更新会议室成功';
    } catch (error) {
      throw new HttpException(`更新会议室失败${error}`, HttpStatus.BAD_REQUEST);
    }
  }
  async findById(id: number) {
    try {
      let meeting = await this.repository.findOneBy({
        id,
      });
      if (meeting) {
        return meeting;
      } else {
        throw '会议室不存在';
      }
    } catch (error) {
      throw new HttpException(`查询失败${error}`, HttpStatus.BAD_REQUEST);
    }
  }
  async delete(id: number) {
    try {
      await this.findById(id);
      await this.repository.delete({
        id,
      });
      return '删除成功';
    } catch (error) {
      throw new HttpException(`删除失败${error}`, HttpStatus.BAD_REQUEST);
    }
  }
}
