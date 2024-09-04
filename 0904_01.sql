create table muser(
id int,
reg_num varchar2(8) not null,
name varchar2(10 char),
grade int,
salary int,
time int);

create sequence muser_no
increment by 1
start with 10
;

insert into muser values(muser_no.nextval,'870205-1','�̽���',1,10000,34);
insert into muser values(muser_no.nextval,'880405-1','������',2,20000,31);
insert into muser values(muser_no.nextval,'770715-2','���̼�',4,40000,32);
insert into muser values(muser_no.nextval,'010205-3','������',1,10000,30);
insert into muser values(muser_no.nextval,'810205-2','������',2,20000,34);
insert into muser values(muser_no.nextval,'820219-2','���¿�',3,30000,35);
insert into muser values(muser_no.nextval,'020205-3','�����',1,10000,30);
insert into muser values(muser_no.nextval,'970214-2','������',2,20000,31);
insert into muser values(muser_no.nextval,'040205-4','������',4,40000,31);
insert into muser values(muser_no.nextval,'770225-1','���翵',5,50000,30);
insert into muser values(muser_no.nextval,'770905-2','�̽ż�',4,40000,34);
insert into muser values(muser_no.nextval,'050208-3','�̹߲�',2,20000,30);
insert into muser values(muser_no.nextval,'051205-4','�̿���',1,10000,34);
insert into muser values(muser_no.nextval,'891215-1','���¾�',3,30000,30);
insert into muser values(muser_no.nextval,'670805-1','������',2,20000,34);
insert into muser values(muser_no.nextval,'840207-1','���̷�',1,10000,35);
insert into muser values(muser_no.nextval,'770405-1','��õ��',1,10000,31);

select * from muser;

-- !!!! grade�� 3�� ����� ��� ����ΰ���?
select count(*) -- ���ϴ� ���� �ο���.. �ο����� �÷����� �ذ� �Ұ�.
from muser
where grade=3;  -- grade 3�� ����� Ʃ���� ���� �����̶� �� �� ����

-- !!!! grade�� 1,2,4�� ������� salary�� ����� ���Ͻÿ�.
select avg(salary)  -- �÷����� �Լ��� ����ؾ� �Ѵ�.
from muser
where grade in (1,2,3);  -- in�����ڴ� or�� �ǹ̰� �ִ�.
-- where grade=1 or grade=2 or grade=4;
--group by  -- �׷��� ���� : �׷캰 ������ ���
--order by

-- !!!! salary�� 20000 �̸��� ����� �� ����Դϱ�?
select count(*)
from muser
where salary<20000;
--group by
--order by

-- !!!! 77�� �߿�  salary�� ���� ���� ����� �̸��� ���̿� salary�� ����Ͻÿ�.
select --�̸��� ���̿� salary
from muser
where --77����߿�
--group by
--order by
/* 77��� ���� �׽�Ʈ ���� */
select substr(reg_num,1,2) from muser; -- �߰� �ܰ�
-- �������� ����...
select --�̸��� ���̿� salary
from muser
where substr(reg_num,1,2)='77' 
/* 77��� ���� �׽�Ʈ �� */
-- 77����߿��� ���� ���� salary �̾� ������.
select min(salary)
from muser
where substr(reg_num,1,2)='77';
-- ���� ���� salary�� �˸� ���� ���� salary�� ��������
-- ���� ���� salary�� �޴� ����� Ʃ���� ������ �� �ִ�.
select *
from muser
where substr(reg_num,1,2)='77' and salary=10000;
-- 10000�� ����� �����ϸ� �ȵȴ�. ���������� ����
select name �̸�, reg_num ����, salary �޿�
from muser
where substr(reg_num,1,2)='77' and salary=(
    select min(salary)
    from muser
    where substr(reg_num,1,2)='77');
-- ���̸� ����Ѵ�.. �׷��� �� Ŀ���� �ֹι�ȣ�� ���
-- �÷����� �ذ� �����Ѱ�? ����? �Լ�? �������� > ���İ� �Լ��� �ʿ�
select 1900+substr(reg_num,1,2) from muser;
select * from muser;
-- �м� ����� 1900�� �����ϸ� 2000�� ���� ����ڴ� ���������Ͱ� ��
-- ���ǿ� ���� 1900 �Ǵ� 2000�� �÷��� ����� �Ѵ�.
-- �˻��� : ����Ŭ ���ǿ� ����     > decode
select substr(reg_num,8,1) from muser;
select substr(reg_num,8,1) a,
       decode(substr(reg_num,8,1),'1',1900,'2',1900,2000) b,
       decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)
       + substr(reg_num,1,2) c
from muser;
-- ���� ������ ������ ���ϴ�.
select name �̸�,
       (extract (year from sysdate))-
       (decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)
       + substr(reg_num,1,2)) ����,
       salary �޿�
from muser
where substr(reg_num,1,2)='77' and salary=(
    select min(salary)
    from muser
    where substr(reg_num,1,2)='77');
-- ���� �� �� �ִ� ����    
-- name�� ������, min(salary)�� �����Լ�(������)�̹Ƿ� ���� �� �� ����. ��������
select name, min(salary)
from muser
where substr(reg_num,1,2)='77';

-- !!!! ������ ��� �޿��� ���Ͻÿ�.
select avg(salary) -- ��ձ޿�
from muser
where substr(reg_num,8,1) in ('1','3');
      -- ����? �÷����� �ȵȴ�. �����̳� �Լ��� ����������
--group by
--order by

-- !!!! ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿��� ����Ͻÿ�
select name, salary
from muser
where; -- ��ձ޿����� ���� �޿� �޴� ����� Ʃ�� ����
      -- �÷� ��ü�� �ذ�? ����? �Լ�? ��������?
      -- ��� �޿��� ��������� ������ �ϼ� -> ��������
select name, salary
from muser
where salary >
    (select avg(salary)
    from muser);
--group by
--order by

-- !!!! ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿�, ��ü��ձ޿��� ����Ͻÿ�
select name,
       salary,
       (select avg(salary) -- ��Į�� ��������, ���å�� ����
        from muser)��ձ޿� -- ����? �Լ�? ��������!
from muser
where salary >
    (select avg(salary)
    from muser);
    -- ������ ������.. �ֳ��ϸ� ������ select���� Ʃ����
    -- �ϳ��� �ϼ��Ҷ����� ���������� �����ϱ� ������
    -- ������ ���������� ��� �����ϱ� �����̴�.

-- !!!! �׷캰 ��ձ޿��� ��ü ��պ��� ���� �׷��� ����Ͻÿ�.
-- �׷캰 ����� ���Ѵ�... �� �׷��߿� ��ü ��պ��� ���� �׷� ����
select grade, avg(salary)
from muser
--where
group by grade having avg(salary) > (
                                    select avg(salary)
                                    from muser);
--order by

-- !!!! �������� ������ ����Ͻÿ�.
-- (��� ���� �̸�, ����(������ ���Ǵ� ���� ����Ѵ�)
select name �̸�,
       decode(substr(reg_num,8,1),'1','��','3','��','��') ����
from muser;
--where
--group by
--order by
-- ����Ŭ���� ���ǿ� ���� ó���ϴ� ������ case when then else end
-- case when then else end�� ������ �м�
-- case
--      when ����1 then ����1�� ���� ��� ����
--      when ����2 then ����2�� ���� ��� ����
--      else ����1�� ����2 ��� �͵� ���� �ƴ� ��� ����
-- end
select name �̸�,
       case
            when substr(reg_num,8,1)in('1','3') then '��'
            else '��'
       end ����
from muser; -- ���� ������ ����

select distinct grade, salary from muser;
-- distinct�� �ߺ��� �÷��� �����ϰ� select������ �ѹ��� ����� ����
-- �ߺ� ���� ������ select���� ������ ��ü ���� �ߺ��̴�.
-- #3�� �������� ���ɺ�(time�÷�) �޿��� ��. over �Լ� �̿�
select distinct -- ���⼭�� ����, ���� �÷� ��θ� ������� �ߺ��� �� ����
       time ����,
       sum(salary) over(partition by time) ����
from muser;

-- #2�� ���� time�� 30-31, 32�̻����� ������ ��ƿ� ������ ��
select 
  (select trunc(sum(months_between(sysdate,substr(reg_num,1,6)))) 
   from muser where time in (30,31)) as �������,
  (select trunc(sum(months_between(sysdate,substr(reg_num,1,6)))) 
   from muser where time >= 32) as ���� 
from dual;
