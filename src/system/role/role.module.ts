import { Module } from '@nestjs/common';
import { RoleService } from './role.service';
import { RoleController } from './role.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Role } from './entities/role.entity';
import { Menu } from '../menu/entities/menu.entity';
import { Dept } from '../dept/entities/dept.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Role, Menu, Dept])],
  controllers: [RoleController],
  providers: [RoleService],
  exports: [RoleService],
})
export class RoleModule {}
