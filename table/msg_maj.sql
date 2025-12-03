prompt PL/SQL Developer import file
prompt Created on mardi 2 décembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.MSG_MAJ...
drop table COPT.MSG_MAJ cascade constraints;
prompt Creating COPT.MSG_MAJ...
create table COPT.MSG_MAJ
(
  bur_cod  NUMBER not null,
  code_app NUMBER not null,
  date_cre DATE not null,
  msg_maj  VARCHAR2(4000)
)
nologging;
alter table COPT.MSG_MAJ
  add constraint PK_MSG_MAJ primary key (BUR_COD, CODE_APP, DATE_CRE);

prompt Loading COPT.MSG_MAJ...
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (81, 1, to_date('24-02-2017', 'dd-mm-yyyy'), '--- VOUS ETES SUR DONNEE PROD ---');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (1, 1, to_date('27-09-2018', 'dd-mm-yyyy'), '6D11600023070219492709041203953028            RIM KADHRAOUI            00101    58931027092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (2, 1, to_date('27-09-2018', 'dd-mm-yyyy'), '6D11613825000219492709021403831090            NARJES BOURARA           00102    58931027092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (3, 1, to_date('27-09-2018', 'dd-mm-yyyy'), '6D11613825000219492709041203831090            NARJES BOURARA           00103    58931027092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (4, 1, to_date('27-09-2018', 'dd-mm-yyyy'), '6D11600023070219492709021403953028            RIM KADHRAOUI            00104    58931027092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (1, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D11692226092390675909021805265807            HELA BOUJEMAA            00101    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (2, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D11692226092390675909041705265807            HELA BOUJEMAA            00102    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (3, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D12955897072390675909021804580544            WAFA JELLAD              00103    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (4, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D12955897072390675909011704580544            WAFA JELLAD              00104    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (5, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D11600023070219492709041203953028            RIM KADHRAOUI            00105    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (6, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D11692226092390675909011805265807            HELA BOUJEMAA            00106    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (7, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D12955897072390675909041604580544            WAFA JELLAD              00107    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (8, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D12955897072390675909041704580544            WAFA JELLAD              00108    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (9, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D11613825000219492709021403831090            NARJES BOURARA           00109    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (10, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D11613825000219492709041203831090            NARJES BOURARA           00110    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (11, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D12955897072390675909011804580544            WAFA JELLAD              00111    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (12, 1, to_date('04-10-2018', 'dd-mm-yyyy'), '6D12955897072390675909021704580544            WAFA JELLAD              00112    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (1, 2, to_date('04-10-2018', 'dd-mm-yyyy'), '6D11600023070219492709021403953028            RIM KADHRAOUI            00201    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (2, 2, to_date('04-10-2018', 'dd-mm-yyyy'), '6D12955897072390675909031704580544            WAFA JELLAD              00202    58931004102018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (1, 1, to_date('13-09-2018', 'dd-mm-yyyy'), '6D11600023070219492709041203953028            RIM KADHRAOUI            00101    68868113092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (2, 1, to_date('13-09-2018', 'dd-mm-yyyy'), '6D11613825000219492709021403831090            NARJES BOURARA           00102    68868113092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (3, 1, to_date('13-09-2018', 'dd-mm-yyyy'), '6D11613825000219492709041203831090            NARJES BOURARA           00103    68868113092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (4, 1, to_date('13-09-2018', 'dd-mm-yyyy'), '6D11600023070219492709021403953028            RIM KADHRAOUI            00104    68868113092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (1, 1, to_date('28-09-2018', 'dd-mm-yyyy'), '6D11692226092390675909021805265807            HELA BOUJEMAA            00101    58931028092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (2, 1, to_date('28-09-2018', 'dd-mm-yyyy'), '6D11692226092390675909041705265807            HELA BOUJEMAA            00102    58931028092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (3, 1, to_date('28-09-2018', 'dd-mm-yyyy'), '6D11600023070219492709041203953028            RIM KADHRAOUI            00103    58931028092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (4, 1, to_date('28-09-2018', 'dd-mm-yyyy'), '6D11692226092390675909011805265807            HELA BOUJEMAA            00104    58931028092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (5, 1, to_date('28-09-2018', 'dd-mm-yyyy'), '6D11613825000219492709021403831090            NARJES BOURARA           00105    58931028092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (6, 1, to_date('28-09-2018', 'dd-mm-yyyy'), '6D11613825000219492709041203831090            NARJES BOURARA           00106    58931028092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (7, 1, to_date('28-09-2018', 'dd-mm-yyyy'), '6D11600023070219492709021403953028            RIM KADHRAOUI            00107    58931028092018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (1, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D11692226092390675909021805265807            HELA BOUJEMAA            00101    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (2, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D12955897072390675909031804580544            WAFA JELLAD              00102    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (3, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D11692226092390675909041705265807            HELA BOUJEMAA            00103    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (4, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D11692226092390675909031805265807            HELA BOUJEMAA            00104    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (5, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D12955897072390675909021804580544            WAFA JELLAD              00105    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (6, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D12955897072390675909011704580544            WAFA JELLAD              00106    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (7, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D11600023070219492709041203953028            RIM KADHRAOUI            00107    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (8, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D11692226092390675909011805265807            HELA BOUJEMAA            00108    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (9, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D12955897072390675909041604580544            WAFA JELLAD              00109    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (10, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D12955897072390675909041704580544            WAFA JELLAD              00110    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (11, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D11613825000219492709021403831090            NARJES BOURARA           00111    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (12, 1, to_date('08-11-2018', 'dd-mm-yyyy'), '6D11613825000219492709041203831090            NARJES BOURARA           00112    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (1, 2, to_date('08-11-2018', 'dd-mm-yyyy'), '6D12955897072390675909011804580544            WAFA JELLAD              00201    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (2, 2, to_date('08-11-2018', 'dd-mm-yyyy'), '6D12955897072390675909021704580544            WAFA JELLAD              00202    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (3, 2, to_date('08-11-2018', 'dd-mm-yyyy'), '6D11600023070219492709021403953028            RIM KADHRAOUI            00203    58931008112018');
insert into COPT.MSG_MAJ (bur_cod, code_app, date_cre, msg_maj)
values (4, 2, to_date('08-11-2018', 'dd-mm-yyyy'), '6D12955897072390675909031704580544            WAFA JELLAD              00204    58931008112018');
commit;
prompt 46 records loaded
set feedback on
set define on
prompt Done.
