import { ApiProperty } from '@nestjs/swagger';
import { IsEmail, IsNotEmpty, MinLength } from 'class-validator';
export class CreateUserDto {
  @ApiProperty()
  @IsNotEmpty({
    message: '用户名不能为空',
  })
  user_name: string;

  @ApiProperty()
  @IsNotEmpty({
    message: '昵称不能为空',
  })
  nick_name: string;

  @ApiProperty()
  @IsNotEmpty({
    message: '密码不能为空',
  })
  @MinLength(6, {
    message: '密码不能少于6位',
  })
  password: string;

  @ApiProperty()
  @IsNotEmpty({
    message: '邮箱不能为空',
  })
  @IsEmail(
    {},
    {
      message: '不是合法的邮箱',
    },
  )
  email: string;

  @ApiProperty()
  @IsNotEmpty({
    message: '手机号不能为空',
  })
  phone_number: string;

  @ApiProperty()
  @IsNotEmpty({
    message: '性别不能为空',
  })
  gender: string;

  @ApiProperty()
  remark: string;

  @ApiProperty()
  @IsNotEmpty({
    message: '部门不能为空',
  })
  dept_ids: number[];

  @ApiProperty()
  @IsNotEmpty({
    message: '岗位不能为空',
  })
  post_ids: number[];

  @ApiProperty()
  @IsNotEmpty({
    message: '角色不能为空',
  })
  role_ids: number[];
}
