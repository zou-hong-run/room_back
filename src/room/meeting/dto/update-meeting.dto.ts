import { PartialType } from '@nestjs/swagger';
import { CreateMeetingDto } from './create-meeting.dto';
import { IsNotEmpty } from 'class-validator';

export class UpdateMeetingDto extends PartialType(CreateMeetingDto) {
  @IsNotEmpty({
    message: 'ID不能为空',
  })
  id: number;
}
