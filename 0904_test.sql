drop table users;
drop table carinfo;

create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4),   --자동차 번호
c_name varchar2(10),  -- 자동차 종류
 id varchar2(8));

insert into users values ('1111','kim','수원');
insert into users values ('2222','lee','서울');
insert into users values ('3333','park','대전');
insert into users values ('4444','choi','대전');

insert into carinfo values ('1234','중형','1111');
insert into carinfo values ('3344','소형','1111');
insert into carinfo values ('5566','중형','3333');
insert into carinfo values ('6677','중형','3333');
insert into carinfo values ('7788','중형','4444');
insert into carinfo values ('8888','중형','5555');

select * from users;
select * from carinfo;

1. 회원의 이름과 주소를 출력하시오.
select name, addr from users;
2. 회원의 이름과 소유한 자동차 번호를 출력하시오.
select u.name, c.c_num
from users u, carinfo c
where u.id=c.id;
3. 자동차 번호가 7788인 소유자의 이름과 주소를 출력하시오.
select u.name, u.addr
from users u, carinfo c
where u.id=c.id and c.c_num=7788;
4. 자동차를 소유하지 않은 사람의 이름과 주소를 출력하시오.
select u.name, u.addr
from users u
left outer join carinfo c
on u.id=c.id
where c.c_num is null;
5. 회원별 등록한 자동차 수를 출력하시오.
select id 회원, count(*) 자동차수
from carinfo
group by id
order by id;

6. 2대 이상을 소유한 회원의 이름과 소유한 자동차 수를 출력하시오.

7. 자동차는 등록되어 있는데 소유자가 없는 자동차 번호를 출력하시오.
select c.c_num
from users u
right outer join carinfo c
on u.id=c.id
where u.id is null;