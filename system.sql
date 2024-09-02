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
select count(*) from hm where point < 50;
select point from hm where name='ȫ�浿';
select * from hm where name='������';