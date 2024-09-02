create table hm(
no number(3) primary key,
name varchar2(10) not null,
point number(5) default 0,
addr varchar2(20),
indate timestamp default sysdate);

insert into hm values (1,'ȫ�浿',45,'�����',default);
insert into hm values (2,'������',50,'����',default);
insert into hm values (3,'������',43,'����',default);

select * from hm;
/* 1. �̸� �ڿ� ���� �ٿ��� ����Ͻÿ�. ��� ����� �̸��� ����Ʈ�� ��� */
select point, concat(name,'��') �̸� from hm;


/* 2. ��� ����� �̸��� ����Ʈ�� ������� ���.
      ���� ������ ���� ���. ���� ���߿� ������ ����� ���� ���� ���
      ���� ��¥�� indate */

select name �̸�, point ����Ʈ, indate ����� from hm order by indate desc;

      
      
/* 3. ����Ʈ�� 50 �̻��� ����� �̸��� ������ ���.
      ������ no,�̸�,����Ʈ�� ������ ���ڿ��̴�. */
select name �̸�, concat(no,concat(name,point)) ���� from hm where point >= 50;


/* 4. ��������Ʈ�� 60�̴�. ��� ȸ���� ��������Ʈ�� ���߱� ���ؼ� ������ ����Ʈ��
      ����Ͻÿ�.. ����� �̸� ��������Ʈ ����������Ʈ */
select name �̸�, point ��������Ʈ, 60-point ����������Ʈ from hm;      


create table hm(
no number(3) primary key,
name varchar2(10) not null,
point number(5) default 0,
addr varchar2(20),
indate timestamp default sysdate);

insert into hm values (1,'ȫ�浿',45,'�����',default);
insert into hm values (2,'������',50,'����',default);
insert into hm values (3,'������',43,'����',default);

select * from hm;
select no,name from hm;
select count(*) from hm;

select name,point from hm;
select name,point from hm where point < 50;
/* count �Լ��� �Լ� ó�� ��, ���ϰ��� �ش� */
select count(*) from hm where point < 50;
select point from hm where name='ȫ�浿';
select * from hm where name='������';

/* ��� ȸ���� ����ϵ� ���� ������ ��� */
select * from hm order by indate;

/* 
    name�� �̸����� �ٲ�
    ���� �ٲ�� ���� �ƴ�, ��µ� ���� �ٲ�� ��. ���� �����ʹ� �ȹٲ��.
*/
select no, name �̸� from hm;
select no, name from hm;

/* ��� ȸ���� �̸��� ����Ʈ�� ���. ����Ʈ�� ���� ����Ʈ���� 10�� �÷��� ��� */
select name, point+10 from hm;

/*
    ��� ȸ���� �̸��� ����Ʈ�� ���. ����� �̸� ��������Ʈ ��������Ʈ
    �̸��� �л��� �̸�, ���� ����Ʈ�� ����� ����Ʈ, ���� ����Ʈ�� +10 ����Ʈ
*/
select name �̸�, point ��������Ʈ, point+10 ��������Ʈ from hm;

/* ������ ���� �����͸� �ٲ� ������ update�� �̿� */
select * from hm;
update hm set point=100, name='�̿���';
delete from hm;
/* name �÷� ���� 'ȫ�浿'�� ����� name ���� '�̿���'�� �ٲٱ� */
update hm set point=100, name='�̿���' where name='ȫ�浿';
/* �̿����� ��� ����� */
delete from hm where name='�̿���';

/* �Լ�(�Ű�����).. concat�Լ��� '�̸�'�� '��'�� string �� ���� �Ѱ���
   ��� ���Ͻÿ��� �� ���� ���ļ� ���� */
/* �÷��� �����ϴ� �������� select���� �Լ��� ��� */
/* ���ǿ� ���� ���ϴ� �Լ��� ��� */
/* dual = ����Ŭ ���� �ӽ� ���̺�, concat �Լ��� �׽�Ʈ �ϱ� ���ؼ�
   select�� ��ɾ� ������ ���߱� ���� �ӽ÷� �Է� */
select concat('�̸�','��') �̸� from dual;
select *
from hm
where point >20
order by point desc;
select sysdate from dual;

      