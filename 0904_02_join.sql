create table stu1(
no number, name varchar2(5 char), tel varchar2(13));

create table pp(
no number, e_name varchar2(4), e_point number(3));

insert into stu1 values (1,'hong','1111');
insert into stu1 values (2,'kim','2222');
insert into stu1 values (3,'lee','3333');
insert into pp values(1,'java',70);
insert into pp values(1,'html',90);
insert into pp values(3,'java',80);
commit;
select * from stu1;
select * from pp;

-- join : 한 개 이상의 테이블을 논리적으로 합치는 것
-- 종류 : full join : 두 개의 테이블을 모두 합치는 것
--          결과는 n*m의 수만큼 조인이 되어 튜플이 만들어진다.
--       inner join : 조건을 제시한다. 조건이 참일 경우만 조인한다.
--          종류 : 동등이너조인(==), 비동등이너조인(!=)
--       outer join : 이너조인 + 조인에 참여하지 않은 튜플까지 출력
--          종류 : 테이블 조인의 위치에 따라
--                left outer join, right outer join
--    공부의 방향은 : 어떤 테이블을 조인할까? 어떤 조인을 사용할까?

-- full join..  절대 실제로 하지 않는다. 속도 느려짐
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s,pp p;
-- inner join
  -- 동등이너조인
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s,pp p
    where s.no=p.no;
  -- 동등이너조인 다른 표기법
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s     -- 여기에 left table을 넣고
    inner join pp p -- 여기에 right table을 넣어야 한다.
    on s.no=p.no;
  -- 비동등이너조인
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s,pp p
    where s.no!=p.no;
-- outer join
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s     
    left outer join pp p -- left outer join/ left table : stu
    on s.no=p.no;
    -- inner join을 기본으로하고 join에 참여하지 않은 애도 포함하나 null 값으로 표현
    -- left outer는 left table에 right table이 들어간다고 생각하면
    -- kim은 right table인 pp에 없기때문에 null로 표현
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s     
    right outer join pp p -- right outer join/ right table : pp
    on s.no=p.no;   -- 참여하지않은애가 없어서 inner join과 같다.
    -- right outer는 right table에 left table이 들어간다고 생각하면
    -- hong, lee 모두 left에 존재하여 inner join과 같다.

-- 시험을 본 학생들의 이름과 과목과 점수를 출력하시오
-- 2개의 테이블을 합쳐야 한다. // 조인.. 그런데 같은 컬럼을 합친다. -- 이너조인
select s.name, p.e_name, p.e_point
from stu1 s, pp p
where s.no = p.no;

-- 홍길동의 이름과 과목과 점수를 출력하시오. 이너조인 필요
select s.name, p.e_name, p.e_point
from stu1 s, pp p
where s.no = p.no and s.name='hong';

-- 시험을 보지 않은 학생들의 이름을 출력하시오.
-- 이너조인에 참여하지 않은 튜플의 정보이므로 아우터 조인
-- 1. left outer join 해결
select s.name
from stu1 s
left outer join pp p
on s.no = p.no
where p.no is null; -- 합쳐졌을때 pp table에 kim의 값이 없으므로 null로 표현되는 것을
                    -- 이용하여 시험을 보지 않은 학생 출력

// join 정의
// 조인의 종류
// 조인의 종류를 언제 사용하는지? 샘플..