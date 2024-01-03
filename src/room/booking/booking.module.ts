import { Module } from '@nestjs/common';
import { BookingService } from './booking.service';
import { BookingController } from './booking.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Booking } from './entities/booking.entity';
import { Meeting } from '../meeting/entities/meeting.entity';
import { User } from 'src/system/user/entities/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Booking, Meeting, User])],
  controllers: [BookingController],
  providers: [BookingService],
})
export class BookingModule {}
