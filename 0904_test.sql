drop table users;
drop table carinfo;

create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4),   --�ڵ��� ��ȣ
c_name varchar2(10),  -- �ڵ��� ����
 id varchar2(8));

insert into users values ('1111','kim','����');
insert into users values ('2222','lee','����');
insert into users values ('3333','park','����');
insert into users values ('4444','choi','����');

insert into carinfo values ('1234','����','1111');
insert into carinfo values ('3344','����','1111');
insert into carinfo values ('5566','����','3333');
insert into carinfo values ('6677','����','3333');
insert into carinfo values ('7788','����','4444');
insert into carinfo values ('8888','����','5555');

select * from users;
select * from carinfo;

1. ȸ���� �̸��� �ּҸ� ����Ͻÿ�.
select name, addr from users;
2. ȸ���� �̸��� ������ �ڵ��� ��ȣ�� ����Ͻÿ�.
select u.name, c.c_num
from users u, carinfo c
where u.id=c.id;
3. �ڵ��� ��ȣ�� 7788�� �������� �̸��� �ּҸ� ����Ͻÿ�.
select u.name, u.addr
from users u, carinfo c
where u.id=c.id and c.c_num=7788;
4. �ڵ����� �������� ���� ����� �̸��� �ּҸ� ����Ͻÿ�.
select u.name, u.addr
from users u
left outer join carinfo c
on u.id=c.id
where c.c_num is null;
5. ȸ���� ����� �ڵ��� ���� ����Ͻÿ�.
select id ȸ��, count(*) �ڵ�����
from carinfo
group by id
order by id;

6. 2�� �̻��� ������ ȸ���� �̸��� ������ �ڵ��� ���� ����Ͻÿ�.

7. �ڵ����� ��ϵǾ� �ִµ� �����ڰ� ���� �ڵ��� ��ȣ�� ����Ͻÿ�.
select c.c_num
from users u
right outer join carinfo c
on u.id=c.id
where u.id is null;