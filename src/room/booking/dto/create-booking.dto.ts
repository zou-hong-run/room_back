import { IsNotEmpty, IsNumber } from 'class-validator';

export class CreateBookingDto {
  @IsNotEmpty({ message: '会议室id不能为空' })
  @IsNumber()
  meeting_id: number;

  @IsNotEmpty({ message: '会议开始时间不能为空' })
  @IsNumber()
  start_time: number;

  @IsNotEmpty({ message: '会议结束时间不能为空' })
  @IsNumber()
  end_time: number;

  note: string;
}
