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
      
      