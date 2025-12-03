prompt PL/SQL Developer import file
prompt Created on mardi 2 décembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.MDISP_SALAIRE...
drop table COPT.MDISP_SALAIRE cascade constraints;
prompt Creating COPT.MDISP_SALAIRE...
create table COPT.MDISP_SALAIRE
(
  emp_mat     NUMBER(8) not null,
  emp_cle     NUMBER(2) not null,
  ass_mat     NUMBER(8) not null,
  ass_cle     NUMBER(2) not null,
  dco_dtdeb   DATE not null,
  sle_date    DATE not null,
  sle_salaire NUMBER(15,3),
  sle_agent   NUMBER(6)
)
nologging;
create index COPT.FK_MDISP_SALLAIRE on COPT.MDISP_SALAIRE (EMP_MAT, EMP_CLE, ASS_MAT, ASS_CLE, DCO_DTDEB);
alter table COPT.MDISP_SALAIRE
  add constraint PK_MDISP_SALLAIRE primary key (EMP_MAT, EMP_CLE, ASS_MAT, ASS_CLE, DCO_DTDEB, SLE_DATE);

prompt Loading COPT.MDISP_SALAIRE...
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11600023, 7, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('01-04-2014', 'dd-mm-yyyy'), 1317.676, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11613825, 0, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('01-04-2014', 'dd-mm-yyyy'), 1277.03, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 12157915, 8, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('01-04-2014', 'dd-mm-yyyy'), 1029.597, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11445070, 9, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('01-04-2014', 'dd-mm-yyyy'), 1809.704, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11613297, 9, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('01-04-2014', 'dd-mm-yyyy'), 1759.06, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 16166114, 4, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('01-04-2014', 'dd-mm-yyyy'), 1797.737, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11810800, 1, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('01-04-2014', 'dd-mm-yyyy'), 1373.566, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11359712, 6, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('01-04-2014', 'dd-mm-yyyy'), 1404.918, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11613825, 0, to_date('01-01-2013', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), 1277.033, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 12157915, 8, to_date('01-01-2013', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), 1029.597, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11600023, 7, to_date('01-01-2013', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), 1317.676, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11445070, 9, to_date('01-01-2013', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), 1809.704, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11613297, 9, to_date('01-01-2013', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), 1759.06, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11584144, 7, to_date('01-01-2013', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), 1404.829, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 876037, 0, to_date('01-01-2013', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), 2670.174, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11359712, 6, to_date('01-04-2013', 'dd-mm-yyyy'), to_date('01-04-2013', 'dd-mm-yyyy'), 1404.918, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 16166114, 4, to_date('01-12-2013', 'dd-mm-yyyy'), to_date('01-12-2013', 'dd-mm-yyyy'), 1797.737, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11810800, 1, to_date('01-01-2014', 'dd-mm-yyyy'), to_date('01-01-2014', 'dd-mm-yyyy'), 1373.566, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11811998, 1, to_date('01-09-2014', 'dd-mm-yyyy'), to_date('01-09-2014', 'dd-mm-yyyy'), 2320.517, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 12157915, 8, to_date('01-10-2012', 'dd-mm-yyyy'), to_date('01-10-2012', 'dd-mm-yyyy'), 1029.597, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (239067, 59, 12955897, 7, to_date('01-10-2016', 'dd-mm-yyyy'), to_date('01-10-2016', 'dd-mm-yyyy'), 1526.848, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (239067, 59, 11692226, 9, to_date('01-09-2017', 'dd-mm-yyyy'), to_date('01-09-2017', 'dd-mm-yyyy'), 1755.269, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (64759, 60, 16078805, 5, to_date('01-09-2017', 'dd-mm-yyyy'), to_date('01-01-2018', 'dd-mm-yyyy'), 1091.984, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11613825, 0, to_date('01-12-2011', 'dd-mm-yyyy'), to_date('01-12-2011', 'dd-mm-yyyy'), 1277.03, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11689874, 0, to_date('19-10-2011', 'dd-mm-yyyy'), to_date('19-10-2011', 'dd-mm-yyyy'), 1722.432, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11600023, 7, to_date('01-09-2012', 'dd-mm-yyyy'), to_date('01-09-2012', 'dd-mm-yyyy'), 1317.676, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11584144, 7, to_date('01-07-2012', 'dd-mm-yyyy'), to_date('01-07-2012', 'dd-mm-yyyy'), 1404.829, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11445070, 9, to_date('01-11-2011', 'dd-mm-yyyy'), to_date('01-11-2011', 'dd-mm-yyyy'), 1809.704, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11613297, 9, to_date('28-03-2012', 'dd-mm-yyyy'), to_date('28-03-2012', 'dd-mm-yyyy'), 1759.06, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (64759, 60, 16078805, 5, to_date('01-09-2017', 'dd-mm-yyyy'), to_date('01-05-2019', 'dd-mm-yyyy'), 1244.292, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (20757, 96, 16078883, 0, to_date('01-01-2015', 'dd-mm-yyyy'), to_date('01-04-2015', 'dd-mm-yyyy'), 1285.549, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (21949, 27, 11613825, 0, to_date('01-10-2012', 'dd-mm-yyyy'), to_date('01-10-2012', 'dd-mm-yyyy'), 1277.03, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (64759, 60, 16078805, 5, to_date('01-09-2017', 'dd-mm-yyyy'), to_date('01-09-2017', 'dd-mm-yyyy'), 1050.446, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2014', 'dd-mm-yyyy'), to_date('01-03-2014', 'dd-mm-yyyy'), 1406.606, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2014', 'dd-mm-yyyy'), to_date('01-10-2014', 'dd-mm-yyyy'), 1816.141, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2014', 'dd-mm-yyyy'), to_date('01-01-2015', 'dd-mm-yyyy'), 1431.906, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (64759, 60, 16078805, 5, to_date('01-09-2017', 'dd-mm-yyyy'), to_date('28-08-2025', 'dd-mm-yyyy'), 1954.945, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (64759, 60, 16078805, 5, to_date('01-09-2025', 'dd-mm-yyyy'), to_date('01-09-2025', 'dd-mm-yyyy'), 1954.945, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (25724, 19, 11763581, 7, to_date('16-11-2020', 'dd-mm-yyyy'), to_date('16-11-2020', 'dd-mm-yyyy'), 2965.4, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2015', 'dd-mm-yyyy'), to_date('01-04-2015', 'dd-mm-yyyy'), 1444.557, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2015', 'dd-mm-yyyy'), to_date('01-10-2015', 'dd-mm-yyyy'), 1866.742, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2015', 'dd-mm-yyyy'), to_date('01-01-2016', 'dd-mm-yyyy'), 1543.042, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2016', 'dd-mm-yyyy'), to_date('01-04-2016', 'dd-mm-yyyy'), 1549.285, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2016', 'dd-mm-yyyy'), to_date('01-10-2016', 'dd-mm-yyyy'), 2066.38, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2016', 'dd-mm-yyyy'), to_date('01-01-2017', 'dd-mm-yyyy'), 1696.618, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2017', 'dd-mm-yyyy'), to_date('01-07-2017', 'dd-mm-yyyy'), 1829.951, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2017', 'dd-mm-yyyy'), to_date('01-10-2017', 'dd-mm-yyyy'), 2496.157, null);
insert into COPT.MDISP_SALAIRE (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, sle_date, sle_salaire, sle_agent)
values (18624, 0, 16520937, 7, to_date('01-03-2017', 'dd-mm-yyyy'), to_date('01-01-2018', 'dd-mm-yyyy'), 2218.211, null);
commit;
prompt 48 records loaded
set feedback on
set define on
prompt Done.
