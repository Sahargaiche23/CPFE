prompt PL/SQL Developer import file
prompt Created on mardi 2 décembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.ENG_PERIODE...
drop table COPT.ENG_PERIODE cascade constraints;
prompt Creating COPT.ENG_PERIODE...
create table COPT.ENG_PERIODE
(
  eng_num   NUMBER(6) not null,
  emp_mat   NUMBER(8) not null,
  emp_cle   NUMBER(2) not null,
  dco_dtdeb DATE not null,
  per_num   NUMBER(6) not null,
  dt_deb    DATE,
  dt_fin    DATE,
  montant   NUMBER(15,3)
)
nologging;
create index COPT.FK_ENG_PERIODE on COPT.ENG_PERIODE (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB);
alter table COPT.ENG_PERIODE
  add constraint PK_ENG_PERIODE primary key (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB, PER_NUM);
alter table COPT.ENG_PERIODE
  add constraint FK_ENG_PERIODE_ENGAGEMNT foreign key (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB)
  references COPT.ENGAGEMNT (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB);

prompt Loading COPT.ENG_PERIODE...
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500290, 61, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-2001', 'dd-mm-yyyy'), to_date('31-12-2001', 'dd-mm-yyyy'), 796.881);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500290, 61, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-04-2002', 'dd-mm-yyyy'), to_date('31-12-2016', 'dd-mm-yyyy'), 7921.9);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-1999', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 49611.96);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500008, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-1992', 'dd-mm-yyyy'), to_date('30-06-1998', 'dd-mm-yyyy'), 1048.825);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500010, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1995', 'dd-mm-yyyy'), to_date('30-06-1998', 'dd-mm-yyyy'), 1388.359);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500010, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-04-1994', 'dd-mm-yyyy'), to_date('30-09-1994', 'dd-mm-yyyy'), 147.513);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500018, 80, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-06-1998', 'dd-mm-yyyy'), to_date('30-09-1998', 'dd-mm-yyyy'), 84.86);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500027, 89, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-03-1988', 'dd-mm-yyyy'), to_date('30-09-1998', 'dd-mm-yyyy'), 1131.737);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-1994', 'dd-mm-yyyy'), to_date('30-09-1999', 'dd-mm-yyyy'), 3106.578);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-07-2000', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 4520.995);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500036, 1, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-06-1990', 'dd-mm-yyyy'), to_date('30-06-1998', 'dd-mm-yyyy'), 1212.639);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-1996', 'dd-mm-yyyy'), to_date('30-09-2000', 'dd-mm-yyyy'), 23493.771);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-04-2004', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 17616.242);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1989', 'dd-mm-yyyy'), to_date('31-12-1997', 'dd-mm-yyyy'), 1700.838);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('18-09-1991', 'dd-mm-yyyy'), to_date('30-09-1998', 'dd-mm-yyyy'), 49504.036);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-07-2007', 'dd-mm-yyyy'), to_date('31-12-2011', 'dd-mm-yyyy'), 41074.911);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('01-10-2000', 'dd-mm-yyyy'), to_date('30-09-2006', 'dd-mm-yyyy'), 38800.203);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500055, 20, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1985', 'dd-mm-yyyy'), to_date('30-06-1999', 'dd-mm-yyyy'), 1669.88);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-2000', 'dd-mm-yyyy'), to_date('30-09-2006', 'dd-mm-yyyy'), 2913.382);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-01-1994', 'dd-mm-yyyy'), to_date('31-12-1998', 'dd-mm-yyyy'), 1979.593);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500063, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-2011', 'dd-mm-yyyy'), to_date('30-06-2012', 'dd-mm-yyyy'), 2512.494);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500063, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-10-2010', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 418.749);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500063, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('01-04-2010', 'dd-mm-yyyy'), to_date('30-06-2010', 'dd-mm-yyyy'), 418.749);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500075, 40, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1997', 'dd-mm-yyyy'), to_date('30-09-2001', 'dd-mm-yyyy'), 2223.177);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1994', 'dd-mm-yyyy'), to_date('30-06-2002', 'dd-mm-yyyy'), 3580.871);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-10-2004', 'dd-mm-yyyy'), to_date('31-12-2006', 'dd-mm-yyyy'), 1079.049);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('05-01-2001', 'dd-mm-yyyy'), to_date('19-12-2007', 'dd-mm-yyyy'), 3989.429);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500116, 81, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2003', 'dd-mm-yyyy'), to_date('31-12-2004', 'dd-mm-yyyy'), 698.366);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500120, 85, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1997', 'dd-mm-yyyy'), to_date('31-12-2004', 'dd-mm-yyyy'), 3362.088);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('08-01-2004', 'dd-mm-yyyy'), to_date('30-06-2005', 'dd-mm-yyyy'), 8418.832);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500128, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2005', 'dd-mm-yyyy'), to_date('31-12-2005', 'dd-mm-yyyy'), 147.981);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500132, 0, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1991', 'dd-mm-yyyy'), to_date('31-03-2006', 'dd-mm-yyyy'), 79664.893);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500134, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2005', 'dd-mm-yyyy'), to_date('31-03-2006', 'dd-mm-yyyy'), 480.009);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500137, 5, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2005', 'dd-mm-yyyy'), to_date('30-06-2006', 'dd-mm-yyyy'), 683.281);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-2006', 'dd-mm-yyyy'), to_date('31-03-2007', 'dd-mm-yyyy'), 1192.134);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-2002', 'dd-mm-yyyy'), to_date('31-12-2007', 'dd-mm-yyyy'), 10318.755);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-2007', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 407.051);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500276, 47, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-2016', 'dd-mm-yyyy'), to_date('31-12-2016', 'dd-mm-yyyy'), 3962.319);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500081, 46, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-2016', 'dd-mm-yyyy'), to_date('30-06-2016', 'dd-mm-yyyy'), 1169.595);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500150, 18, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-2006', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 1873.796);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500152, 20, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2006', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 602.941);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500153, 21, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-2006', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 749.283);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-1983', 'dd-mm-yyyy'), to_date('31-12-1995', 'dd-mm-yyyy'), 4959.991);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500156, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-1985', 'dd-mm-yyyy'), to_date('31-12-1991', 'dd-mm-yyyy'), 5018.873);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500157, 25, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-2007', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 233.72);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-11-2003', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 2267.848);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('15-11-1985', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 2994.888);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500161, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('05-02-1986', 'dd-mm-yyyy'), to_date('05-02-1990', 'dd-mm-yyyy'), 1571.907);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('04-01-1999', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 6793.17);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-2001', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 3176.93);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('23-06-1992', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 7263.807);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500166, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-2002', 'dd-mm-yyyy'), to_date('31-12-2003', 'dd-mm-yyyy'), 929.108);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500167, 35, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-1998', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 29683.469);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500169, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-2004', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 2079.675);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500170, 38, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-1988', 'dd-mm-yyyy'), to_date('30-06-1993', 'dd-mm-yyyy'), 541.514);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500171, 39, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-2002', 'dd-mm-yyyy'), to_date('31-07-2003', 'dd-mm-yyyy'), 983.214);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500172, 40, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('17-01-1989', 'dd-mm-yyyy'), to_date('01-11-1995', 'dd-mm-yyyy'), 1080.849);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-1984', 'dd-mm-yyyy'), to_date('31-08-1988', 'dd-mm-yyyy'), 4493.159);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500174, 42, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-1990', 'dd-mm-yyyy'), to_date('31-12-1991', 'dd-mm-yyyy'), 154.941);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500175, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-1990', 'dd-mm-yyyy'), to_date('31-12-1999', 'dd-mm-yyyy'), 2601.238);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-1996', 'dd-mm-yyyy'), to_date('30-06-2003', 'dd-mm-yyyy'), 3858.326);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-01-1996', 'dd-mm-yyyy'), to_date('31-03-1996', 'dd-mm-yyyy'), 114.784);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500177, 45, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-1991', 'dd-mm-yyyy'), to_date('31-12-1993', 'dd-mm-yyyy'), 187.713);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500180, 48, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-1990', 'dd-mm-yyyy'), to_date('31-03-1991', 'dd-mm-yyyy'), 118.966);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-09-1997', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 3873.423);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500183, 51, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-1997', 'dd-mm-yyyy'), to_date('30-09-2000', 'dd-mm-yyyy'), 840.691);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500185, 53, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1999', 'dd-mm-yyyy'), to_date('30-09-2001', 'dd-mm-yyyy'), 1718.405);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500185, 53, to_date('01-01-2008', 'dd-mm-yyyy'), 3, to_date('01-01-1995', 'dd-mm-yyyy'), to_date('31-12-1998', 'dd-mm-yyyy'), 2196.072);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500185, 53, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-01-1994', 'dd-mm-yyyy'), to_date('31-12-1994', 'dd-mm-yyyy'), 423.817);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500186, 54, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-02-2002', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 19821.719);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-2000', 'dd-mm-yyyy'), to_date('30-06-2001', 'dd-mm-yyyy'), 830.223);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500189, 57, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2011', 'dd-mm-yyyy'), to_date('30-09-2012', 'dd-mm-yyyy'), 3498.498);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500189, 57, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-01-2010', 'dd-mm-yyyy'), to_date('31-03-2010', 'dd-mm-yyyy'), 920.309);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1990', 'dd-mm-yyyy'), to_date('31-01-2002', 'dd-mm-yyyy'), 4317.537);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-1998', 'dd-mm-yyyy'), to_date('30-09-2009', 'dd-mm-yyyy'), 13892.075);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2002', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 10613.056);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500202, 70, to_date('01-01-2008', 'dd-mm-yyyy'), 2, to_date('01-10-1993', 'dd-mm-yyyy'), to_date('31-12-1996', 'dd-mm-yyyy'), 7246.634);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1998', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 7836.606);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-2006', 'dd-mm-yyyy'), to_date('30-07-2007', 'dd-mm-yyyy'), 3254.974);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-09-1984', 'dd-mm-yyyy'), to_date('31-03-1998', 'dd-mm-yyyy'), 4393.885);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500215, 83, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1990', 'dd-mm-yyyy'), to_date('31-12-1993', 'dd-mm-yyyy'), 383.003);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-1992', 'dd-mm-yyyy'), to_date('30-06-1998', 'dd-mm-yyyy'), 9866.89);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-1994', 'dd-mm-yyyy'), to_date('31-03-1996', 'dd-mm-yyyy'), 7379.78);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500233, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-2007', 'dd-mm-yyyy'), to_date('31-12-2012', 'dd-mm-yyyy'), 4450.309);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-2001', 'dd-mm-yyyy'), to_date('19-11-2012', 'dd-mm-yyyy'), 53772.647);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-1987', 'dd-mm-yyyy'), to_date('30-09-1989', 'dd-mm-yyyy'), 3973.965);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2001', 'dd-mm-yyyy'), to_date('31-12-2012', 'dd-mm-yyyy'), 10867.253);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('15-09-2009', 'dd-mm-yyyy'), to_date('14-09-2012', 'dd-mm-yyyy'), 2498.592);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-1997', 'dd-mm-yyyy'), to_date('30-09-1997', 'dd-mm-yyyy'), 682.639);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500031, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-2014', 'dd-mm-yyyy'), to_date('30-06-2016', 'dd-mm-yyyy'), 4871.281);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-01-1998', 'dd-mm-yyyy'), to_date('30-09-2001', 'dd-mm-yyyy'), 10103.941);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-2016', 'dd-mm-yyyy'), to_date('31-12-2016', 'dd-mm-yyyy'), 940.687);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 4, to_date('01-01-2011', 'dd-mm-yyyy'), to_date('30-06-2011', 'dd-mm-yyyy'), 1522.589);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500091, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2015', 'dd-mm-yyyy'), to_date('31-12-2015', 'dd-mm-yyyy'), 539.035);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (2, 500169, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2014', 'dd-mm-yyyy'), to_date('30-06-2015', 'dd-mm-yyyy'), 1265.225);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500021, 83, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-2015', 'dd-mm-yyyy'), to_date('31-12-2015', 'dd-mm-yyyy'), 3066.411);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500272, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2015', 'dd-mm-yyyy'), to_date('30-06-2016', 'dd-mm-yyyy'), 5200.463);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-2016', 'dd-mm-yyyy'), to_date('31-12-2016', 'dd-mm-yyyy'), 2531.418);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 3, to_date('01-04-2010', 'dd-mm-yyyy'), to_date('30-09-2010', 'dd-mm-yyyy'), 1522.589);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-01-1990', 'dd-mm-yyyy'), to_date('30-09-1991', 'dd-mm-yyyy'), 1944.553);
commit;
prompt 100 records committed...
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-07-2007', 'dd-mm-yyyy'), to_date('31-12-2007', 'dd-mm-yyyy'), 1522.589);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-10-2007', 'dd-mm-yyyy'), to_date('31-03-2008', 'dd-mm-yyyy'), 2782.084);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500087, 52, to_date('01-01-2009', 'dd-mm-yyyy'), 1, to_date('01-07-2014', 'dd-mm-yyyy'), to_date('30-06-2016', 'dd-mm-yyyy'), 3480.214);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500082, 47, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-04-2010', 'dd-mm-yyyy'), to_date('30-09-2010', 'dd-mm-yyyy'), 1193.328);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (1, 500101, 66, to_date('01-07-2007', 'dd-mm-yyyy'), 1, to_date('01-07-2015', 'dd-mm-yyyy'), to_date('31-03-2016', 'dd-mm-yyyy'), 704.288);
insert into COPT.ENG_PERIODE (eng_num, emp_mat, emp_cle, dco_dtdeb, per_num, dt_deb, dt_fin, montant)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 2, to_date('01-07-2008', 'dd-mm-yyyy'), to_date('31-10-2014', 'dd-mm-yyyy'), 35599.015);
commit;
prompt 106 records loaded
set feedback on
set define on
prompt Done.
