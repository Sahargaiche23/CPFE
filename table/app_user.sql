prompt PL/SQL Developer import file
prompt Created on mardi 2 décembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.APP_USER...
drop table COPT.APP_USER cascade constraints;
prompt Creating COPT.APP_USER...
create table COPT.APP_USER
(
  id       NUMBER(11) not null,
  username VARCHAR2(50),
  password VARCHAR2(50),
  identite VARCHAR2(100),
  profil   VARCHAR2(10),
  bur_cod  NUMBER(2)
)
nologging;
alter table COPT.APP_USER
  add constraint PK_TEST_USER primary key (ID);

prompt Loading COPT.APP_USER...
insert into COPT.APP_USER (id, username, password, identite, profil, bur_cod)
values (3, 'user', 'user', 'Simple User', 'user', 12);
insert into COPT.APP_USER (id, username, password, identite, profil, bur_cod)
values (1, '68866', '68866', 'AHDI KADDES', 'admin', 81);
insert into COPT.APP_USER (id, username, password, identite, profil, bur_cod)
values (2, '1', '1', 'AHDI AHDI', 'admin', 81);
insert into COPT.APP_USER (id, username, password, identite, profil, bur_cod)
values (4, '68924', '19031980', 'marouen', 'admin', 10);
insert into COPT.APP_USER (id, username, password, identite, profil, bur_cod)
values (5, '65714', '65714', 'mounira', 'admin', 85);
commit;
prompt 5 records loaded
set feedback on
set define on
prompt Done.
