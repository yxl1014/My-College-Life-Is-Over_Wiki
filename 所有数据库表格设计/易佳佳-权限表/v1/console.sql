


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
    role_id       bigint(20)  not null comment '角色ID',
    power_name    varchar(30) not null comment '权限名称',
    power_type    char(1)     not null comment '权限类型（1：可操作2:可访问）',
    power_comment varchar(100) default '' comment '权限描述',
    create_time     datetime           comment '创建时间',
    remark        varchar(500)    default ''      comment '备注',
    primary key (power_id)
)engine = innodb auto_increment = 2000 comment = '权限表';


insert into sys_power
values ('1','1' ,'公告系统', '1', '公告系统', sysdate(), '');
insert into sys_power
values ('2', '1','内部邮箱系统', '1', '内部邮箱系统', sysdate(), '');
insert into sys_power
values ('3', '1','用户管理', '1','用户管理', sysdate(), '');
insert into sys_power
values ('4','1' ,'任务管理', '1','任务管理', sysdate(), '');
insert into sys_power
values ('5','1', '内部服务器集群管理', '1', '内部服务器集群管理', sysdate(), '');
insert into sys_power
values ('100','1', '发布公告', '1','发布公告', sysdate(), '');
insert into sys_power
values ('101', '1','删除公告', '1', '删除公告', sysdate(), '');
insert into sys_power
values ('102', '1','菜单管理', '1', '菜单管理', sysdate(), '');
insert into sys_power
values ('6', '1','发布任务', '1', '发布任务', sysdate(), '');
insert into sys_power
values ('7', '1','任务状态', '1', '任务状态', sysdate(), '');
insert into sys_power
values ('600', '1','开始任务', '1', '开始任务', sysdate(), '');
insert into sys_power
values ('601', '1','暂停任务', '1', '暂停任务', sysdate(), '');
insert into sys_power
values ('602', '1','结束任务', '1', '结束任务', sysdate(), '');
insert into sys_power
values ('700', '1','查看测试结果', '1', '查看测试结果', sysdate(), '');


drop table if exists sys_role_power;
create table sys_role_power
(
    role_id bigint(20) not null comment '角色ID',
    power_id bigint(20) not null comment '菜单ID',
    primary key (role_id, power_id)
) engine = innodb comment = '角色和权限关联表';

