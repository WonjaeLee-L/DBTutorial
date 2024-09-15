1. 회원가입 테이블
CREATE TABLE member (
name VARCHAR(5) NOT NULL,
jumin VARCHAR(14) NOT NULL UNIQUE,
gender VARCHAR(1) NOT NULL CHECK (gender IN('남','여')),
id VARCHAR(10) PRIMARY KEY,
pwd VARCHAR(20) NOT NULL,
grade VARCHAR(2));


2. 회사명단 테이블
CREATE TABLE company (
name VARCHAR(5) NOT NULL,
jumin VARCHAR(14) NOT NULL UNIQUE,
gender VARCHAR(1) NOT NULL CHECK (gender IN('남','여')),
team VARCHAR(2) NOT NULL,
num VARCHAR(7) PRIMARY KEY,
grade VARCHAR(2) NOT NULL,
salary NUMERIC);


3. 카테고리 테이블
CREATE TABLE category (
cate VARCHAR(5) PRIMARY KEY,
secret VARCHAR(1) NOT NULL CHECK (secret IN('Y','N')));


4. 봉사 테이블
CREATE SEQUENCE bongsa_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE bongsa (
no NUMERIC PRIMARY KEY,
cate VARCHAR(5) NOT NULL CHECK (cate IN('봉사')),
name VARCHAR(5) NOT NULL,
id VARCHAR(10),
bname VARCHAR(20) NOT NULL,
bdate VARCHAR(20),
bplace VARCHAR(20),
sub VARCHAR(1) CHECK (sub IN('Y')),
CONSTRAINT fk_bongsa_cate FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE,
CONSTRAINT fk_bongsa_id FOREIGN KEY(id) REFERENCES member(id) ON DELETE SET NULL);


5. 칭찬 테이블
CREATE SEQUENCE good_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE good (
no NUMERIC NOT NULL UNIQUE,
cate VARCHAR(5) NOT NULL CHECK (cate IN('칭찬')),
name VARCHAR(5) NOT NULL,
id VARCHAR(10) NOT NULL,
gname VARCHAR(5) NOT NULL,
num VARCHAR(7) NOT NULL,
comment VARCHAR(50),
CONSTRAINT fk_good_cate FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE,
CONSTRAINT fk_good_id FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE,
CONSTRAINT fk_good_num FOREIGN KEY(num) REFERENCES company(num));


6. 자유게시판 테이블
CREATE SEQUENCE free_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE free (
no NUMERIC NOT NULL UNIQUE,
cate VARCHAR(5) NOT NULL CHECK (cate IN('자유게시판')),
name VARCHAR(5) NOT NULL,
id VARCHAR(10) NOT NULL,
title VARCHAR(20) NOT NULL,
comment VARCHAR(50),
CONSTRAINT fk_free_cate FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE,
CONSTRAINT fk_free_id FOREIGN KEY(id) REFERENCES member(id));


7. 건의사항 테이블
CREATE SEQUENCE plus_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE plus (
no NUMERIC NOT NULL UNIQUE,
cate VARCHAR(5) NOT NULL CHECK (cate IN('건의사항')),
name VARCHAR(5) NOT NULL,
id VARCHAR(10) NOT NULL,
title VARCHAR(20) NOT NULL,
comment VARCHAR(50),
CONSTRAINT fk_plus_cate FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE,
CONSTRAINT fk_plus_id FOREIGN KEY(id) REFERENCES member(id));


8. 익명 테이블
CREATE SEQUENCE noname_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE noname (
no NUMERIC NOT NULL UNIQUE,
cate VARCHAR(5) NOT NULL CHECK (cate IN('익명')),
title VARCHAR(20) NOT NULL,
comment VARCHAR(50),
CONSTRAINT fk_noname_cate FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE);


9. 봉사참여명단 테이블
CREATE TABLE bongsa_checklist (
bongsa_no NUMERIC NOT NULL,
id VARCHAR(10) NOT NULL,
num VARCHAR(7),
CONSTRAINT fk_bongcheck_no FOREIGN KEY(bongsa_no) REFERENCES bongsa(no),
CONSTRAINT fk_bongcheck_id FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE,
CONSTRAINT fk_bongcheck_num FOREIGN KEY(num) REFERENCES company(num));


