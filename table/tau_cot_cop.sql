prompt PL/SQL Developer import file
prompt Created on mardi 2 décembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.TAU_COT_COP...
drop table COPT.TAU_COT_COP cascade constraints;
prompt Creating COPT.TAU_COT_COP...
create table COPT.TAU_COT_COP
(
  tcc_agedeb NUMBER(2) not null,
  tcc_agefin NUMBER(3),
  tcc_taucot NUMBER(8,4)
)
nologging;
alter table COPT.TAU_COT_COP
  add constraint PK_TAU_COT_COP primary key (TCC_AGEDEB);

prompt Loading COPT.TAU_COT_COP...
insert into COPT.TAU_COT_COP (tcc_agedeb, tcc_agefin, tcc_taucot)
values (0, 24, 23);
insert into COPT.TAU_COT_COP (tcc_agedeb, tcc_agefin, tcc_taucot)
values (25, 29, 24);
insert into COPT.TAU_COT_COP (tcc_agedeb, tcc_agefin, tcc_taucot)
values (30, 34, 25);
insert into COPT.TAU_COT_COP (tcc_agedeb, tcc_agefin, tcc_taucot)
values (35, 39, 27);
insert into COPT.TAU_COT_COP (tcc_agedeb, tcc_agefin, tcc_taucot)
values (40, 44, 28);
insert into COPT.TAU_COT_COP (tcc_agedeb, tcc_agefin, tcc_taucot)
values (45, 49, 29);
insert into COPT.TAU_COT_COP (tcc_agedeb, tcc_agefin, tcc_taucot)
values (50, 54, 31);
insert into COPT.TAU_COT_COP (tcc_agedeb, tcc_agefin, tcc_taucot)
values (55, null, 32);
commit;
prompt 8 records loaded
set feedback on
set define on
prompt Done.
