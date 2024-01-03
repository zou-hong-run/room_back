import {
  Body,
  Controller,
  DefaultValuePipe,
  Get,
  Param,
  Post,
  Query,
  Req,
} from '@nestjs/common';
import { BookingService } from './booking.service';
import { generateParseIntPipe } from 'src/utils/common';
import { ApiTags } from '@nestjs/swagger';
import { CreateBookingDto } from './dto/create-booking.dto';
import { Request } from 'express';

@ApiTags('预定会议室管理')
@Controller('booking')
export class BookingController {
  constructor(private readonly bookingService: BookingService) {}

  /**
   * 获取预定列表
   * @param page_no
   * @param page_size
   * @param user_name
   * @param meeting_name
   * @param meeting_position
   * @param booking_time_range_start
   * @param booking_time_range_end
   * @returns
   */
  @Get('list')
  async list(
    @Query('page_no', new DefaultValuePipe(1), generateParseIntPipe('page_no'))
    page_no: number,
    @Query(
      'page_size',
      new DefaultValuePipe(10),
      generateParseIntPipe('page_size'),
    )
    page_size: number,
    @Query('user_name') user_name: string,
    @Query('meeting_name') meeting_name: string,
    @Query('meeting_position') meeting_position: string,
    @Query('booking_time_range_start') booking_time_range_start: number,
    @Query('booking_time_range_end') booking_time_range_end: number,
  ) {
    return this.bookingService.find(
      page_no,
      page_size,
      user_name,
      meeting_name,
      meeting_position,
      booking_time_range_start,
      booking_time_range_end,
    );
  }

  /**
   * 提交预定会议室申请
   * @param booking
   * @param req
   * @returns
   */
  @Post('add')
  async add(@Body() booking: CreateBookingDto, @Req() req: Request) {
    let user_id = req.user.user_id;
    return await this.bookingService.add(booking, user_id);
  }

  /**
   * 审批通过预定
   * @param id
   * @returns
   */
  @Get('apply/:id')
  async apply(@Param('id') id: number) {
    return this.bookingService.apply(id);
  }

  /**
   * 审批驳回
   * @param id
   * @returns
   */
  @Get('reject/:id')
  async reject(@Param('id') id: number) {
    return this.bookingService.reject(id);
  }

  /**
   * 预定解除
   * @param id
   * @returns
   */
  @Get('unbind/:id')
  async unbind(@Param('id') id: number) {
    return this.bookingService.unbind(id);
  }

  @Get('history')
  async history() {}

  /**
   * 催办
   * @param id
   * @returns
   */
  @Get('urge/:id')
  async urge(@Param('id') id: number) {
    return this.bookingService.urge(id);
  }
}
