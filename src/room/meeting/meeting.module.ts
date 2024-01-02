import { Module } from '@nestjs/common';
import { MeetingService } from './meeting.service';
import { MeetingController } from './meeting.controller';

@Module({
  controllers: [MeetingController],
  providers: [MeetingService],
})
export class MeetingModule {}
