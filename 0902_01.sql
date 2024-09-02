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
/* 1. 이름 뒤에 님을 붙여서 출력하시오. 모든 사람의 이름과 포인트를 출력 */
select point, concat(name,'님') 이름 from hm;


/* 2. 모든 사람의 이름과 포인트와 등록일을 출력.
      가입 순서에 따라 출력. 가장 나중에 가입한 사람이 제일 먼저 출력
      가입 날짜는 indate */

select name 이름, point 포인트, indate 등록일 from hm order by indate desc;

      
      
/* 3. 포인트가 50 이상인 사람의 이름과 정보를 출력.
      정보는 no,이름,포인트가 합쳐진 문자열이다. */
select name 이름, concat(no,concat(name,point)) 정보 from hm where point >= 50;


/* 4. 기준포인트는 60이다. 모든 회원이 기준포인트를 맞추기 위해서 부족한 포인트를
      출력하시오.. 출력은 이름 현재포인트 부족한포인트 */
select name 이름, point 현재포인트, 60-point 부족한포인트 from hm;      


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
/* count 함수는 함수 처리 후, 리턴값을 준다 */
select count(*) from hm where point < 50;
select point from hm where name='홍길동';
select * from hm where name='일지매';

/* 모든 회원을 출력하되 가입 순서로 출력 */
select * from hm order by indate;

/* 
    name을 이름으로 바꿈
    실제 바뀌는 것이 아닌, 출력될 때만 바뀌는 것. 원본 데이터는 안바뀐다.
*/
select no, name 이름 from hm;
select no, name from hm;

/* 모든 회원의 이름과 포인트를 출력. 포인트는 현재 포인트에서 10점 올려서 출력 */
select name, point+10 from hm;

/*
    모든 회원의 이름과 포인트를 출력. 출력은 이름 현재포인트 가산포인트
    이름은 학생의 이름, 현재 포인트는 저장된 포인트, 가산 포인트는 +10 포인트
*/
select name 이름, point 현재포인트, point+10 가산포인트 from hm;

/* 실제로 원본 데이터를 바꿀 때에는 update를 이용 */
select * from hm;
update hm set point=100, name='이원재';
delete from hm;
/* name 컬럼 값이 '홍길동'인 사람의 name 값을 '이원재'로 바꾸기 */
update hm set point=100, name='이원재' where name='홍길동';
/* 이원재라는 사람 지우기 */
delete from hm where name='이원재';

/* 함수(매개변수).. concat함수에 '이름'과 '님'의 string 두 개를 넘겨줌
   결과 리턴시에는 두 값을 합쳐서 리턴 */
/* 컬럼을 선택하는 조건으로 select절에 함수를 사용 */
/* 조건에 따라 원하는 함수를 사용 */
/* dual = 오라클 제공 임시 테이블, concat 함수를 테스트 하기 위해서
   select절 명령어 문법을 맞추기 위해 임시로 입력 */
select concat('이름','님') 이름 from dual;
select *
from hm
where point >20
order by point desc;
select sysdate from dual;

      