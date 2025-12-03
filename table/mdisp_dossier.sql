prompt PL/SQL Developer import file
prompt Created on mardi 2 dÈcembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.MDISP_DOSSIER...
drop table COPT.MDISP_DOSSIER cascade constraints;
prompt Creating COPT.MDISP_DOSSIER...
create table COPT.MDISP_DOSSIER
(
  emp_mat     NUMBER(8) not null,
  emp_cle     NUMBER(2) not null,
  ass_mat     NUMBER(8) not null,
  ass_cle     NUMBER(2) not null,
  dco_dtdeb   DATE not null,
  dco_dtfin   DATE,
  dco_salaire NUMBER(15,3),
  adresse     VARCHAR2(500),
  cod_pos     NUMBER(3),
  compl       NUMBER(1) default 0
)
nologging;
create index COPT.FK_ASS_MDISP_DOSSSIER on COPT.MDISP_DOSSIER (ASS_MAT, ASS_CLE);
create index COPT.FK_EMP_MDISP_DOSSSIER on COPT.MDISP_DOSSIER (EMP_MAT, EMP_CLE);
create index COPT.FK_POS_MDISP_DOSSSIER on COPT.MDISP_DOSSIER (COD_POS);
alter table COPT.MDISP_DOSSIER
  add constraint PK_MDISP_DOSSSIER primary key (EMP_MAT, EMP_CLE, ASS_MAT, ASS_CLE, DCO_DTDEB);

prompt Loading COPT.MDISP_DOSSIER...
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11613825, 0, to_date('01-10-2012', 'dd-mm-yyyy'), to_date('31-12-2012', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 876037, 0, to_date('01-01-2013', 'dd-mm-yyyy'), to_date('30-06-2013', 'dd-mm-yyyy'), null, null, null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 12157915, 8, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('30-06-2014', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11600023, 7, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('30-06-2014', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11445070, 9, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('30-06-2014', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11613297, 9, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('30-06-2014', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11810800, 1, to_date('01-04-2014', 'dd-mm-yyyy'), to_date('30-06-2014', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 12157915, 8, to_date('01-10-2012', 'dd-mm-yyyy'), to_date('31-03-2014', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (239067, 59, 12955897, 7, to_date('01-10-2016', 'dd-mm-yyyy'), to_date('30-09-2018', 'dd-mm-yyyy'), null, '18 ‰ÂÃ «·„ﬁ«Ê·Ì‰ «·‘—ﬁÌ… 2 2035', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (239067, 59, 11692226, 9, to_date('01-09-2017', 'dd-mm-yyyy'), to_date('30-09-2018', 'dd-mm-yyyy'), null, '20‰ÂÃ 9 «›—Ì· «·“Â—«¡ 2034', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (64759, 60, 16078805, 5, to_date('01-09-2017', 'dd-mm-yyyy'), to_date('31-08-2022', 'dd-mm-yyyy'), null, '‰ÂÃ «·⁄—»Ì “—Êﬁ  «·„⁄„Ê—… 8013', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11584144, 7, to_date('01-07-2012', 'dd-mm-yyyy'), to_date('30-06-2013', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (239067, 59, 11692226, 9, to_date('01-10-2018', 'dd-mm-yyyy'), to_date('31-08-2019', 'dd-mm-yyyy'), null, null, null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11445070, 9, to_date('01-11-2011', 'dd-mm-yyyy'), to_date('31-03-2014', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11613297, 9, to_date('28-03-2012', 'dd-mm-yyyy'), to_date('31-03-2014', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (239067, 59, 12955897, 7, to_date('01-10-2018', 'dd-mm-yyyy'), to_date('30-09-2019', 'dd-mm-yyyy'), null, null, null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (20757, 96, 16078883, 0, to_date('01-01-2015', 'dd-mm-yyyy'), to_date('31-12-2015', 'dd-mm-yyyy'), null, 'ÕÌ ”ÌœÌ ”⁄œ «·„—‰«ﬁ  »‰ ⁄—Ê”', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11689874, 0, to_date('19-10-2011', 'dd-mm-yyyy'), to_date('18-10-2012', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11600023, 7, to_date('01-09-2012', 'dd-mm-yyyy'), to_date('31-03-2014', 'dd-mm-yyyy'), null, '«·ŒÿÊÿ «· Ê‰”Ì… ‘«—⁄ „Õ„œ «·»Ê⁄“Ì“Ì  Ê‰” «·ﬁ—ÿ«Ã', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11359712, 6, to_date('01-04-2013', 'dd-mm-yyyy'), to_date('30-06-2014', 'dd-mm-yyyy'), null, null, null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 11613825, 0, to_date('01-01-2013', 'dd-mm-yyyy'), to_date('30-06-2014', 'dd-mm-yyyy'), null, null, null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (21949, 27, 16166114, 4, to_date('01-12-2013', 'dd-mm-yyyy'), to_date('30-06-2014', 'dd-mm-yyyy'), null, null, null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (18624, 0, 16520937, 7, to_date('01-03-2014', 'dd-mm-yyyy'), to_date('28-02-2015', 'dd-mm-yyyy'), null, 'RUE MOHAMED ALI AKID', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (18624, 0, 16520937, 7, to_date('01-03-2015', 'dd-mm-yyyy'), to_date('28-02-2016', 'dd-mm-yyyy'), null, 'RUE MOHAMED ALI AKID', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (18624, 0, 16520937, 7, to_date('01-03-2016', 'dd-mm-yyyy'), to_date('28-02-2017', 'dd-mm-yyyy'), null, 'RUE MOHAMED ALI AKID', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (18624, 0, 16520937, 7, to_date('01-03-2017', 'dd-mm-yyyy'), to_date('28-02-2018', 'dd-mm-yyyy'), null, 'RUE MOHAMED ALI AKID', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (64759, 60, 16078805, 5, to_date('01-09-2025', 'dd-mm-yyyy'), to_date('31-08-2026', 'dd-mm-yyyy'), null, '‰ÂÃ «·⁄—»Ì “—Êﬁ «·„⁄„Ê—… 8013', null, 0);
insert into COPT.MDISP_DOSSIER (emp_mat, emp_cle, ass_mat, ass_cle, dco_dtdeb, dco_dtfin, dco_salaire, adresse, cod_pos, compl)
values (25724, 19, 11763581, 7, to_date('16-11-2020', 'dd-mm-yyyy'), to_date('15-11-2021', 'dd-mm-yyyy'), null, '«ﬁ«„… «·Õœ«∆ﬁ „œ—Ã Õ ‘ﬁ… 89 2094Õœ«∆ﬁ «·„‰“Â', null, 0);
commit;
prompt 28 records loaded
set feedback on
set define on
prompt Done.
