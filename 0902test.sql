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
      
      