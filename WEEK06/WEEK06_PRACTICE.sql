SET SERVEROUTPUT ON;
SET AUTOCOMMIT OFF;
COMMIT;

BEGIN
insert into trainer
(T_ID, T_NAME, EMAIL, PHONE, W_HOURS, M_LEVEL)
values(50, 'tname5', 't5@email.com','4169647000', 30, 'B');
insert into trainer
(T_ID, T_NAME, EMAIL, PHONE, W_HOURS, M_LEVEL)
values(60, 'tname6', 't6@email.com','4169647666', 25, 'B');

commit;
insert into member
(MEM_ID, MEM_NAME, EMAIL, AGE, TRAINER_ID)
values(100, 'mname1', 'm1@email.com', 30,25);
insert into member
(MEM_ID, MEM_NAME, EMAIL, AGE, TRAINER_ID)
values(200, 'mname2', 'm2@email.com', 25,70);
commit;

EXCEPTION
    when others then
    rollback;
   DBMS_OUTPUT.PUT_LINE ('There is an Error!');
end;


select *
from trainer;

COMMIT;

ROLLBACK;
select *
from trainer;

delete from trainer
where t_id in(50,60);

delete from member;


select *
from member;

alter table member
add constraint member_id_pk
primary key (mem_id);

alter table member
add constraint member_trainerid_fk
foreign key(trainer_id)
references trainer (t_id);


--DELETE FROM TRAINER
--WHERE T_ID=50;

--update trainer
--set m_level = 'D', phone ='4168888888'
--where t_id=40;

-- Transaction starts
-- receive the amount
-- find the saving account
-- check the balance
-- deducte the amount from the balance
-- find the chequing account
-- add amount to the balance
-- transaction ends






















