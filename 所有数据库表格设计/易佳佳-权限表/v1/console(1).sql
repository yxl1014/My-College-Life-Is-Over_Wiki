drop table if exists UserInfo;
create table UserInfo
(
    user_id    bigint      not null auto_increment comment '不作为用户登录的id 只是便于系统排序 统计当前注册用户数量',
    user_Name     varchar(50)       not null comment '用户用户名 邮箱 电话都可作为用户账号登录' unique,
    user_NickName  varchar(40)       not null comment '用户昵称',
    user_Password  varchar(20)       not null comment '用户密码',
    user_Email     varchar(30)       not null comment '用户邮箱:xxx@qq.com' unique ,
    user_Telephone varchar(11)       not null comment '用户电话:11位纯数字' unique ,
    user_Gender    tinyint(1)        not null comment '用户性别：男1 女0',
    user_BornDay   date              not null comment '用户出生年月日: 2000/12/1',
    user_IdCard    varchar(18)       not null comment '用户身份证号:18位',
    user_Money     double  default 0 not null comment '用户余额',
    user_Company   varchar(100)      not null comment '用户单位',
    user_Home      varchar(100)      not null comment '用户住址',
    user_Ip        varchar(20)       not null comment '用户IP',
    user_Flag      tinyint default 1 not null comment '无符号tinyint取值范围为-128 到 127 0代表此用户已删除 1代表管理员 -1代表账户停用的管理员 2代表测试者 3代表被测者 -2代表停机的用户',
    user_PersonalProfile varchar(500)comment '用户个人简介',
    primary key (user_id)
)engine =innodb auto_increment=100 comment ='用户信息表';

insert into UserInfo value (1,'sheen','sheen123','sheen','sheen@123.com','15600000000','1',sysdate(),'1111111111',100,'管理','江西','127.1','1','hh');
insert into UserInfo value (2,'qqq','qqq123','sheen','qqq@123.com','15600000001','1',sysdate(),'2222222222',100,'运维','上海','127.2','2','ww');
insert into UserInfo value (3,'www','www123','www','www@123.com','15600000002','1',sysdate(),'22222222',100,'物流','北京','127.3','3','ee');



drop table if exists Role;
create table Role(
    role_id bigint(20) not null  auto_increment comment '角色ID',
    role_Name varchar(20) default '' comment '角色名称',
    code bigint(100) not null   comment '角色权限字符串',
    primary key (role_id)
) engine =innodb auto_increment=100 comment ='角色信息表';


drop table if exists Permission;
create table Permission(
    per_id bigint(20) not null  auto_increment comment '权限ID',
    parent_id bigint(20) default 0 comment '父权限ID',
    per_Name varchar(20) default '' comment '权限名称',
    level int default '1' comment '等级(1：一级 2：二级',
    code bigint(100) not null   comment '权限字符串',
    primary key (per_id)
) engine =innodb auto_increment=100 comment ='权限表';

drop table if exists UserRoleRef;
create table UserRoleRef
(
  user_id   bigint(20) not null comment '用户ID',
  role_id   bigint(20) not null comment '角色ID',
  primary key (user_id, role_id),
    foreign key (user_id) references UserInfo(user_id),
    foreign key (role_id) references Role(role_id)
) engine=innodb comment = '用户与角色关联表';

drop table if exists RolePermissionRef;
create table RolePermissionRef
(
  role_id   bigint(20) not null comment '用户ID',
  per_id   bigint(20) not null comment '角色ID',
  primary key (role_id, per_id),
  foreign key (role_id) references Role(role_id),
  foreign key (per_id) references Permission(per_id)
) engine=innodb comment = '角色与权限关联表';

