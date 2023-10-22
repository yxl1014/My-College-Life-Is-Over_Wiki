create table sys_user
(
    user_id     bigint(20)  not null auto_increment comment '用户ID',
    user_name   varchar(30) not null comment '用户账号',
    nick_name   varchar(30) not null comment '用户昵称',
    user_type   varchar(2)   default '00' comment '用户类型（00系统用户）',
    email       varchar(50)  default '' comment '用户邮箱',
    phone_number varchar(11)  default '' comment '手机号码',
    sex         char(1)      default '0' comment '用户性别（0男 1女 2未知）',
    avatar      varchar(100) default '' comment '头像地址',
    password    varchar(100) default '' comment '密码',
    status      char(1)      default '0' comment '帐号状态（0正常 1停用）',
    del_flag    char(1)      default '0' comment '删除标志（0代表存在 2代表删除）',
    remark      varchar(500) default null comment '备注',
    primary key (user_id)
) engine = innodb
  auto_increment = 100 comment = '用户表';

insert into sys_user
values (1, 'admin', '管理员', '00', 'aa@163.com', '15888888888', '1', '', '123', '0', '0', '管理员');
insert into sys_user
values (2, 'test', '测试员', '00', 'ww@qq.com', '15666666666', '1', '', '123', '0', '0', '测试员');
insert into sys_user
values (3, 'tested', '被测者', '00', 'eey@qq.com', '15666666666', '1', '', '123', '0', '0', '被测者');


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

