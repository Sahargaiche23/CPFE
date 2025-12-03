prompt PL/SQL Developer import file
prompt Created on mardi 2 décembre 2025 by 66324
set feedback off
set define off
prompt Dropping COPT.ENGAGEMNT...
drop table COPT.ENGAGEMNT cascade constraints;
prompt Creating COPT.ENGAGEMNT...
create table COPT.ENGAGEMNT
(
  eng_num   NUMBER(6) not null,
  emp_mat   NUMBER(8) not null,
  emp_cle   NUMBER(2) not null,
  dco_dtdeb DATE not null,
  eng_sit   NUMBER(1) default 1 not null,
  flg_valid NUMBER default 0 not null,
  salaire   NUMBER(15,3) not null
)
nologging;
comment on column COPT.ENGAGEMNT.eng_sit
  is 'si 2 : cloture si 1 : encours';
alter table COPT.ENGAGEMNT
  add constraint PK_ENGAGEMNT primary key (ENG_NUM, EMP_MAT, EMP_CLE, DCO_DTDEB);
alter table COPT.ENGAGEMNT
  add constraint FK_DOSCOP_ENGAGEMNT foreign key (EMP_MAT, EMP_CLE, DCO_DTDEB)
  references COPT.DOSSIER_COP (EMP_MAT, EMP_CLE, DCO_DTDEB);

prompt Loading COPT.ENGAGEMNT...
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500021, 83, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 5901.484);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500290, 61, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4724.43);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500081, 46, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4501.905);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500276, 47, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 15849.275);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500288, 59, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 9908.001);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500031, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4687.53);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500262, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 6615.242);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500007, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 22227.001);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500008, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 1253.077);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500010, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2410.345);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500018, 80, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 944.992);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500027, 89, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 872.11);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500034, 96, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3471.813);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500036, 1, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 1160.531);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500037, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 9199.008);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500039, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 1588.677);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500046, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 9026.647);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500055, 20, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 1184.9);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500059, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2511.536);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500063, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3223.626);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500075, 40, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2605.998);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500095, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2521.581);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500109, 74, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3051.889);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500116, 81, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2946.693);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500120, 85, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2307.858);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500125, 90, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 9475.964);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500128, 93, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3121.969);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500132, 0, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 7322.778);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500134, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4605.021);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500137, 5, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4446.825);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500143, 11, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 5354.749);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500145, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3481.143);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 6810.681);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500149, 17, to_date('01-07-2007', 'dd-mm-yyyy'), 2, 0, 5860.618);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500150, 18, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2998.073);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500152, 20, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4148.274);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500153, 21, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3951.917);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500155, 23, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 689.606);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500156, 24, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 1239.228);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500157, 25, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 4930.808);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500159, 27, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3189.66);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500160, 28, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 1035.899);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500161, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 565.943);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500162, 30, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3834.432);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500164, 32, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2829.975);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500165, 33, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2846.925);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500166, 34, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2864.964);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500167, 35, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 5547.84);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500169, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3375);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500170, 38, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 1116.294);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500171, 39, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 3983.184);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500172, 40, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 1487.134);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500173, 41, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 1332.807);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500174, 42, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 958.198);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500175, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 1979.181);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500176, 44, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2825.82);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500177, 45, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 902.902);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500180, 48, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 1287.514);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500181, 49, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2103.978);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500183, 51, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 1560.303);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500185, 53, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3148.953);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500185, 53, to_date('01-01-2008', 'dd-mm-yyyy'), 1, 1, 3148.953);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500186, 54, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 5699.452);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500188, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3081.75);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500189, 57, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 6168.747);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500196, 64, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 2479.206);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500201, 69, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 6512.928);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500202, 70, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4487.55);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500202, 70, to_date('01-01-2008', 'dd-mm-yyyy'), 1, 1, 4487.55);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500203, 71, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4474.992);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500204, 72, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 3719.97);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500210, 78, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 969.332);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500215, 83, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 1036.263);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500231, 2, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 6326.982);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500232, 3, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 5371.449);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500233, 4, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4267.653);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500236, 7, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 7163.904);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500241, 12, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 0, 2681.01);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500242, 13, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 5094.821);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500258, 29, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4392.742);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500091, 56, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4149.618);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500272, 43, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 13867.9);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (2, 500169, 37, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 8897.5);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500289, 60, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 10475.949);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500087, 52, to_date('01-01-2009', 'dd-mm-yyyy'), 1, 0, 7827.245);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500082, 47, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4593.255);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (1, 500101, 66, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 4952.799);
insert into COPT.ENGAGEMNT (eng_num, emp_mat, emp_cle, dco_dtdeb, eng_sit, flg_valid, salaire)
values (2, 500148, 16, to_date('01-07-2007', 'dd-mm-yyyy'), 1, 1, 9478.212);
commit;
prompt 88 records loaded
set feedback on
set define on
prompt Done.
