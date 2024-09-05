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
   name과 addr은 users에.. 조인 필요 없다.
select name, addr from users;


2. 회원의 이름과 소유한 자동차 번호를 출력하시오.
   이름 users, 자동차번호 carinfo, 회원이 소유한 자동차 : 이너조인
select u.name, c.c_num
from users u, carinfo c
where u.id=c.id;


3. 자동차 번호가 7788인 소유자의 이름과 주소를 출력하시오.
  자동차 번호는 조건절 where
  소유자의 이름과 주소는 users 문제는 자동차 번호는 carinfo..
 -> 1. 조인을 해서 조건절로 7788인 자동차의 소유자의 정보를 출력 > 조인
select u.name, u.addr
from users u, carinfo c
where u.id=c.id and c.c_num=7788;
 -> 2. 7788소유자의 회원아이디를 검색 한 후 결과값을 본 쿼리의 조건 > 서브쿼리
select id from carinfo where c_num='7788';를 서브쿼리로 이용
select name,addr
from users
where id=(select id from carinfo where c_num='7788');


4. 자동차를 소유하지 않은 사람의 이름과 주소를 출력하시오.
   이름과 주소는 users // 자동차를 소유하지 않은 사람이라는 조건
                    carinfo 테이블을 참조해 봐야 한다. 이너조인, 아우터조인..
select u.*, c.*
from users u -- left table
left outer join carinfo c -- right table // left 테이블에서
on u.id=c.id;                    -- 이너조인하고 조인에 참여하지 않은 튜플 표현
-> 결론
select u.name, u.addr
from users u -- left table
left outer join carinfo c -- right table // left 테이블에서
on u.id=c.id                    -- 이너조인하고 조인에 참여하지 않은 튜플 표현
where c.c_num is null;
-- left outer join을 다음과 같이 (+)기호로 표현할 수 있다.
select u.name, u.addr
from users u, carinfo c  -- left table
where u.id=c.id(+) and c_name is null; -- 이것도 left outer join. (+)표시 참고
-- right outer join을 다음과 같이 (+)기호로 표현할 수 있다.
select u.name, u.addr
from users u, carinfo c  -- right table
where u.id(+)=c.id and c_name is null; -- 이것도 right outer join. (+)표시 참고


5. 회원별 등록한 자동차 수를 출력하시오.
   회원별 집계, users만으로는 회원의 자동차를 모른다. users와 carinfo 테이블을 조인
   필요한 조인은 이너조인. 이너 조인을 한 후에 회원으로 그룹을 만들고 카운팅 집계
1) 테이블 조인
select u.*, c.*
from users u, carinfo c
where u.id=c.id;
2)
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by u.name; -- 동명이인의 가능성 -> u.id로 그룹화 한다.
3)
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by u.id; -- 동명이인의 가능성 -> u.id로 그룹화 한다. --> 에러가 난다.
                                        -- select u.name은 다중행이다..
4) 최종
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id, u.name); -- group by를 복합속성으로 정의한다.
                        -- 괄호 안 두 속성을 하나로 보고 그룹화


6. 2대 이상을 소유한 회원의 이름과 소유한 자동차 수를 출력하시오.
   5번문제와 비슷. 단, 2대 이상이라는 조건 추가 됨
   조건은 having(2대 이상 회원 그룹을 할것이므로)
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id, u.name) having count(*) >= 2;
-- group by를 복합속성으로 정하는 방법을 몰라서 어려움을 겪었음.


7. 자동차는 등록되어 있는데 소유자가 없는 자동차 번호를 출력하시오.
Tip, 먼저 보는 테이블과 나중에 보는 테이블의 순서를 기억.
 -> 먼저 보는 테이블 carinfo, 나중은 users.
    자동차가 등록되어 있는데 소유자가 누구냐? 이너조인 
    이너조인에 참여하지 못하는 튜플을 원한다? 아우터조인
    아우터 조인일때는 어떤 테이블을 left로 볼 것인가? 첫번째 left 지정
1) left outer join
select c.c_num
from carinfo c
left outer join users u
on u.id=c.id
where u.id is null;
2) left outer join - 다른 표기법
select c.c_num
from carinfo c,users u
where c.id = u.id(+) and u.id is null;
3) right outer join
select c.c_num
from users u
right outer join carinfo c
on u.id=c.id
where u.id is null;


-- 다음 부터는 3개 테이블을 조인하는 문제입니다.

-- companycar 회사에서 구매한 자동차를 의미, 
carinfo는 직원에게 배정한 자동차

다음 테이블을 생성하시오.
create table companycar(     -- 자동차 정보
c_num varchar2(4),   -- 차번호
c_com varchar2(30), 
c_name varchar2(10),  -- 차이름
c_price number);  -- 차 가격

다음 튜플을 삽입하세요
insert into companycar values ('1234','현다','소나타',1000);
insert into companycar values ('3344','기와','축제',2000);
insert into companycar values ('7788','기와','레2',800);
insert into companycar values ('9900','현다','그랭저',2100);
commit;
select * from users;
select * from carinfo;
select * from companycar;


8. 배정 자동차의 차번호, 제조사, 자동차명, 가격을 출력하시오.
1) carinfo 배정, 차번호는 carinfo에서 해결,
2) 제조사, 자동차명, 가격은 companycar.
3) 이너조인 필요
select c.c_num, cc.c_com, cc.c_name, cc.c_price
from carinfo c, companycar cc
where c.c_num = cc.c_num;


9. 회사에서구매는 하였지만 배정되지 않은 자동차의 차번호, 제조자, 자동차 이름을 출력   
1) 테이블을 보는 순서를 정한다.
   companycar 테이블에 보유한 자동차 정보를 확인, 이 자동차가 배정되었는지 확인하기 위해
   carinfo 테이블 확인.
2) 배정된 자동차는 이너조인. 배정되지 않은 자동차는 아우터 조인
3) companycar를 left table로 지정
select c.c_num, c.c_com, c.c_name
from companycar c
left outer join carinfo cc
on c.c_num = cc.c_num
where cc.c_num is null;


10. 자동차 가격이 1000만원 이상인 자동차의 자동차 번호를 출력하시오.
1) 자동차의 가격조건은 companycar에서 해결 가능
   자동차의 조건 또한 companycar에서 해결 가능. 조인 필요 없음
select c_num
from companycar
where c_price >= 1000;


11. 배정된 자동차 중에 회사에서 구매한 자동차가 아닌 자동차 번호를 출력하시오.
1) 관련 테이블은 carinfo, companycar
2) outer join -> carinfo 테이블을 left
select c.c_num
from carinfo c
left outer join companycar cc
on c.c_num = cc.c_num
where cc.c_com is null;


12. 모든 사람의 정보를 출력하시오. 이름, 배정받은 자동차번호, 자동차이름
1) 관련 테이블은 users, carinfo, companycar
2) 조인해서 만들고 싶은 테이블은 users.name carinfo.c_num companycar.c_name
   즉, 테이블 3개를 조인. 이때는 순서를 정하고 순서대로 2개씩 조인하고
   그 결과의 논리 테이블과 다음 테이블을 조인한다.
select u.name, NVL(c.c_num,'없음'), NVL(cc.c_name,'없음')
from users u
left outer join carinfo c
on u.id=c.id
left outer join companycar cc   -- 이렇게 바로 뒤에 다른 조인을 적으면,
on c.c_num=cc.c_num;            -- 조인을 연속으로 할 수 있다.

-- 고찰
테이블은 데이터 중복을 최소화 하기 위해 정규화 되어야 하고,
정규화는 테이블을 분리하는 의미가 있다.
그런데, 서비스를 이용하는 고객 입장에서는
2개 이상의 테이블이 조인이 되어야하는 경우가 있다.
그래서 정규화는 설계자의 입장이고, 조인은 서비스를 제공하는 입장의 기술이다.
그러나, 2개 이상의 테이블이 조인되어야 하는 서비스는, 서비스가 이용될때마다
db가 조인 연산을 계속해야 한다. 쿼리도 복잡하므로 간단하게 할 방법을 생각해본다.
해결책은 물리적은 테이블은 유지하되, 조인 결과를 합친 논리적인 테이블을 만드는 것이다.
논리적인 테이블은 물리적인 테이블의 데이터로 만들어져 있다.
이런 논리적인 테이블을 뷰라고 한다.