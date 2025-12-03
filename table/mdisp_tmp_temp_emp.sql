prompt PL/SQL Developer import file
prompt Created on mardi 2 décembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.MDISP_TMP_TEMP_EMP...
drop table COPT.MDISP_TMP_TEMP_EMP cascade constraints;
prompt Creating COPT.MDISP_TMP_TEMP_EMP...
create table COPT.MDISP_TMP_TEMP_EMP
(
  bur_cod     NUMBER(3) not null,
  emp_mat     NUMBER(8) not null,
  emp_cle     NUMBER(2) not null,
  mvc_codexp  NUMBER(3) not null,
  mvc_trim    NUMBER(1) not null,
  mvc_ann     NUMBER(4) not null,
  mvc_djour   DATE,
  mvc_montant NUMBER(15,3),
  reg_cod     NUMBER(3),
  dt_affecte  DATE
)
nologging;
create index COPT.UI_TMP_TEMP_EMP on COPT.MDISP_TMP_TEMP_EMP (BUR_COD, EMP_MAT, EMP_CLE, MVC_CODEXP, MVC_TRIM, MVC_ANN);

prompt Loading COPT.MDISP_TMP_TEMP_EMP...
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2013, to_date('23-04-2013', 'dd-mm-yyyy'), 362.888, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2013, to_date('23-04-2013', 'dd-mm-yyyy'), 362.888, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2013, to_date('23-04-2013', 'dd-mm-yyyy'), 362.888, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2013, to_date('23-04-2013', 'dd-mm-yyyy'), 362.888, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2013, to_date('23-04-2013', 'dd-mm-yyyy'), 362.888, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2013, to_date('23-04-2013', 'dd-mm-yyyy'), 362.888, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2005, to_date('22-10-2013', 'dd-mm-yyyy'), 321.195, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2005, to_date('22-10-2013', 'dd-mm-yyyy'), 321.195, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2013, to_date('22-10-2013', 'dd-mm-yyyy'), 1538.84, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2013, to_date('22-10-2013', 'dd-mm-yyyy'), 428.017, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2005, to_date('22-10-2013', 'dd-mm-yyyy'), 321.195, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2006, to_date('22-10-2013', 'dd-mm-yyyy'), 321.195, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2013, to_date('22-10-2013', 'dd-mm-yyyy'), 83.608, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2006, to_date('22-10-2013', 'dd-mm-yyyy'), 321.195, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2013, to_date('22-10-2013', 'dd-mm-yyyy'), 735.366, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2006, to_date('22-10-2013', 'dd-mm-yyyy'), 321.195, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2013, to_date('22-10-2013', 'dd-mm-yyyy'), 735.366, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2014, to_date('21-05-2014', 'dd-mm-yyyy'), 362.887, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 3, 2014, to_date('16-10-2014', 'dd-mm-yyyy'), 220.961, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2014, to_date('16-10-2014', 'dd-mm-yyyy'), 60.479, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2014, to_date('16-10-2014', 'dd-mm-yyyy'), 6235.022, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 2, 2014, to_date('27-11-2014', 'dd-mm-yyyy'), .003, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2014, to_date('27-11-2014', 'dd-mm-yyyy'), .002, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 3, 2012, to_date('31-12-2014', 'dd-mm-yyyy'), 2294.439, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2015, to_date('23-07-2015', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2014, to_date('12-11-2015', 'dd-mm-yyyy'), 85.485, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2016, to_date('04-08-2016', 'dd-mm-yyyy'), 634.811, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2015, to_date('22-08-2016', 'dd-mm-yyyy'), 211.603, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2016, to_date('31-08-2016', 'dd-mm-yyyy'), 117.232, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2016, to_date('05-10-2016', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2006, to_date('19-10-2017', 'dd-mm-yyyy'), 223.276, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2007, to_date('19-10-2017', 'dd-mm-yyyy'), 223.276, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2005, to_date('19-10-2017', 'dd-mm-yyyy'), 223.276, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2006, to_date('19-10-2017', 'dd-mm-yyyy'), 223.276, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2013, to_date('19-10-2017', 'dd-mm-yyyy'), 252.186, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2006, to_date('19-10-2017', 'dd-mm-yyyy'), 223.376, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2007, to_date('19-10-2017', 'dd-mm-yyyy'), 223.276, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2007, to_date('19-10-2017', 'dd-mm-yyyy'), 223.276, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2008, to_date('19-10-2017', 'dd-mm-yyyy'), 244.02, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2006, to_date('19-10-2017', 'dd-mm-yyyy'), 223.276, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2013, to_date('19-10-2017', 'dd-mm-yyyy'), 378.28, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2005, to_date('19-10-2017', 'dd-mm-yyyy'), 223.276, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2007, to_date('19-10-2017', 'dd-mm-yyyy'), 223.276, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2008, to_date('19-10-2017', 'dd-mm-yyyy'), 223.276, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2008, to_date('19-10-2017', 'dd-mm-yyyy'), 223.276, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2017, to_date('12-01-2018', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2017, to_date('16-01-2018', 'dd-mm-yyyy'), 522.177, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2019, to_date('28-10-2019', 'dd-mm-yyyy'), 28.646, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2019, to_date('28-10-2019', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2019, to_date('28-10-2019', 'dd-mm-yyyy'), 28.646, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2019, to_date('28-10-2019', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2019, to_date('30-10-2019', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 3, 2019, to_date('23-12-2019', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 4, 2019, to_date('15-01-2020', 'dd-mm-yyyy'), 1631.54, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2018, to_date('16-07-2018', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2018, to_date('16-07-2018', 'dd-mm-yyyy'), 5539.035, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 3, 2017, to_date('03-10-2018', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 1, 2017, to_date('03-10-2018', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 2, 2017, to_date('03-10-2018', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 4, 2016, to_date('03-10-2018', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 1, 2018, to_date('03-10-2018', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 4, 2017, to_date('03-10-2018', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 2, 2018, to_date('03-10-2018', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2018, to_date('16-10-2018', 'dd-mm-yyyy'), 368.846, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2018, to_date('16-10-2018', 'dd-mm-yyyy'), 15.457, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2018, to_date('16-10-2018', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2018, to_date('16-10-2018', 'dd-mm-yyyy'), 351.698, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2018, to_date('16-10-2018', 'dd-mm-yyyy'), 172.668, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2018, to_date('16-10-2018', 'dd-mm-yyyy'), 7133.559, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 3, 2018, to_date('07-11-2018', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 4, 2018, to_date('16-01-2019', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2018, to_date('16-01-2019', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2019, to_date('17-07-2019', 'dd-mm-yyyy'), 16.155, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2019, to_date('17-07-2019', 'dd-mm-yyyy'), 650.906, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2019, to_date('15-01-2020', 'dd-mm-yyyy'), 8256.473, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2019, to_date('15-01-2020', 'dd-mm-yyyy'), 161.509, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2019, to_date('21-01-2020', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2020, to_date('29-07-2020', 'dd-mm-yyyy'), 15.901, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2019, to_date('29-07-2020', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2020, to_date('29-07-2020', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2020, to_date('25-08-2020', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2020, to_date('25-08-2020', 'dd-mm-yyyy'), 15.901, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2020, to_date('25-08-2020', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2020, to_date('25-08-2020', 'dd-mm-yyyy'), 15.901, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2020, to_date('28-08-2020', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 118, 3, 2020, to_date('14-10-2020', 'dd-mm-yyyy'), 1187.75, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 192, 3, 2020, to_date('14-10-2020', 'dd-mm-yyyy'), 11.476, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 3, 2020, to_date('16-10-2020', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2020, to_date('21-10-2020', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2020, to_date('03-11-2020', 'dd-mm-yyyy'), 1619.236, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2020, to_date('03-11-2020', 'dd-mm-yyyy'), 12303.945, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2013, to_date('15-12-2020', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2014, to_date('15-12-2020', 'dd-mm-yyyy'), 703.388, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2016, to_date('15-12-2020', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2017, to_date('15-12-2020', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2015, to_date('15-12-2020', 'dd-mm-yyyy'), 117.232, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2020, to_date('18-01-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2020, to_date('28-01-2021', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2013, to_date('31-07-2013', 'dd-mm-yyyy'), 351.694, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2013, to_date('29-01-2014', 'dd-mm-yyyy'), 351.694, null, null);
commit;
prompt 100 records committed...
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2014, to_date('22-07-2014', 'dd-mm-yyyy'), 351.694, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2007, to_date('10-11-2014', 'dd-mm-yyyy'), 226.288, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2008, to_date('10-11-2014', 'dd-mm-yyyy'), 503.613, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2006, to_date('10-11-2014', 'dd-mm-yyyy'), 226.288, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2007, to_date('10-11-2014', 'dd-mm-yyyy'), 226.288, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2008, to_date('10-11-2014', 'dd-mm-yyyy'), 226.288, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2009, to_date('10-11-2014', 'dd-mm-yyyy'), 268.041, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2009, to_date('10-11-2014', 'dd-mm-yyyy'), 268.041, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2011, to_date('10-11-2014', 'dd-mm-yyyy'), 268.041, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2008, to_date('10-11-2014', 'dd-mm-yyyy'), 460.803, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2008, to_date('10-11-2014', 'dd-mm-yyyy'), 247.31, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2008, to_date('10-11-2014', 'dd-mm-yyyy'), 460.803, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2009, to_date('10-11-2014', 'dd-mm-yyyy'), 503.613, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2007, to_date('10-11-2014', 'dd-mm-yyyy'), 226.288, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2008, to_date('10-11-2014', 'dd-mm-yyyy'), 226.288, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2011, to_date('10-11-2014', 'dd-mm-yyyy'), 268.041, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2007, to_date('10-11-2014', 'dd-mm-yyyy'), 460.803, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2010, to_date('10-11-2014', 'dd-mm-yyyy'), 268.041, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2010, to_date('10-11-2014', 'dd-mm-yyyy'), 268.041, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2010, to_date('10-11-2014', 'dd-mm-yyyy'), 268.041, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2009, to_date('10-11-2014', 'dd-mm-yyyy'), 503.613, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2006, to_date('10-11-2014', 'dd-mm-yyyy'), 226.288, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2006, to_date('10-11-2014', 'dd-mm-yyyy'), 226.288, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2008, to_date('10-11-2014', 'dd-mm-yyyy'), 247.31, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2005, to_date('10-11-2014', 'dd-mm-yyyy'), 226.288, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2009, to_date('10-11-2014', 'dd-mm-yyyy'), 247.31, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2009, to_date('10-11-2014', 'dd-mm-yyyy'), 247.31, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2011, to_date('10-11-2014', 'dd-mm-yyyy'), 268.041, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2006, to_date('10-11-2014', 'dd-mm-yyyy'), 226.288, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2007, to_date('10-11-2014', 'dd-mm-yyyy'), 226.288, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2010, to_date('10-11-2014', 'dd-mm-yyyy'), 268.041, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2008, to_date('10-11-2014', 'dd-mm-yyyy'), 503.613, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2018, to_date('10-05-2018', 'dd-mm-yyyy'), .536, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 2, 2018, to_date('16-07-2018', 'dd-mm-yyyy'), 542.825, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2015, to_date('15-04-2015', 'dd-mm-yyyy'), 85.485, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2014, to_date('15-01-2015', 'dd-mm-yyyy'), 6219.832, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2014, to_date('15-01-2015', 'dd-mm-yyyy'), 85.485, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2015, to_date('15-04-2015', 'dd-mm-yyyy'), 6951.057, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2014, to_date('19-02-2015', 'dd-mm-yyyy'), 362.887, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2014, to_date('19-02-2015', 'dd-mm-yyyy'), 362.887, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2015, to_date('17-04-2015', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2016, to_date('15-07-2016', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 2, 2016, to_date('15-07-2016', 'dd-mm-yyyy'), 143.559, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2016, to_date('15-07-2016', 'dd-mm-yyyy'), 7443.248, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2016, to_date('15-07-2016', 'dd-mm-yyyy'), 758.47, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 2, 2016, to_date('06-10-2016', 'dd-mm-yyyy'), 4.603, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2016, to_date('06-10-2016', 'dd-mm-yyyy'), 457.798, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2016, to_date('16-01-2017', 'dd-mm-yyyy'), 8839.815, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2016, to_date('16-01-2017', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2016, to_date('16-01-2017', 'dd-mm-yyyy'), 298.259, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2017, to_date('17-04-2017', 'dd-mm-yyyy'), 546.087, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2017, to_date('17-04-2017', 'dd-mm-yyyy'), 10851.784, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2017, to_date('17-04-2017', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2017, to_date('17-04-2017', 'dd-mm-yyyy'), 324.789, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2017, to_date('30-10-2017', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2017, to_date('30-10-2017', 'dd-mm-yyyy'), .536, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2017, to_date('30-10-2017', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2017, to_date('30-10-2017', 'dd-mm-yyyy'), .536, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2017, to_date('30-10-2017', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2017, to_date('30-10-2017', 'dd-mm-yyyy'), .536, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2018, to_date('10-05-2018', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2018, to_date('17-07-2018', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2019, to_date('25-02-2020', 'dd-mm-yyyy'), 5299.477, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2019, to_date('25-02-2020', 'dd-mm-yyyy'), 5299.477, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2019, to_date('25-02-2020', 'dd-mm-yyyy'), 3000.667, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 118, 1, 2020, to_date('14-04-2020', 'dd-mm-yyyy'), 1187.75, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 192, 1, 2020, to_date('14-04-2020', 'dd-mm-yyyy'), 11.476, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2020, to_date('25-08-2020', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 3, 2018, to_date('23-10-2018', 'dd-mm-yyyy'), 1631.54, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 3, 2018, to_date('23-10-2018', 'dd-mm-yyyy'), .001, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 3, 2018, to_date('01-11-2018', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2018, to_date('02-11-2018', 'dd-mm-yyyy'), 546.087, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2018, to_date('02-11-2018', 'dd-mm-yyyy'), 546.087, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 3, 2020, to_date('16-10-2020', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 2, 2020, to_date('12-11-2020', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2018, to_date('15-01-2019', 'dd-mm-yyyy'), 542.825, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2018, to_date('15-01-2019', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 4, 2018, to_date('15-01-2019', 'dd-mm-yyyy'), 1631.54, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2018, to_date('15-01-2019', 'dd-mm-yyyy'), 7294.13, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2018, to_date('15-01-2019', 'dd-mm-yyyy'), 150.43, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 7294.13, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 1631.54, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 650.906, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 16.155, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 201.849, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2020, to_date('06-01-2021', 'dd-mm-yyyy'), 15.901, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2020, to_date('06-01-2021', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 2, 2019, to_date('19-07-2019', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 2, 2019, to_date('02-08-2019', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 2, 2019, to_date('10-10-2019', 'dd-mm-yyyy'), 63.476, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 2, 2019, to_date('10-10-2019', 'dd-mm-yyyy'), 35.165, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 3, 2019, to_date('10-10-2019', 'dd-mm-yyyy'), 41.946, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 3, 2019, to_date('10-10-2019', 'dd-mm-yyyy'), 75.715, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 3, 2019, to_date('16-10-2019', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2019, to_date('27-01-2020', 'dd-mm-yyyy'), 9.638, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2019, to_date('27-01-2020', 'dd-mm-yyyy'), 655.27, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2020, to_date('25-08-2020', 'dd-mm-yyyy'), 15.901, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2020, to_date('18-01-2021', 'dd-mm-yyyy'), 618.538, 100, null);
commit;
prompt 200 records committed...
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2020, to_date('18-01-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2020, to_date('03-02-2021', 'dd-mm-yyyy'), 341.446, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2012, to_date('21-01-2013', 'dd-mm-yyyy'), 4445.258, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2012, to_date('01-02-2013', 'dd-mm-yyyy'), 351.694, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2012, to_date('04-01-2013', 'dd-mm-yyyy'), 1.607, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2012, to_date('04-01-2013', 'dd-mm-yyyy'), 484.445, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2012, to_date('04-01-2013', 'dd-mm-yyyy'), 9.815, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2012, to_date('28-01-2013', 'dd-mm-yyyy'), 362.888, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2012, to_date('21-01-2013', 'dd-mm-yyyy'), 22.441, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2012, to_date('04-01-2013', 'dd-mm-yyyy'), 484.445, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2013, to_date('15-04-2013', 'dd-mm-yyyy'), 5601.358, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2013, to_date('15-04-2013', 'dd-mm-yyyy'), 23.319, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2010, to_date('02-05-2013', 'dd-mm-yyyy'), 333.974, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2008, to_date('02-05-2013', 'dd-mm-yyyy'), 308.144, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2007, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2006, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2005, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2013, to_date('02-05-2013', 'dd-mm-yyyy'), 351.694, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2010, to_date('02-05-2013', 'dd-mm-yyyy'), 333.974, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2009, to_date('02-05-2013', 'dd-mm-yyyy'), 333.974, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2008, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2006, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2009, to_date('02-05-2013', 'dd-mm-yyyy'), 308.144, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2007, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2007, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2006, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2009, to_date('02-05-2013', 'dd-mm-yyyy'), 333.974, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2005, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2005, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2011, to_date('02-05-2013', 'dd-mm-yyyy'), 222.649, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2010, to_date('02-05-2013', 'dd-mm-yyyy'), 333.974, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2006, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2009, to_date('02-05-2013', 'dd-mm-yyyy'), 308.144, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2007, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2010, to_date('02-05-2013', 'dd-mm-yyyy'), 333.974, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2008, to_date('02-05-2013', 'dd-mm-yyyy'), 281.949, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2008, to_date('02-05-2013', 'dd-mm-yyyy'), 308.144, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 2, 2013, to_date('17-07-2013', 'dd-mm-yyyy'), 182.762, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2013, to_date('17-07-2013', 'dd-mm-yyyy'), 6299.743, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2013, to_date('19-09-2013', 'dd-mm-yyyy'), 362.887, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 500095, 60, 137, 2, 2013, to_date('02-10-2013', 'dd-mm-yyyy'), 315.716, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2013, to_date('16-01-2014', 'dd-mm-yyyy'), 4571.943, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2013, to_date('16-01-2014', 'dd-mm-yyyy'), 36.392, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2013, to_date('21-02-2014', 'dd-mm-yyyy'), 18.196, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2013, to_date('21-02-2014', 'dd-mm-yyyy'), 535.207, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2014, to_date('25-09-2014', 'dd-mm-yyyy'), 362.887, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2010, to_date('26-12-2014', 'dd-mm-yyyy'), 461.689, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2009, to_date('26-12-2014', 'dd-mm-yyyy'), 461.689, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2010, to_date('26-12-2014', 'dd-mm-yyyy'), 461.689, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2010, to_date('26-12-2014', 'dd-mm-yyyy'), 461.689, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2011, to_date('26-12-2014', 'dd-mm-yyyy'), 461.689, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2011, to_date('26-12-2014', 'dd-mm-yyyy'), 461.689, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2011, to_date('26-12-2014', 'dd-mm-yyyy'), 461.689, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2009, to_date('26-12-2014', 'dd-mm-yyyy'), 461.689, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2010, to_date('26-12-2014', 'dd-mm-yyyy'), 461.689, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2014, to_date('04-02-2015', 'dd-mm-yyyy'), 362.887, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2014, to_date('27-02-2015', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2014, to_date('10-04-2015', 'dd-mm-yyyy'), 511.812, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2015, to_date('15-01-2016', 'dd-mm-yyyy'), 466.034, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2015, to_date('15-01-2016', 'dd-mm-yyyy'), 7152.867, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2015, to_date('15-01-2016', 'dd-mm-yyyy'), 234.462, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2016, to_date('16-01-2017', 'dd-mm-yyyy'), 8839.815, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2016, to_date('16-01-2017', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2016, to_date('16-01-2017', 'dd-mm-yyyy'), 298.259, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2016, to_date('16-01-2017', 'dd-mm-yyyy'), 8839.815, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2016, to_date('16-01-2017', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2016, to_date('16-01-2017', 'dd-mm-yyyy'), 298.259, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2014, to_date('21-04-2017', 'dd-mm-yyyy'), 874.428, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2006, to_date('04-07-2017', 'dd-mm-yyyy'), 109.932, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2007, to_date('04-07-2017', 'dd-mm-yyyy'), 109.932, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2008, to_date('04-07-2017', 'dd-mm-yyyy'), 109.932, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2008, to_date('04-07-2017', 'dd-mm-yyyy'), 109.932, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2016, to_date('04-07-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2006, to_date('04-07-2017', 'dd-mm-yyyy'), 109.932, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2006, to_date('04-07-2017', 'dd-mm-yyyy'), 109.932, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2016, to_date('04-07-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2007, to_date('04-07-2017', 'dd-mm-yyyy'), 109.932, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2008, to_date('04-07-2017', 'dd-mm-yyyy'), 80.097, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2011, to_date('04-07-2017', 'dd-mm-yyyy'), 332.252, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2016, to_date('04-07-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2006, to_date('04-07-2017', 'dd-mm-yyyy'), 109.932, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2007, to_date('04-07-2017', 'dd-mm-yyyy'), 109.932, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2007, to_date('04-07-2017', 'dd-mm-yyyy'), 109.932, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2017, to_date('15-08-2017', 'dd-mm-yyyy'), 10.472, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2017, to_date('15-08-2017', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2017, to_date('15-08-2017', 'dd-mm-yyyy'), 10.472, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2016, to_date('15-08-2017', 'dd-mm-yyyy'), 227.629, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2017, to_date('15-08-2017', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2016, to_date('15-08-2017', 'dd-mm-yyyy'), 4.188, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2016, to_date('27-09-2017', 'dd-mm-yyyy'), 654.635, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2016, to_date('27-09-2017', 'dd-mm-yyyy'), 654.635, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2017, to_date('27-09-2017', 'dd-mm-yyyy'), 654.635, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2006, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2016, to_date('27-09-2017', 'dd-mm-yyyy'), 38.433, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2006, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2008, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2015, to_date('27-09-2017', 'dd-mm-yyyy'), 199.67, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2016, to_date('27-09-2017', 'dd-mm-yyyy'), 38.433, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2017, to_date('27-09-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2005, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
commit;
prompt 300 records committed...
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2007, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2007, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2007, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2008, to_date('27-09-2017', 'dd-mm-yyyy'), 229.462, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2016, to_date('27-09-2017', 'dd-mm-yyyy'), 38.433, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2017, to_date('27-09-2017', 'dd-mm-yyyy'), 38.433, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2011, to_date('27-09-2017', 'dd-mm-yyyy'), 107.874, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2016, to_date('27-09-2017', 'dd-mm-yyyy'), 654.635, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2017, to_date('27-09-2017', 'dd-mm-yyyy'), 654.635, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2006, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2006, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2007, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2010, to_date('27-09-2017', 'dd-mm-yyyy'), 510.981, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2016, to_date('27-09-2017', 'dd-mm-yyyy'), 654.635, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2016, to_date('27-09-2017', 'dd-mm-yyyy'), 38.433, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2017, to_date('27-09-2017', 'dd-mm-yyyy'), 38.433, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2015, to_date('27-09-2017', 'dd-mm-yyyy'), 610.992, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2005, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2005, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2008, to_date('27-09-2017', 'dd-mm-yyyy'), 314.935, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 3, 2017, to_date('13-10-2017', 'dd-mm-yyyy'), 174.888, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 3, 2017, to_date('13-10-2017', 'dd-mm-yyyy'), 174.888, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2013, to_date('16-10-2017', 'dd-mm-yyyy'), 682.799, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2017, to_date('16-10-2017', 'dd-mm-yyyy'), 654.635, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2017, to_date('16-10-2017', 'dd-mm-yyyy'), 28.497, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2013, to_date('16-10-2017', 'dd-mm-yyyy'), 455.199, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2017, to_date('16-10-2017', 'dd-mm-yyyy'), 897.781, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2015, to_date('16-10-2017', 'dd-mm-yyyy'), 455.199, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2017, to_date('16-10-2017', 'dd-mm-yyyy'), 192.561, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2017, to_date('16-10-2017', 'dd-mm-yyyy'), 8544.671, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2017, to_date('24-04-2018', 'dd-mm-yyyy'), 654.635, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 3, 2017, to_date('27-09-2018', 'dd-mm-yyyy'), 161.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 2, 2018, to_date('27-09-2018', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 4, 2017, to_date('27-09-2018', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 1, 2018, to_date('27-09-2018', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 3, 2018, to_date('25-10-2018', 'dd-mm-yyyy'), 542.825, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 3, 2018, to_date('25-10-2018', 'dd-mm-yyyy'), 542.825, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2018, to_date('26-10-2018', 'dd-mm-yyyy'), 53.598, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2018, to_date('26-10-2018', 'dd-mm-yyyy'), 3.093, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2018, to_date('15-01-2019', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 4, 2018, to_date('15-01-2019', 'dd-mm-yyyy'), 1631.54, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2018, to_date('15-01-2019', 'dd-mm-yyyy'), 7294.13, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2018, to_date('15-01-2019', 'dd-mm-yyyy'), 150.43, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 4, 2018, to_date('16-01-2019', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2018, to_date('16-01-2019', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 4, 2018, to_date('16-01-2019', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2018, to_date('16-01-2019', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2018, to_date('11-02-2019', 'dd-mm-yyyy'), 546.087, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 1, 2019, to_date('18-04-2019', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 2, 2019, to_date('15-07-2019', 'dd-mm-yyyy'), 606.301, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2019, to_date('24-01-2020', 'dd-mm-yyyy'), 650.906, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2019, to_date('24-01-2020', 'dd-mm-yyyy'), 650.906, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2019, to_date('24-01-2020', 'dd-mm-yyyy'), 16.155, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2019, to_date('24-01-2020', 'dd-mm-yyyy'), 17.831, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2012, to_date('30-05-2013', 'dd-mm-yyyy'), 474.357, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2012, to_date('30-05-2013', 'dd-mm-yyyy'), 6.518, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2013, to_date('17-10-2013', 'dd-mm-yyyy'), 856.034, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2013, to_date('17-10-2013', 'dd-mm-yyyy'), 7121.515, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2013, to_date('17-10-2013', 'dd-mm-yyyy'), 15.544, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2013, to_date('25-10-2013', 'dd-mm-yyyy'), 351.694, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2014, to_date('29-04-2014', 'dd-mm-yyyy'), 351.694, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2013, to_date('05-11-2014', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2014, to_date('05-11-2014', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2013, to_date('05-11-2014', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2014, to_date('05-11-2014', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2013, to_date('05-11-2014', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2014, to_date('05-11-2014', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2011, to_date('11-12-2014', 'dd-mm-yyyy'), 282.382, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2007, to_date('11-12-2014', 'dd-mm-yyyy'), 238.394, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2009, to_date('11-12-2014', 'dd-mm-yyyy'), 282.382, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2010, to_date('11-12-2014', 'dd-mm-yyyy'), 282.382, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2009, to_date('11-12-2014', 'dd-mm-yyyy'), 260.542, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2010, to_date('11-12-2014', 'dd-mm-yyyy'), 282.382, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2007, to_date('11-12-2014', 'dd-mm-yyyy'), 553.196, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2007, to_date('11-12-2014', 'dd-mm-yyyy'), 553.196, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2008, to_date('11-12-2014', 'dd-mm-yyyy'), 604.591, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2006, to_date('11-12-2014', 'dd-mm-yyyy'), 238.394, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2009, to_date('11-12-2014', 'dd-mm-yyyy'), 282.382, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2010, to_date('11-12-2014', 'dd-mm-yyyy'), 282.382, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2007, to_date('11-12-2014', 'dd-mm-yyyy'), 553.196, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2008, to_date('11-12-2014', 'dd-mm-yyyy'), 604.591, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2011, to_date('11-12-2014', 'dd-mm-yyyy'), 282.382, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2008, to_date('11-12-2014', 'dd-mm-yyyy'), 553.196, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2010, to_date('11-12-2014', 'dd-mm-yyyy'), 282.382, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2011, to_date('11-12-2014', 'dd-mm-yyyy'), 75.302, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2008, to_date('11-12-2014', 'dd-mm-yyyy'), 553.196, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2009, to_date('11-12-2014', 'dd-mm-yyyy'), 260.542, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2011, to_date('11-12-2014', 'dd-mm-yyyy'), 282.382, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2007, to_date('29-12-2014', 'dd-mm-yyyy'), 210.838, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2008, to_date('29-12-2014', 'dd-mm-yyyy'), 210.838, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2008, to_date('29-12-2014', 'dd-mm-yyyy'), 210.838, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 3, 2014, to_date('29-12-2014', 'dd-mm-yyyy'), 122.416, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2007, to_date('29-12-2014', 'dd-mm-yyyy'), 210.838, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2007, to_date('29-12-2014', 'dd-mm-yyyy'), 140.559, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2008, to_date('29-12-2014', 'dd-mm-yyyy'), 230.425, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2014, to_date('29-12-2014', 'dd-mm-yyyy'), 222.355, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2007, to_date('29-12-2014', 'dd-mm-yyyy'), 210.838, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2014, to_date('20-01-2015', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2015, to_date('01-06-2015', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2015, to_date('18-08-2015', 'dd-mm-yyyy'), 333.533, 100, null);
commit;
prompt 400 records committed...
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2015, to_date('16-10-2015', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2015, to_date('16-10-2015', 'dd-mm-yyyy'), 4751.89, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2015, to_date('16-10-2015', 'dd-mm-yyyy'), 85.485, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2015, to_date('16-10-2015', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2015, to_date('16-10-2015', 'dd-mm-yyyy'), 4751.89, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2015, to_date('16-10-2015', 'dd-mm-yyyy'), 85.485, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2016, to_date('08-08-2016', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2015, to_date('22-08-2016', 'dd-mm-yyyy'), 211.603, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2015, to_date('22-09-2016', 'dd-mm-yyyy'), 188.729, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2016, to_date('22-09-2016', 'dd-mm-yyyy'), 386.04, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2015, to_date('22-09-2016', 'dd-mm-yyyy'), 117.232, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2015, to_date('22-09-2016', 'dd-mm-yyyy'), 386.04, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2016, to_date('22-09-2016', 'dd-mm-yyyy'), 386.04, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2016, to_date('17-10-2016', 'dd-mm-yyyy'), 8428.941, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2016, to_date('17-10-2016', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2016, to_date('17-10-2016', 'dd-mm-yyyy'), 907.948, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2016, to_date('22-02-2017', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2016, to_date('22-02-2017', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2014, to_date('18-01-2018', 'dd-mm-yyyy'), 378.28, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2014, to_date('18-01-2018', 'dd-mm-yyyy'), 378.28, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2014, to_date('18-01-2018', 'dd-mm-yyyy'), 378.28, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2015, to_date('18-01-2018', 'dd-mm-yyyy'), 378.28, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2014, to_date('18-01-2018', 'dd-mm-yyyy'), 378.28, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2015, to_date('31-01-2018', 'dd-mm-yyyy'), 378.28, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2015, to_date('31-01-2018', 'dd-mm-yyyy'), 378.28, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 4, 2019, to_date('28-01-2020', 'dd-mm-yyyy'), 903.895, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2018, to_date('28-01-2020', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2018, to_date('28-01-2020', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 1, 2017, to_date('03-09-2018', 'dd-mm-yyyy'), 758.996, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 4, 2016, to_date('03-09-2018', 'dd-mm-yyyy'), 758.996, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 2, 2017, to_date('03-09-2018', 'dd-mm-yyyy'), 758.996, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 1, 2018, to_date('03-09-2018', 'dd-mm-yyyy'), 1631.54, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 4, 2017, to_date('03-09-2018', 'dd-mm-yyyy'), 1631.54, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 3, 2017, to_date('03-09-2018', 'dd-mm-yyyy'), 1049.844, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 2, 2018, to_date('03-09-2018', 'dd-mm-yyyy'), 1631.54, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2017, to_date('10-09-2018', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 7294.13, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 1631.54, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 650.906, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 16.155, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 201.849, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 192, 2, 2020, to_date('24-07-2020', 'dd-mm-yyyy'), 11.476, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 118, 2, 2020, to_date('24-07-2020', 'dd-mm-yyyy'), 1187.75, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2019, to_date('24-07-2019', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 2, 2019, to_date('24-07-2019', 'dd-mm-yyyy'), 1778.74, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2019, to_date('18-09-2019', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2019, to_date('18-09-2019', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2019, to_date('16-10-2019', 'dd-mm-yyyy'), 8677.221, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2019, to_date('16-10-2019', 'dd-mm-yyyy'), 273.341, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 3, 2019, to_date('16-10-2019', 'dd-mm-yyyy'), 1631.54, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2019, to_date('16-10-2019', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2018, to_date('28-01-2020', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 1, 2020, to_date('29-04-2020', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2020, to_date('18-05-2020', 'dd-mm-yyyy'), 23147.613, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2020, to_date('18-05-2020', 'dd-mm-yyyy'), 4312.909, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2020, to_date('02-06-2020', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 1, 2020, to_date('29-04-2020', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2020, to_date('17-07-2020', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2020, to_date('17-07-2020', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 5.886, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 658.483, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 658.483, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 5.886, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 5.886, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 658.483, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 658.483, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 5.886, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 5.886, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 658.483, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 658.483, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 5.886, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2020, to_date('18-09-2020', 'dd-mm-yyyy'), 745.14, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2020, to_date('18-09-2020', 'dd-mm-yyyy'), 34.206, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2020, to_date('18-01-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2020, to_date('18-01-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2020, to_date('18-01-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2020, to_date('18-01-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2020, to_date('18-01-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2020, to_date('18-01-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2020, to_date('22-01-2021', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2020, to_date('26-01-2021', 'dd-mm-yyyy'), 655.217, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2020, to_date('26-01-2021', 'dd-mm-yyyy'), 4.819, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2020, to_date('26-01-2021', 'dd-mm-yyyy'), 655.217, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2020, to_date('26-01-2021', 'dd-mm-yyyy'), 655.217, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2020, to_date('26-01-2021', 'dd-mm-yyyy'), 4.819, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2020, to_date('26-01-2021', 'dd-mm-yyyy'), 4.819, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2012, to_date('27-08-2013', 'dd-mm-yyyy'), 94.72, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2013, to_date('10-02-2014', 'dd-mm-yyyy'), 362.887, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2013, to_date('10-02-2014', 'dd-mm-yyyy'), 362.887, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2014, to_date('15-04-2014', 'dd-mm-yyyy'), 25.72, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2014, to_date('15-04-2014', 'dd-mm-yyyy'), 5850.513, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2014, to_date('15-04-2014', 'dd-mm-yyyy'), 25.72, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2014, to_date('15-04-2014', 'dd-mm-yyyy'), 5850.513, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2014, to_date('15-07-2014', 'dd-mm-yyyy'), 5850.513, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 2, 2014, to_date('15-07-2014', 'dd-mm-yyyy'), 25.72, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 2, 2014, to_date('15-07-2014', 'dd-mm-yyyy'), 2787.343, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 197, 2, 2014, to_date('08-08-2014', 'dd-mm-yyyy'), 367.247, null, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2014, to_date('23-10-2014', 'dd-mm-yyyy'), 351.694, null, null);
commit;
prompt 500 records committed...
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 1, 2014, to_date('27-01-2015', 'dd-mm-yyyy'), 662.884, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2018, to_date('16-04-2018', 'dd-mm-yyyy'), 5539.035, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2014, to_date('10-04-2015', 'dd-mm-yyyy'), 511.812, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2015, to_date('15-07-2015', 'dd-mm-yyyy'), 5378.244, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 2, 2015, to_date('15-07-2015', 'dd-mm-yyyy'), 85.485, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2016, to_date('15-04-2016', 'dd-mm-yyyy'), 143.559, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2016, to_date('15-04-2016', 'dd-mm-yyyy'), 6451.483, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2015, to_date('18-05-2016', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2015, to_date('18-05-2016', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2016, to_date('18-05-2016', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 4, 2014, to_date('18-05-2016', 'dd-mm-yyyy'), 367.247, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2015, to_date('22-08-2016', 'dd-mm-yyyy'), 211.603, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2016, to_date('08-05-2017', 'dd-mm-yyyy'), 546.087, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2013, to_date('08-05-2017', 'dd-mm-yyyy'), 484.445, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2015, to_date('08-05-2017', 'dd-mm-yyyy'), 484.445, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2016, to_date('08-05-2017', 'dd-mm-yyyy'), 242.705, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2012, to_date('08-05-2017', 'dd-mm-yyyy'), 484.445, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2013, to_date('08-05-2017', 'dd-mm-yyyy'), 484.445, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2014, to_date('08-05-2017', 'dd-mm-yyyy'), 484.445, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2014, to_date('08-05-2017', 'dd-mm-yyyy'), 484.445, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2016, to_date('08-05-2017', 'dd-mm-yyyy'), 546.087, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2016, to_date('08-05-2017', 'dd-mm-yyyy'), 2.959, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2013, to_date('08-05-2017', 'dd-mm-yyyy'), 484.445, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2013, to_date('08-05-2017', 'dd-mm-yyyy'), 484.445, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2016, to_date('08-05-2017', 'dd-mm-yyyy'), 2.959, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2016, to_date('08-05-2017', 'dd-mm-yyyy'), 1.315, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2014, to_date('08-05-2017', 'dd-mm-yyyy'), 484.445, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2014, to_date('08-05-2017', 'dd-mm-yyyy'), 484.445, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2012, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2013, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2012, to_date('12-06-2017', 'dd-mm-yyyy'), 14.373, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2012, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2013, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2013, to_date('12-06-2017', 'dd-mm-yyyy'), 6.165, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2013, to_date('12-06-2017', 'dd-mm-yyyy'), 6.165, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2014, to_date('12-06-2017', 'dd-mm-yyyy'), 6.165, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2012, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2014, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2014, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2015, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2015, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2015, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2016, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2017, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2012, to_date('12-06-2017', 'dd-mm-yyyy'), 6.165, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2015, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2012, to_date('12-06-2017', 'dd-mm-yyyy'), 14.373, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2013, to_date('12-06-2017', 'dd-mm-yyyy'), 6.165, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2013, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2012, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2014, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2012, to_date('12-06-2017', 'dd-mm-yyyy'), 14.373, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2013, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2014, to_date('12-06-2017', 'dd-mm-yyyy'), 498.392, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2013, to_date('12-06-2017', 'dd-mm-yyyy'), 6.165, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2017, to_date('17-07-2017', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 2, 2017, to_date('17-07-2017', 'dd-mm-yyyy'), 258.096, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2017, to_date('17-07-2017', 'dd-mm-yyyy'), 9698.255, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2017, to_date('17-07-2017', 'dd-mm-yyyy'), 546.087, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2017, to_date('27-11-2017', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2017, to_date('27-11-2017', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2017, to_date('27-11-2017', 'dd-mm-yyyy'), 333.533, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2017, to_date('15-01-2018', 'dd-mm-yyyy'), 6457.268, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2017, to_date('15-01-2018', 'dd-mm-yyyy'), 546.087, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2017, to_date('15-01-2018', 'dd-mm-yyyy'), 94.752, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2017, to_date('16-01-2018', 'dd-mm-yyyy'), 522.177, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2017, to_date('12-02-2018', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 1, 2018, to_date('13-04-2018', 'dd-mm-yyyy'), 542.825, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2018, to_date('16-04-2018', 'dd-mm-yyyy'), 897.781, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2018, to_date('16-04-2018', 'dd-mm-yyyy'), 135.567, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 4, 2018, to_date('25-01-2019', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2018, to_date('01-02-2019', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2018, to_date('01-02-2019', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2018, to_date('01-02-2019', 'dd-mm-yyyy'), .536, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2018, to_date('06-02-2019', 'dd-mm-yyyy'), 1340.033, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2018, to_date('06-02-2019', 'dd-mm-yyyy'), 37.631, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 1, 2019, to_date('17-04-2019', 'dd-mm-yyyy'), 581.829, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2019, to_date('30-05-2019', 'dd-mm-yyyy'), 28.646, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2019, to_date('30-05-2019', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2019, to_date('15-07-2019', 'dd-mm-yyyy'), 201.849, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2019, to_date('15-07-2019', 'dd-mm-yyyy'), 6308.437, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2019, to_date('15-07-2019', 'dd-mm-yyyy'), 351.694, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 4, 2017, to_date('24-07-2019', 'dd-mm-yyyy'), 289.293, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 3, 2018, to_date('24-07-2019', 'dd-mm-yyyy'), 300.732, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 4, 2018, to_date('24-07-2019', 'dd-mm-yyyy'), 300.732, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 3, 2017, to_date('24-07-2019', 'dd-mm-yyyy'), 96.431, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 1, 2018, to_date('24-07-2019', 'dd-mm-yyyy'), 300.732, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 2, 2018, to_date('24-07-2019', 'dd-mm-yyyy'), 300.732, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 3, 2019, to_date('21-10-2019', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2019, to_date('21-10-2019', 'dd-mm-yyyy'), 438.988, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2019, to_date('21-10-2019', 'dd-mm-yyyy'), 17.563, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2019, to_date('21-10-2019', 'dd-mm-yyyy'), 12.42, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2019, to_date('21-10-2019', 'dd-mm-yyyy'), 655.217, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2019, to_date('24-02-2020', 'dd-mm-yyyy'), 1030.017, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2019, to_date('24-02-2020', 'dd-mm-yyyy'), 569.075, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 1, 2020, to_date('29-04-2020', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2020, to_date('11-05-2020', 'dd-mm-yyyy'), 32.685, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2020, to_date('11-05-2020', 'dd-mm-yyyy'), 712.021, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2020, to_date('06-08-2020', 'dd-mm-yyyy'), 23207.394, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 1, 2020, to_date('26-08-2020', 'dd-mm-yyyy'), 483.401, 100, null);
commit;
prompt 600 records committed...
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 2, 2020, to_date('26-08-2020', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 2, 2020, to_date('23-10-2020', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2019, to_date('23-10-2020', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 1, 2020, to_date('23-10-2020', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 3, 2020, to_date('23-10-2020', 'dd-mm-yyyy'), 420.494, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 3, 2020, to_date('23-10-2020', 'dd-mm-yyyy'), 1631.54, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 5.886, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 658.483, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 658.483, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2020, to_date('12-08-2020', 'dd-mm-yyyy'), 5.886, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 119, 2, 2020, to_date('10-12-2020', 'dd-mm-yyyy'), 675.995, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 193, 2, 2020, to_date('10-12-2020', 'dd-mm-yyyy'), 13.126, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 119, 2, 2020, to_date('10-12-2020', 'dd-mm-yyyy'), 675.995, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 193, 2, 2020, to_date('10-12-2020', 'dd-mm-yyyy'), 13.126, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2020, to_date('17-02-2021', 'dd-mm-yyyy'), 10472.737, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2020, to_date('18-01-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 192, 1, 2020, to_date('14-04-2020', 'dd-mm-yyyy'), 11.476, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 118, 1, 2020, to_date('14-04-2020', 'dd-mm-yyyy'), 1187.75, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 118, 2, 2020, to_date('24-07-2020', 'dd-mm-yyyy'), 1187.75, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 192, 2, 2020, to_date('24-07-2020', 'dd-mm-yyyy'), 11.476, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 192, 3, 2020, to_date('14-10-2020', 'dd-mm-yyyy'), 11.476, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 118, 3, 2020, to_date('14-10-2020', 'dd-mm-yyyy'), 1187.75, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 193, 2, 2020, to_date('10-12-2020', 'dd-mm-yyyy'), 13.126, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 119, 2, 2020, to_date('10-12-2020', 'dd-mm-yyyy'), 675.995, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 193, 2, 2020, to_date('10-12-2020', 'dd-mm-yyyy'), 13.126, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 119, 2, 2020, to_date('10-12-2020', 'dd-mm-yyyy'), 675.995, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2021, to_date('19-04-2021', 'dd-mm-yyyy'), 1477.703, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2021, to_date('19-04-2021', 'dd-mm-yyyy'), 9460.232, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2021, to_date('29-04-2021', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2021, to_date('29-04-2021', 'dd-mm-yyyy'), 2.293, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2020, to_date('29-04-2021', 'dd-mm-yyyy'), 49.996, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2020, to_date('29-04-2021', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2021, to_date('26-05-2021', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 119, 1, 2020, to_date('27-05-2021', 'dd-mm-yyyy'), 658.029, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 193, 1, 2020, to_date('27-05-2021', 'dd-mm-yyyy'), 5.738, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 119, 1, 2020, to_date('27-05-2021', 'dd-mm-yyyy'), 658.029, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 193, 1, 2020, to_date('27-05-2021', 'dd-mm-yyyy'), 5.738, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 1, 2021, to_date('17-06-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 1, 2021, to_date('17-06-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2020, to_date('18-06-2021', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 1, 2021, to_date('17-06-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2021, to_date('16-07-2021', 'dd-mm-yyyy'), 8558.04, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 500299, 70, 137, 1, 2021, to_date('23-07-2021', 'dd-mm-yyyy'), 255.661, 500, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 500299, 70, 137, 2, 2021, to_date('23-07-2021', 'dd-mm-yyyy'), 255.661, 500, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 2, 2021, to_date('26-07-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 2, 2021, to_date('13-09-2021', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 3, 2020, to_date('13-09-2021', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 1, 2021, to_date('13-09-2021', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 4, 2020, to_date('13-09-2021', 'dd-mm-yyyy'), 483.401, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 1, 2021, to_date('27-09-2021', 'dd-mm-yyyy'), 872.544, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 2, 2021, to_date('27-09-2021', 'dd-mm-yyyy'), 1093.079, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2021, to_date('01-10-2021', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2021, to_date('08-10-2021', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2021, to_date('08-10-2021', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 3, 2021, to_date('14-10-2021', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 3, 2021, to_date('19-10-2021', 'dd-mm-yyyy'), 1401.476, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2021, to_date('09-11-2021', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 3, 2021, to_date('09-11-2021', 'dd-mm-yyyy'), 322.267, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2021, to_date('09-11-2021', 'dd-mm-yyyy'), 2.293, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 138, 3, 2021, to_date('12-11-2021', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2021, to_date('14-01-2022', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2021, to_date('04-02-2022', 'dd-mm-yyyy'), 1477.705, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2021, to_date('04-02-2022', 'dd-mm-yyyy'), 7895.701, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 137, 3, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 1474.1, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 197, 1, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 87.948, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 137, 4, 2020, to_date('14-03-2022', 'dd-mm-yyyy'), 491.367, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 137, 1, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 1474.1, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 197, 3, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 87.948, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 137, 4, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 491.367, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 197, 2, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 87.948, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 137, 2, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 1474.1, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 2, 2016, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 4, 2015, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 2, 2016, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 1, 2017, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 4, 2015, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 2, 2018, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 4, 2016, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 4, 2017, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 3, 2018, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 3, 2015, to_date('23-03-2022', 'dd-mm-yyyy'), 308.711, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 2, 2017, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 4, 2017, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 1, 2018, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 1, 2019, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 3, 2019, to_date('23-03-2022', 'dd-mm-yyyy'), 617.424, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 3, 2017, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 2, 2018, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 3, 2015, to_date('23-03-2022', 'dd-mm-yyyy'), 171.03, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 3, 2019, to_date('23-03-2022', 'dd-mm-yyyy'), 342.054, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 1, 2017, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 1, 2016, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 2, 2017, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 4, 2018, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 4, 2016, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 3, 2018, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 4, 2018, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 1, 2018, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 1, 2019, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 3, 2017, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
commit;
prompt 700 records committed...
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 2, 2019, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 2, 2019, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 1, 2016, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 137, 3, 2016, to_date('23-03-2022', 'dd-mm-yyyy'), 926.134, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (83, 76660, 30, 138, 3, 2016, to_date('23-03-2022', 'dd-mm-yyyy'), 513.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2022, to_date('15-04-2022', 'dd-mm-yyyy'), 1477.703, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2022, to_date('15-04-2022', 'dd-mm-yyyy'), 7895.701, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 1, 2022, to_date('18-04-2022', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 1, 2022, to_date('18-04-2022', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2022, to_date('18-05-2022', 'dd-mm-yyyy'), 2.293, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2021, to_date('18-05-2022', 'dd-mm-yyyy'), 2.293, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2021, to_date('18-05-2022', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2022, to_date('18-05-2022', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 193, 3, 2020, to_date('13-06-2022', 'dd-mm-yyyy'), 5.738, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 119, 3, 2020, to_date('13-06-2022', 'dd-mm-yyyy'), 658.029, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 137, 3, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 1474.1, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 197, 1, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 87.948, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 137, 4, 2020, to_date('14-03-2022', 'dd-mm-yyyy'), 491.367, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 137, 1, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 1474.1, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 197, 3, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 87.948, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 137, 4, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 491.367, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 197, 2, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 87.948, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 137, 2, 2021, to_date('14-03-2022', 'dd-mm-yyyy'), 1474.1, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 193, 3, 2020, to_date('13-06-2022', 'dd-mm-yyyy'), 5.738, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 119, 3, 2020, to_date('13-06-2022', 'dd-mm-yyyy'), 658.029, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2021, to_date('11-07-2022', 'dd-mm-yyyy'), 655.217, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2020, to_date('11-07-2022', 'dd-mm-yyyy'), 655.217, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2021, to_date('11-07-2022', 'dd-mm-yyyy'), 655.217, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2022, to_date('15-07-2022', 'dd-mm-yyyy'), 7895.701, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 2, 2022, to_date('15-07-2022', 'dd-mm-yyyy'), 1477.703, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 239067, 59, 137, 2, 2022, to_date('22-07-2022', 'dd-mm-yyyy'), 671.631, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 2, 2022, to_date('02-08-2022', 'dd-mm-yyyy'), 618.538, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 138, 2, 2021, to_date('03-08-2022', 'dd-mm-yyyy'), 816.671, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 138, 4, 2021, to_date('03-08-2022', 'dd-mm-yyyy'), 272.224, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 198, 2, 2021, to_date('03-08-2022', 'dd-mm-yyyy'), 43.974, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 198, 1, 2021, to_date('03-08-2022', 'dd-mm-yyyy'), 43.974, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 138, 3, 2021, to_date('03-08-2022', 'dd-mm-yyyy'), 816.671, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 198, 3, 2021, to_date('03-08-2022', 'dd-mm-yyyy'), 43.974, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 138, 4, 2020, to_date('03-08-2022', 'dd-mm-yyyy'), 272.224, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 25724, 19, 138, 1, 2021, to_date('03-08-2022', 'dd-mm-yyyy'), 816.671, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 4, 2021, to_date('18-08-2022', 'dd-mm-yyyy'), 342.679, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 1, 2022, to_date('18-08-2022', 'dd-mm-yyyy'), 342.679, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 2, 2022, to_date('18-08-2022', 'dd-mm-yyyy'), 342.679, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 3, 2021, to_date('18-08-2022', 'dd-mm-yyyy'), 342.679, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2022, to_date('25-08-2022', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2021, to_date('25-08-2022', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2022, to_date('25-08-2022', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (20, 84124, 25, 198, 2, 2012, to_date('15-09-2022', 'dd-mm-yyyy'), 382.528, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 3, 2022, to_date('21-09-2022', 'dd-mm-yyyy'), 114.226, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 2, 2022, to_date('28-09-2022', 'dd-mm-yyyy'), 2.293, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2022, to_date('28-09-2022', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2022, to_date('10-10-2022', 'dd-mm-yyyy'), 597.243, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2022, to_date('10-10-2022', 'dd-mm-yyyy'), 1.987, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2022, to_date('14-10-2022', 'dd-mm-yyyy'), 8067.267, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2022, to_date('14-10-2022', 'dd-mm-yyyy'), 1477.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 3, 2022, to_date('14-10-2022', 'dd-mm-yyyy'), 412.358, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2021, to_date('28-11-2022', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2021, to_date('28-11-2022', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 1, 2021, to_date('28-11-2022', 'dd-mm-yyyy'), 2.293, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 3, 2021, to_date('28-11-2022', 'dd-mm-yyyy'), 2.293, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2021, to_date('28-11-2022', 'dd-mm-yyyy'), 8071.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2020, to_date('28-11-2022', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2021, to_date('28-11-2022', 'dd-mm-yyyy'), 689.127, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 198, 4, 2020, to_date('28-11-2022', 'dd-mm-yyyy'), 49.996, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2022, to_date('29-11-2022', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 4, 2022, to_date('16-01-2023', 'dd-mm-yyyy'), 7664.071, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2022, to_date('16-01-2023', 'dd-mm-yyyy'), 1442.015, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2022, to_date('14-10-2022', 'dd-mm-yyyy'), 8067.267, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 3, 2022, to_date('14-10-2022', 'dd-mm-yyyy'), 1477.091, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2023, to_date('14-04-2023', 'dd-mm-yyyy'), 1442.013, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2023, to_date('14-04-2023', 'dd-mm-yyyy'), 7664.071, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2022, to_date('23-06-2023', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2023, to_date('23-06-2023', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2023, to_date('14-07-2023', 'dd-mm-yyyy'), 7664.071, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 2, 2023, to_date('14-07-2023', 'dd-mm-yyyy'), 1442.013, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2023, to_date('29-09-2023', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 1, 2017, to_date('14-12-2023', 'dd-mm-yyyy'), 843.388, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 4, 2014, to_date('14-12-2023', 'dd-mm-yyyy'), 500.165, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 2, 2017, to_date('14-12-2023', 'dd-mm-yyyy'), 467.248, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 2, 2014, to_date('14-12-2023', 'dd-mm-yyyy'), 699.223, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 4, 2016, to_date('14-12-2023', 'dd-mm-yyyy'), 1027.197, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 2, 2015, to_date('14-12-2023', 'dd-mm-yyyy'), 397.83, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 1, 2016, to_date('14-12-2023', 'dd-mm-yyyy'), 424.953, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 1, 2016, to_date('14-12-2023', 'dd-mm-yyyy'), 767.046, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 2, 2014, to_date('14-12-2023', 'dd-mm-yyyy'), 387.379, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 3, 2015, to_date('14-12-2023', 'dd-mm-yyyy'), 397.83, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 4, 2014, to_date('14-12-2023', 'dd-mm-yyyy'), 902.803, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 4, 2015, to_date('14-12-2023', 'dd-mm-yyyy'), 927.957, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 2, 2016, to_date('14-12-2023', 'dd-mm-yyyy'), 770.149, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 2, 2017, to_date('14-12-2023', 'dd-mm-yyyy'), 843.388, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 4, 2015, to_date('14-12-2023', 'dd-mm-yyyy'), 514.1, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 2, 2016, to_date('14-12-2023', 'dd-mm-yyyy'), 426.673, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 4, 2016, to_date('14-12-2023', 'dd-mm-yyyy'), 569.081, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 3, 2014, to_date('14-12-2023', 'dd-mm-yyyy'), 387.379, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 1, 2015, to_date('14-12-2023', 'dd-mm-yyyy'), 394.347, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 1, 2015, to_date('14-12-2023', 'dd-mm-yyyy'), 711.8, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 3, 2017, to_date('14-12-2023', 'dd-mm-yyyy'), 909.668, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 1, 2018, to_date('14-12-2023', 'dd-mm-yyyy'), 735.115, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 1, 2014, to_date('14-12-2023', 'dd-mm-yyyy'), 129.126, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 3, 2016, to_date('14-12-2023', 'dd-mm-yyyy'), 426.673, 100, null);
commit;
prompt 800 records committed...
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 1, 2018, to_date('14-12-2023', 'dd-mm-yyyy'), 407.263, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 1, 2014, to_date('14-12-2023', 'dd-mm-yyyy'), 233.074, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 3, 2014, to_date('14-12-2023', 'dd-mm-yyyy'), 699.223, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 2, 2015, to_date('14-12-2023', 'dd-mm-yyyy'), 718.089, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 3, 2015, to_date('14-12-2023', 'dd-mm-yyyy'), 718.089, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 3, 2016, to_date('14-12-2023', 'dd-mm-yyyy'), 770.149, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 1, 2017, to_date('14-12-2023', 'dd-mm-yyyy'), 467.248, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 137, 4, 2017, to_date('14-12-2023', 'dd-mm-yyyy'), 1240.839, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 3, 2017, to_date('14-12-2023', 'dd-mm-yyyy'), 503.968, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 138, 4, 2017, to_date('14-12-2023', 'dd-mm-yyyy'), 687.441, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2019, to_date('13-05-2024', 'dd-mm-yyyy'), 3, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 4, 2024, to_date('16-01-2025', 'dd-mm-yyyy'), 862.737, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 3, 2025, to_date('23-10-2025', 'dd-mm-yyyy'), 2758.8, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 192, 3, 2025, to_date('23-10-2025', 'dd-mm-yyyy'), 73.455, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 3, 2025, to_date('23-10-2025', 'dd-mm-yyyy'), 2758.8, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 192, 3, 2025, to_date('23-10-2025', 'dd-mm-yyyy'), 73.455, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 3, 2025, to_date('23-10-2025', 'dd-mm-yyyy'), 2758.8, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 192, 3, 2025, to_date('23-10-2025', 'dd-mm-yyyy'), 73.455, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 3, 2025, to_date('23-10-2025', 'dd-mm-yyyy'), 2758.8, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 192, 3, 2025, to_date('23-10-2025', 'dd-mm-yyyy'), 73.455, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 3, 2025, to_date('23-10-2025', 'dd-mm-yyyy'), 2758.8, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 192, 3, 2025, to_date('23-10-2025', 'dd-mm-yyyy'), 73.455, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 1, 2019, to_date('20-10-2023', 'dd-mm-yyyy'), 300.732, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 4, 2019, to_date('20-10-2023', 'dd-mm-yyyy'), 342.678, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 3, 2022, to_date('20-10-2023', 'dd-mm-yyyy'), 114.226, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 2, 2020, to_date('20-10-2023', 'dd-mm-yyyy'), 342.678, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 3, 2020, to_date('20-10-2023', 'dd-mm-yyyy'), 342.678, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 4, 2020, to_date('20-10-2023', 'dd-mm-yyyy'), 342.678, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 2, 2021, to_date('20-10-2023', 'dd-mm-yyyy'), 342.678, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 1, 2021, to_date('20-10-2023', 'dd-mm-yyyy'), 342.678, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 2, 2019, to_date('20-10-2023', 'dd-mm-yyyy'), 335.897, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 3, 2019, to_date('20-10-2023', 'dd-mm-yyyy'), 342.678, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 138, 1, 2020, to_date('20-10-2023', 'dd-mm-yyyy'), 342.678, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 4, 2022, to_date('23-02-2024', 'dd-mm-yyyy'), 192.742, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 2, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 1, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 4, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 3, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2023, to_date('06-03-2024', 'dd-mm-yyyy'), 30.729, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 1, 2024, to_date('16-04-2024', 'dd-mm-yyyy'), 1442.013, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 1, 2024, to_date('16-04-2024', 'dd-mm-yyyy'), 5299.477, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (81, 64759, 60, 137, 4, 2019, to_date('13-05-2024', 'dd-mm-yyyy'), 3, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 119, 4, 2022, to_date('18-06-2024', 'dd-mm-yyyy'), 41.263, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 119, 4, 2023, to_date('18-06-2024', 'dd-mm-yyyy'), 694.081, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 119, 1, 2023, to_date('18-06-2024', 'dd-mm-yyyy'), 694.081, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 119, 4, 2022, to_date('18-06-2024', 'dd-mm-yyyy'), 65.519, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 119, 3, 2023, to_date('18-06-2024', 'dd-mm-yyyy'), 694.081, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 119, 2, 2023, to_date('18-06-2024', 'dd-mm-yyyy'), 694.081, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 119, 1, 2024, to_date('18-06-2024', 'dd-mm-yyyy'), 729.23, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2022, to_date('05-07-2024', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2021, to_date('05-07-2024', 'dd-mm-yyyy'), 460.942, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 3, 2024, to_date('16-10-2024', 'dd-mm-yyyy'), 1465.027, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 3, 2023, to_date('16-10-2023', 'dd-mm-yyyy'), 730.301, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 4, 2022, to_date('23-02-2024', 'dd-mm-yyyy'), 192.742, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 2, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 1, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 4, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 3, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 4, 2022, to_date('23-02-2024', 'dd-mm-yyyy'), 192.742, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 2, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 1, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 4, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 3, 2023, to_date('23-02-2024', 'dd-mm-yyyy'), 1252.826, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 1, 2024, to_date('22-04-2024', 'dd-mm-yyyy'), 1316.268, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 137, 2, 2024, to_date('15-07-2024', 'dd-mm-yyyy'), 5299.477, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 2, 2024, to_date('15-07-2024', 'dd-mm-yyyy'), 1465.027, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 2, 2024, to_date('15-07-2024', 'dd-mm-yyyy'), 1495.571, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2016, to_date('04-09-2024', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2017, to_date('04-09-2024', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2017, to_date('04-09-2024', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 4, 2016, to_date('04-09-2024', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 2, 2017, to_date('04-09-2024', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 1, 2017, to_date('04-09-2024', 'dd-mm-yyyy'), 386.914, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 118, 3, 2023, to_date('22-01-2024', 'dd-mm-yyyy'), 423.285, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 118, 3, 2023, to_date('22-01-2024', 'dd-mm-yyyy'), 423.285, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 119, 3, 2023, to_date('05-12-2023', 'dd-mm-yyyy'), 234.506, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 138, 3, 2023, to_date('06-03-2024', 'dd-mm-yyyy'), 30.729, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 2, 2025, to_date('21-08-2025', 'dd-mm-yyyy'), 1509.234, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 207906, 35, 193, 4, 2015, to_date('31-08-2023', 'dd-mm-yyyy'), 4273.906, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 197, 4, 2023, to_date('16-01-2024', 'dd-mm-yyyy'), 22.018, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 4, 2023, to_date('16-01-2024', 'dd-mm-yyyy'), 1789.243, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 192, 1, 2024, to_date('17-04-2024', 'dd-mm-yyyy'), 53.558, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (10, 21949, 27, 118, 1, 2024, to_date('17-04-2024', 'dd-mm-yyyy'), 2414.589, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 118, 4, 2023, to_date('16-05-2024', 'dd-mm-yyyy'), 1144.99, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 119, 3, 2023, to_date('16-05-2024', 'dd-mm-yyyy'), 422.893, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 119, 4, 2023, to_date('16-05-2024', 'dd-mm-yyyy'), 634.34, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 118, 1, 2024, to_date('16-05-2024', 'dd-mm-yyyy'), 801.493, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 118, 3, 2023, to_date('16-05-2024', 'dd-mm-yyyy'), 763.327, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 18624, 0, 119, 1, 2024, to_date('16-05-2024', 'dd-mm-yyyy'), 444.037, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 119, 2, 2024, to_date('22-07-2024', 'dd-mm-yyyy'), 730.196, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 2, 2024, to_date('22-07-2024', 'dd-mm-yyyy'), 1318.011, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 118, 3, 2024, to_date('22-10-2024', 'dd-mm-yyyy'), 878.357, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (85, 253240, 70, 119, 3, 2024, to_date('22-10-2024', 'dd-mm-yyyy'), 486.621, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 118, 2, 2024, to_date('15-11-2024', 'dd-mm-yyyy'), 1269.855, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 119, 4, 2023, to_date('15-11-2024', 'dd-mm-yyyy'), 703.517, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 118, 4, 2023, to_date('15-11-2024', 'dd-mm-yyyy'), 1269.855, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 119, 2, 2024, to_date('15-11-2024', 'dd-mm-yyyy'), 703.517, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 118, 3, 2023, to_date('15-11-2024', 'dd-mm-yyyy'), 846.57, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 118, 1, 2024, to_date('15-11-2024', 'dd-mm-yyyy'), 1269.855, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 119, 1, 2024, to_date('15-11-2024', 'dd-mm-yyyy'), 703.517, 100, null);
commit;
prompt 900 records committed...
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 118, 3, 2024, to_date('15-11-2024', 'dd-mm-yyyy'), 423.285, 100, null);
insert into COPT.MDISP_TMP_TEMP_EMP (bur_cod, emp_mat, emp_cle, mvc_codexp, mvc_trim, mvc_ann, mvc_djour, mvc_montant, reg_cod, dt_affecte)
values (80, 206056, 28, 119, 3, 2024, to_date('15-11-2024', 'dd-mm-yyyy'), 234.505, 100, null);
commit;
prompt 902 records loaded
set feedback on
set define on
prompt Done.
