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

select grade, count(*) 인원수
from users
group by grade;

응용1, 그룹별 인원수를 출력하되 학년을 오름차순으로 정렬
select grade, count(*) 인원수
from users
group by grade order by grade asc;

응용2, 그룹별 최고점과 최저점을 출력하시오.
select grade, max(point), min(point)
from users
group by grade;

응용3, 그룹별 최고점을 획득한 사람의 이름은?
select grade, max(point), name 
from users
group by grade;
-- 에러남 이유는 name은 그룹화 되지 않음

확인문제 1.
3학년과 4학년 그룹의 인원수를 각각 출력하시오.
select grade, count(*) 인원수 from users
where grade=3 or grade=4
group by grade;

확인문제 2.
1학년과 2학년의 최고점과 최저점의 점수 차이를 출력하시오.
select grade, max(point)-min(point) 점수차이 from users
where grade=1 or grade=2
group by grade;

확인문제 3.
주민번호 2자리는 태어난 년도이다. 같은 년도에 태어난 사람을 카운팅하시오
이때, 태어난 년도와 인원수로 출력한다.
select substr(jumin,1,2) 태어난년도, count(*) 인원수 from users
group by substr(jumin,1,2);

연구과제
그룹을 만들 때 그룹별 조건을 지정할 수 있다.
예를 들어, 그룹의 인원이 3명 이상인 그룹의 인원수를 출력하시오.
이 지시사항은 그룹별로 인원을 카운팅하고, 그룹중에 인원수가 3명 이상인 그룹만
선택하는 의미이다. 그룹에 조건을 지정하는 방법을 찾아보세요.

having과 where의 차이 구분...
그룹별로 집계된 결과 중 원하는 결과만 필터링 할 때에 having절을 이용한다.
having절은 group by없이 단독으로 사용 못한다.

다음 문제를 쿼리문으로 완성하세요
그룹의 인원이 3명 이상인 그룹의 인원수를 출력하시오.
select grade, count(*)
from users
group by grade
having count(*)>=3;

전체 평균보다 평균이 큰 그룹(서브쿼리-select안에 select)
select grade, avg(point)
from users
group by grade having avg(point)>=
(select avg(point) from users); --서브 쿼리
--서브쿼리의 결과값이 전체평균임. 그 결과값으로 그룹의 조건을 완성
--avg(point)>=서브쿼리결과값(전체평균)
서브쿼리가 먼저 실행되고 본 쿼리가 실행
서브쿼리는 본쿼리 안에 소괄호로 시작하는 select문
서브쿼리의 결과값을 본커리에 활용한다.
서브쿼리는 본쿼리의 조건으로 활용이 가능 - where, having
본쿼리의 테이블로 활용가능 - from
본쿼리의 원하는 컬럼에서 활용가능 - select

정리
select에서 서브 쿼리를 활용하면 > 스칼라 서브쿼리(속도 느려질 수 있음, 조심해서 사용)
from에서 서브 쿼리를 활용하면 > 인라인뷰 서브쿼리

--ex)
--select * from users; 는 단일 값이 아니어서 위의 경우 사용 못함
--from절에서 사용할 수 있다. 테이블 이므로

인라인뷰 서브쿼리
select m.name, m.addr
from (select * from users) m; -- (임시로 만든 테이블의) 별칭을 m으로 지정
                                -- 실제 users 테이블의 복사본이라고 생각하면 됨.
                                -- m은 이 쿼리문 안에서만 사용 가능함
select m.name, m.addr
from (select * from users) m
where m.grade=3;

select * from users;
가장 높은 점수를 획득한 사람의 이름과 점수는?
select name, point
from users
where point = (select max(point) from users);

