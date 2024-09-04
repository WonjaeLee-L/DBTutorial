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

1 grade가 3인 사람은 모두 몇명인가요?
select count(*) from muser where grade=3;
2 grade가 1,2,4인 사람들의 salary의 평균을 구하시오.
select avg(salary), grade from muser 
group by grade having grade in(1,2,4);
3 salary가 20000 미만인 사람은 총 몇명입니까?
select count(*) from muser where salary<20000;
4 salary가 30000 이상인 사람의 salary 평균을 구하시오.
select avg(salary) from muser where salary>30000;
5 77년생 중에  salary가 가장 적은 사람의 이름과 나이와 salary를 출력하시오.
select name,
to_number(to_char(sysdate,'yyyy'))-(1900+to_number(substr(reg_num,1,2))),
salary
from muser
where substr(reg_num,1,2)=77 and salary=(select min(salary) from muser);
6 모든 사람의 이름과, 생일(월과 일 예를들어 0205)를 출력하시오.
select name, substr(reg_num,3,4) 생일 from muser;
7 남자의 평균 급여를 구하시오.
select avg(salary) from muser
where substr(reg_num,8,1)=1 or substr(reg_num,8,1)=3;
8 전체 평균급여보다 높은 급여를 받는 사람의 이름과, 급여를 출력하시오
select name, salary from muser
where salary > (select avg(salary) from muser);
9 전체 평균급여보다 높은 급여를 받는 사람의 이름과, 급여, 평균급여를 출력하시오
select name, salary, (select avg(salary) from muser) 평균급여 from muser
where salary > (select avg(salary) from muser);
10 여직원의 평균급여보다 높은 남자직원은 모두 몇명입니까
select count(*) from muser
where substr(reg_num,8,1)=1 or substr(reg_num,8,1)=3
and salary>(select avg(salary) 
from muser where substr(reg_num,8,1)=2 or substr(reg_num,8,1)=4);
11 grade별 평균 급여를 출력하세요..
select avg(grade) 
from muser
group by grade;
12 그룹별 평균급여가 전체 평균보다 높은 그룹을 출력하시오.
select grade, avg(salary)
from muser
group by grade having avg(salary)>(select avg(salary) from muser);
13 직원들의 월급 명세서를 출력하시오. (출력 형태는 이름, 월급(grade*salary*time)
select name, grade*salary*time 월급
from muser;
14 직원들의 성별을 출력하시오. (출력 형태 이름, 성별(성별은 남또는 여로 출력한다)
select name, decode(substr(reg_num,8,1),1,'남',3,'남',2,'여',4,'여')
from muser;
15 time은 근무시간이 근무시간이 31이상인 사람의 이름을 출력하시오.
select name
from muser
where time>31;
16 짝수년도에 태어난 사람들의 이름을 모두 출력하싱.
select name from muser where substr(reg_num,2,1)=0 or
substr(reg_num,2,1)=2 or substr(reg_num,2,1)=4 or substr(reg_num,2,1)=6 or
substr(reg_num,2,1)=8;
17 직원들의 생년월일을 출력하시오. (출력 형태는 이름과 생년월일(97년1월2일))
select name, to_char(to_date(substr(reg_num,1,6)),'yy"년"mm"월"dd"일"') 생년월일
from muser;
18 여직원들의 육아를 지원하기 위한 정책으로 time을 2시간가산하기로 했다. 이를 처리 하시오.
select name, time+2 시간 from muser
where substr(reg_num,8,1)=2 or substr(reg_num,8,1)=4;
19 나이별 인원수는 몇명입니까
select substr(reg_num,1,2) 년생, count(*) 인원수 from muser
group by substr(reg_num,1,2);
20 2학년그룹과 4학년 그룹은 모두 몇명입니까
select grade 학년, count(*) 인원수 from muser
group by grade having grade=2 or grade=4;

추가문제

#1) 모든 사람이 태어난 후 오늘까지 몇 달이 지났는지 출력하시오
--(출력형태: 이름, 주민번호, 지금까지살아온월수)
select name 이름, reg_num 주민번호,
trunc(months_between(sysdate, to_date(substr(reg_num,1,6)))) 월수
from muser;
#2) time을 나이로 봄. 30~31세의 살아온 월수의 합, 32세 이상의 살아온 월수의 합 구하기
select
distinct(select sum(time*12)
from muser
where time<32),
(select sum(time*12)
from muser
where time>31)
from muser;
#3) 연령별 급여의 합, over()함수 이용
select distinct(time) 연령, sum(salary)over(partition by time) 합
from muser
order by time;
#4) 연령별 인원수, over()함수 이용
select distinct(time) 연령,
count(*) over(partition by time) 인원수
from muser
order by time;
#5) 등급별 급여의 최고급여, over()함수 이용
select distinct(grade),
max(salary)over(partition by grade) 최고급여
from muser
order by grade;
#6) 구글검색하여 오라클 함수 정리
1. 집계 함수
    max() : 최대값
    min() : 최소값
    avg() : 평균값
    sum() : 합계
    mod(a,b) : a를 b로 나눈 나머지
    count(*) : 총 레코드 세는 함수, null 포함
    count(컬럼명) : 컬럼명 기준으로 총 레코드 수 세는 함수, null 제외
    
2. 문자열 함수
    lower('HH') : hh, 해당 컬럼의 값을 소문자로 변환하는 함수
    upper('hh') : HH, 해당 컬럼의 값을 대문자로 변환하는 함수
    inicap('go go go') : Go Go Go, 첫글자, 공백 이후 첫글자를 대문자로 변환
    concat(a,b) : ab, 두 개의 문자열을 연결
    substr('HelloWorld',1,5) : Hello, 문자열의 1번째자리부터 5번째자리까지 추출
    length('oracle') : 6, 문자열의 길이
    instr('HelloWorld','W') : 6, 문자열에서 특정 문자의 위치를 세는 함수.
                                 없다면 0 반환
    lpad('SQLPLUS',10,'*') : ***SQLPLUS, 해당 길이에 부족한 부분을 왼쪽부터 채움
    rpad('SQLPLUS',10,'*') : SQLPLUS***, 해당 길이에 부족한 부분을 오른쪽부터 채움
    trim('SQ LP L US') : SQLPLUS, 공백 제거
    ltrim('*SQLPLUS','*') : SQLPLUS, 좌측부터 문자열에서 해당 문자를 제거
    rtrim('SQLPLUS*','*') : SQLPLUS, 우측부터 문자열에서 해당 문자를 제거
    replace('SEVLTL','L','EN') : SEVENTEN, 해당 문자를 다른 문자로 바꾸어줌
    nvl(expr1,expr2) : expr1이 null이면 expr2 값으로 반환하는 함수
    nvl2(expr1,expr2,expr3) : expr1과 null1을 비교해 null이 아니면 expr2,
                              null이면 expr3을 반환하는 함수
    nullif(expr1,expr2) : expr1과 expr2를 비교하여 같으면 null, 다르면 expr1 반환
    coalesce(expr1,expr2,...exprn) : 목록에서 첫번째로 null아닌 expr을 반환
    || : 결합연산자 ex) select uname || '의 평균은 ' || aver || '입니다' 
    
3. 숫자 함수
    abs(-7) : 7, 절대값을 계산하는 함수
    mod(1500, 200) : 100, 1500 / 200 의 나머지를 반환하는 함수
    ceil(1.123) ; 2 :       소수점 첫째자리에서 해당 값을 올림 처리한 정수를 반환하고
    ceil(-1.623) ; -1 :     해당 값보다는 크지만 가장 근접하는 최소값을 구하는 함수
    
    floor(1.123)  :         소수점 첫째자리에서 해당 값을 내림 처리한 정수를 반환하고 
    floor(-1.123) :         해당 값보다는 작지만 가장 근접하는 최대값을 구하는 함수
    round(n,m) : 해당 숫자 n에서 m자리까지 반올림하는 함수
    trunc(n.m) : 해당 숫자 n에서 m자리까지 버림하는 함수
    to_number : 문자열을 숫자형으로 바꿔준다.
                      
4. 날짜 함수
    sysdate : 현재 날짜, 시간 ex) select sysdate from dual;
    extract(year from sysdate) : sysdate에서 년월일 추출(year,month,day)
    months_between(sysdate, to_date('2014-12-11')) : 첫번째 날짜에서
                                        두번째 날짜 사이 개월 수를 반환하는 함수
    to_date() : 문자열을 날짜형으로 변환
    add_months(sysdate, 5) : 해당 날짜에서 개월 수를 더한 날짜를 반환
    next_day(sysdate, '금요일') : 해당 날짜에서 최초로 도래하는 해당 요일의 날짜를 반환
    last_day(sysdate) : 해당 날짜가 포함되어 있는 달의 마지막 날짜를 반환
5. 형변환 함수
    to_char(원래 날짜,'원하는 모양') - 숫자와 날짜를 문자로 변환해준다
    to_number('1')
    to_date('문자','날짜포맷')
    
6. if문 역할 함수
    decode : decode(컬럼,조건1,결과1,조건2,결과2)
    case(case when then else end) :
        case
              when 조건1 then 조건1이 참일 경우 실행
              when 조건2 then 조건2가 참일 경우 실행
              else 조건1과 조건2 어느 것도 참이 아닌 경우 실행
        end