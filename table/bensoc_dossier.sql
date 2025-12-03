prompt PL/SQL Developer import file
prompt Created on mardi 2 dÈcembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.BENSOC_DOSSIER...
drop table COPT.BENSOC_DOSSIER cascade constraints;
prompt Creating COPT.BENSOC_DOSSIER...
create table COPT.BENSOC_DOSSIER
(
  emp_mat     NUMBER(8) not null,
  emp_cle     NUMBER(2) not null,
  ass_mat     NUMBER(8) not null,
  ass_cle     NUMBER(2) not null,
  dco_dtdeb   DATE not null,
  dco_dtfin   DATE,
  dco_salaire NUMBER(15,3),
  adresse     VARCHAR2(500),
  cod_pos     NUMBER(3)
)
nologging;
create index COPT.FK_ASS_BENSOC_DOSSSIER on COPT.BENSOC_DOSSIER (ASS_MAT, ASS_CLE);
create index COPT.FK_EMP_BENSOC_DOSSSIER on COPT.BENSOC_DOSSIER (EMP_MAT, EMP_CLE);
create index COPT.FK_POS_BENSOC_DOSSSIER on COPT.BENSOC_DOSSIER (COD_POS);
alter table COPT.BENSOC_DOSSIER
  add constraint PK_BENSOC_DOSSSIER primary key (EMP_MAT, EMP_CLE, ASS_MAT, ASS_CLE, DCO_DTDEB);

prompt Loading COPT.BENSOC_DOSSIER...
insert into COPT.BENSOC_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos)
values (25724, 19, 12542256, 8, to_date('01-10-2018', 'dd-mm-yyyy'), to_date('30-09-2019', 'dd-mm-yyyy'), 2363, '‰ÂÃ «·—ÊÌ”Ì «ﬁ«„… «·“Ì Ê‰… ‘11 „œ—Ã »2 «·„‰«—', null);
insert into COPT.BENSOC_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos)
values (25724, 19, 12174410, 3, to_date('02-10-2019', 'dd-mm-yyyy'), to_date('30-09-2020', 'dd-mm-yyyy'), 2389.358, '8 ‰ÂÃ «·«„«„ «·‘«›⁄Ì ÕÌ «·—Ì«÷ »«—œÊ', null);
insert into COPT.BENSOC_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos)
values (1, 1, 12545398, 0, to_date('01-01-2014', 'dd-mm-yyyy'), null, 5000, 'ﬂ„ﬂ„ﬂ„ﬂ', null);
insert into COPT.BENSOC_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos)
values (1, 1, 12278295, 2, to_date('01-01-2014', 'dd-mm-yyyy'), null, 6000, ' » ·»·»', null);
insert into COPT.BENSOC_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos)
values (25724, 19, 12542256, 8, to_date('02-10-2017', 'dd-mm-yyyy'), to_date('30-09-2018', 'dd-mm-yyyy'), 2362.8, '‰ÂÃ «·—ÊÌ”Ì «ﬁ«„… «·“Ì Ê‰… ‘11 „œ—Ã »2 «·„‰«—', null);
insert into COPT.BENSOC_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos)
values (1, 1, 917364, 0, to_date('15-01-2014', 'dd-mm-yyyy'), null, 1600, '‰Ï”Ì»„Ï”„Ì »', null);
insert into COPT.BENSOC_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos)
values (253240, 70, 16467095, 9, to_date('18-12-2022', 'dd-mm-yyyy'), to_date('12-02-2024', 'dd-mm-yyyy'), 1163.201, '«·»ÕÌ—… √Ê—«‰ 1053 «·»ÕÌ—…', null);
insert into COPT.BENSOC_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos)
values (253240, 70, 16467095, 9, to_date('12-02-2024', 'dd-mm-yyyy'), null, 1163, '«·»ÕÌ—… √Ê—«‰ 1053 «·»ÕÌ—…', null);
insert into COPT.BENSOC_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos)
values (18624, 0, 11081638, 7, to_date('01-08-2023', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 2303.34, 'route el mahdia km 5', null);
insert into COPT.BENSOC_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos)
values (206056, 28, 12253392, 7, to_date('01-08-2022', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'), 2554.527, '‘«—⁄ «·ÿÌ» «·„ÂÌ—Ì', null);
commit;
prompt 10 records loaded
set feedback on
set define on
prompt Done.
