create table users(
no int primary key,
name varchar2(10),
addr varchar2(10),
point number,
grade varchar2(1),
jumin varchar2(8));

insert into users values (1,'kimsu','suwon',99.12,1,'820405-1');
insert into users values (2,'leesu','suwon city',89.00,2,'970805-2');
insert into users values (3,'choihee','seoul',88.21,1,'910204-2');
insert into users values (4,'leesil','suwon',77.62,4,'850405-1');
insert into users values (5,'james','seoul',60.22,1,'871105-1');
insert into users values (6,'parksuji','suwon',90.12,3,'880405-2');
insert into users values (7,'kimrae','yougin',89.96,3,'820105-1');
insert into users values (8,'sangJin','youngin',99.31,3,'990420-2');
insert into users values (9,'Leechan','incheon',79.12,2,'970605-2');
insert into users values (10,'kimmi','incheon',79.92,1,'810505-1');
insert into users values (11,'ryusu','seoul',85.32,4,'861205-2');
insert into users values (12,'Gosu',null,82.13,4,'810715-1');

select * from users;

select grade, count(*) �ο���
from users
group by grade;

����1, �׷캰 �ο����� ����ϵ� �г��� ������������ ����
select grade, count(*) �ο���
from users
group by grade order by grade asc;

����2, �׷캰 �ְ����� �������� ����Ͻÿ�.
select grade, max(point), min(point)
from users
group by grade;

����3, �׷캰 �ְ����� ȹ���� ����� �̸���?
select grade, max(point), name 
from users
group by grade;
-- ������ ������ name�� �׷�ȭ ���� ����

Ȯ�ι��� 1.
3�г�� 4�г� �׷��� �ο����� ���� ����Ͻÿ�.
select grade, count(*) �ο��� from users
where grade=3 or grade=4
group by grade;

Ȯ�ι��� 2.
1�г�� 2�г��� �ְ����� �������� ���� ���̸� ����Ͻÿ�.
select grade, max(point)-min(point) �������� from users
where grade=1 or grade=2
group by grade;

Ȯ�ι��� 3.
�ֹι�ȣ 2�ڸ��� �¾ �⵵�̴�. ���� �⵵�� �¾ ����� ī�����Ͻÿ�
�̶�, �¾ �⵵�� �ο����� ����Ѵ�.
select substr(jumin,1,2) �¾�⵵, count(*) �ο��� from users
group by substr(jumin,1,2);

��������
�׷��� ���� �� �׷캰 ������ ������ �� �ִ�.
���� ���, �׷��� �ο��� 3�� �̻��� �׷��� �ο����� ����Ͻÿ�.
�� ���û����� �׷캰�� �ο��� ī�����ϰ�, �׷��߿� �ο����� 3�� �̻��� �׷츸
�����ϴ� �ǹ��̴�. �׷쿡 ������ �����ϴ� ����� ã�ƺ�����.

having�� where�� ���� ����...
�׷캰�� ����� ��� �� ���ϴ� ����� ���͸� �� ���� having���� �̿��Ѵ�.
having���� group by���� �ܵ����� ��� ���Ѵ�.

���� ������ ���������� �ϼ��ϼ���
�׷��� �ο��� 3�� �̻��� �׷��� �ο����� ����Ͻÿ�.
select grade, count(*)
from users
group by grade
having count(*)>=3;

��ü ��պ��� ����� ū �׷�(��������-select�ȿ� select)
select grade, avg(point)
from users
group by grade having avg(point)>=
(select avg(point) from users); --���� ����
--���������� ������� ��ü�����. �� ��������� �׷��� ������ �ϼ�
--avg(point)>=�������������(��ü���)
���������� ���� ����ǰ� �� ������ ����
���������� ������ �ȿ� �Ұ�ȣ�� �����ϴ� select��
���������� ������� ��Ŀ���� Ȱ���Ѵ�.
���������� �������� �������� Ȱ���� ���� - where, having
�������� ���̺�� Ȱ�밡�� - from
�������� ���ϴ� �÷����� Ȱ�밡�� - select

����
select���� ���� ������ Ȱ���ϸ� > ��Į�� ��������(�ӵ� ������ �� ����, �����ؼ� ���)
from���� ���� ������ Ȱ���ϸ� > �ζ��κ� ��������

--ex)
--select * from users; �� ���� ���� �ƴϾ ���� ��� ��� ����
--from������ ����� �� �ִ�. ���̺� �̹Ƿ�

�ζ��κ� ��������
select m.name, m.addr
from (select * from users) m; -- (�ӽ÷� ���� ���̺���) ��Ī�� m���� ����
                                -- ���� users ���̺��� ���纻�̶�� �����ϸ� ��.
                                -- m�� �� ������ �ȿ����� ��� ������
select m.name, m.addr
from (select * from users) m
where m.grade=3;

select * from users;
���� ���� ������ ȹ���� ����� �̸��� ������?
select name, point
from users
where point = (select max(point) from users);

