create table sys_user
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

insert into sys_user value (1,'sheen','sheen123','sheen','sheen@123.com','15600000000','1',sysdate(),'1111111111',100,'管理','江西','127.1','1','hh');
insert into sys_user value (2,'qqq','qqq123','sheen','qqq@123.com','15600000001','1',sysdate(),'2222222222',100,'运维','上海','127.2','2','ww');
insert into sys_user value (3,'www','www123','www','www@123.com','15600000002','1',sysdate(),'22222222',100,'物流','北京','127.3','3','ee');

create table sys_role
(
    role_id   bigint(20)   not null auto_increment comment '角色ID',
    role_name varchar(30)  not null comment '角色名称',
    role_key  varchar(100) not null comment '角色权限字符串',
    role_sort int(4)       not null comment '显示顺序',
    status    char(1)      not null comment '角色状态（0正常 1停用）',
    del_flag  char(1)      default '0' comment '删除标志（0代表存在 2代表删除）',
    remark    varchar(500) default null comment '备注',
    primary key (role_id)
) engine = innodb
  auto_increment = 100 comment = '角色表';

insert into sys_role
values ('1', '管理员', 'admin', 1, '0', '0', '超级管理员');
insert into sys_role
values ('2', '测试者', 'test', 2, '0', '0', '普通角色');
insert into sys_role
values ('3', '被测者', 'tested', 3, '0', '0', '普通角色');


create table sys_user_role
(
    user_id bigint(20) not null comment '用户ID',
    role_id bigint(20) not null comment '角色ID',
    primary key (user_id, role_id)
) engine = innodb comment = '用户和角色关联表';


create table sys_power
(
    power_id      bigint(20)  not null auto_increment comment '权限ID',
    power_name    varchar(30) not null comment '权限名称',
    power_type    char(1)     not null comment '权限类型（1：可操作2:可访问）',
    power_comment varchar(100) default '' comment '权限描述',
    create_time     datetime           comment '创建时间',
    remark        varchar(500)    default ''      comment '备注',
    primary key (power_id)
)engine = innodb auto_increment = 2000 comment = '权限表';


insert into sys_power
values ('1' ,'公告系统', '1', '公告系统', sysdate(), '');
insert into sys_power
values ('2','内部邮箱系统', '1', '内部邮箱系统', sysdate(), '');
insert into sys_power
values ('3','用户管理', '1','用户管理', sysdate(), '');
insert into sys_power
values ('4' ,'任务管理', '1','任务管理', sysdate(), '');
insert into sys_power
values ('5', '内部服务器集群管理', '1', '内部服务器集群管理', sysdate(), '');
insert into sys_power
values ('100', '发布公告', '1','发布公告', sysdate(), '');
insert into sys_power
values ('101','删除公告', '1', '删除公告', sysdate(), '');
insert into sys_power
values ('102','菜单管理', '1', '菜单管理', sysdate(), '');
insert into sys_power
values ('6','发布任务', '1', '发布任务', sysdate(), '');
insert into sys_power
values ('7','任务状态', '1', '任务状态', sysdate(), '');
insert into sys_power
values ('600','开始任务', '1', '开始任务', sysdate(), '');
insert into sys_power
values ('601','暂停任务', '1', '暂停任务', sysdate(), '');
insert into sys_power
values ('602','结束任务', '1', '结束任务', sysdate(), '');
insert into sys_power
values ('700','查看测试结果', '1', '查看测试结果', sysdate(), '');


drop table if exists sys_role_power;
create table sys_role_power
(
    role_id bigint(20) not null comment '角色ID',
    power_id bigint(20) not null comment '权限ID',
    primary key (role_id, power_id)
) engine = innodb comment = '角色和权限关联表';

