import {
  Controller,
  Get,
  Post,
  Body,
  Query,
  DefaultValuePipe,
  Param,
  Delete,
  Patch,
} from '@nestjs/common';
import { MeetingService } from './meeting.service';
import { CreateMeetingDto } from './dto/create-meeting.dto';
import { UpdateMeetingDto } from './dto/update-meeting.dto';
import { generateParseIntPipe } from 'src/utils/common';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('会议室管理')
@Controller('meeting')
export class MeetingController {
  constructor(private readonly meetingService: MeetingService) {}

  /**
   * 获取会议室列表
   * @param page_no
   * @param page_size
   * @param name
   * @param capacity
   * @param equipment
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
    @Query('name') name: string,
    @Query('capacity') capacity: number,
    @Query('equipment') equipment: string,
    @Query('location') location: string,
    @Query('description') description: string,
  ) {
    return await this.meetingService.find(
      page_no,
      page_size,
      name,
      capacity,
      equipment,
      location,
      description,
    );
  }

  /**
   * 创建会议室
   * @param meetingDto
   */
  @Post('create')
  async create(@Body() meetingDto: CreateMeetingDto) {
    return await this.meetingService.create(meetingDto);
  }

  /**
   * 更新会议室信息
   * @param meetingDto
   */
  @Patch('update')
  async update(@Body() meetingDto: UpdateMeetingDto) {
    return await this.meetingService.update(meetingDto);
  }

  /**
   * 根据id查询单个会议室
   * @param id
   * @returns
   */
  @Get(':id')
  async find(@Param('id') id: number) {
    return await this.meetingService.findById(id);
  }

  /**
   * 根据id删除会议室
   * @param id
   * @returns
   */
  @Delete(':id')
  async delete(@Param('id') id: number) {
    return await this.meetingService.delete(id);
  }
}
