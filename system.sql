create table hm(
no number(3) primary key,
name varchar2(10) not null,
point number(5) default 0,
addr varchar2(20),
indate timestamp default sysdate);

insert into hm values (1,'홍길동',45,'서울시',default);
insert into hm values (2,'일지매',50,'수원',default);
insert into hm values (3,'이지매',43,'서울',default);

select * from hm;
select no,name from hm;
select count(*) from hm;

select name,point from hm;
select name,point from hm where point < 50;
select count(*) from hm where point < 50;
select point from hm where name='홍길동';
select * from hm where name='일지매';