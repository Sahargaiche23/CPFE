prompt PL/SQL Developer import file
prompt Created on mardi 2 décembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.ENG_ECHEANCE...
drop table COPT.ENG_ECHEANCE cascade constraints;
prompt Creating COPT.ENG_ECHEANCE...
create table COPT.ENG_ECHEANCE
(
  eng_num   NUMBER(6) not null,
  emp_mat   NUMBER(8) not null,
  emp_cle   NUMBER(2) not null,
  dco_dtdeb DATE not null,
  num_ech   NUMBER(5) not null,
  dt_ech    DATE not null,
  sit_ech   NUMBER(1) default 0 not null,
  mnt_ech   NUMBER(15,3),
  dt_pay    DATE,
  mnt_pay   NUMBER(15,3)
)
nologging;
create index COPT.FK_ENG_ECH on COPT.ENG_ECHEANCE (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB);
alter table COPT.ENG_ECHEANCE
  add constraint PK_ENG_ECH primary key (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB, NUM_ECH);
alter table COPT.ENG_ECHEANCE
  add constraint FK_ENG_ECH_ENGAGEMNT foreign key (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB)
  references COPT.ENGAGEMNT (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB);

prompt Loading COPT.ENG_ECHEANCE...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('24-02-2016', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('24-03-2016', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('24-04-2016', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('24-05-2013', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('24-06-2013', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('24-07-2013', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('24-08-2013', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('24-09-2013', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('24-10-2013', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('24-11-2013', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('24-12-2013', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('24-01-2014', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('24-02-2014', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('24-03-2014', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('24-04-2014', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('24-05-2014', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('24-06-2014', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('24-07-2014', 'dd-mm-yyyy'), 2, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 233.856);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('24-08-2014', 'dd-mm-yyyy'), 1, 233.856, to_date('05-01-2015', 'dd-mm-yyyy'), 220.392);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('24-09-2014', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('24-10-2014', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('24-11-2014', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('24-12-2014', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('24-01-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('24-02-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('24-03-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('24-04-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('24-05-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('24-06-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('24-09-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500128, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('09-02-2009', 'dd-mm-yyyy'), 2, 147.981, to_date('29-06-2007', 'dd-mm-yyyy'), 147.981);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500134, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('27-09-2009', 'dd-mm-yyyy'), 2, 480.009, to_date('17-09-2009', 'dd-mm-yyyy'), 480.009);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500137, 5, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('17-11-2008', 'dd-mm-yyyy'), 2, 683.281, to_date('29-10-2008', 'dd-mm-yyyy'), 683.281);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('11-03-2009', 'dd-mm-yyyy'), 2, 99.345, to_date('12-03-2009', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('11-04-2009', 'dd-mm-yyyy'), 2, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('11-05-2009', 'dd-mm-yyyy'), 2, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('11-06-2009', 'dd-mm-yyyy'), 2, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('11-07-2009', 'dd-mm-yyyy'), 2, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('11-02-2010', 'dd-mm-yyyy'), 2, 99.345, to_date('12-03-2009', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('11-09-2009', 'dd-mm-yyyy'), 2, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('11-10-2009', 'dd-mm-yyyy'), 2, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('11-11-2009', 'dd-mm-yyyy'), 2, 99.345, to_date('09-06-2009', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('11-12-2009', 'dd-mm-yyyy'), 2, 99.345, to_date('12-03-2009', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('11-01-2010', 'dd-mm-yyyy'), 2, 99.345, to_date('12-03-2009', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('11-08-2009', 'dd-mm-yyyy'), 2, 99.345, to_date('13-07-2007', 'dd-mm-yyyy'), 99.345);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('16-01-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('16-12-2011', 'dd-mm-yyyy'), 2, 286.632, to_date('15-01-2009', 'dd-mm-yyyy'), 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('16-03-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('16-04-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('16-05-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('16-06-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('16-07-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('16-08-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('16-09-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('16-10-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('16-11-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('16-12-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('16-01-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('16-02-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('16-03-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('16-04-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('16-05-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('16-06-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('16-07-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('16-08-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('16-09-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('16-10-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('16-11-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('16-12-2010', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('16-01-2011', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('16-02-2011', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('16-03-2011', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('16-04-2011', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('16-05-2011', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('16-06-2011', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('16-07-2011', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('16-08-2011', 'dd-mm-yyyy'), 2, 286.632, to_date('15-01-2009', 'dd-mm-yyyy'), 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('16-09-2011', 'dd-mm-yyyy'), 2, 286.632, to_date('15-01-2009', 'dd-mm-yyyy'), 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('16-10-2011', 'dd-mm-yyyy'), 2, 286.632, to_date('15-01-2009', 'dd-mm-yyyy'), 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('16-11-2011', 'dd-mm-yyyy'), 2, 286.632, to_date('15-01-2009', 'dd-mm-yyyy'), 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('16-02-2009', 'dd-mm-yyyy'), 2, 286.632, null, 286.632);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500091, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('10-09-2017', 'dd-mm-yyyy'), 0, 539.035, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500021, 83, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('30-09-2017', 'dd-mm-yyyy'), 0, 3066.411, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500272, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('11-02-2018', 'dd-mm-yyyy'), 0, 1040.093, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500272, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('11-01-2018', 'dd-mm-yyyy'), 0, 1040.093, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500272, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('11-03-2018', 'dd-mm-yyyy'), 0, 1040.093, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500272, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('11-04-2018', 'dd-mm-yyyy'), 0, 1040.093, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500272, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('11-05-2018', 'dd-mm-yyyy'), 0, 1040.093, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500169, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('16-03-2018', 'dd-mm-yyyy'), 0, 421.742, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500169, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('16-04-2018', 'dd-mm-yyyy'), 0, 421.742, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500169, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('16-05-2018', 'dd-mm-yyyy'), 0, 421.742, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('22-03-2018', 'dd-mm-yyyy'), 0, 3198.425, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('22-04-2018', 'dd-mm-yyyy'), 0, 3198.425, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('22-05-2018', 'dd-mm-yyyy'), 0, 3198.425, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('22-06-2018', 'dd-mm-yyyy'), 0, 3198.425, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('22-07-2018', 'dd-mm-yyyy'), 0, 3198.425, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('22-08-2018', 'dd-mm-yyyy'), 0, 3198.425, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('22-09-2018', 'dd-mm-yyyy'), 0, 3198.425, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('22-10-2018', 'dd-mm-yyyy'), 0, 3198.425, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('22-11-2018', 'dd-mm-yyyy'), 0, 3198.425, null, null);
commit;
prompt 100 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('22-12-2018', 'dd-mm-yyyy'), 0, 3198.425, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('22-01-2019', 'dd-mm-yyyy'), 0, 3198.425, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('22-02-2019', 'dd-mm-yyyy'), 0, 3198.425, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500290, 61, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('26-05-2018', 'dd-mm-yyyy'), 0, 2906.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500290, 61, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('26-06-2018', 'dd-mm-yyyy'), 0, 2906.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500290, 61, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('26-07-2018', 'dd-mm-yyyy'), 0, 2906.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500150, 18, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('22-11-2008', 'dd-mm-yyyy'), 2, 1873.796, to_date('15-10-2008', 'dd-mm-yyyy'), 1873.796);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500152, 20, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('19-01-2009', 'dd-mm-yyyy'), 2, 602.941, to_date('19-12-2008', 'dd-mm-yyyy'), 602.941);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500153, 21, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('02-01-2009', 'dd-mm-yyyy'), 2, 249.761, null, 249.761);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500153, 21, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('02-02-2009', 'dd-mm-yyyy'), 2, 249.761, null, 249.761);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500153, 21, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('02-03-2009', 'dd-mm-yyyy'), 2, 249.761, null, 249.761);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('28-02-2011', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('29-01-2011', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('29-04-2011', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('29-05-2011', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('29-06-2011', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('29-07-2011', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('29-08-2011', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('29-09-2011', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('29-10-2011', 'dd-mm-yyyy'), 2, 137.778, to_date('10-08-2010', 'dd-mm-yyyy'), 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('29-11-2008', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('29-12-2008', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('29-01-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('28-02-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('29-03-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('29-04-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('04-11-2009', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('04-12-2009', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('04-01-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('04-02-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('04-03-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('04-04-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('04-05-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('04-06-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('04-07-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('04-08-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('04-09-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('04-10-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('04-11-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('04-12-2010', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('04-01-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('04-02-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('04-03-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('04-04-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('04-05-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('04-06-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('04-07-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('04-08-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('04-09-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('04-10-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('04-11-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('04-12-2011', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('04-01-2012', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('04-02-2012', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('04-03-2012', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('04-04-2012', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('04-05-2012', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('04-06-2012', 'dd-mm-yyyy'), 2, 201.772, null, 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('04-07-2012', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('04-08-2012', 'dd-mm-yyyy'), 2, 201.772, null, 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500166, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('10-05-2009', 'dd-mm-yyyy'), 2, 264.436, to_date('26-06-2009', 'dd-mm-yyyy'), 264.436);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500166, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('10-08-2009', 'dd-mm-yyyy'), 2, 264.436, null, 264.436);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500166, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('10-07-2009', 'dd-mm-yyyy'), 2, 264.436, to_date('26-06-2009', 'dd-mm-yyyy'), 264.436);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500166, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('10-06-2009', 'dd-mm-yyyy'), 2, 264.436, to_date('26-06-2009', 'dd-mm-yyyy'), 264.436);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500169, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('04-01-2009', 'dd-mm-yyyy'), 2, 2079.675, null, 2079.675);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500170, 38, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('28-12-2008', 'dd-mm-yyyy'), 2, 541.514, null, 541.514);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('26-12-2008', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('26-11-2011', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('26-02-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('26-03-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('26-04-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('26-05-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('26-06-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('26-07-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('26-08-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('26-09-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('26-10-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('26-11-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('26-12-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('26-01-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('26-02-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('26-03-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('26-04-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('26-05-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('26-06-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('26-07-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('26-08-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('26-09-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('26-10-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('26-11-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('26-12-2010', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('26-01-2011', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('26-02-2011', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('26-03-2011', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('26-04-2011', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('26-05-2011', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('26-06-2011', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('26-07-2011', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('26-08-2011', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('26-09-2011', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
commit;
prompt 200 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('26-10-2011', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('26-01-2009', 'dd-mm-yyyy'), 2, 124.81, null, 124.81);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500174, 42, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('26-12-2008', 'dd-mm-yyyy'), 2, 154.941, null, 154.941);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500175, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('02-01-2009', 'dd-mm-yyyy'), 2, 867.079, null, 867.079);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500175, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('02-03-2009', 'dd-mm-yyyy'), 2, 867.079, null, 867.079);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500175, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('02-02-2009', 'dd-mm-yyyy'), 2, 867.079, null, 867.079);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('08-02-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('08-01-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('08-04-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('08-05-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('08-06-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('08-07-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('08-08-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('08-09-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('08-10-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('08-11-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('08-12-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('08-01-2012', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('08-02-2012', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('08-03-2012', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('08-04-2012', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('08-05-2012', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('08-06-2012', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('08-07-2012', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('08-08-2009', 'dd-mm-yyyy'), 2, 110.364, to_date('07-08-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('08-09-2009', 'dd-mm-yyyy'), 2, 110.364, to_date('07-08-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('08-10-2009', 'dd-mm-yyyy'), 2, 110.364, to_date('07-08-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('08-11-2009', 'dd-mm-yyyy'), 2, 110.364, to_date('07-08-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('08-12-2009', 'dd-mm-yyyy'), 2, 110.364, to_date('07-08-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('08-01-2010', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('08-02-2010', 'dd-mm-yyyy'), 2, 110.364, to_date('07-10-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('08-03-2010', 'dd-mm-yyyy'), 2, 110.364, to_date('07-10-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('08-04-2010', 'dd-mm-yyyy'), 2, 110.364, to_date('10-11-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('08-05-2010', 'dd-mm-yyyy'), 2, 110.364, to_date('10-11-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('08-06-2010', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('08-07-2010', 'dd-mm-yyyy'), 2, 110.364, to_date('07-10-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('08-08-2010', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('08-09-2010', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('08-10-2010', 'dd-mm-yyyy'), 2, 110.364, to_date('10-11-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('08-11-2010', 'dd-mm-yyyy'), 2, 110.364, to_date('08-12-2009', 'dd-mm-yyyy'), 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('08-12-2010', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('08-03-2011', 'dd-mm-yyyy'), 2, 110.364, null, 110.364);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500177, 45, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('19-02-2009', 'dd-mm-yyyy'), 2, 187.713, to_date('19-01-2009', 'dd-mm-yyyy'), 187.713);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500180, 48, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('12-03-2009', 'dd-mm-yyyy'), 2, 118.966, null, 118.966);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('16-03-2009', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('16-04-2009', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('16-05-2009', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('16-06-2009', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('16-07-2009', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('16-08-2009', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('16-09-2009', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('16-10-2009', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('16-11-2009', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('16-12-2009', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('16-01-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('16-02-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('16-03-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('16-04-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('16-05-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('16-06-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('29-05-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('29-06-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('29-07-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('29-08-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('29-09-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('29-10-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('29-11-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('29-12-2009', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('29-01-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('28-02-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('29-03-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('29-04-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('29-05-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('29-06-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('29-07-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('29-08-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('29-09-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('29-10-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('29-11-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('29-12-2010', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('29-03-2011', 'dd-mm-yyyy'), 2, 137.778, null, 137.778);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('14-08-2010', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('14-07-2013', 'dd-mm-yyyy'), 2, 62.996, to_date('05-01-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('14-10-2010', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('14-11-2010', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('14-12-2010', 'dd-mm-yyyy'), 2, 62.996, null, 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('14-01-2011', 'dd-mm-yyyy'), 2, 62.996, null, 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('14-02-2011', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('14-03-2011', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('14-04-2011', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('14-05-2011', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('14-06-2011', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('14-07-2011', 'dd-mm-yyyy'), 2, 62.996, null, 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('14-08-2011', 'dd-mm-yyyy'), 2, 62.996, null, 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('14-09-2011', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('14-10-2011', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('14-11-2011', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('14-12-2011', 'dd-mm-yyyy'), 2, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('14-01-2012', 'dd-mm-yyyy'), 2, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('14-02-2012', 'dd-mm-yyyy'), 2, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), 62.996);
commit;
prompt 300 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('14-03-2012', 'dd-mm-yyyy'), 2, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('14-04-2012', 'dd-mm-yyyy'), 2, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('14-05-2012', 'dd-mm-yyyy'), 2, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('14-06-2012', 'dd-mm-yyyy'), 2, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('14-07-2012', 'dd-mm-yyyy'), 2, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('14-08-2012', 'dd-mm-yyyy'), 2, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('14-09-2012', 'dd-mm-yyyy'), 2, 62.996, to_date('05-01-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('14-10-2012', 'dd-mm-yyyy'), 2, 62.996, to_date('05-01-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('14-11-2012', 'dd-mm-yyyy'), 2, 62.996, to_date('05-01-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('14-12-2012', 'dd-mm-yyyy'), 2, 62.996, null, 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('14-01-2013', 'dd-mm-yyyy'), 2, 62.996, null, 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('14-02-2013', 'dd-mm-yyyy'), 2, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('14-03-2013', 'dd-mm-yyyy'), 2, 62.996, to_date('22-09-2011', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('14-04-2013', 'dd-mm-yyyy'), 2, 62.996, null, 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('14-05-2013', 'dd-mm-yyyy'), 2, 62.996, null, 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('14-06-2013', 'dd-mm-yyyy'), 2, 62.996, null, 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('14-09-2010', 'dd-mm-yyyy'), 2, 62.996, to_date('09-11-2010', 'dd-mm-yyyy'), 62.996);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('29-08-2009', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('29-09-2009', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('29-10-2009', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('29-11-2009', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('29-12-2009', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('29-07-2010', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('28-02-2010', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('29-03-2010', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('29-04-2010', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('29-05-2010', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('29-06-2010', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('29-01-2010', 'dd-mm-yyyy'), 2, 249.574, null, 249.574);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500161, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('26-12-2008', 'dd-mm-yyyy'), 2, 1571.907, to_date('24-10-2008', 'dd-mm-yyyy'), 1571.907);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('13-09-2009', 'dd-mm-yyyy'), 2, 188.699, null, 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('13-08-2009', 'dd-mm-yyyy'), 2, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('13-11-2009', 'dd-mm-yyyy'), 2, 188.699, null, 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('13-12-2009', 'dd-mm-yyyy'), 2, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('13-01-2010', 'dd-mm-yyyy'), 2, 188.699, null, 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('13-02-2010', 'dd-mm-yyyy'), 2, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('13-03-2010', 'dd-mm-yyyy'), 2, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('13-04-2010', 'dd-mm-yyyy'), 2, 188.699, null, 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('13-05-2010', 'dd-mm-yyyy'), 2, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('13-06-2010', 'dd-mm-yyyy'), 2, 188.699, to_date('10-08-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('13-07-2010', 'dd-mm-yyyy'), 2, 188.699, to_date('10-08-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('13-08-2010', 'dd-mm-yyyy'), 2, 188.699, null, 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('13-09-2010', 'dd-mm-yyyy'), 2, 188.699, to_date('10-08-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('13-10-2010', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('13-11-2010', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('13-12-2010', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('13-01-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('13-02-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('13-03-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('13-04-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('13-05-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('13-06-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('13-07-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('10-08-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('13-08-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('13-09-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('13-10-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('13-11-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('13-12-2011', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('13-01-2012', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('13-02-2012', 'dd-mm-yyyy'), 2, 188.699, to_date('19-11-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('13-03-2009', 'dd-mm-yyyy'), 2, 188.699, to_date('24-03-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('13-04-2009', 'dd-mm-yyyy'), 2, 188.699, to_date('24-03-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('13-05-2009', 'dd-mm-yyyy'), 2, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('13-06-2009', 'dd-mm-yyyy'), 2, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('13-07-2009', 'dd-mm-yyyy'), 2, 188.699, to_date('12-06-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('13-10-2009', 'dd-mm-yyyy'), 2, 188.699, to_date('24-03-2009', 'dd-mm-yyyy'), 188.699);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('08-02-2009', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('08-01-2011', 'dd-mm-yyyy'), 2, 132.372, null, 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('08-04-2009', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('08-05-2009', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('08-06-2009', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('08-07-2009', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('08-08-2009', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('08-09-2009', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('08-10-2009', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('08-11-2009', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('08-12-2009', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('08-01-2010', 'dd-mm-yyyy'), 2, 132.372, null, 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('08-02-2010', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('08-03-2010', 'dd-mm-yyyy'), 2, 132.372, null, 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('08-04-2010', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('08-05-2010', 'dd-mm-yyyy'), 2, 132.372, null, 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('08-06-2010', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('08-07-2010', 'dd-mm-yyyy'), 2, 132.372, null, 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('08-08-2010', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('08-09-2010', 'dd-mm-yyyy'), 2, 132.372, null, 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('08-10-2010', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('08-11-2010', 'dd-mm-yyyy'), 2, 132.372, null, 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('08-12-2010', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('08-03-2009', 'dd-mm-yyyy'), 2, 132.372, to_date('19-01-2009', 'dd-mm-yyyy'), 132.372);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('04-09-2009', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('04-10-2009', 'dd-mm-yyyy'), 2, 201.772, to_date('19-08-2009', 'dd-mm-yyyy'), 201.772);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('04-01-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('04-12-2012', 'dd-mm-yyyy'), 2, 1378.11, null, 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('04-03-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('04-04-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('04-05-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('04-06-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('04-07-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('04-08-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
commit;
prompt 400 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('04-09-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('04-10-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('04-11-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('04-12-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('04-01-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('04-02-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('04-03-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('04-04-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('04-05-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('04-06-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('04-07-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('04-08-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('04-09-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('04-10-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('04-11-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('04-12-2011', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('04-01-2012', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('04-02-2012', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('04-03-2012', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('04-04-2012', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('04-05-2012', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('04-06-2012', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('04-07-2012', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('04-08-2012', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('04-09-2012', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('04-10-2012', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('04-11-2012', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('04-02-2010', 'dd-mm-yyyy'), 2, 1378.11, to_date('09-12-2009', 'dd-mm-yyyy'), 1378.11);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500008, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('27-08-2009', 'dd-mm-yyyy'), 2, 1048.825, to_date('28-07-2009', 'dd-mm-yyyy'), 1048.825);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500010, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('08-04-2012', 'dd-mm-yyyy'), 2, 767.936, to_date('14-02-2012', 'dd-mm-yyyy'), 767.936);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500010, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('08-03-2012', 'dd-mm-yyyy'), 2, 767.936, to_date('09-02-2012', 'dd-mm-yyyy'), 767.936);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500018, 80, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('02-12-2010', 'dd-mm-yyyy'), 2, 84.86, to_date('08-11-2010', 'dd-mm-yyyy'), 84.86);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500027, 89, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('28-12-2008', 'dd-mm-yyyy'), 2, 1131.737, null, 1131.737);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('16-10-2012', 'dd-mm-yyyy'), 2, 211.877, to_date('02-11-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('16-09-2012', 'dd-mm-yyyy'), 2, 211.877, to_date('22-06-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('16-12-2012', 'dd-mm-yyyy'), 2, 211.877, to_date('29-11-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('16-01-2013', 'dd-mm-yyyy'), 2, 211.877, null, 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('16-02-2013', 'dd-mm-yyyy'), 2, 211.877, to_date('29-11-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('16-03-2013', 'dd-mm-yyyy'), 2, 211.877, to_date('31-12-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('16-04-2013', 'dd-mm-yyyy'), 2, 211.877, to_date('31-12-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('16-05-2013', 'dd-mm-yyyy'), 2, 211.877, to_date('31-12-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('16-06-2013', 'dd-mm-yyyy'), 2, 211.877, null, 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('16-07-2013', 'dd-mm-yyyy'), 2, 211.877, to_date('29-11-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('16-08-2013', 'dd-mm-yyyy'), 2, 211.877, null, 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('16-09-2013', 'dd-mm-yyyy'), 2, 211.877, to_date('12-03-2010', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('16-10-2013', 'dd-mm-yyyy'), 2, 211.877, to_date('31-12-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('16-11-2013', 'dd-mm-yyyy'), 2, 211.877, to_date('21-02-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('16-12-2013', 'dd-mm-yyyy'), 2, 211.877, to_date('21-02-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('16-01-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('21-02-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('16-02-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('11-03-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('16-03-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('18-04-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('16-04-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('18-04-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('16-05-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('18-04-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('16-06-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('18-04-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('16-07-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('16-08-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('16-09-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('16-10-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('16-11-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('16-12-2014', 'dd-mm-yyyy'), 2, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('16-01-2015', 'dd-mm-yyyy'), 2, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('16-02-2015', 'dd-mm-yyyy'), 2, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('16-03-2015', 'dd-mm-yyyy'), 2, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('16-04-2015', 'dd-mm-yyyy'), 2, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('16-05-2015', 'dd-mm-yyyy'), 2, 211.877, to_date('09-09-2013', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('16-06-2012', 'dd-mm-yyyy'), 2, 211.877, to_date('22-06-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('16-07-2012', 'dd-mm-yyyy'), 2, 211.877, to_date('02-11-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('16-08-2012', 'dd-mm-yyyy'), 2, 211.877, to_date('22-06-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('16-11-2012', 'dd-mm-yyyy'), 2, 211.877, to_date('02-11-2012', 'dd-mm-yyyy'), 211.877);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500036, 1, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('17-09-2009', 'dd-mm-yyyy'), 2, 1212.639, to_date('01-09-2009', 'dd-mm-yyyy'), 1212.639);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('16-01-2017', 'dd-mm-yyyy'), 2, 1141.945, to_date('24-03-2010', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('16-12-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('24-03-2010', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('16-03-2017', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('16-04-2017', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('16-05-2017', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('16-06-2014', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('16-07-2014', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('16-08-2014', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('16-09-2014', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('16-10-2014', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('16-11-2014', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('16-12-2014', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('16-01-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('16-02-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('16-03-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('16-04-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('16-05-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('16-06-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('16-07-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('16-08-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('16-09-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('16-10-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('16-11-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('16-12-2015', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('16-01-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('16-02-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('16-03-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('16-04-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('16-05-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('16-06-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
commit;
prompt 500 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('16-07-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('16-08-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('16-09-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('16-10-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('16-11-2016', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('16-02-2017', 'dd-mm-yyyy'), 2, 1141.945, to_date('04-11-2014', 'dd-mm-yyyy'), 1141.945);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('30-01-2009', 'dd-mm-yyyy'), 2, 340.168, to_date('12-03-2010', 'dd-mm-yyyy'), 340.168);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('28-02-2009', 'dd-mm-yyyy'), 2, 340.168, to_date('12-03-2010', 'dd-mm-yyyy'), 340.168);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('30-05-2009', 'dd-mm-yyyy'), 2, 340.168, to_date('12-03-2010', 'dd-mm-yyyy'), 340.168);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('30-04-2009', 'dd-mm-yyyy'), 2, 340.168, to_date('12-03-2010', 'dd-mm-yyyy'), 340.168);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('30-03-2009', 'dd-mm-yyyy'), 2, 340.168, to_date('12-03-2010', 'dd-mm-yyyy'), 340.168);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('27-07-2013', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('27-08-2013', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('27-09-2013', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('27-10-2013', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('27-11-2013', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('27-12-2013', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('27-01-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('27-02-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('27-03-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('27-04-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('27-05-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('27-06-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('27-07-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('27-08-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('27-09-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('27-10-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('27-11-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('27-12-2014', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('27-01-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('27-02-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('27-03-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('27-04-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('27-05-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('27-06-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('27-07-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('27-08-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('27-09-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('27-10-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('27-11-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('27-12-2015', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('27-01-2016', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('27-02-2016', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('27-03-2016', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('27-04-2016', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('27-05-2016', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('27-06-2016', 'dd-mm-yyyy'), 0, 3593.865, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('06-08-2010', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('06-07-2010', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('06-10-2010', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('06-11-2010', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('06-12-2010', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('06-01-2011', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('06-02-2011', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('06-03-2011', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('06-04-2011', 'dd-mm-yyyy'), 2, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('06-05-2011', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('06-06-2011', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('06-07-2011', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('06-08-2011', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('06-09-2011', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('06-10-2011', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('06-11-2011', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('06-12-2011', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('06-01-2012', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('06-02-2009', 'dd-mm-yyyy'), 2, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('06-03-2009', 'dd-mm-yyyy'), 2, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('06-04-2009', 'dd-mm-yyyy'), 2, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('06-05-2009', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('06-06-2009', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('06-07-2009', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('06-08-2009', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('06-09-2009', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('06-10-2009', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('06-11-2009', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('06-12-2009', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('06-01-2010', 'dd-mm-yyyy'), 2, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('06-02-2010', 'dd-mm-yyyy'), 2, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('06-03-2010', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('06-04-2010', 'dd-mm-yyyy'), 2, 135.916, null, 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('06-05-2010', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('06-06-2010', 'dd-mm-yyyy'), 2, 135.916, to_date('06-01-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('06-09-2010', 'dd-mm-yyyy'), 2, 135.916, to_date('03-03-2009', 'dd-mm-yyyy'), 135.916);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500063, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('28-09-2013', 'dd-mm-yyyy'), 0, 3349.992, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500075, 40, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('07-08-2009', 'dd-mm-yyyy'), 2, 2223.177, to_date('17-07-2009', 'dd-mm-yyyy'), 2223.177);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('28-08-2009', 'dd-mm-yyyy'), 2, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('28-07-2012', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('28-10-2009', 'dd-mm-yyyy'), 2, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('28-11-2009', 'dd-mm-yyyy'), 2, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('28-12-2009', 'dd-mm-yyyy'), 2, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('28-01-2010', 'dd-mm-yyyy'), 2, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('28-02-2010', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('28-03-2010', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('28-04-2010', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('28-05-2010', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('28-06-2010', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('28-07-2010', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('28-08-2010', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('28-09-2010', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('28-10-2010', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
commit;
prompt 600 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('28-11-2010', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('28-12-2010', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('28-01-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('28-02-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('28-03-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('28-04-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('28-05-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('28-06-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('28-07-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('28-08-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('28-09-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('28-10-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('28-11-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('28-12-2011', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('28-01-2012', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('28-02-2012', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('28-03-2012', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('28-04-2012', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('28-05-2012', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('28-06-2012', 'dd-mm-yyyy'), 2, 129.442, null, 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('28-09-2009', 'dd-mm-yyyy'), 2, 129.442, to_date('25-08-2009', 'dd-mm-yyyy'), 129.442);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('27-11-2008', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('27-10-2011', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('27-01-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('27-02-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('27-03-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('27-04-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('27-05-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('27-06-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('27-07-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('27-08-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('27-09-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('27-10-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('27-11-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('27-12-2009', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('27-01-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('27-02-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('27-03-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('27-04-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('27-05-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('27-06-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('27-07-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('27-08-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('27-09-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('27-10-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('27-11-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('27-12-2010', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('27-01-2011', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('27-02-2011', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('27-03-2011', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('27-04-2011', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('27-05-2011', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('27-06-2011', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('27-07-2011', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('27-08-2011', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('27-09-2011', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('27-12-2008', 'dd-mm-yyyy'), 2, 110.817, null, 110.817);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500116, 81, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('10-01-2009', 'dd-mm-yyyy'), 2, 698.366, to_date('12-12-2008', 'dd-mm-yyyy'), 698.366);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('24-08-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('24-07-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('24-10-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('24-11-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('24-12-2015', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('24-01-2016', 'dd-mm-yyyy'), 0, 233.856, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('06-09-2014', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('06-10-2014', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('06-01-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('26-02-2015', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('26-03-2015', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('26-04-2015', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('26-05-2015', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('26-06-2015', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('26-01-2016', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('26-08-2015', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('26-09-2015', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('26-10-2015', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('26-11-2015', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('26-12-2015', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('26-07-2015', 'dd-mm-yyyy'), 0, 208.216, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500081, 46, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('23-12-2017', 'dd-mm-yyyy'), 0, 1169.595, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('11-01-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('18-08-2014', 'dd-mm-yyyy'), 2, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('18-07-2014', 'dd-mm-yyyy'), 2, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('11-02-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('11-03-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('11-04-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('11-05-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('11-06-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('18-10-2014', 'dd-mm-yyyy'), 2, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('18-11-2014', 'dd-mm-yyyy'), 2, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('18-12-2014', 'dd-mm-yyyy'), 2, 180.898, to_date('17-07-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('18-01-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('27-08-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('18-02-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('17-07-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('18-03-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('17-07-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('18-04-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('27-08-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('18-05-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('27-08-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('18-06-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('27-08-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('18-07-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('25-09-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('18-08-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('25-09-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('18-09-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), 180.898);
commit;
prompt 700 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('18-10-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('25-09-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('18-11-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('25-09-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('18-12-2015', 'dd-mm-yyyy'), 2, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('18-01-2016', 'dd-mm-yyyy'), 2, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('18-02-2016', 'dd-mm-yyyy'), 2, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('18-03-2016', 'dd-mm-yyyy'), 2, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('18-04-2016', 'dd-mm-yyyy'), 2, 180.898, to_date('25-11-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('18-05-2016', 'dd-mm-yyyy'), 2, 180.898, to_date('26-12-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('18-06-2016', 'dd-mm-yyyy'), 2, 180.898, to_date('26-12-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('18-07-2016', 'dd-mm-yyyy'), 2, 180.898, to_date('26-12-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('18-08-2016', 'dd-mm-yyyy'), 2, 180.898, to_date('26-12-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('18-09-2016', 'dd-mm-yyyy'), 1, 180.898, to_date('26-12-2014', 'dd-mm-yyyy'), 109.37);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('18-10-2016', 'dd-mm-yyyy'), 0, 180.898, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('18-11-2016', 'dd-mm-yyyy'), 0, 180.898, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('18-12-2016', 'dd-mm-yyyy'), 0, 180.898, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('18-01-2017', 'dd-mm-yyyy'), 0, 180.898, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('18-02-2017', 'dd-mm-yyyy'), 0, 180.898, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('18-03-2017', 'dd-mm-yyyy'), 0, 180.898, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('18-04-2014', 'dd-mm-yyyy'), 2, 180.898, to_date('17-07-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('18-05-2014', 'dd-mm-yyyy'), 2, 180.898, to_date('17-07-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('18-06-2014', 'dd-mm-yyyy'), 2, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('18-09-2014', 'dd-mm-yyyy'), 2, 180.898, to_date('04-08-2014', 'dd-mm-yyyy'), 180.898);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('11-07-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('11-08-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('11-09-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('11-10-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('11-11-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('11-12-2018', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('11-01-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('11-02-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('11-03-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('11-04-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('11-05-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('11-06-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('11-07-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('11-08-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('11-09-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('11-10-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('11-11-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('11-12-2019', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('11-01-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('11-02-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('11-03-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('11-04-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('11-05-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('11-06-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('11-07-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('11-08-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('11-09-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('11-10-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('11-11-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('11-12-2020', 'dd-mm-yyyy'), 0, 299.627, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500082, 47, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('02-02-2018', 'dd-mm-yyyy'), 0, 1193.328, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('21-03-2018', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('21-04-2018', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('21-05-2018', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('21-06-2018', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('21-07-2018', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('21-08-2018', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('21-09-2018', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('21-10-2018', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('21-11-2018', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('21-12-2018', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('21-01-2019', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('21-02-2019', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('21-03-2019', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('21-04-2019', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('21-05-2019', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('21-06-2019', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('21-07-2019', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('21-08-2019', 'dd-mm-yyyy'), 0, 52.26, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500031, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('15-01-2018', 'dd-mm-yyyy'), 0, 1217.82, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500031, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('15-02-2018', 'dd-mm-yyyy'), 0, 1217.82, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500031, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('15-03-2018', 'dd-mm-yyyy'), 0, 1217.82, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('22-04-2018', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500031, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('15-04-2018', 'dd-mm-yyyy'), 0, 1217.82, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('22-03-2018', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('22-05-2018', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('22-06-2018', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('22-07-2018', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('22-08-2018', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('22-09-2018', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('22-10-2018', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('22-11-2018', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('22-12-2018', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('22-01-2019', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('22-02-2019', 'dd-mm-yyyy'), 0, 210.952, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500276, 47, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('17-05-2018', 'dd-mm-yyyy'), 0, 1981.16, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500276, 47, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('17-06-2018', 'dd-mm-yyyy'), 0, 1981.16, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500101, 66, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('24-02-2018', 'dd-mm-yyyy'), 0, 234.763, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500101, 66, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('24-03-2018', 'dd-mm-yyyy'), 0, 234.763, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500101, 66, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('24-04-2018', 'dd-mm-yyyy'), 0, 234.763, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('16-07-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('16-08-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('16-09-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('16-10-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('16-11-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('16-12-2010', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('16-01-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('16-02-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
commit;
prompt 800 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('16-03-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('16-04-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('16-05-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('16-06-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('16-07-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('16-08-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('16-09-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('16-10-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('16-11-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('16-12-2011', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('16-01-2012', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('16-02-2012', 'dd-mm-yyyy'), 2, 107.595, to_date('02-03-2009', 'dd-mm-yyyy'), 107.595);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500183, 51, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('10-09-2009', 'dd-mm-yyyy'), 2, 840.691, to_date('12-08-2009', 'dd-mm-yyyy'), 840.691);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500185, 53, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('10-09-2009', 'dd-mm-yyyy'), 2, 2142.222, to_date('12-08-2009', 'dd-mm-yyyy'), 2142.222);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500185, 53, to_date('01-01-2008', 'dd-mm-yyyy'), 1, to_date('30-09-2010', 'dd-mm-yyyy'), 2, 2196.072, to_date('08-09-2010', 'dd-mm-yyyy'), 2196.072);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('08-06-2010', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('08-07-2010', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('08-08-2010', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('08-09-2010', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('08-05-2010', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('08-02-2010', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('08-03-2010', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('08-04-2010', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('08-01-2010', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('08-12-2009', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('08-11-2009', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('08-10-2009', 'dd-mm-yyyy'), 2, 69.185, to_date('10-09-2009', 'dd-mm-yyyy'), 69.185);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500189, 57, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('14-12-2013', 'dd-mm-yyyy'), 0, 4418.807, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('24-03-2010', 'dd-mm-yyyy'), 2, 119.932, to_date('02-04-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('24-10-2010', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('24-11-2010', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('24-12-2010', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('24-01-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('24-02-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('24-03-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('24-04-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('24-05-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('24-06-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('24-07-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('24-08-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('24-09-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('24-10-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('24-11-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('24-12-2011', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('24-01-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('24-02-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('24-03-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('24-04-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('24-05-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('24-06-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('24-07-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('24-08-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('24-09-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('24-10-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('24-11-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('24-12-2012', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('24-02-2010', 'dd-mm-yyyy'), 2, 119.932, to_date('02-04-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('24-01-2010', 'dd-mm-yyyy'), 2, 119.932, to_date('02-04-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('24-07-2010', 'dd-mm-yyyy'), 2, 119.932, null, 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('24-06-2010', 'dd-mm-yyyy'), 2, 119.932, null, 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('24-05-2010', 'dd-mm-yyyy'), 2, 119.932, null, 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('24-04-2010', 'dd-mm-yyyy'), 2, 119.932, null, 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('24-08-2010', 'dd-mm-yyyy'), 2, 119.932, null, 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('24-09-2010', 'dd-mm-yyyy'), 2, 119.932, to_date('02-06-2010', 'dd-mm-yyyy'), 119.932);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('04-10-2013', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('04-09-2016', 'dd-mm-yyyy'), 0, 385.891, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('04-12-2013', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('04-01-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('04-02-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('04-03-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('04-04-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('04-05-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('04-06-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('04-07-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('04-08-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('04-09-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('04-10-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('04-11-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('04-12-2014', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('04-01-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('04-02-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('04-03-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('04-04-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('04-05-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('04-06-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('04-07-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('04-08-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('04-09-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('04-10-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('04-11-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('04-12-2015', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('04-01-2016', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('04-02-2016', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('04-03-2016', 'dd-mm-yyyy'), 1, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 154.36);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('04-04-2016', 'dd-mm-yyyy'), 0, 385.891, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('04-05-2016', 'dd-mm-yyyy'), 0, 385.891, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('04-06-2016', 'dd-mm-yyyy'), 0, 385.891, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('04-07-2016', 'dd-mm-yyyy'), 0, 385.891, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('04-08-2016', 'dd-mm-yyyy'), 0, 385.891, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('04-11-2013', 'dd-mm-yyyy'), 2, 385.891, to_date('24-12-2014', 'dd-mm-yyyy'), 385.891);
commit;
prompt 900 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('29-11-2012', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('29-10-2012', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('29-01-2013', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('28-02-2013', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('29-03-2013', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('29-04-2013', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('29-05-2013', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('29-06-2013', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('29-07-2013', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('29-08-2010', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-01-2008', 'dd-mm-yyyy'), 1, to_date('30-09-2010', 'dd-mm-yyyy'), 2, 7246.634, null, 7246.634);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('29-09-2010', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('29-10-2010', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('29-11-2010', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('29-12-2010', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('29-01-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('28-02-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('29-03-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('29-04-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('29-05-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('29-06-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('29-07-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('29-08-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('29-09-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('29-10-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('29-11-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('29-12-2011', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('29-01-2012', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('29-02-2012', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('29-03-2012', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('29-04-2012', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('29-05-2012', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('29-06-2012', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('29-07-2012', 'dd-mm-yyyy'), 2, 294.807, to_date('10-08-2010', 'dd-mm-yyyy'), 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('29-08-2012', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('29-09-2012', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('29-12-2012', 'dd-mm-yyyy'), 2, 294.807, null, 294.807);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('10-09-2010', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('10-08-2013', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('10-11-2010', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('10-12-2010', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('10-01-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('10-02-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('10-03-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('10-04-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('10-05-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('10-06-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('10-07-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('10-08-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('10-09-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('10-10-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('10-11-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('10-12-2011', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('10-01-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('10-02-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('10-03-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('10-04-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('10-05-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('10-06-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('10-07-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('10-08-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('10-09-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('10-10-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('10-11-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('10-12-2012', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('10-01-2013', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('10-02-2013', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('10-03-2013', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('10-04-2013', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('10-05-2013', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('10-06-2013', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('10-07-2013', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('10-10-2010', 'dd-mm-yyyy'), 2, 217.683, to_date('11-08-2010', 'dd-mm-yyyy'), 217.683);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('18-06-2012', 'dd-mm-yyyy'), 2, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('18-05-2012', 'dd-mm-yyyy'), 2, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('18-08-2012', 'dd-mm-yyyy'), 2, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('18-09-2012', 'dd-mm-yyyy'), 2, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('18-10-2012', 'dd-mm-yyyy'), 2, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('18-11-2010', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('18-12-2010', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('18-01-2011', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('18-02-2011', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('18-03-2011', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('18-04-2011', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('18-05-2011', 'dd-mm-yyyy'), 2, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('18-06-2011', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('18-07-2011', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('18-08-2011', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('18-09-2011', 'dd-mm-yyyy'), 2, 135.624, null, 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('18-10-2011', 'dd-mm-yyyy'), 2, 135.624, null, 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('18-11-2011', 'dd-mm-yyyy'), 2, 135.624, null, 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('18-12-2011', 'dd-mm-yyyy'), 2, 135.624, null, 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('18-01-2012', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('18-02-2012', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('18-03-2012', 'dd-mm-yyyy'), 2, 135.624, to_date('16-12-2010', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('18-04-2012', 'dd-mm-yyyy'), 2, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('18-07-2012', 'dd-mm-yyyy'), 2, 135.624, to_date('28-02-2011', 'dd-mm-yyyy'), 135.624);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('03-11-2011', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('03-12-2011', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('03-01-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
commit;
prompt 1000 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('03-02-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('03-03-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('03-04-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('03-05-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('03-06-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('03-07-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('03-08-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('03-09-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('03-10-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('03-11-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('03-12-2012', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('03-01-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('03-02-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('03-03-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('03-04-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('03-05-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('03-06-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('03-07-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('03-08-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('03-09-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('03-10-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('03-11-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('03-12-2013', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('03-01-2014', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('03-02-2014', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('03-03-2014', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('03-04-2014', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('03-05-2014', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('03-06-2014', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('03-07-2014', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('03-08-2014', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('03-09-2014', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('03-10-2014', 'dd-mm-yyyy'), 2, 122.052, to_date('31-10-2011', 'dd-mm-yyyy'), 122.052);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500215, 83, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('16-05-2012', 'dd-mm-yyyy'), 2, 383.003, to_date('17-04-2012', 'dd-mm-yyyy'), 383.003);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('11-03-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('11-02-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('11-05-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('11-06-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('11-07-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('11-08-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('11-09-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('11-10-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('11-11-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('11-12-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('11-01-2017', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('11-02-2017', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('11-03-2017', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('11-04-2017', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('11-05-2014', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('11-06-2014', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('11-07-2014', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('11-08-2014', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('11-09-2014', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('11-10-2014', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('11-11-2014', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('11-12-2014', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('11-01-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('11-02-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('11-03-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('11-04-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('11-05-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('11-06-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('11-07-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('11-08-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('11-09-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('11-10-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('11-11-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('11-12-2015', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('11-01-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('11-04-2016', 'dd-mm-yyyy'), 0, 274.08, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('06-10-2013', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('06-09-2016', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('06-12-2013', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('06-01-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('06-02-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('06-03-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('06-04-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('06-05-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('06-06-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('06-07-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('06-08-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('06-09-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('06-10-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('06-11-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('06-12-2014', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('06-01-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('06-02-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('06-03-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('06-04-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('06-05-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('06-06-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('06-07-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('06-08-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('06-09-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('06-10-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('06-11-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('06-12-2015', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('06-01-2016', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('06-02-2016', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('06-03-2016', 'dd-mm-yyyy'), 0, 204.994, null, null);
commit;
prompt 1100 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('06-04-2016', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('06-05-2016', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('06-06-2016', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('06-07-2016', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('06-08-2016', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('06-11-2013', 'dd-mm-yyyy'), 0, 204.994, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500233, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('12-09-2013', 'dd-mm-yyyy'), 0, 4450.309, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('27-04-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('27-03-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('27-06-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('27-07-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('27-08-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('27-09-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('27-10-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('27-11-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('27-12-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('27-01-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('27-02-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('27-03-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('27-04-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('27-05-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('27-06-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('27-07-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('27-08-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('27-09-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('27-10-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('27-11-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('27-12-2016', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('27-01-2017', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('27-02-2017', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('27-03-2014', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('27-04-2014', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('27-05-2014', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('27-06-2014', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('27-07-2014', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('27-08-2014', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('27-09-2014', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('27-10-2014', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('27-11-2014', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('27-12-2014', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('27-01-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('27-02-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('27-05-2015', 'dd-mm-yyyy'), 0, 1493.685, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('18-04-2014', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('18-03-2017', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('18-06-2014', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('18-07-2014', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('18-08-2014', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('18-09-2014', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 7, to_date('18-10-2014', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('18-11-2014', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('18-12-2014', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('18-01-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('18-02-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('18-03-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('18-04-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('18-05-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('18-06-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('18-07-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('18-08-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('18-09-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('18-10-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('18-11-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('18-12-2015', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('18-01-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('18-02-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('18-03-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('18-04-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('18-05-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('18-06-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('18-07-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('18-08-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('18-09-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('18-10-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('18-11-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('18-12-2016', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('18-01-2017', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('18-02-2017', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('18-05-2014', 'dd-mm-yyyy'), 0, 110.388, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 6, to_date('06-12-2014', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 5, to_date('06-11-2014', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 8, to_date('06-02-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 9, to_date('06-03-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 10, to_date('06-04-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 11, to_date('06-05-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 12, to_date('06-06-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 13, to_date('06-07-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 14, to_date('06-08-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 15, to_date('06-09-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 16, to_date('06-10-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 17, to_date('06-11-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 18, to_date('06-12-2015', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 19, to_date('06-01-2016', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 20, to_date('06-02-2016', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 21, to_date('06-03-2016', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 22, to_date('06-04-2016', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 23, to_date('06-05-2016', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 24, to_date('06-06-2016', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 25, to_date('06-07-2016', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 26, to_date('06-08-2016', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
commit;
prompt 1200 records committed...
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 27, to_date('06-09-2016', 'dd-mm-yyyy'), 2, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 28, to_date('06-10-2016', 'dd-mm-yyyy'), 1, 301.868, to_date('28-01-2015', 'dd-mm-yyyy'), 60.394);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 29, to_date('06-11-2016', 'dd-mm-yyyy'), 0, 301.868, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 30, to_date('06-12-2016', 'dd-mm-yyyy'), 0, 301.868, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 31, to_date('06-01-2017', 'dd-mm-yyyy'), 0, 301.868, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 32, to_date('06-02-2017', 'dd-mm-yyyy'), 0, 301.868, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 33, to_date('06-03-2017', 'dd-mm-yyyy'), 0, 301.868, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 34, to_date('06-04-2017', 'dd-mm-yyyy'), 0, 301.868, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 35, to_date('06-05-2017', 'dd-mm-yyyy'), 0, 301.868, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 36, to_date('06-06-2017', 'dd-mm-yyyy'), 0, 301.868, null, null);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('06-07-2014', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
insert into COPT.ENG_ECHEANCE (eng_num, emp_mat, emp_cle, dco_dtdeb, num_ech, dt_ech, sit_ech, mnt_ech, dt_pay, mnt_pay)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('06-08-2014', 'dd-mm-yyyy'), 2, 301.868, to_date('06-06-2014', 'dd-mm-yyyy'), 301.868);
commit;
prompt 1212 records loaded
set feedback on
set define on
prompt Done.
