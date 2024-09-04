# DBTutorial
<pre>
Day 1.
  DB: 자료를(영구적으로) 저장_그 중, 형태가 있는 정형데이터인 관계형 데이터베이스를 공부

- 관계형 데이터베이스(개발, 확장성, 자료관리가 편리)
종류로는
1) Oracle♥
2) Mysql
3) Maria♥
4) Mssql

ex) 저장할 자료: 고객의 정보(각 정보를 정의해서 저장)
      번호 이름 나이 주소 성별
       1  홍길동 37 수원  남 
       2  김길수 25 서울  여
       3  홍길동 34 대전  여

관계형 데이터베이스 용어
- 릴레이션(테이블): 전체를 말함
- 릴레이션은 행(로우, 위에서는 세줄)과 열(컬럼, 위에서는 다섯줄)로 구성됨

- 로우는 저장할 대상의 자료, CRUD로 되어있다

- 컬럼은 의미가 있음(주소는 사는곳의 의미이며 문자/ 번호라는 컬럼은 숫자고 순서)
- 컬럼은 속성, 제약조건을 지정할(가질) 수 있다(속성은 숫자 또는 문자)(제약조건, 나이의 경우 <150)

- 제약조건: not null(반드시 입력을 해야하는 컬럼값),
	   check(이 값은 정확한지 아닌지 체크하겠다)
	   unique(중복 확인)
- 사칙연산 할 수 있으면 숫자, 필요 없으면 문자로(자동차 번호는 문자, 나이는 년 지나면 숫자 달라지므로 숫자)
- 이름의 경우 무조건 말해야 합니다. 라고하면, 이름이라는 컬럼은 속성이 문자이고 제약조건은 not null
- 번호에서 1,2,3,3 <-- 무결성위배. 절대 같은게 들어가면 안된다. 다른 컬럼은(이름, 나이, 주소, 성별 등) 중복 가능하다. 번호의 경우 unique라는 제약조건을 건다.
  같은 컬럼에서 중복될 수 없음을 의미한다.
- 번호의 경우 다른것과 구분하여 하나를 특정할 수 있게 만드는 것. 이름과 나이와 주소가 같을 수 있는데 번호라는 컬럼으로는 구분할 수 있다. 
  번호라는 컬럼이 유니크하기 때문에, 로우를 유니크하게 만들 수 있다. (unique라는 제약조건으로 내가 원하는 로우를 유니크하게 만들 수 있다.)
  테이블을 만든다: 컬럼을 만든다.
  로우가 없어도 데이터가 없는 테이블일 수 있다. 컬럼만 있으면 테이블이 된다.
  
- 개념적인 모델링(생각한 것)을 실제로 만들어보기

  물리적 설계
  Create table 고객의 정보 (
  첫 번째 컬럼,
  두 번째 컬럼,
  세 번째 컬럼,
  네 번째 컬럼
  );
  
  컬럼 속성 제약조건,
  
  Create table 고객의 정보 (
  번호 number unique key,
  이름 varchar2(6) not null,
  나이 number(2) default 1,
  주소 varchar2(50)
  );
  
  number: oracle의 자료형 type
  이름 varchar2(byte)

  default 1 : 처음부터 1이라는 값으로 시작
  number(3,1) : 0~99까지. 뒤에1은 소숫점한자리를 의미
  desc : 현재 만들어진 테이블의 구조를 확인하는 명령어
  create table : table을 만드는 명령어
  alter table : table 수정 명령어
  insert into aaa value (1, ‘’);
  -> aaa table의 value를 저장하겠다(로우를 집어넣는 명령어)
  select * from aaa;
  -> aaa라는 릴레이션에 모든(*)걸 보여달라

  // 관계형 데이터베이스 용어를 중심으로 공부한다.  
  
  
    
  Day 2.
  키 : 컬럼에 부여하는 기능(기본키/외래키)
    
    1.
  기본키: (유일성을 가진다. 인덱스를 형성한다.)
  튜플(row)을 유일하게 식별할 수 있다.
  -> 그래야 갱신, 삭제 이상현상을 방지할 수 있다.
    
  기본키로 index(색인)을 형성하여 검색속도를 향상시켜 저장한다. 
  index: 검색속도를 향상시킨다. 색인을 만들어 놓으면 검색속도가 빨라진다.
  서랍장에 옷을 구분해서 넣어놓는 생각 자체가 색인과 같은 개념이라 생각
   기본키는 null 불가하다.(not null을 포함하고 있다)
  
  index는 테이블당 한 개라고 생각. 많아지면 속도가 더 느릴 수 있다.
  
  
  
  기본키로 설정하는 코드
  create table m(
  ID varchar2(1) primary key,
  name  varchar2(2),
  ad varchar2(10)
  );
  
  primary key 자리에 원래 unique를 넣었었음.
  대신 primary key를 넣어서 유일하게 식별하게 만들면서 검색속도도 빨라진다. (자동으로 ID를 가지고 색인을 만드는 것)
  ID로 검색했을때만 속도가 빨라지는 특성을 가진다.
  
  member
  이름	주소	전화번호
  홍길동	서울	1111
  일지매	서울	1111
  홍길동	수원	2222
  
  C; row insert
   -> 상관 x
  R: row select
   -> 상관 x
  U: row update
   -> 홍길동의 전화번호를 4444로 바꾸세요/ 누군지 확실하지 않음
   (갱신 이상현상이 발생할 수 있다.)
  	(이유 : row(튜플)를 유일하게 식별하지 못한다. row가 unique하지 않다.
  		 -> 이상 현상이 발생할 수 있다.)
  D: row delete
   -> 홍길동을 삭제하세요/ 누군지 확실하지 않음
   (삭제 이상현상이 발생할 수 있다.)
  	(이유 : row(튜플)를 유일하게 식별하지 못한다. row가 unique하지 않다.
  		 -> 이상 현상이 발생할 수 있다.)
  
  -> 이상현상 해결을 위해서
  ID라는 컬럼을 새로 만든다. ID를 unique하게 설정한다.
  
  -> READ시의 속도를 고려해야함. 속도를 빠르게. 속도는 unique로 해결이 불가능.
  속도는 index로 해결.
  
    2.
  외래키: 컬럼 to 컬럼
  
  설계시 고려: 1. 이상현상 |-> 유일성 보장해서 해결
  			                  |-> 데이터의 중복을 최소화(정규화를 진행한다 = 테이블 분리)
  			                    	외래키로 해결
  
  ex)
  자동차 등록. 한 사람이 여러대를 등록
  여러대를 등록하려보니까 테이블 하나로 불가능해짐
  (게시판에 글을 작성한다. 게시글 테이블과 댓글 테이블)
  
  ID	이름	전번	차번호
  a	  홍길동	1111	  1
  a	  홍	  1111	  2
  -> 차번호 제외하고는 다 중복 -> UD에서 이상현상 발생
  -> unique 한다고 해결되지 않음.
  -> 테이블 분리하기(= 정규화를 거친다)
  
  table member(부모 릴레이션)
  (PK)
  ID	이름	전번
  a	홍	1111
  b	홍	2222
  
  table car(자식 릴레이션)
  차번호	ID(외래키)--> 외래키가 member 테이블의 ID를 참조함
  1	a
  2	a
  
  외래키는 car table이 소유하고있음. 외래키 설정은 car table에서 한다.
  자식릴레이션의 외래키는 부모 릴레이션의 특정 컬럼(참조대상)을 참조한다.
  참조대상은 유일성을 갖춰야하고, 자식릴레이션의 외래키는 유일성 없어도 된다.
  
  // 기본키와 외래키의 개념을 이해하고 활용한다. 관계형 데이터베이스 용어에 대해 더 익숙해진다.

  
  Day 3.
  개념적 설계 -> 논리적 설계(테이블 명세서) -> 물리적 설계(쿼리문)
  (시나리오1)
  - 고객관리
  고객은 아이디와 이름, 성별, 포인트로 구성된다.
  아이디는 8글자이며, 중복된 아이디는 사용할 수 없다.
  이름은 한글로 최대 5글자이며 성별은 남과 여로 저장한다.
  포인트는 최대 9999.99까지 저장할 수 있다.
  
  고객은 출석도장을 찍을 수 있다.
  출석도장은 날짜를 저장한다.
  고객은 하루에 여러번 출석도장을 찍을 수 있다. 
  
  고객 table, 출석대장 table 로 나누는 이유에 대한 공부 => ERD 기법
  
  ERD  -> 개념적 설계
  e: 개체 – 독립적으로 존재할 수 있는 대상
 	위의 시나리오에서 고객이 개체 (id, name 등이 속성). 출석은 고객이 하는거니까 독립적이 아님. 출석대장이 개체(시간이 속성).
  그럼 두 개체가 관계가 있는지 본다. -> 고객 개체와 출석시간 개체는 출석관계가 있고 1:n 관계를 갖는다. 고객은 무조건 출석해야함
  
  
  
</pre>
