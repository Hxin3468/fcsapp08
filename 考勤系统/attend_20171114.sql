/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/11/14 17:16:50                          */
/*==============================================================*/


drop table if exists T_ATTEND;

drop table if exists T_ORG_ATTEND;

drop table if exists T_USER;

drop table if exists T_USER_ATTEND;

drop table if exists T_USER_ORG_ATTEND;

/*==============================================================*/
/* Table: T_ATTEND                                              */
/*==============================================================*/
create table T_ATTEND
(
   PK_ATTEND_ID         bigint not null,
   FK_ORG_ATTEND_ID     bigint not null,
   ATTEND_TITLE         varchar(255) not null,
   ATTEND_CREATE_BY_ID  bigint not null,
   ATTEND_CREATE_BY_TIME datetime not null,
   ATTEND_LOCATION      varchar(255) not null,
   ATTEND_START_TIME    datetime not null,
   ATTEND_OVER_TIME     datetime not null,
   ATTEND_PEOPLE_NUM    int not null,
   ATTEND_TRUE_NUM      int not null,
   ATTEND_LATE_NUM      int not null,
   ATTEND_FALSE_NUM     int not null,
   ATTEND_WORK_START_TIME datetime not null,
   ATTEND_WORK_OVER_TIME datetime not null,
   primary key (PK_ATTEND_ID)
);

/*==============================================================*/
/* Table: T_ORG_ATTEND                                          */
/*==============================================================*/
create table T_ORG_ATTEND
(
   PK_ORG_ATTEND_ID     bigint not null,
   ORG_ATTEND_NAME      varchar(255) not null,
   ORG_ATTEND_CREATE_BY_ID bigint not null,
   ORG_ATTEND_CREATE_TIME datetime not null,
   ORG_ATTEND_PEOPLE_NUM int not null,
   primary key (PK_ORG_ATTEND_ID)
);

/*==============================================================*/
/* Table: T_USER                                                */
/*==============================================================*/
create table T_USER
(
   PK_USER_ID           bigint not null,
   USER_EMAIL           varchar(255) not null,
   USER_PASSWD          varchar(255) not null,
   USER_NAME            varchar(255) not null,
   USER_PHONE           varchar(255) not null,
   USER_SEX             bool not null,
   USER_IS_LOGIN        bool not null,
   USER_REGISTER_TIME   datetime not null,
   USER_DESCRIPTION     varchar(255) not null,
   USER_LOGIN_TIME      datetime not null,
   USER_LOGIN_IP        varchar(255) not null,
   primary key (PK_USER_ID)
);

/*==============================================================*/
/* Table: T_USER_ATTEND                                         */
/*==============================================================*/
create table T_USER_ATTEND
(
   FK_ATTEND_ID         bigint not null,
   FK_USER_ID           bigint not null,
   ATTEND_TIME          datetime not null,
   ATTEND_STATE         varchar(255) not null,
   primary key (FK_ATTEND_ID, FK_USER_ID)
);

/*==============================================================*/
/* Table: T_USER_ORG_ATTEND                                     */
/*==============================================================*/
create table T_USER_ORG_ATTEND
(
   FK_USER_ID           bigint not null,
   FK_ORG_ATTEND_ID     bigint not null,
   USER_ATTEND_TIME     datetime not null,
   ATTEND_TRUE_NUM      int not null,
   ATTEND_LATE_NUM      int not null,
   ATTEND_FALSE_NUM     int not null,
   primary key (FK_USER_ID, FK_ORG_ATTEND_ID)
);

/*==============================================================*/
/* Foreign Constraint (                                         */
/*                     name:FK_table_referTable)                */
/*==============================================================*/
alter table T_ATTEND add constraint FK_ATTEND_ORG_ATTEND foreign key (FK_ORG_ATTEND_ID)
      references T_ORG_ATTEND (PK_ORG_ATTEND_ID) on delete restrict on update restrict;

alter table T_USER_ATTEND add constraint FK_USER_ATTEND_ATTEND foreign key (FK_ATTEND_ID)
      references T_ATTEND (PK_ATTEND_ID) on delete restrict on update restrict;

alter table T_USER_ATTEND add constraint FK_USER_ATTEND_USER foreign key (FK_USER_ID)
      references T_USER (PK_USER_ID) on delete restrict on update restrict;

alter table T_USER_ORG_ATTEND add constraint FK_USER_ORG_ATTEND_USER foreign key (FK_USER_ID)
      references T_USER (PK_USER_ID) on delete restrict on update restrict;

alter table T_USER_ORG_ATTEND add constraint FK_USER_ORG_ATTEND_ORG_ATTEND foreign key (FK_ORG_ATTEND_ID)
      references T_ORG_ATTEND (PK_ORG_ATTEND_ID) on delete restrict on update restrict;

