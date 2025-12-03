prompt PL/SQL Developer import file
prompt Created on mardi 2 décembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.ENG_COP...
drop table COPT.ENG_COP cascade constraints;
prompt Creating COPT.ENG_COP...
create table COPT.ENG_COP
(
  eng_num      NUMBER(6) not null,
  emp_mat      NUMBER(8) not null,
  emp_cle      NUMBER(2) not null,
  dco_dtdeb    DATE not null,
  eno_numeng   NUMBER(2) not null,
  eno_dtech    DATE not null,
  eno_siteng   NUMBER(1),
  eno_mnt      NUMBER(15,3),
  eno_mntech   NUMBER(15,3),
  eno_dtpayech DATE,
  eno_dtdeb    DATE,
  eno_dtfin    DATE,
  eno_salaire  NUMBER(15,3),
  eno_mntpay   NUMBER(15,3)
)
nologging;
create index COPT.BIN$VV4T5wKNDG3gVAAUTyNFyw==$0 on COPT.ENG_COP (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB);
create unique index COPT.BIN$VV4T5wKODG3gVAAUTyNFyw==$0 on COPT.ENG_COP (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB, ENO_NUMENG, ENO_DTECH);
alter table COPT.ENG_COP
  add constraint BIN$VV4T5wKMDG3gVAAUTyNFyw==$0 primary key (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB, ENO_NUMENG, ENO_DTECH);

prompt Loading COPT.ENG_COP...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('28-01-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('28-02-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('28-03-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('28-04-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('28-05-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('28-06-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('28-07-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('28-08-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('28-09-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('28-10-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('28-11-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('28-12-2011', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('28-01-2012', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('28-02-2012', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('28-03-2012', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('28-04-2012', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('28-05-2012', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('28-06-2012', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('28-07-2012', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('27-11-2008', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('27-12-2008', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('27-01-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('27-02-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('27-03-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('27-04-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('27-05-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('27-06-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('27-07-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('27-08-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('27-09-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('27-10-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('27-11-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('27-12-2009', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('27-01-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('27-02-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('27-03-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('27-04-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('27-05-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('27-06-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('27-07-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('27-08-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('27-09-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('27-10-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('27-11-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('27-12-2010', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('27-01-2011', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('27-02-2011', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('27-03-2011', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('27-04-2011', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('27-05-2011', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('27-06-2011', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('27-07-2011', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('27-08-2011', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('27-09-2011', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('27-10-2011', 'dd-mm-yyyy'), 2, 3989.429, 110.817, null, null, null, 3051.889, 110.817);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500116, 81, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('10-01-2009', 'dd-mm-yyyy'), 2, 698.366, 698.366, to_date('12-12-2008', 'dd-mm-yyyy'), null, null, 2946.693, 698.366);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('24-05-2013', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('24-06-2013', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('24-07-2013', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('24-08-2013', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('24-09-2013', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('24-10-2013', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('24-11-2013', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('24-12-2013', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('24-01-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('24-02-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('24-03-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('24-04-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('24-05-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('24-06-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('24-07-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('24-08-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('24-09-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('24-10-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('24-11-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('24-12-2014', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('24-01-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('24-02-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('24-03-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('24-04-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('24-05-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('24-06-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('24-07-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('24-08-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('24-09-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('24-10-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('24-11-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('21-04-2010', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('24-12-2015', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('03-01-2019', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('24-01-2016', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('03-01-2019', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('24-02-2016', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('03-01-2019', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('24-03-2016', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('03-01-2019', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('24-04-2016', 'dd-mm-yyyy'), 2, 8418.832, 233.856, to_date('03-01-2019', 'dd-mm-yyyy'), null, null, 9475.964, 233.856);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500128, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('09-02-2009', 'dd-mm-yyyy'), 2, 147.981, 147.981, to_date('29-06-2007', 'dd-mm-yyyy'), null, null, 3121.969, 147.981);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500134, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('27-09-2009', 'dd-mm-yyyy'), 2, 480.009, 480.009, to_date('17-09-2009', 'dd-mm-yyyy'), null, null, 4605.021, 480.009);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500137, 5, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('17-11-2008', 'dd-mm-yyyy'), 2, 683.281, 683.281, to_date('29-10-2008', 'dd-mm-yyyy'), null, null, 4446.825, 683.281);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('11-03-2009', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('12-03-2009', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('11-04-2009', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('11-05-2009', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('11-06-2009', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('11-07-2009', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
commit;
prompt 100 records committed...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('11-08-2009', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('11-09-2009', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('11-10-2009', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('11-11-2009', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('09-06-2009', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('11-12-2009', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('12-03-2009', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('11-01-2010', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('12-03-2009', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('11-02-2010', 'dd-mm-yyyy'), 2, 1192.134, 99.345, to_date('12-03-2009', 'dd-mm-yyyy'), null, null, 5354.749, 99.345);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('16-01-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('16-02-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('16-03-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('16-04-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('16-05-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('16-06-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('16-07-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('16-08-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('16-09-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('16-10-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('16-11-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('16-12-2009', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('16-01-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('16-02-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('16-03-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('16-04-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('16-05-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('16-06-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('16-07-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('16-08-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('16-09-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('16-10-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('16-11-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('16-12-2010', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('16-01-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('16-02-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('16-03-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('16-04-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('16-05-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('16-06-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('16-07-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, null, null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('16-08-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, to_date('15-01-2009', 'dd-mm-yyyy'), null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('16-09-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, to_date('15-01-2009', 'dd-mm-yyyy'), null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('16-10-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, to_date('15-01-2009', 'dd-mm-yyyy'), null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('16-11-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, to_date('15-01-2009', 'dd-mm-yyyy'), null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('16-12-2011', 'dd-mm-yyyy'), 2, 10318.755, 286.632, to_date('15-01-2009', 'dd-mm-yyyy'), null, null, 3481.143, 286.632);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('18-04-2014', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('17-07-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('18-05-2014', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('17-07-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('18-06-2014', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('18-07-2014', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('18-08-2014', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('18-09-2014', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('18-10-2014', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('18-11-2014', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('18-12-2014', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('17-07-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('18-01-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('27-08-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('18-02-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('17-07-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('18-03-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('17-07-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('18-04-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('27-08-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('18-05-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('27-08-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('18-06-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('27-08-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('18-07-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('25-09-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('18-08-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('25-09-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('18-09-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('18-10-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('25-09-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('18-11-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('25-09-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('18-12-2015', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('18-01-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('18-02-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('18-03-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('18-04-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('18-05-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('26-12-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('18-06-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('26-12-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('18-07-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('26-12-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('18-08-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, to_date('26-12-2014', 'dd-mm-yyyy'), null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('18-09-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, null, null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('18-10-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, null, null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('18-11-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, null, null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('18-12-2016', 'dd-mm-yyyy'), 2, 6512.319, 180.898, null, null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('18-01-2017', 'dd-mm-yyyy'), 2, 6512.319, 180.898, null, null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('18-02-2017', 'dd-mm-yyyy'), 2, 6512.319, 180.898, null, null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('18-03-2017', 'dd-mm-yyyy'), 2, 6512.319, 180.898, null, null, null, 5860.618, 180.898);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500150, 18, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('22-11-2008', 'dd-mm-yyyy'), 2, 1873.796, 1873.796, to_date('15-10-2008', 'dd-mm-yyyy'), null, null, 2998.073, 1873.796);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500152, 20, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('19-01-2009', 'dd-mm-yyyy'), 2, 602.941, 602.941, to_date('19-12-2008', 'dd-mm-yyyy'), null, null, 4148.274, 602.941);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500153, 21, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('02-01-2009', 'dd-mm-yyyy'), 2, 749.283, 249.761, null, null, null, 3951.917, 249.761);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500153, 21, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('02-02-2009', 'dd-mm-yyyy'), 2, 749.283, 249.761, null, null, null, 3951.917, 249.761);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500153, 21, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('02-03-2009', 'dd-mm-yyyy'), 2, 749.283, 249.761, null, null, null, 3951.917, 249.761);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('29-11-2008', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('29-12-2008', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('29-01-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('28-02-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('29-03-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('29-04-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('29-05-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('29-06-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('29-07-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('29-08-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('29-09-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('29-10-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('29-11-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('29-12-2009', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('29-01-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('28-02-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
commit;
prompt 200 records committed...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('29-03-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('29-04-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('29-05-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('29-06-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('29-07-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('29-08-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('29-09-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('29-10-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('29-11-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('29-12-2010', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('29-01-2011', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('28-02-2011', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('29-03-2011', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('29-04-2011', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('29-05-2011', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('29-06-2011', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('29-07-2011', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('29-08-2011', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('29-09-2011', 'dd-mm-yyyy'), 2, 4959.991, 137.778, null, null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('29-10-2011', 'dd-mm-yyyy'), 2, 4959.991, 137.778, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 689.606, 137.778);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('14-08-2010', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('14-09-2010', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('14-10-2010', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('14-11-2010', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('14-12-2010', 'dd-mm-yyyy'), 2, 2267.848, 62.996, null, null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('14-01-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, null, null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('14-02-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('14-03-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('14-04-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('14-05-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('14-06-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('14-07-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, null, null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('14-08-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, null, null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('14-09-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('14-10-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('14-11-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('14-12-2011', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('14-01-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('14-02-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('14-03-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('14-04-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('14-05-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('14-06-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('14-07-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('14-08-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('14-09-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('05-01-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('14-10-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('05-01-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('14-11-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('05-01-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('14-12-2012', 'dd-mm-yyyy'), 2, 2267.848, 62.996, null, null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('14-01-2013', 'dd-mm-yyyy'), 2, 2267.848, 62.996, null, null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('14-02-2013', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('14-03-2013', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('14-04-2013', 'dd-mm-yyyy'), 2, 2267.848, 62.996, null, null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('14-05-2013', 'dd-mm-yyyy'), 2, 2267.848, 62.996, null, null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('14-06-2013', 'dd-mm-yyyy'), 2, 2267.848, 62.996, null, null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('14-07-2013', 'dd-mm-yyyy'), 2, 2267.848, 62.996, to_date('05-01-2011', 'dd-mm-yyyy'), null, null, 3189.66, 62.996);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('29-08-2009', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('29-09-2009', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('29-10-2009', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('29-11-2009', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('29-12-2009', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('29-01-2010', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('28-02-2010', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('29-03-2010', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('29-04-2010', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('29-05-2010', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('29-06-2010', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('29-07-2010', 'dd-mm-yyyy'), 2, 2994.888, 249.574, null, null, null, 1035.899, 249.574);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500161, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('26-12-2008', 'dd-mm-yyyy'), 2, 1571.907, 1571.907, to_date('24-10-2008', 'dd-mm-yyyy'), null, null, 565.943, 1571.907);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('13-03-2009', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('24-03-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('13-04-2009', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('24-03-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('13-05-2009', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('13-06-2009', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('13-07-2009', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('13-08-2009', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('13-09-2009', 'dd-mm-yyyy'), 2, 6793.17, 188.699, null, null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('13-10-2009', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('24-03-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('13-11-2009', 'dd-mm-yyyy'), 2, 6793.17, 188.699, null, null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('13-12-2009', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('13-01-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, null, null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('13-02-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('13-03-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('13-04-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, null, null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('13-05-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('13-06-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('10-08-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('13-07-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('10-08-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('13-08-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, null, null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('13-09-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('10-08-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('13-10-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('13-11-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('13-12-2010', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('13-01-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('13-02-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('13-03-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('13-04-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('13-05-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('13-06-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('13-07-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('10-08-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('13-08-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('13-09-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
commit;
prompt 300 records committed...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('13-10-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('13-11-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('13-12-2011', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('13-01-2012', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('13-02-2012', 'dd-mm-yyyy'), 2, 6793.17, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), null, null, 3834.432, 188.699);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('08-02-2009', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('08-03-2009', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('08-04-2009', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('08-05-2009', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('08-06-2009', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('08-07-2009', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('08-08-2009', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('08-09-2009', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('08-10-2009', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('08-11-2009', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('08-12-2009', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('08-01-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, null, null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('08-02-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('08-03-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, null, null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('08-04-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('08-05-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, null, null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('04-01-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('04-02-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('04-03-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('04-04-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('04-05-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('04-06-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('04-07-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('04-08-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('04-09-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('04-10-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('04-11-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('04-12-2010', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('04-01-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('04-02-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('04-03-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('04-04-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('04-05-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('04-06-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('04-07-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('04-08-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('04-09-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('04-10-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('04-11-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('04-12-2011', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('04-01-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('04-02-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('04-03-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('04-04-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('04-05-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('04-06-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('04-07-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('04-08-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('04-09-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('04-10-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('04-11-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('04-12-2012', 'dd-mm-yyyy'), 2, 49611.96, 1378.11, null, null, null, 22227.001, 1378.11);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500008, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('27-08-2009', 'dd-mm-yyyy'), 2, 1048.825, 1048.825, to_date('28-07-2009', 'dd-mm-yyyy'), null, null, 1253.077, 1048.825);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500010, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('08-03-2012', 'dd-mm-yyyy'), 2, 1535.872, 767.936, to_date('09-02-2012', 'dd-mm-yyyy'), null, null, 2410.345, 767.936);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500010, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('08-04-2012', 'dd-mm-yyyy'), 2, 1535.872, 767.936, to_date('14-02-2012', 'dd-mm-yyyy'), null, null, 2410.345, 767.936);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500018, 80, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('02-12-2010', 'dd-mm-yyyy'), 2, 84.86, 84.86, to_date('08-11-2010', 'dd-mm-yyyy'), null, null, 944.992, 84.86);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500027, 89, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('28-12-2008', 'dd-mm-yyyy'), 2, 1131.737, 1131.737, null, null, null, 872.11, 1131.737);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('16-06-2012', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('22-06-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('16-07-2012', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('02-11-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('16-08-2012', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('22-06-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('16-09-2012', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('22-06-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('16-10-2012', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('02-11-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('16-11-2012', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('02-11-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('16-12-2012', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('29-11-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('16-01-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, null, null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('16-02-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('29-11-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('16-03-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('31-12-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('16-04-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('31-12-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('16-05-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('31-12-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('16-06-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, null, null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('16-07-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('29-11-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('16-08-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, null, null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('16-09-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('12-03-2010', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('16-10-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('31-12-2012', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('16-11-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('21-02-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('16-12-2013', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('21-02-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('16-01-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('21-02-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('16-02-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('11-03-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('16-03-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('18-04-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('16-04-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('18-04-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('16-05-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('18-04-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('16-06-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('18-04-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('16-07-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('16-08-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('16-09-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('16-10-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('16-11-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('16-12-2014', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('16-01-2015', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('16-02-2015', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('16-03-2015', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('16-04-2015', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('16-05-2015', 'dd-mm-yyyy'), 2, 7627.573, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), null, null, 3471.813, 211.877);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500036, 1, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('17-09-2009', 'dd-mm-yyyy'), 2, 1212.639, 1212.639, to_date('01-09-2009', 'dd-mm-yyyy'), null, null, 1160.531, 1212.639);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('16-06-2014', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
commit;
prompt 400 records committed...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('16-07-2014', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('16-08-2014', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('16-09-2014', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('16-10-2014', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('16-11-2014', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('16-12-2014', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('16-01-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('16-02-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('16-03-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('16-04-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('16-05-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('16-06-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('16-07-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('16-08-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('16-09-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('16-10-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('16-11-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('16-12-2015', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('16-01-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('16-02-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('16-03-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('16-04-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('16-05-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('16-06-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('16-07-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('16-08-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('16-09-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('16-10-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('16-11-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('16-12-2016', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('24-03-2010', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('16-01-2017', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('24-03-2010', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('16-02-2017', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('16-03-2017', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('16-04-2017', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('16-05-2017', 'dd-mm-yyyy'), 2, 41110.013, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), null, null, 9199.008, 1141.945);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('30-01-2009', 'dd-mm-yyyy'), 2, 1700.838, 340.168, to_date('12-03-2010', 'dd-mm-yyyy'), null, null, 1588.677, 340.168);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('28-02-2009', 'dd-mm-yyyy'), 2, 1700.838, 340.168, to_date('12-03-2010', 'dd-mm-yyyy'), null, null, 1588.677, 340.168);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('30-03-2009', 'dd-mm-yyyy'), 2, 1700.838, 340.168, to_date('12-03-2010', 'dd-mm-yyyy'), null, null, 1588.677, 340.168);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('30-04-2009', 'dd-mm-yyyy'), 2, 1700.838, 340.168, to_date('12-03-2010', 'dd-mm-yyyy'), null, null, 1588.677, 340.168);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('30-05-2009', 'dd-mm-yyyy'), 2, 1700.838, 340.168, to_date('12-03-2010', 'dd-mm-yyyy'), null, null, 1588.677, 340.168);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('27-07-2013', 'dd-mm-yyyy'), 1, 129379.15, 3593.865, to_date('24-03-2010', 'dd-mm-yyyy'), null, null, 9026.647, 2090.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('27-08-2013', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('27-09-2013', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('27-10-2013', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('27-11-2013', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('27-12-2013', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('27-01-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('27-02-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('27-03-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('27-04-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('27-05-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('27-06-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('27-07-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('27-08-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('27-09-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('08-06-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('08-07-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, null, null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('08-08-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('08-09-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, null, null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('08-10-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('08-11-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, null, null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('08-12-2010', 'dd-mm-yyyy'), 2, 3176.93, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('08-01-2011', 'dd-mm-yyyy'), 2, 3176.93, 132.372, null, null, null, 2829.975, 132.372);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('04-09-2009', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('04-10-2009', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('04-11-2009', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('04-12-2009', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('04-01-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('04-02-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('04-03-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('04-04-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('04-05-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('04-06-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('04-07-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('04-08-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('04-09-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('04-10-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('04-11-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('04-12-2010', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('04-01-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('04-02-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('04-03-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('04-04-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('04-05-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('04-06-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('04-07-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('04-08-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('04-09-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('04-10-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('04-11-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('04-12-2011', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('04-01-2012', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('04-02-2012', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('04-03-2012', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('04-04-2012', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('04-05-2012', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('04-06-2012', 'dd-mm-yyyy'), 2, 7263.807, 201.772, null, null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('04-07-2012', 'dd-mm-yyyy'), 2, 7263.807, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('04-08-2012', 'dd-mm-yyyy'), 2, 7263.807, 201.772, null, null, null, 2846.925, 201.772);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500166, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('10-05-2009', 'dd-mm-yyyy'), 2, 1057.745, 264.436, to_date('26-06-2009', 'dd-mm-yyyy'), null, null, 2864.964, 264.436);
commit;
prompt 500 records committed...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500166, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('10-06-2009', 'dd-mm-yyyy'), 2, 1057.745, 264.436, to_date('26-06-2009', 'dd-mm-yyyy'), null, null, 2864.964, 264.436);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500166, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('10-07-2009', 'dd-mm-yyyy'), 2, 1057.745, 264.436, to_date('26-06-2009', 'dd-mm-yyyy'), null, null, 2864.964, 264.436);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500166, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('10-08-2009', 'dd-mm-yyyy'), 2, 1057.745, 264.436, null, null, null, 2864.964, 264.436);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500169, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('04-01-2009', 'dd-mm-yyyy'), 2, 2079.675, 2079.675, null, null, null, 3375, 2079.675);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500170, 38, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('28-12-2008', 'dd-mm-yyyy'), 2, 541.514, 541.514, null, null, null, 1116.294, 541.514);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('26-12-2008', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('26-01-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('26-02-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('26-03-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('26-04-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('26-05-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('26-06-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('26-07-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('26-08-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('26-09-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('26-10-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('26-11-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('26-12-2009', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('26-01-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('26-02-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('26-03-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('26-04-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('26-05-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('26-06-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('26-07-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('26-08-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('26-09-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('26-10-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('26-11-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('26-12-2010', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('26-01-2011', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('26-02-2011', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('26-03-2011', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('26-04-2011', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('26-05-2011', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('26-06-2011', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('26-07-2011', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('26-08-2011', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('26-09-2011', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('26-10-2011', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('26-11-2011', 'dd-mm-yyyy'), 2, 4493.159, 124.81, null, null, null, 1332.807, 124.81);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500174, 42, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('26-12-2008', 'dd-mm-yyyy'), 2, 154.941, 154.941, null, null, null, 958.198, 154.941);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500175, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('02-01-2009', 'dd-mm-yyyy'), 2, 2601.238, 867.079, null, null, null, 1979.181, 867.079);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500175, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('02-02-2009', 'dd-mm-yyyy'), 2, 2601.238, 867.079, null, null, null, 1979.181, 867.079);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500175, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('02-03-2009', 'dd-mm-yyyy'), 2, 2601.238, 867.079, null, null, null, 1979.181, 867.079);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('08-08-2009', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('07-08-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('08-09-2009', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('07-08-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('08-10-2009', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('07-08-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('08-11-2009', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('07-08-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('08-12-2009', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('07-08-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('08-01-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('08-02-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('07-10-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('08-03-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('07-10-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('08-04-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('10-11-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('08-05-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('10-11-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('08-06-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('08-07-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('07-10-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('08-08-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('08-09-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('08-10-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('10-11-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('08-11-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, to_date('08-12-2009', 'dd-mm-yyyy'), null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('08-12-2010', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('08-01-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('08-02-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('08-03-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('08-04-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('08-05-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('08-06-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('08-07-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('08-08-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('08-09-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('08-10-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('08-11-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('08-12-2011', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('08-01-2012', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('08-02-2012', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('08-03-2012', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('08-04-2012', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('08-05-2012', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('08-06-2012', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('08-07-2012', 'dd-mm-yyyy'), 2, 3973.11, 110.364, null, null, null, 2825.82, 110.364);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500177, 45, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('19-02-2009', 'dd-mm-yyyy'), 2, 187.713, 187.713, to_date('19-01-2009', 'dd-mm-yyyy'), null, null, 902.902, 187.713);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500180, 48, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('12-03-2009', 'dd-mm-yyyy'), 2, 118.966, 118.966, null, null, null, 1287.514, 118.966);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('16-03-2009', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('16-04-2009', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('16-05-2009', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('16-06-2009', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('16-07-2009', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('16-08-2009', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('16-09-2009', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('16-10-2009', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('16-11-2009', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('16-12-2009', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('16-01-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('16-02-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('16-03-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('16-04-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('16-05-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('16-06-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('16-07-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
commit;
prompt 600 records committed...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('16-08-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('16-09-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('16-10-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('16-11-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('16-12-2010', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('16-01-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('16-02-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('16-03-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('16-04-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('16-05-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('16-06-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('16-07-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('16-08-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('16-09-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('16-10-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('16-11-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('16-12-2011', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('16-01-2012', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('16-02-2012', 'dd-mm-yyyy'), 2, 3873.423, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), null, null, 2103.978, 107.595);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500183, 51, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('10-09-2009', 'dd-mm-yyyy'), 2, 840.691, 840.691, to_date('12-08-2009', 'dd-mm-yyyy'), null, null, 1560.303, 840.691);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500185, 53, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('10-09-2009', 'dd-mm-yyyy'), 2, 2142.222, 2142.222, to_date('12-08-2009', 'dd-mm-yyyy'), null, null, 3148.953, 2142.222);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500185, 53, to_date('01-01-2008', 'dd-mm-yyyy'), 1, to_date('30-09-2010', 'dd-mm-yyyy'), 2, 2196.072, 2196.072, to_date('08-09-2010', 'dd-mm-yyyy'), null, null, 3148.953, 2196.072);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('08-10-2009', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('08-11-2009', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('08-12-2009', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('08-01-2010', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('08-02-2010', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('08-03-2010', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('08-04-2010', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('08-05-2010', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('08-06-2010', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('08-07-2010', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('08-08-2010', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('08-09-2010', 'dd-mm-yyyy'), 2, 830.223, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), null, null, 3081.75, 69.185);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500189, 57, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('14-12-2013', 'dd-mm-yyyy'), 0, 4418.807, 4418.807, null, null, null, 6168.747, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('24-01-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-04-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('24-02-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-04-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('24-03-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-04-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('24-04-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, null, null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('24-05-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, null, null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('24-06-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, null, null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('24-07-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, null, null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('24-08-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, null, null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('24-09-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('24-10-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('24-11-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('24-12-2010', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('24-01-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('24-02-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('24-03-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('24-04-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('24-05-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('24-06-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('24-07-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('24-08-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('24-09-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('24-10-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('24-11-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('24-12-2011', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('24-01-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('24-02-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('24-03-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('24-04-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('24-05-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('24-06-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('24-07-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('24-08-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('24-09-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('24-10-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('24-11-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('24-12-2012', 'dd-mm-yyyy'), 2, 4317.537, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), null, null, 2479.206, 119.932);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('04-10-2013', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('04-11-2013', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('04-12-2013', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('04-01-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('04-02-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('04-03-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('04-04-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('04-05-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('04-06-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('04-07-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('04-08-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('04-09-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('04-10-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('04-11-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('04-12-2014', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('04-01-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('04-02-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('04-03-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('04-04-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('04-05-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('04-06-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('04-07-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('04-08-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('04-09-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('04-10-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('04-11-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('04-12-2015', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('04-01-2016', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('04-02-2016', 'dd-mm-yyyy'), 2, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 385.891);
commit;
prompt 700 records committed...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('04-03-2016', 'dd-mm-yyyy'), 1, 13892.075, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), null, null, 6512.928, 154.36);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('04-04-2016', 'dd-mm-yyyy'), 0, 13892.075, 385.891, null, null, null, 6512.928, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('04-05-2016', 'dd-mm-yyyy'), 0, 13892.075, 385.891, null, null, null, 6512.928, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('04-06-2016', 'dd-mm-yyyy'), 0, 13892.075, 385.891, null, null, null, 6512.928, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('04-07-2016', 'dd-mm-yyyy'), 0, 13892.075, 385.891, null, null, null, 6512.928, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('04-08-2016', 'dd-mm-yyyy'), 0, 13892.075, 385.891, null, null, null, 6512.928, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('04-09-2016', 'dd-mm-yyyy'), 0, 13892.075, 385.891, null, null, null, 6512.928, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('29-08-2010', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-01-2008', 'dd-mm-yyyy'), 1, to_date('30-09-2010', 'dd-mm-yyyy'), 2, 7246.634, 7246.634, null, null, null, 4487.55, 7246.634);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('29-09-2010', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('29-10-2010', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('29-11-2010', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('29-12-2010', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('29-01-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('28-02-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('29-03-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('29-04-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('29-05-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('29-06-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('29-07-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('29-08-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('29-09-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('29-10-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('29-11-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('29-12-2011', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('29-01-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('29-02-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('29-03-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('29-04-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('29-05-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('29-06-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('29-07-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('29-08-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('29-09-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('29-10-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('29-11-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('29-12-2012', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('29-01-2013', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('28-02-2013', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('29-03-2013', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('29-04-2013', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('29-05-2013', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('29-06-2013', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('29-07-2013', 'dd-mm-yyyy'), 2, 10613.056, 294.807, null, null, null, 4487.55, 294.807);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('10-09-2010', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('10-10-2010', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('10-11-2010', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('10-12-2010', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('10-01-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('10-02-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('10-03-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('10-04-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('10-05-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('10-06-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('10-07-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('10-08-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('10-09-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('10-10-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('10-11-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('10-12-2011', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('10-01-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('10-02-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('10-03-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('10-04-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('10-05-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('10-06-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('10-07-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('10-08-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('10-09-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('10-10-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('10-11-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('10-12-2012', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('10-01-2013', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('10-02-2013', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('10-03-2013', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('10-04-2013', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('10-05-2013', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('10-06-2013', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('10-07-2013', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('10-08-2013', 'dd-mm-yyyy'), 2, 7836.606, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), null, null, 4474.992, 217.683);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('18-11-2010', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('18-12-2010', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('18-01-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('18-02-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('18-03-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('18-04-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('18-05-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('18-06-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('18-07-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('18-08-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('18-09-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, null, null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('18-10-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, null, null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('18-11-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, null, null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('18-12-2011', 'dd-mm-yyyy'), 2, 3254.974, 135.624, null, null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('18-01-2012', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('18-02-2012', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('18-03-2012', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('18-04-2012', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('18-05-2012', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('18-06-2012', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
commit;
prompt 800 records committed...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('18-07-2012', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('18-08-2012', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('18-09-2012', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('18-10-2012', 'dd-mm-yyyy'), 2, 3254.974, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), null, null, 3719.97, 135.624);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('03-11-2011', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('03-12-2011', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('03-01-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('03-02-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('03-03-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('03-04-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('03-05-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('03-06-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('03-07-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('03-08-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('03-09-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('03-10-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('03-11-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('03-12-2012', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('03-01-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('03-02-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('03-03-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('03-04-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('03-05-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('03-06-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('03-07-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('03-08-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('03-09-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('03-10-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('03-11-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('03-12-2013', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('03-01-2014', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('03-02-2014', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('03-03-2014', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('03-04-2014', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('03-05-2014', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('03-06-2014', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('03-07-2014', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('03-08-2014', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('03-09-2014', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('03-10-2014', 'dd-mm-yyyy'), 2, 4393.885, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), null, null, 969.332, 122.052);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500215, 83, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('16-05-2012', 'dd-mm-yyyy'), 2, 383.003, 383.003, to_date('17-04-2012', 'dd-mm-yyyy'), null, null, 1036.263, 383.003);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('11-05-2014', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('11-06-2014', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('11-07-2014', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('11-08-2014', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('11-09-2014', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('11-10-2014', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('11-11-2014', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('11-12-2014', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('11-01-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('11-02-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('11-03-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('11-04-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('11-05-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('11-06-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('11-07-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('11-08-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('11-09-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('11-10-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('11-11-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('11-12-2015', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('11-01-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('11-02-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('11-03-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('11-04-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('11-05-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('11-06-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('11-07-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('11-08-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('11-09-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('11-10-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('11-11-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('11-12-2016', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('11-01-2017', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('11-02-2017', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('11-03-2017', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('11-04-2017', 'dd-mm-yyyy'), 2, 9866.89, 274.08, to_date('20-12-2017', 'dd-mm-yyyy'), null, null, 6326.982, 274.08);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('06-10-2013', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('06-11-2013', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('06-12-2013', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('06-01-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('06-02-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('06-03-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('06-04-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('06-05-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('06-06-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('06-07-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('06-08-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('06-09-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('06-10-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('06-11-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('06-12-2014', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('06-01-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('06-02-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('06-03-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('06-04-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('06-05-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('06-06-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('06-07-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('06-08-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
commit;
prompt 900 records committed...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('06-09-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('06-10-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('06-11-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('06-12-2015', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('06-01-2016', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('06-02-2016', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('06-03-2016', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('06-04-2016', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('06-05-2016', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('06-06-2016', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('06-07-2016', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('06-08-2016', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('06-09-2016', 'dd-mm-yyyy'), 0, 7379.78, 204.994, null, null, null, 5371.449, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500233, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('12-09-2013', 'dd-mm-yyyy'), 0, 4450.309, 4450.309, null, null, null, 4267.653, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('27-03-2014', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('27-04-2014', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('27-05-2014', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('27-06-2014', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('27-07-2014', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('27-08-2014', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('27-09-2014', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('27-10-2014', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('27-11-2014', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('27-12-2014', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('27-01-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('27-02-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('27-03-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('27-04-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('27-05-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('27-06-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('27-07-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('27-08-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('27-09-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('27-10-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('27-11-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('27-12-2015', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('27-01-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('27-02-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('27-03-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('27-04-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('27-05-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('27-06-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('27-07-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('27-08-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('27-09-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('27-10-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('27-11-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('27-12-2016', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('27-01-2017', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('27-02-2017', 'dd-mm-yyyy'), 0, 53772.647, 1493.685, null, null, null, 7163.904, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('18-04-2014', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('18-05-2014', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('18-06-2014', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('18-07-2014', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('18-08-2014', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('18-09-2014', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('18-10-2014', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('18-11-2014', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('18-12-2014', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('18-01-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('18-02-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('18-03-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('18-04-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('18-05-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('18-06-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('18-07-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('18-08-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('18-09-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('18-10-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('18-11-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('18-12-2015', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('18-01-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('18-02-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('18-03-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('18-04-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('18-05-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('18-06-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('18-07-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('18-08-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('18-09-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('18-10-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('18-11-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('18-12-2016', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('18-01-2017', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('18-02-2017', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('18-03-2017', 'dd-mm-yyyy'), 0, 3973.965, 110.388, null, null, null, 2681.01, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('06-07-2014', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('06-08-2014', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('06-09-2014', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('06-10-2014', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('06-11-2014', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('06-12-2014', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('06-01-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('06-02-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('06-03-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('06-04-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('06-05-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('06-06-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('06-07-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('06-08-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
commit;
prompt 1000 records committed...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('06-09-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('06-10-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('06-11-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('06-12-2015', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('06-01-2016', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('06-02-2016', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('06-03-2016', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('06-04-2016', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('06-05-2016', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('06-06-2016', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('06-07-2016', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('06-08-2016', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('06-09-2016', 'dd-mm-yyyy'), 2, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 301.868);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('06-10-2016', 'dd-mm-yyyy'), 1, 10867.253, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), null, null, 5094.821, 60.394);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('06-11-2016', 'dd-mm-yyyy'), 0, 10867.253, 301.868, null, null, null, 5094.821, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('06-12-2016', 'dd-mm-yyyy'), 0, 10867.253, 301.868, null, null, null, 5094.821, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('06-01-2017', 'dd-mm-yyyy'), 0, 10867.253, 301.868, null, null, null, 5094.821, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('06-02-2017', 'dd-mm-yyyy'), 0, 10867.253, 301.868, null, null, null, 5094.821, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('06-03-2017', 'dd-mm-yyyy'), 0, 10867.253, 301.868, null, null, null, 5094.821, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('06-04-2017', 'dd-mm-yyyy'), 0, 10867.253, 301.868, null, null, null, 5094.821, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('06-05-2017', 'dd-mm-yyyy'), 0, 10867.253, 301.868, null, null, null, 5094.821, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('06-06-2017', 'dd-mm-yyyy'), 0, 10867.253, 301.868, null, null, null, 5094.821, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('26-02-2015', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('26-03-2015', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('26-04-2015', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('26-05-2015', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('26-06-2015', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('26-07-2015', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('26-08-2015', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('26-09-2015', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('26-10-2015', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('26-11-2015', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('26-12-2015', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('26-01-2016', 'dd-mm-yyyy'), 0, 2498.592, 208.216, null, null, null, 4392.742, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('27-10-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('27-11-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('27-12-2014', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('27-01-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('27-02-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('27-03-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('27-04-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('27-05-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('27-06-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('27-07-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('27-08-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('27-09-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('27-10-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('27-11-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('27-12-2015', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('27-01-2016', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('27-02-2016', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('27-03-2016', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('27-04-2016', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('27-05-2016', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('27-06-2016', 'dd-mm-yyyy'), 0, 129379.15, 3593.865, null, null, null, 9026.647, null);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('06-02-2009', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('06-03-2009', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('06-04-2009', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('06-05-2009', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('06-06-2009', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('06-07-2009', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('06-08-2009', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('06-09-2009', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('06-10-2009', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('06-11-2009', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('06-12-2009', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('06-01-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('06-02-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('06-03-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('06-04-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('06-05-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('06-06-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('06-07-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('06-08-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('06-09-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('06-10-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('06-11-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('06-12-2010', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('06-01-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('06-02-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('06-03-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('06-04-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('06-05-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('06-06-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('06-07-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('06-08-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('06-09-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('06-10-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('06-11-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('06-12-2011', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('06-01-2012', 'dd-mm-yyyy'), 2, 4892.975, 135.916, null, null, null, 2511.536, 135.916);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500063, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('28-09-2013', 'dd-mm-yyyy'), 2, 3349.992, 3349.992, to_date('12-03-2010', 'dd-mm-yyyy'), null, null, 3223.626, 3349.992);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500075, 40, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('07-08-2009', 'dd-mm-yyyy'), 2, 2223.177, 2223.177, to_date('17-07-2009', 'dd-mm-yyyy'), null, null, 2605.998, 2223.177);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('28-08-2009', 'dd-mm-yyyy'), 2, 4659.921, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('28-09-2009', 'dd-mm-yyyy'), 2, 4659.921, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('28-10-2009', 'dd-mm-yyyy'), 2, 4659.921, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('28-11-2009', 'dd-mm-yyyy'), 2, 4659.921, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('28-12-2009', 'dd-mm-yyyy'), 2, 4659.921, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('28-01-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('28-02-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
commit;
prompt 1100 records committed...
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('28-03-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('28-04-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('28-05-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('28-06-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('28-07-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('28-08-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('28-09-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('28-10-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('28-11-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
insert into COPT.ENG_COP (eng_num, emp_mat, emp_cle, dco_dtdeb, eno_numeng, eno_dtech, eno_siteng, eno_mnt, eno_mntech, eno_dtpayech, eno_dtdeb, eno_dtfin, eno_salaire, eno_mntpay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('28-12-2010', 'dd-mm-yyyy'), 2, 4659.921, 129.442, null, null, null, 2521.581, 129.442);
commit;
prompt 1110 records loaded
set feedback on
set define on
prompt Done.
