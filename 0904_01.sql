create table muser(
id int,
reg_num varchar2(8) not null,
name varchar2(10 char),
grade int,
salary int,
time int);

create sequence muser_no
increment by 1
start with 10
;

insert into muser values(muser_no.nextval,'870205-1','이승진',1,10000,34);
insert into muser values(muser_no.nextval,'880405-1','박이진',2,20000,31);
insert into muser values(muser_no.nextval,'770715-2','최이수',4,40000,32);
insert into muser values(muser_no.nextval,'010205-3','류진아',1,10000,30);
insert into muser values(muser_no.nextval,'810205-2','오현식',2,20000,34);
insert into muser values(muser_no.nextval,'820219-2','정승우',3,30000,35);
insert into muser values(muser_no.nextval,'020205-3','이재수',1,10000,30);
insert into muser values(muser_no.nextval,'970214-2','박지영',2,20000,31);
insert into muser values(muser_no.nextval,'040205-4','정은아',4,40000,31);
insert into muser values(muser_no.nextval,'770225-1','정재영',5,50000,30);
insert into muser values(muser_no.nextval,'770905-2','이신수',4,40000,34);
insert into muser values(muser_no.nextval,'050208-3','이발끈',2,20000,30);
insert into muser values(muser_no.nextval,'051205-4','이욱이',1,10000,34);
insert into muser values(muser_no.nextval,'891215-1','지승아',3,30000,30);
insert into muser values(muser_no.nextval,'670805-1','현진수',2,20000,34);
insert into muser values(muser_no.nextval,'840207-1','최이런',1,10000,35);
insert into muser values(muser_no.nextval,'770405-1','이천안',1,10000,31);

select * from muser;

-- !!!! grade가 3인 사람은 모두 몇명인가요?
select count(*) -- 원하는 값은 인원수.. 인원수는 컬럼으로 해결 불가.
from muser
where grade=3;  -- grade 3인 사람은 튜플의 선정 조건이라 볼 수 있음

-- !!!! grade가 1,2,4인 사람들의 salary의 평균을 구하시오.
select avg(salary)  -- 컬럼값에 함수를 사용해야 한다.
from muser
where grade in (1,2,3);  -- in연산자는 or의 의미가 있다.
-- where grade=1 or grade=2 or grade=4;
--group by  -- 그룹의 정의 : 그룹별 집계일 경우
--order by

-- !!!! salary가 20000 미만인 사람은 총 몇명입니까?
select count(*)
from muser
where salary<20000;
--group by
--order by

-- !!!! 77년 중에  salary가 가장 적은 사람의 이름과 나이와 salary를 출력하시오.
select --이름과 나이와 salary
from muser
where --77년생중에
--group by
--order by
/* 77년생 쿼리 테스트 시작 */
select substr(reg_num,1,2) from muser; -- 중간 단계
-- 본쿼리에 적용...
select --이름과 나이와 salary
from muser
where substr(reg_num,1,2)='77' 
/* 77년생 쿼리 테스트 끝 */
-- 77년생중에서 가장 작은 salary 뽑아 내본다.
select min(salary)
from muser
where substr(reg_num,1,2)='77';
-- 가장 작은 salary를 알면 가장 작은 salary를 조건으로
-- 가장 작은 salary를 받는 사람의 튜플을 선정할 수 있다.
select *
from muser
where substr(reg_num,1,2)='77' and salary=10000;
-- 10000은 상수로 지정하면 안된다. 서브쿼리를 생각
select name 이름, reg_num 나이, salary 급여
from muser
where substr(reg_num,1,2)='77' and salary=(
    select min(salary)
    from muser
    where substr(reg_num,1,2)='77');
-- 나이를 출력한다.. 그런데 위 커리는 주민번호를 출력
-- 컬럼으로 해결 가능한가? 수식? 함수? 서브쿼리 > 수식과 함수가 필요
select 1900+substr(reg_num,1,2) from muser;
select * from muser;
-- 분석 상수로 1900을 보정하면 2000년 이후 출생자는 오류데이터가 됨
-- 조건에 따라 1900 또는 2000을 플러스 해줘야 한다.
-- 검색어 : 오라클 조건에 따라     > decode
select substr(reg_num,8,1) from muser;
select substr(reg_num,8,1) a,
       decode(substr(reg_num,8,1),'1',1900,'2',1900,2000) b,
       decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)
       + substr(reg_num,1,2) c
from muser;
-- 최종 쿼리에 대입해 봅니다.
select name 이름,
       (extract (year from sysdate))-
       (decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)
       + substr(reg_num,1,2)) 나이,
       salary 급여
from muser
where substr(reg_num,1,2)='77' and salary=(
    select min(salary)
    from muser
    where substr(reg_num,1,2)='77');
-- 오류 낼 수 있는 쿼리    
-- name은 다중행, min(salary)는 집계함수(단일행)이므로 같이 쓸 수 없다. 에러원인
select name, min(salary)
from muser
where substr(reg_num,1,2)='77';

-- !!!! 남자의 평균 급여를 구하시오.
select avg(salary) -- 평균급여
from muser
where substr(reg_num,8,1) in ('1','3');
      -- 남자? 컬럼으로 안된다. 수식이나 함수나 서브쿼리로
--group by
--order by

-- !!!! 전체 평균급여보다 높은 급여를 받는 사람의 이름과, 급여를 출력하시오
select name, salary
from muser
where; -- 평균급여보다 높은 급여 받는 사람의 튜플 선택
      -- 컬럼 자체로 해결? 수식? 함수? 서브쿼리?
      -- 평균 급여의 결과값으로 조건을 완성 -> 서브쿼리
select name, salary
from muser
where salary >
    (select avg(salary)
    from muser);
--group by
--order by

-- !!!! 전체 평균급여보다 높은 급여를 받는 사람의 이름과, 급여, 전체평균급여를 출력하시오



-- !!!! 여직원의 평균급여보다 높은 남자직원은 모두 몇명입니까
-- !!!! grade별 평균 급여를 출력하세요..
-- !!!! 그룹별 평균급여가 전체 평균보다 높은 그룹을 출력하시오.
13 직원들의 월급 명세서를 출력하시오. (출력 형태는 이름, 월급(grade*salary*time)
14 직원들의 성별을 출력하시오. (출력 형태 이름, 성별(성별은 남또는 여로 출력한다)
15 time은 근무시간이 근무시간이 31이상인 사람의 이름을 출력하시오.
16 짝수년도에 태어난 사람들의 이름을 모두 출력하싱.
17 직원들의 생년월일을 출력하시오. (출력 형태는 이름과 생년월일(97년1월2일))
18 여직원들의 육아를 지원하기 위한 정책으로 time을 2시간가산하기로 했다. 이를 처리 하시오.
19 나이별 인원수는 몇명입니까
20 2학년그룹과 4학년 그룹은 모두 몇명입니까