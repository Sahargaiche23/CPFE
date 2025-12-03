prompt PL/SQL Developer import file
prompt Created on mardi 2 décembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.DOSSIER_COP...
drop table COPT.DOSSIER_COP cascade constraints;
prompt Creating COPT.DOSSIER_COP...
create table COPT.DOSSIER_COP
(
  emp_mat        NUMBER(8) not null,
  emp_cle        NUMBER(2) not null,
  dco_dtdeb      DATE not null,
  ass_mat        NUMBER(8) not null,
  ass_cle        NUMBER(2) not null,
  pay_cod        NUMBER(4) not null,
  dco_dtfin      DATE,
  dco_salaire    NUMBER(15,3),
  dco_numaff     NUMBER(8),
  dco_cleaff     NUMBER(2),
  dco_numregcpl  NUMBER(8),
  dco_clleregcpl NUMBER(2),
  dco_salid      VARCHAR2(1)
)
nologging;
create index COPT.FK_ASS_DOSS_COP on COPT.DOSSIER_COP (ASS_MAT, ASS_CLE);
create index COPT.FK_EMP_DOSS_COP on COPT.DOSSIER_COP (EMP_MAT, EMP_CLE);
create index COPT.FK_PAY_DOSCOP on COPT.DOSSIER_COP (PAY_COD);
alter table COPT.DOSSIER_COP
  add constraint PK_DOSSIER_COP primary key (EMP_MAT, EMP_CLE, DCO_DTDEB);
alter table COPT.DOSSIER_COP
  add constraint FK_DOSSIER_PAYS foreign key (PAY_COD)
  references REFERENTIEL.PAYS (PAY_COD);

prompt Loading COPT.DOSSIER_COP...
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500029, 91, to_date('01-07-2007', 'dd-mm-yyyy'), 11045324, 1, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 11767089, 5, 206, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500030, 92, to_date('01-07-2007', 'dd-mm-yyyy'), 515043, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 419566, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 11991874, 0, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500048, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 11142392, 3, 602, null, null, 600004, 59, 151, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500140, 8, to_date('01-07-2007', 'dd-mm-yyyy'), 11137474, 4, 209, null, null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500136, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 12546285, 4, 209, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500053, 18, to_date('01-07-2007', 'dd-mm-yyyy'), 11765860, 4, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 11057185, 4, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500156, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 980686, 0, 207, null, null, 35555, 53, 296, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 11554775, 6, 207, null, null, 18002, 57, 135, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500163, 31, to_date('01-07-2007', 'dd-mm-yyyy'), 11269011, 5, 207, null, null, 206110, 82, 808, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500170, 38, to_date('01-07-2007', 'dd-mm-yyyy'), 11766824, 7, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500174, 42, to_date('01-07-2007', 'dd-mm-yyyy'), 11766626, 7, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500175, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 793238, 0, 602, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500177, 45, to_date('01-07-2007', 'dd-mm-yyyy'), 11767019, 0, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500192, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 870291, 0, 209, null, 18377.64, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500179, 47, to_date('01-09-2008', 'dd-mm-yyyy'), 11765791, 8, 602, null, 3035.27, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500182, 50, to_date('01-01-2009', 'dd-mm-yyyy'), 11384946, 2, 209, null, 18377.64, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 946752, 0, 206, null, null, 20757, 96, 145, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500026, 88, to_date('01-07-2007', 'dd-mm-yyyy'), 360778, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500028, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 11123224, 7, 206, null, null, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500032, 94, to_date('01-07-2007', 'dd-mm-yyyy'), 370120, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500038, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 366211, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500043, 8, to_date('01-07-2007', 'dd-mm-yyyy'), 795211, 0, 207, null, null, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500044, 9, to_date('01-07-2007', 'dd-mm-yyyy'), 11045106, 5, 206, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 11307569, 9, 209, null, 21385.2, 20053, 71, 90, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500185, 53, to_date('01-01-2008', 'dd-mm-yyyy'), 11172570, 4, 205, null, null, 62459, 88, 409, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500207, 75, to_date('01-07-2007', 'dd-mm-yyyy'), 11451662, 1, 206, null, 6745, 133141, 57, 748, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500212, 80, to_date('01-01-2012', 'dd-mm-yyyy'), 16101645, 9, 207, null, 10012.14, 63915, 89, 1538, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500213, 81, to_date('01-10-2010', 'dd-mm-yyyy'), 11318462, 4, 602, to_date('30-09-2011', 'dd-mm-yyyy'), 5487.3, 16715, 31, 103, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500218, 86, to_date('01-07-2007', 'dd-mm-yyyy'), 12275255, 6, 517, null, 4500.93, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500219, 87, to_date('01-07-2007', 'dd-mm-yyyy'), 11065048, 4, 209, null, 24695.924, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500228, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 12622634, 1, 209, null, 43143, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 11444352, 1, 524, null, null, 25724, 19, 204, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 11038272, 8, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 11719714, 9, 602, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500246, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 11766496, 4, 207, null, 5978.265, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500247, 18, to_date('01-07-2007', 'dd-mm-yyyy'), 11086515, 4, 602, null, 11883.75, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 12296300, 7, 214, null, 5572.38, 28423, 2, 999, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500263, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 12054712, 2, 602, null, 7689.96, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500265, 36, to_date('01-07-2007', 'dd-mm-yyyy'), 12255114, 9, 209, null, 59377.273, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500266, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 11410040, 0, 214, null, 10203.12, 25724, 19, 204, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500273, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 11987133, 5, 601, null, 15295.411, 238152, 17, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500274, 45, to_date('01-07-2007', 'dd-mm-yyyy'), 12544533, 9, 209, null, 12078.48, 25724, 19, 204, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500277, 48, to_date('01-07-2007', 'dd-mm-yyyy'), 11373230, 0, 207, null, 7415.28, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500279, 50, to_date('01-07-2007', 'dd-mm-yyyy'), 11237121, 9, 202, null, 4778.4, 600029, 84, 99, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500280, 51, to_date('01-07-2007', 'dd-mm-yyyy'), 11980758, 4, 311, null, 30430.35, 27310, 53, 253, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500281, 52, to_date('01-07-2007', 'dd-mm-yyyy'), 11451351, 7, 207, null, 21203.438, 62459, 88, 409, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500285, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 12548730, 1, 207, null, 10187.28, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500297, 68, to_date('01-07-2007', 'dd-mm-yyyy'), 16264111, 0, 207, null, 8554.68, 133571, 2, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500299, 70, to_date('01-10-2017', 'dd-mm-yyyy'), 12502634, 5, 602, null, 2750.033, 198408, 43, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500305, 76, to_date('01-04-2019', 'dd-mm-yyyy'), 16993002, 6, 312, null, 26521.56, 600004, 59, 151, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500307, 78, to_date('01-07-2018', 'dd-mm-yyyy'), 12542269, 3, 208, null, 6820.575, 133571, 2, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500298, 69, to_date('01-10-2018', 'dd-mm-yyyy'), 11600810, 4, 206, null, 20886.3, 133141, 57, 748, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500313, 84, to_date('01-01-2019', 'dd-mm-yyyy'), 16682999, 0, 209, null, 55011.87, 329912, 15, 132, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500311, 82, to_date('01-10-2018', 'dd-mm-yyyy'), 16761495, 1, 311, null, 24082.47, 27310, 53, 253, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500315, 86, to_date('01-05-2019', 'dd-mm-yyyy'), 16273491, 1, 207, null, 32860.575, 27193, 33, 300, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500147, 15, to_date('01-07-2007', 'dd-mm-yyyy'), 11192847, 9, 208, null, null, 76904, 80, 1255, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500091, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 11192299, 2, 404, null, null, 600097, 55, 263, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 561606, 0, 404, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500006, 68, to_date('01-07-2007', 'dd-mm-yyyy'), 11764194, 4, 602, null, null, 16715, 31, 103, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500008, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 11766204, 7, 206, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500055, 20, to_date('01-07-2007', 'dd-mm-yyyy'), 627497, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500011, 73, to_date('01-07-2007', 'dd-mm-yyyy'), 656650, 0, 206, null, null, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500018, 80, to_date('01-07-2007', 'dd-mm-yyyy'), 11758155, 3, 209, null, null, 18030, 85, 136, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500020, 82, to_date('01-07-2007', 'dd-mm-yyyy'), 11600578, 6, 209, null, null, 133141, 57, 748, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500021, 83, to_date('01-07-2007', 'dd-mm-yyyy'), 11765531, 3, 206, null, null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500023, 85, to_date('01-07-2007', 'dd-mm-yyyy'), 11108535, 2, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500025, 87, to_date('01-07-2007', 'dd-mm-yyyy'), 11189821, 5, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500001, 63, to_date('01-07-2007', 'dd-mm-yyyy'), 11767392, 7, 206, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500052, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 583531, 0, 207, null, null, 18002, 57, 135, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500057, 22, to_date('01-07-2007', 'dd-mm-yyyy'), 11584366, 8, 207, null, null, 18002, 57, 135, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500058, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 965553, 0, 601, null, null, 18002, 57, 135, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 11230062, 5, 207, null, null, 45175, 70, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500063, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 11189832, 2, 209, to_date('31-12-2024', 'dd-mm-yyyy'), null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500065, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 11045106, 5, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500069, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 11065613, 9, 203, null, null, 63915, 89, 1538, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 883774, 0, 209, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500040, 5, to_date('01-07-2007', 'dd-mm-yyyy'), 11056984, 9, 307, null, null, 65291, 10, 454, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500042, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 287177, 0, 209, null, null, 600097, 55, 263, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500124, 89, to_date('01-07-2007', 'dd-mm-yyyy'), 11659914, 5, 209, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 12236846, 4, 209, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500126, 91, to_date('01-07-2007', 'dd-mm-yyyy'), 12256032, 6, 209, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500127, 92, to_date('01-07-2007', 'dd-mm-yyyy'), 11328141, 2, 207, null, null, 143121, 46, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500129, 94, to_date('01-07-2007', 'dd-mm-yyyy'), 12517893, 9, 209, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500130, 95, to_date('01-07-2007', 'dd-mm-yyyy'), 11766512, 4, 209, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500131, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 897885, 0, 209, null, null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500151, 19, to_date('01-07-2007', 'dd-mm-yyyy'), 12174550, 3, 602, null, null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500154, 22, to_date('01-07-2007', 'dd-mm-yyyy'), 12278320, 1, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500157, 25, to_date('01-07-2007', 'dd-mm-yyyy'), 11294791, 9, 214, null, null, 141564, 41, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500158, 26, to_date('01-07-2007', 'dd-mm-yyyy'), 11511254, 6, 207, null, 37367.4, 600029, 84, 99, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500132, 0, to_date('01-07-2007', 'dd-mm-yyyy'), 841029, 0, 207, null, null, 18002, 57, 135, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500167, 35, to_date('01-07-2007', 'dd-mm-yyyy'), 662538, 0, 207, null, null, 25724, 19, 204, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500009, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 11766875, 5, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500002, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 556802, 0, 512, null, null, 500002, 64, 1226, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500142, 10, to_date('01-07-2007', 'dd-mm-yyyy'), 929918, 0, 207, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 11524984, 6, 207, null, null, 66127, 70, 535, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500186, 54, to_date('01-07-2007', 'dd-mm-yyyy'), 11765926, 6, 516, null, null, 206056, 28, 36, null, 'S');
commit;
prompt 100 records committed...
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 11435419, 0, 207, null, 8196.834, null, null, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500200, 68, to_date('01-07-2007', 'dd-mm-yyyy'), 11807459, 1, 207, null, 13393, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500003, 65, to_date('01-07-2007', 'dd-mm-yyyy'), 11767270, 4, 206, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500004, 66, to_date('01-07-2007', 'dd-mm-yyyy'), 11766022, 7, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500005, 67, to_date('01-07-2007', 'dd-mm-yyyy'), 565196, 0, 207, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500202, 70, to_date('01-10-1993', 'dd-mm-yyyy'), 868859, 0, 218, to_date('31-12-1996', 'dd-mm-yyyy'), null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500202, 70, to_date('01-01-2008', 'dd-mm-yyyy'), 868859, 0, 218, null, null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500206, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 11487770, 4, 206, null, 14133.644, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500221, 89, to_date('01-07-2007', 'dd-mm-yyyy'), 12620014, 5, 209, null, 26962.866, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500223, 91, to_date('01-07-2007', 'dd-mm-yyyy'), 12789744, 5, 602, null, 8780.28, 18002, 57, 135, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500230, 1, to_date('01-07-2007', 'dd-mm-yyyy'), 12271848, 9, 209, null, 26875, 269624, 61, 1642, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500235, 6, to_date('01-07-2007', 'dd-mm-yyyy'), 11454868, 7, 206, null, 51891.84, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500245, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 11611367, 8, 209, null, 12611.13, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500244, 15, to_date('01-07-2007', 'dd-mm-yyyy'), 16419567, 9, 517, null, 11349.72, 133571, 2, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500243, 14, to_date('01-07-2007', 'dd-mm-yyyy'), 12441775, 5, 602, null, 9507.456, 600004, 59, 151, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500260, 31, to_date('01-07-2007', 'dd-mm-yyyy'), 11834799, 4, 311, null, 13500, 75334, 62, 616, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500252, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 12513937, 6, 209, null, 11175, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 12274814, 3, 401, null, 6488.64, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500272, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 16683255, 7, 311, null, 32979, 329912, 15, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500291, 62, to_date('01-07-2007', 'dd-mm-yyyy'), 11705828, 1, 306, to_date('31-03-2025', 'dd-mm-yyyy'), 13671.651, 239067, 59, 1546, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500303, 74, to_date('01-07-2018', 'dd-mm-yyyy'), 11288285, 4, 100, null, 3704.228, 76904, 80, 1255, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500314, 85, to_date('01-01-2019', 'dd-mm-yyyy'), 11772614, 9, 309, null, 20563.2, 16715, 31, 103, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500083, 48, to_date('01-07-2007', 'dd-mm-yyyy'), 11767323, 1, 208, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500017, 79, to_date('01-07-2007', 'dd-mm-yyyy'), 11037816, 3, 209, null, null, 25166, 43, 254, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500123, 88, to_date('01-07-2007', 'dd-mm-yyyy'), 11620125, 2, 301, null, null, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500144, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 12482462, 7, 302, null, null, 198408, 43, null, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500086, 51, to_date('01-07-2007', 'dd-mm-yyyy'), 11693172, 1, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500089, 54, to_date('01-07-2007', 'dd-mm-yyyy'), 11763319, 6, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500090, 55, to_date('01-07-2007', 'dd-mm-yyyy'), 644429, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500093, 58, to_date('01-07-2007', 'dd-mm-yyyy'), 538917, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500103, 68, to_date('01-07-2007', 'dd-mm-yyyy'), 11821647, 5, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500105, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 11767448, 1, 501, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500107, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 11754297, 1, 512, null, null, 18030, 85, 136, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500108, 73, to_date('01-07-2007', 'dd-mm-yyyy'), 11188040, 2, 209, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500110, 75, to_date('01-07-2007', 'dd-mm-yyyy'), 639776, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500111, 76, to_date('01-07-2007', 'dd-mm-yyyy'), 12192390, 9, 209, null, null, 37943, 16, 514, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500112, 77, to_date('01-07-2007', 'dd-mm-yyyy'), 11767165, 2, 209, null, null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500113, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 11158771, 0, 307, null, null, 137, 40, 26, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500114, 79, to_date('01-07-2007', 'dd-mm-yyyy'), 11818719, 4, 209, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500116, 81, to_date('01-07-2007', 'dd-mm-yyyy'), 11239765, 6, 207, null, null, 600004, 59, 151, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500117, 82, to_date('01-07-2007', 'dd-mm-yyyy'), 12540181, 2, 206, null, null, 206360, 41, 691, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500141, 9, to_date('01-07-2007', 'dd-mm-yyyy'), 11139423, 2, 501, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500178, 46, to_date('01-01-2009', 'dd-mm-yyyy'), 11642751, 7, 602, null, 7231.875, 18624, 0, 264, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 12059439, 3, 209, null, null, 18002, 57, 135, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500153, 21, to_date('01-07-2007', 'dd-mm-yyyy'), 11767166, 1, 209, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 11479474, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 11045173, 3, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500027, 89, to_date('01-07-2007', 'dd-mm-yyyy'), 11008573, 7, 209, null, null, 20757, 96, 145, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500166, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 11167297, 6, 209, null, 2982, 62459, 88, 409, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500168, 36, to_date('01-07-2007', 'dd-mm-yyyy'), 995980, 0, 100, null, null, 76904, 80, 1255, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500171, 39, to_date('01-07-2007', 'dd-mm-yyyy'), 11752343, 9, 602, null, null, 20757, 96, 145, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500169, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 12055796, 8, 208, null, 4397.062, 76904, 80, 1255, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500172, 40, to_date('01-07-2007', 'dd-mm-yyyy'), 11034871, 2, 214, null, null, 29840, 61, 229, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 283838, 0, 202, null, null, 52846, 78, 399, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500180, 48, to_date('01-07-2007', 'dd-mm-yyyy'), 11766625, 8, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500183, 51, to_date('01-07-2007', 'dd-mm-yyyy'), 11298426, 3, 207, null, null, 62459, 88, 409, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500187, 55, to_date('01-07-2007', 'dd-mm-yyyy'), 11946286, 6, 209, null, 33228.852, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500197, 65, to_date('01-07-2007', 'dd-mm-yyyy'), 11087412, 6, 206, null, 14133.642, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500121, 86, to_date('01-07-2007', 'dd-mm-yyyy'), 11449708, 1, 206, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500106, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 11467968, 8, 203, null, null, 133141, 57, 748, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500104, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 695083, 0, 301, null, null, 16715, 31, 103, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500099, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 11431197, 7, 206, null, null, 73456, 27, 1129, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500098, 63, to_date('01-07-2007', 'dd-mm-yyyy'), 879241, 0, 208, null, null, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500096, 61, to_date('01-07-2007', 'dd-mm-yyyy'), 11150235, 7, 100, null, null, 600029, 84, 99, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500088, 53, to_date('01-07-2007', 'dd-mm-yyyy'), 11573108, 4, 207, null, null, 18002, 57, 135, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 11358526, 4, 207, null, 7086.6, 18002, 57, 135, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500217, 85, to_date('01-07-2007', 'dd-mm-yyyy'), 12895780, 5, 208, null, 3017.1, 73456, 27, 1129, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500220, 88, to_date('01-07-2007', 'dd-mm-yyyy'), 16222255, 4, 206, null, 11358, 209501, 78, 1097, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500225, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 12255115, 8, 206, null, 61544.644, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500227, 95, to_date('01-07-2007', 'dd-mm-yyyy'), 16168797, 4, 209, null, 43245, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500233, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 11767088, 6, 522, null, 3058.669, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500239, 10, to_date('01-07-2007', 'dd-mm-yyyy'), 11046222, 2, 207, null, 10187.1, 62459, 88, 409, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 1049930, 0, 207, null, null, 58011, 5, 396, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500251, 22, to_date('01-07-2007', 'dd-mm-yyyy'), 11702637, 9, 206, to_date('30-04-2026', 'dd-mm-yyyy'), 12503, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500249, 20, to_date('01-07-2007', 'dd-mm-yyyy'), 11487599, 3, 209, null, 32517, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500259, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 12871669, 2, 100, null, 9279, 141564, 41, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500261, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 12547635, 9, 207, null, 12784.74, 252814, 32, 1531, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500275, 46, to_date('01-07-2007', 'dd-mm-yyyy'), 12780128, 0, 515, null, 1789.26, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500278, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 12640534, 4, 209, null, 3247.2, 36251, 70, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500276, 47, to_date('01-07-2007', 'dd-mm-yyyy'), 16683396, 7, 207, null, 41987.905, 329912, 15, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500282, 53, to_date('01-07-2007', 'dd-mm-yyyy'), 11164187, 6, 207, null, 25444.125, 62459, 88, 409, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500283, 54, to_date('01-07-2007', 'dd-mm-yyyy'), 16341018, 0, 518, null, 2090.556, 208887, 46, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500284, 55, to_date('01-07-2007', 'dd-mm-yyyy'), 11119702, 6, 516, null, 23510.834, 27193, 33, 300, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500292, 63, to_date('01-07-2007', 'dd-mm-yyyy'), 11469335, 0, 206, null, 12128.415, 133141, 57, 748, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500293, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 12710855, 6, 209, null, 38532, 143601, 41, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500294, 65, to_date('01-07-2007', 'dd-mm-yyyy'), 16532273, 4, 209, null, 32070.972, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500302, 73, to_date('01-04-2019', 'dd-mm-yyyy'), 12961810, 9, 311, null, 18200.1, 198408, 43, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500306, 77, to_date('01-07-2018', 'dd-mm-yyyy'), 12174845, 8, 209, null, 53904, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500308, 79, to_date('01-07-2018', 'dd-mm-yyyy'), 12275254, 7, 208, null, 11962.05, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500310, 81, to_date('01-10-2018', 'dd-mm-yyyy'), 12165003, 4, 517, null, 24766.56, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500317, 88, to_date('01-07-2019', 'dd-mm-yyyy'), 16272592, 1, 601, to_date('31-12-2024', 'dd-mm-yyyy'), 4962.672, 25724, 19, 204, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500318, 89, to_date('01-01-2020', 'dd-mm-yyyy'), 12784534, 0, 602, null, 10203.066, 18624, 0, 264, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500319, 90, to_date('01-07-2020', 'dd-mm-yyyy'), 12955185, 8, 602, null, 2281.275, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500119, 84, to_date('01-07-2007', 'dd-mm-yyyy'), 11599408, 6, 214, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500122, 87, to_date('01-07-2007', 'dd-mm-yyyy'), 12255120, 1, 209, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500120, 85, to_date('01-07-2007', 'dd-mm-yyyy'), 11097162, 7, 207, null, null, 30931, 85, 1113, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500118, 83, to_date('01-07-2007', 'dd-mm-yyyy'), 11656815, 1, 214, to_date('30-06-2025', 'dd-mm-yyyy'), 90607.707, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500152, 20, to_date('01-07-2007', 'dd-mm-yyyy'), 11775789, 1, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 11353997, 5, 207, null, null, 20757, 96, 145, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500146, 14, to_date('01-07-2007', 'dd-mm-yyyy'), 11828465, 9, 209, null, null, 25166, 43, 254, null, 'I');
commit;
prompt 200 records committed...
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500137, 5, to_date('01-07-2007', 'dd-mm-yyyy'), 11766195, 8, 217, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500070, 35, to_date('01-07-2007', 'dd-mm-yyyy'), 11583931, 6, 207, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500071, 36, to_date('01-07-2007', 'dd-mm-yyyy'), 11450638, 4, 207, null, null, 18002, 57, 135, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500072, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 11528510, 0, 207, to_date('30-09-2025', 'dd-mm-yyyy'), null, 18002, 57, 135, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500075, 40, to_date('01-07-2007', 'dd-mm-yyyy'), 11287971, 5, 206, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500078, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 12061795, 7, 207, null, null, 35698, 2, 174, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500079, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 12308845, 2, 207, null, null, 35505, 3, 268, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500081, 46, to_date('01-07-2007', 'dd-mm-yyyy'), 11685357, 4, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500092, 57, to_date('01-07-2007', 'dd-mm-yyyy'), 11087364, 4, 207, null, null, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500031, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 11045079, 8, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500033, 95, to_date('01-07-2007', 'dd-mm-yyyy'), 644412, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 11382902, 8, 214, to_date('31-12-2025', 'dd-mm-yyyy'), null, 16715, 31, 103, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500036, 1, to_date('01-07-2007', 'dd-mm-yyyy'), 11045353, 5, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500133, 1, to_date('01-07-2007', 'dd-mm-yyyy'), 11610777, 4, 209, null, null, 64289, 75, 441, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500134, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 11667076, 2, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500135, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 12255122, 9, 402, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500138, 6, to_date('01-07-2007', 'dd-mm-yyyy'), 11766452, 6, 209, null, null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500139, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 11050578, 4, 206, null, null, 25166, 43, 254, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 12273314, 0, 209, to_date('31-10-2025', 'dd-mm-yyyy'), null, 16715, 31, 103, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500184, 52, to_date('01-07-2007', 'dd-mm-yyyy'), 12546284, 5, 209, to_date('31-03-2026', 'dd-mm-yyyy'), 6219, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500191, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 11069082, 3, 209, null, 18337.64, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 981582, 0, 207, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500194, 62, to_date('01-07-2007', 'dd-mm-yyyy'), 11413184, 0, 209, null, 18377.64, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500198, 66, to_date('01-07-2007', 'dd-mm-yyyy'), 12548830, 0, 209, null, 14015.4, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500199, 67, to_date('01-07-2007', 'dd-mm-yyyy'), 592855, 0, 207, null, 21132, 25724, 19, 204, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500010, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 11765996, 1, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500013, 75, to_date('01-07-2007', 'dd-mm-yyyy'), 625119, 0, 207, null, null, 25724, 19, 204, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500014, 76, to_date('01-07-2007', 'dd-mm-yyyy'), 11672933, 5, 207, null, null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500016, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 11765450, 0, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 11074031, 5, 207, null, 4837.856, 65283, 2, 905, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500208, 76, to_date('01-07-2007', 'dd-mm-yyyy'), 11384934, 6, 206, null, 19700, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500209, 77, to_date('01-07-2007', 'dd-mm-yyyy'), 11693065, 1, 209, null, 19890, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 678406, 0, 207, null, 1000, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500211, 79, to_date('01-07-2010', 'dd-mm-yyyy'), 12057229, 1, 207, null, 10855.65, 600004, 59, 151, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500216, 84, to_date('01-07-2007', 'dd-mm-yyyy'), 11384943, 5, 206, null, 22714.8, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500222, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 16328318, 4, 209, null, 43720, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 11192743, 4, 207, null, null, 52849, 81, 649, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500234, 5, to_date('01-07-2007', 'dd-mm-yyyy'), 16533622, 0, 209, null, 42942, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500248, 19, to_date('01-07-2007', 'dd-mm-yyyy'), 16120561, 9, 206, null, 23035.788, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500250, 21, to_date('01-07-2007', 'dd-mm-yyyy'), 11656812, 4, 209, null, 60117, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500256, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 12517892, 0, 201, null, 4917.5, 239067, 59, 1546, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500257, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 14733204, 4, 522, null, 5252.4, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 11297648, 7, 207, null, null, 27940, 4, 521, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500267, 38, to_date('01-07-2007', 'dd-mm-yyyy'), 11656795, 5, 209, null, 59212.452, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 11752343, 9, 602, null, 19722.15, 20757, 96, 145, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500290, 61, to_date('01-07-2007', 'dd-mm-yyyy'), 11189938, 5, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500295, 66, to_date('01-07-2007', 'dd-mm-yyyy'), 16435417, 7, 207, null, 15801.228, 25724, 19, 204, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500296, 67, to_date('01-07-2007', 'dd-mm-yyyy'), 12476622, 6, 520, null, 30372.54, 27186, 26, 752, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500304, 75, to_date('02-01-2019', 'dd-mm-yyyy'), 12170545, 9, 601, null, 50536, 25724, 19, 204, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500312, 83, to_date('01-01-2019', 'dd-mm-yyyy'), 16079463, 6, 209, null, 16584.12, 18624, 0, 264, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500320, 91, to_date('01-01-2020', 'dd-mm-yyyy'), 16683852, 4, 207, to_date('30-06-2021', 'dd-mm-yyyy'), 12723, 329912, 15, 132, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500321, 92, to_date('01-01-2020', 'dd-mm-yyyy'), 11424974, 1, 209, to_date('14-01-2021', 'dd-mm-yyyy'), 81972.153, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500150, 18, to_date('01-07-2007', 'dd-mm-yyyy'), 11766459, 9, 209, null, null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500128, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 11600519, 8, 206, null, null, 133141, 57, 748, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500015, 77, to_date('01-07-2007', 'dd-mm-yyyy'), 797072, 0, 206, null, null, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500094, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 11480580, 9, 206, null, null, 16715, 31, 103, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500082, 47, to_date('01-07-2007', 'dd-mm-yyyy'), 11383010, 5, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500097, 62, to_date('01-07-2007', 'dd-mm-yyyy'), 11060604, 1, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500100, 65, to_date('01-07-2007', 'dd-mm-yyyy'), 11222908, 0, 602, null, null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500101, 66, to_date('01-07-2007', 'dd-mm-yyyy'), 11045580, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500047, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 772284, 0, 602, null, null, 16715, 31, 103, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500045, 10, to_date('01-07-2007', 'dd-mm-yyyy'), 968938, 0, 206, null, null, 25724, 19, 204, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 870223, 0, 206, null, null, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500049, 14, to_date('01-07-2007', 'dd-mm-yyyy'), 865427, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 673752, 0, 207, null, null, 64289, 75, 441, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500161, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 11014220, 2, 206, null, null, 300, 9, 208, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 795176, 0, 206, null, 7708.56, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500087, 52, to_date('01-01-2009', 'dd-mm-yyyy'), 11766518, 8, 208, null, 1000, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 11814270, 4, 209, null, null, 18002, 57, 135, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500185, 53, to_date('01-07-2007', 'dd-mm-yyyy'), 11172570, 4, 205, null, null, 62459, 88, 409, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500189, 57, to_date('01-07-2007', 'dd-mm-yyyy'), 11384913, 1, 209, null, 18377.64, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500190, 58, to_date('01-07-2007', 'dd-mm-yyyy'), 11619380, 4, 206, null, 2890.71, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500193, 61, to_date('01-07-2007', 'dd-mm-yyyy'), 11412435, 9, 209, null, 18377.64, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500195, 63, to_date('01-07-2007', 'dd-mm-yyyy'), 11384954, 1, 209, null, 18377.64, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500022, 84, to_date('01-07-2007', 'dd-mm-yyyy'), 11631158, 9, 209, null, null, 133141, 57, 748, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500019, 81, to_date('01-07-2007', 'dd-mm-yyyy'), 11074714, 9, 207, null, null, 59131, 58, 1059, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500085, 50, to_date('01-07-2007', 'dd-mm-yyyy'), 11397726, 0, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500084, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 11111198, 4, 207, null, null, 65283, 2, 905, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500080, 45, to_date('01-07-2007', 'dd-mm-yyyy'), 634984, 0, 512, null, null, 27310, 53, 253, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500077, 42, to_date('01-07-2007', 'dd-mm-yyyy'), 11586304, 8, 522, null, null, 206110, 82, 808, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500076, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 652336, 0, 207, null, null, 29840, 61, 229, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500074, 39, to_date('01-07-2007', 'dd-mm-yyyy'), 176471, 0, 208, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500073, 38, to_date('01-07-2007', 'dd-mm-yyyy'), 11775149, 6, 217, null, null, 18120, 78, 259, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500068, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 945950, 0, 100, null, null, 25724, 19, 204, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500067, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 11506961, 0, 209, null, null, 28960, 54, 30, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500066, 31, to_date('01-07-2007', 'dd-mm-yyyy'), 11644234, 0, 209, null, null, 127859, 13, 1507, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500064, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 365892, 0, 209, null, null, 25166, 43, 254, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500062, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 11769686, 8, 203, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500061, 26, to_date('01-07-2007', 'dd-mm-yyyy'), 11774748, 4, 217, null, null, 18120, 78, 259, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500050, 15, to_date('01-07-2007', 'dd-mm-yyyy'), 11665525, 3, 209, null, null, 127859, 13, 1507, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500051, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 11297596, 9, 207, null, null, 35698, 2, 174, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500054, 19, to_date('01-07-2007', 'dd-mm-yyyy'), 11765649, 2, 207, null, null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500056, 21, to_date('01-07-2007', 'dd-mm-yyyy'), 11711294, 4, 209, null, null, 127859, 13, 1507, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 868859, 0, 218, to_date('31-12-2007', 'dd-mm-yyyy'), null, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500214, 82, to_date('01-01-2012', 'dd-mm-yyyy'), 12381560, 2, 209, null, 27134.604, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500215, 83, to_date('01-07-2007', 'dd-mm-yyyy'), 11767260, 6, 207, null, null, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500224, 92, to_date('01-07-2007', 'dd-mm-yyyy'), 11885677, 3, 306, null, 18693.18, 32619, 27, 770, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500226, 94, to_date('01-07-2007', 'dd-mm-yyyy'), 12274768, 9, 207, null, 28810.652, 25724, 19, 204, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500229, 0, to_date('01-07-2007', 'dd-mm-yyyy'), 16104964, 6, 516, to_date('31-03-2027', 'dd-mm-yyyy'), 8635.8, 25724, 19, 204, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500237, 8, to_date('01-07-2007', 'dd-mm-yyyy'), 11889665, 9, 303, null, 10446.408, 32619, 27, 770, null, 'I');
commit;
prompt 300 records committed...
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500238, 9, to_date('01-07-2007', 'dd-mm-yyyy'), 12385626, 5, 209, null, 15460.956, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500253, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 16426967, 0, 602, null, 4236.3, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500254, 25, to_date('01-07-2007', 'dd-mm-yyyy'), 11539542, 9, 208, null, 3968.416, 76904, 80, 1255, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500255, 26, to_date('01-07-2007', 'dd-mm-yyyy'), 12947460, 1, 511, null, 15032.719, 63915, 89, 1538, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500264, 35, to_date('01-07-2007', 'dd-mm-yyyy'), 12271784, 5, 306, null, 29206.425, 133571, 2, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500268, 39, to_date('01-07-2007', 'dd-mm-yyyy'), 16329493, 9, 209, to_date('30-06-2025', 'dd-mm-yyyy'), 59279.925, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500269, 40, to_date('01-07-2007', 'dd-mm-yyyy'), 11087359, 1, 207, null, 17883, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500270, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 12799754, 1, 302, null, 35895.75, 133571, 2, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500271, 42, to_date('01-07-2007', 'dd-mm-yyyy'), 12154335, 7, 209, null, 63436, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500286, 57, to_date('01-07-2007', 'dd-mm-yyyy'), 12223214, 6, 207, null, 10005.105, 73456, 27, 1129, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500287, 58, to_date('01-07-2007', 'dd-mm-yyyy'), 12237191, 3, 100, null, 11400, 142463, 67, 1729, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500300, 71, to_date('01-01-2018', 'dd-mm-yyyy'), 11551856, 4, 209, null, 39336.6, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500301, 72, to_date('01-01-2019', 'dd-mm-yyyy'), 16683379, 8, 209, null, 33457.455, 329912, 15, 132, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500309, 80, to_date('01-10-2019', 'dd-mm-yyyy'), 11616679, 0, 208, null, 92704.77, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500316, 87, to_date('01-04-2019', 'dd-mm-yyyy'), 11422616, 9, 207, null, 24463.68, 16715, 31, 103, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500323, 94, to_date('01-04-2020', 'dd-mm-yyyy'), 16603107, 5, 602, null, 11507.843, 18624, 0, 264, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500324, 95, to_date('01-04-2020', 'dd-mm-yyyy'), 11505175, 4, 312, null, 17055, 252814, 32, 1531, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500325, 96, to_date('01-07-2020', 'dd-mm-yyyy'), 12108468, 2, 207, null, 34094.7, 166408, 53, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500327, 1, to_date('01-07-2020', 'dd-mm-yyyy'), 16691196, 2, 602, null, 11532.771, 27193, 33, 300, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500328, 2, to_date('01-01-2021', 'dd-mm-yyyy'), 11766397, 4, 309, null, 10315.305, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500329, 3, to_date('01-01-2021', 'dd-mm-yyyy'), 12899800, 3, 206, to_date('28-02-2027', 'dd-mm-yyyy'), 8898.12, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500333, 7, to_date('01-04-2021', 'dd-mm-yyyy'), 11768108, 0, 209, null, 15760.356, 206110, 82, 808, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500335, 9, to_date('01-04-2021', 'dd-mm-yyyy'), 12525975, 3, 602, null, 22412.592, 27186, 26, 752, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500336, 10, to_date('01-10-2021', 'dd-mm-yyyy'), 11593949, 5, 401, to_date('30-09-2027', 'dd-mm-yyyy'), 29573.1, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500337, 11, to_date('01-07-2021', 'dd-mm-yyyy'), 16439901, 2, 100, null, 22680, 209653, 36, 1318, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500342, 16, to_date('01-10-2021', 'dd-mm-yyyy'), 17070692, 7, 602, null, 27286.312, 252814, 32, 1531, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500346, 20, to_date('01-01-2023', 'dd-mm-yyyy'), 12692870, 7, 206, to_date('30-06-2027', 'dd-mm-yyyy'), 59279.925, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500343, 17, to_date('01-04-2023', 'dd-mm-yyyy'), 16533911, 0, 204, null, 14139.9, 27310, 53, 253, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500351, 25, to_date('01-07-2022', 'dd-mm-yyyy'), 16532820, 2, 206, null, 59279.925, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500352, 26, to_date('01-04-2023', 'dd-mm-yyyy'), 16654887, 4, 209, null, 49779.576, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500354, 28, to_date('01-07-2023', 'dd-mm-yyyy'), 16733287, 2, 602, null, 30106.944, 309848, 30, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500357, 31, to_date('01-10-2022', 'dd-mm-yyyy'), 11657040, 6, 221, to_date('30-09-2024', 'dd-mm-yyyy'), 95505.679, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500359, 33, to_date('01-04-2023', 'dd-mm-yyyy'), 12256033, 5, 206, to_date('31-03-2026', 'dd-mm-yyyy'), 116884.77, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500360, 34, to_date('01-10-2023', 'dd-mm-yyyy'), 16053119, 9, 306, to_date('30-09-2025', 'dd-mm-yyyy'), 55958.4, 253240, 70, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500361, 35, to_date('01-07-2023', 'dd-mm-yyyy'), 11816213, 9, 100, null, 23175, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500367, 41, to_date('01-04-2023', 'dd-mm-yyyy'), 16532816, 8, 206, to_date('30-06-2027', 'dd-mm-yyyy'), 59279.925, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500368, 42, to_date('01-04-2023', 'dd-mm-yyyy'), 16005297, 3, 403, to_date('31-12-2023', 'dd-mm-yyyy'), 57109.5, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500376, 50, to_date('01-10-2023', 'dd-mm-yyyy'), 12501889, 9, 206, to_date('31-12-2026', 'dd-mm-yyyy'), 40945.41, 17198, 29, 230, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500377, 51, to_date('01-04-2024', 'dd-mm-yyyy'), 16033524, 0, 602, to_date('30-09-2025', 'dd-mm-yyyy'), 12730.2, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500378, 52, to_date('01-01-2025', 'dd-mm-yyyy'), 13006042, 2, 209, to_date('15-01-2027', 'dd-mm-yyyy'), 27689.836, 209653, 36, 1318, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500381, 55, to_date('01-04-2024', 'dd-mm-yyyy'), 12279993, 5, 207, to_date('31-01-2025', 'dd-mm-yyyy'), 21490.191, 600004, 59, 151, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500326, 0, to_date('01-07-2020', 'dd-mm-yyyy'), 16532246, 8, 207, null, 20752.02, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500322, 93, to_date('01-10-2020', 'dd-mm-yyyy'), 12621996, 5, 207, null, 12980, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500330, 4, to_date('01-07-2021', 'dd-mm-yyyy'), 16205018, 7, 502, null, 22740, 80251, 32, 2542, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500331, 5, to_date('01-04-2021', 'dd-mm-yyyy'), 16532794, 4, 209, null, 29204.175, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500332, 6, to_date('01-01-2022', 'dd-mm-yyyy'), 15157591, 6, 602, null, 20815.34, 252814, 32, 1531, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500334, 8, to_date('01-01-2022', 'dd-mm-yyyy'), 12472296, 0, 602, null, 23619.552, 27186, 26, 752, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500339, 13, to_date('01-07-2021', 'dd-mm-yyyy'), 16134921, 5, 207, to_date('31-07-2022', 'dd-mm-yyyy'), 18049.44, 252814, 32, 1531, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500340, 14, to_date('01-07-2021', 'dd-mm-yyyy'), 16104449, 1, 209, null, 27894.96, 63915, 89, 1538, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500338, 12, to_date('01-07-2021', 'dd-mm-yyyy'), 16426814, 5, 208, to_date('19-08-2025', 'dd-mm-yyyy'), 64267.275, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500341, 15, to_date('01-04-2022', 'dd-mm-yyyy'), 12712988, 2, 207, null, 58283.25, 253167, 94, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500344, 18, to_date('01-01-2023', 'dd-mm-yyyy'), 12159659, 4, 602, null, 54083.25, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500345, 19, to_date('01-04-2022', 'dd-mm-yyyy'), 12622898, 2, 206, null, 91488.15, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500348, 22, to_date('01-01-2023', 'dd-mm-yyyy'), 17057135, 9, 209, null, 63550.626, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500347, 21, to_date('01-04-2022', 'dd-mm-yyyy'), 12890803, 9, 602, null, 34072.55, 47091, 46, 2165, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500350, 24, to_date('01-01-2023', 'dd-mm-yyyy'), 16263517, 2, 206, to_date('30-06-2027', 'dd-mm-yyyy'), 59279.825, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500355, 29, to_date('01-07-2023', 'dd-mm-yyyy'), 16327483, 5, 602, null, 30519.552, 309848, 30, null, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500349, 23, to_date('01-04-2022', 'dd-mm-yyyy'), 12256030, 8, 206, to_date('31-03-2027', 'dd-mm-yyyy'), 92174.94, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500353, 27, to_date('01-04-2023', 'dd-mm-yyyy'), 11997394, 8, 531, to_date('30-06-2026', 'dd-mm-yyyy'), 64960.737, 21949, 27, 141, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500356, 30, to_date('01-07-2022', 'dd-mm-yyyy'), 11600640, 0, 602, null, 16312.625, 133141, 57, 748, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500358, 32, to_date('01-10-2023', 'dd-mm-yyyy'), 12893113, 8, 100, to_date('31-07-2024', 'dd-mm-yyyy'), 17767.05, 340903, 45, 1590, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500362, 36, to_date('01-01-2024', 'dd-mm-yyyy'), 16044134, 9, 602, null, 23355.36, 239067, 59, 1546, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500364, 38, to_date('01-01-2023', 'dd-mm-yyyy'), 16435851, 0, 210, null, 60592.224, 27193, 33, 300, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500363, 37, to_date('01-01-2023', 'dd-mm-yyyy'), 12272774, 5, 306, to_date('15-04-2024', 'dd-mm-yyyy'), 155876.4, 206056, 28, 36, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500366, 40, to_date('01-04-2023', 'dd-mm-yyyy'), 16530623, 5, 209, to_date('01-12-2024', 'dd-mm-yyyy'), 7092, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500365, 39, to_date('01-04-2023', 'dd-mm-yyyy'), 11814601, 4, 209, to_date('28-02-2025', 'dd-mm-yyyy'), 17897.52, 18002, 57, 135, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500369, 43, to_date('01-04-2023', 'dd-mm-yyyy'), 16364355, 3, 602, to_date('31-12-2024', 'dd-mm-yyyy'), 34346.904, 65283, 2, 905, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500370, 44, to_date('01-07-2023', 'dd-mm-yyyy'), 17189555, 1, 209, to_date('31-12-2025', 'dd-mm-yyyy'), 15785.277, 206056, 28, 36, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500374, 48, to_date('01-01-2024', 'dd-mm-yyyy'), 12256025, 5, 206, to_date('31-07-2026', 'dd-mm-yyyy'), 98281.17, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500371, 45, to_date('01-07-2023', 'dd-mm-yyyy'), 11810373, 8, 602, to_date('31-12-2025', 'dd-mm-yyyy'), 17375.232, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500373, 47, to_date('01-10-2024', 'dd-mm-yyyy'), 16435917, 2, 311, to_date('31-07-2026', 'dd-mm-yyyy'), 122089.515, 209653, 36, 1318, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500375, 49, to_date('01-01-2024', 'dd-mm-yyyy'), 16821017, 2, 602, to_date('31-12-2024', 'dd-mm-yyyy'), 27732, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500379, 53, to_date('01-04-2024', 'dd-mm-yyyy'), 12517851, 9, 206, to_date('30-06-2025', 'dd-mm-yyyy'), 59279.925, 21949, 27, 141, null, 'I');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500380, 54, to_date('01-04-2025', 'dd-mm-yyyy'), 16732404, 2, 206, to_date('15-01-2027', 'dd-mm-yyyy'), 24856.5, 209653, 36, 1318, null, 'S');
insert into COPT.DOSSIER_COP (emp_mat, emp_cle, dco_dtdeb, ass_mat, ass_cle, pay_cod, dco_dtfin, dco_salaire, dco_numaff, dco_cleaff, dco_numregcpl, dco_clleregcpl, dco_salid)
values (500382, 56, to_date('01-07-2025', 'dd-mm-yyyy'), 16683084, 4, 206, to_date('30-06-2027', 'dd-mm-yyyy'), 89927.877, 329912, 15, 132, null, 'S');
commit;
prompt 375 records loaded
set feedback on
set define on
prompt Done.
