prompt PL/SQL Developer import file
prompt Created on mardi 2 dÈcembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.CHIFFRE_AR...
drop table COPT.CHIFFRE_AR cascade constraints;
prompt Creating COPT.CHIFFRE_AR...
create table COPT.CHIFFRE_AR
(
  code NUMBER(3),
  lib  CHAR(15)
)
nologging;

prompt Loading COPT.CHIFFRE_AR...
insert into COPT.CHIFFRE_AR (code, lib)
values (0, '               ');
insert into COPT.CHIFFRE_AR (code, lib)
values (1, 'Ê«Õœ           ');
insert into COPT.CHIFFRE_AR (code, lib)
values (2, '≈À‰«‰          ');
insert into COPT.CHIFFRE_AR (code, lib)
values (3, 'À·«À…          ');
insert into COPT.CHIFFRE_AR (code, lib)
values (4, '√—»⁄…          ');
insert into COPT.CHIFFRE_AR (code, lib)
values (5, 'Œ„”…           ');
insert into COPT.CHIFFRE_AR (code, lib)
values (6, '” …            ');
insert into COPT.CHIFFRE_AR (code, lib)
values (7, '”»⁄…           ');
insert into COPT.CHIFFRE_AR (code, lib)
values (8, 'À„«‰Ì…         ');
insert into COPT.CHIFFRE_AR (code, lib)
values (9, ' ”⁄…           ');
insert into COPT.CHIFFRE_AR (code, lib)
values (10, '⁄‘—…           ');
insert into COPT.CHIFFRE_AR (code, lib)
values (11, '≈ÕœÏ ⁄‘—       ');
insert into COPT.CHIFFRE_AR (code, lib)
values (12, '≈À‰Ï ⁄‘—       ');
insert into COPT.CHIFFRE_AR (code, lib)
values (13, 'À·«À… ⁄‘—      ');
insert into COPT.CHIFFRE_AR (code, lib)
values (14, '√—»⁄… ⁄‘—      ');
insert into COPT.CHIFFRE_AR (code, lib)
values (15, 'Œ„”… ⁄‘—       ');
insert into COPT.CHIFFRE_AR (code, lib)
values (16, '” … ⁄‘—        ');
insert into COPT.CHIFFRE_AR (code, lib)
values (17, '”»⁄… ⁄‘—       ');
insert into COPT.CHIFFRE_AR (code, lib)
values (18, 'À„«‰Ì… ⁄‘—     ');
insert into COPT.CHIFFRE_AR (code, lib)
values (19, ' ”⁄… ⁄‘—       ');
insert into COPT.CHIFFRE_AR (code, lib)
values (20, '⁄‘—Ê‰          ');
insert into COPT.CHIFFRE_AR (code, lib)
values (30, 'À·«ÀÊ‰         ');
insert into COPT.CHIFFRE_AR (code, lib)
values (40, '√—»⁄Ê‰         ');
insert into COPT.CHIFFRE_AR (code, lib)
values (50, 'Œ„”Ê‰          ');
insert into COPT.CHIFFRE_AR (code, lib)
values (60, '” Ê‰           ');
insert into COPT.CHIFFRE_AR (code, lib)
values (70, '”»⁄Ê‰          ');
insert into COPT.CHIFFRE_AR (code, lib)
values (80, 'À„«‰Ê‰         ');
insert into COPT.CHIFFRE_AR (code, lib)
values (90, ' ”⁄Ê‰          ');
commit;
prompt 28 records loaded
set feedback on
set define on
prompt Done.
