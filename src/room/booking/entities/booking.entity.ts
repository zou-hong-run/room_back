import { Meeting } from 'src/room/meeting/entities/meeting.entity';
import { User } from 'src/system/user/entities/user.entity';
import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('room_booking')
export class Booking {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({
    comment: '会议开始时间',
  })
  start_time: Date;

  @Column({
    comment: '会议结束时间',
  })
  end_time: Date;

  @Column({
    length: 20,
    comment: '状态（申请中，审批通过，审批驳回，已解除）',
    default: '申请中',
  })
  status: string;

  @Column({
    length: 100,
    comment: '备注',
    default: '',
  })
  note: string;

  @ManyToOne(() => User)
  user: User;

  @ManyToOne(() => Meeting)
  meeting: Meeting;

  @CreateDateColumn({
    comment: '创建时间',
  })
  create_time: Date;

  @UpdateDateColumn({
    comment: '更新时间',
  })
  update_time: Date;
}
