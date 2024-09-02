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
