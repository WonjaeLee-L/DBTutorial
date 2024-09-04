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

insert into muser values(muser_no.nextval,'870205-1','�̽���',1,10000,34);
insert into muser values(muser_no.nextval,'880405-1','������',2,20000,31);
insert into muser values(muser_no.nextval,'770715-2','���̼�',4,40000,32);
insert into muser values(muser_no.nextval,'010205-3','������',1,10000,30);
insert into muser values(muser_no.nextval,'810205-2','������',2,20000,34);
insert into muser values(muser_no.nextval,'820219-2','���¿�',3,30000,35);
insert into muser values(muser_no.nextval,'020205-3','�����',1,10000,30);
insert into muser values(muser_no.nextval,'970214-2','������',2,20000,31);
insert into muser values(muser_no.nextval,'040205-4','������',4,40000,31);
insert into muser values(muser_no.nextval,'770225-1','���翵',5,50000,30);
insert into muser values(muser_no.nextval,'770905-2','�̽ż�',4,40000,34);
insert into muser values(muser_no.nextval,'050208-3','�̹߲�',2,20000,30);
insert into muser values(muser_no.nextval,'051205-4','�̿���',1,10000,34);
insert into muser values(muser_no.nextval,'891215-1','���¾�',3,30000,30);
insert into muser values(muser_no.nextval,'670805-1','������',2,20000,34);
insert into muser values(muser_no.nextval,'840207-1','���̷�',1,10000,35);
insert into muser values(muser_no.nextval,'770405-1','��õ��',1,10000,31);

select * from muser;

1 grade�� 3�� ����� ��� ����ΰ���?
select count(*) from muser where grade=3;
2 grade�� 1,2,4�� ������� salary�� ����� ���Ͻÿ�.
select avg(salary), grade from muser 
group by grade having grade in(1,2,4);
3 salary�� 20000 �̸��� ����� �� ����Դϱ�?
select count(*) from muser where salary<20000;
4 salary�� 30000 �̻��� ����� salary ����� ���Ͻÿ�.
select avg(salary) from muser where salary>30000;
5 77��� �߿�  salary�� ���� ���� ����� �̸��� ���̿� salary�� ����Ͻÿ�.
select name,
to_number(to_char(sysdate,'yyyy'))-(1900+to_number(substr(reg_num,1,2))),
salary
from muser
where substr(reg_num,1,2)=77 and salary=(select min(salary) from muser);
6 ��� ����� �̸���, ����(���� �� ������� 0205)�� ����Ͻÿ�.
select name, substr(reg_num,3,4) ���� from muser;
7 ������ ��� �޿��� ���Ͻÿ�.
select avg(salary) from muser
where substr(reg_num,8,1)=1 or substr(reg_num,8,1)=3;
8 ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿��� ����Ͻÿ�
select name, salary from muser
where salary > (select avg(salary) from muser);
9 ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿�, ��ձ޿��� ����Ͻÿ�
select name, salary, (select avg(salary) from muser) ��ձ޿� from muser
where salary > (select avg(salary) from muser);
10 �������� ��ձ޿����� ���� ���������� ��� ����Դϱ�
select count(*) from muser
where substr(reg_num,8,1)=1 or substr(reg_num,8,1)=3
and salary>(select avg(salary) 
from muser where substr(reg_num,8,1)=2 or substr(reg_num,8,1)=4);
11 grade�� ��� �޿��� ����ϼ���..
select avg(grade) 
from muser
group by grade;
12 �׷캰 ��ձ޿��� ��ü ��պ��� ���� �׷��� ����Ͻÿ�.
select grade, avg(salary)
from muser
group by grade having avg(salary)>(select avg(salary) from muser);
13 �������� ���� ������ ����Ͻÿ�. (��� ���´� �̸�, ����(grade*salary*time)
select name, grade*salary*time ����
from muser;
14 �������� ������ ����Ͻÿ�. (��� ���� �̸�, ����(������ ���Ǵ� ���� ����Ѵ�)
select name, decode(substr(reg_num,8,1),1,'��',3,'��',2,'��',4,'��')
from muser;
15 time�� �ٹ��ð��� �ٹ��ð��� 31�̻��� ����� �̸��� ����Ͻÿ�.
select name
from muser
where time>31;
16 ¦���⵵�� �¾ ������� �̸��� ��� ����Ͻ�.
select name from muser where substr(reg_num,2,1)=0 or
substr(reg_num,2,1)=2 or substr(reg_num,2,1)=4 or substr(reg_num,2,1)=6 or
substr(reg_num,2,1)=8;
17 �������� ��������� ����Ͻÿ�. (��� ���´� �̸��� �������(97��1��2��))
select name, to_char(to_date(substr(reg_num,1,6)),'yy"��"mm"��"dd"��"') �������
from muser;
18 ���������� ���Ƹ� �����ϱ� ���� ��å���� time�� 2�ð������ϱ�� �ߴ�. �̸� ó�� �Ͻÿ�.
select name, time+2 �ð� from muser
where substr(reg_num,8,1)=2 or substr(reg_num,8,1)=4;
19 ���̺� �ο����� ����Դϱ�
select substr(reg_num,1,2) ���, count(*) �ο��� from muser
group by substr(reg_num,1,2);
20 2�г�׷�� 4�г� �׷��� ��� ����Դϱ�
select grade �г�, count(*) �ο��� from muser
group by grade having grade=2 or grade=4;

�߰�����

#1) ��� ����� �¾ �� ���ñ��� �� ���� �������� ����Ͻÿ�
--(�������: �̸�, �ֹι�ȣ, ���ݱ�����ƿ¿���)
select name �̸�, reg_num �ֹι�ȣ,
trunc(months_between(sysdate, to_date(substr(reg_num,1,6)))) ����
from muser;
#2) time�� ���̷� ��. 30~31���� ��ƿ� ������ ��, 32�� �̻��� ��ƿ� ������ �� ���ϱ�
select
distinct(select sum(time*12)
from muser
where time<32),
(select sum(time*12)
from muser
where time>31)
from muser;
#3) ���ɺ� �޿��� ��, over()�Լ� �̿�
select distinct(time) ����, sum(salary)over(partition by time) ��
from muser
order by time;
#4) ���ɺ� �ο���, over()�Լ� �̿�
select distinct(time) ����,
count(*) over(partition by time) �ο���
from muser
order by time;
#5) ��޺� �޿��� �ְ�޿�, over()�Լ� �̿�
select distinct(grade),
max(salary)over(partition by grade) �ְ�޿�
from muser
order by grade;
#6) ���۰˻��Ͽ� ����Ŭ �Լ� ����
1. ���� �Լ�
    max() : �ִ밪
    min() : �ּҰ�
    avg() : ��հ�
    sum() : �հ�
    mod(a,b) : a�� b�� ���� ������
    count(*) : �� ���ڵ� ���� �Լ�, null ����
    count(�÷���) : �÷��� �������� �� ���ڵ� �� ���� �Լ�, null ����
    
2. ���ڿ� �Լ�
    lower('HH') : hh, �ش� �÷��� ���� �ҹ��ڷ� ��ȯ�ϴ� �Լ�
    upper('hh') : HH, �ش� �÷��� ���� �빮�ڷ� ��ȯ�ϴ� �Լ�
    inicap('go go go') : Go Go Go, ù����, ���� ���� ù���ڸ� �빮�ڷ� ��ȯ
    concat(a,b) : ab, �� ���� ���ڿ��� ����
    substr('HelloWorld',1,5) : Hello, ���ڿ��� 1��°�ڸ����� 5��°�ڸ����� ����
    length('oracle') : 6, ���ڿ��� ����
    instr('HelloWorld','W') : 6, ���ڿ����� Ư�� ������ ��ġ�� ���� �Լ�.
                                 ���ٸ� 0 ��ȯ
    lpad('SQLPLUS',10,'*') : ***SQLPLUS, �ش� ���̿� ������ �κ��� ���ʺ��� ä��
    rpad('SQLPLUS',10,'*') : SQLPLUS***, �ش� ���̿� ������ �κ��� �����ʺ��� ä��
    trim('SQ LP L US') : SQLPLUS, ���� ����
    ltrim('*SQLPLUS','*') : SQLPLUS, �������� ���ڿ����� �ش� ���ڸ� ����
    rtrim('SQLPLUS*','*') : SQLPLUS, �������� ���ڿ����� �ش� ���ڸ� ����
    replace('SEVLTL','L','EN') : SEVENTEN, �ش� ���ڸ� �ٸ� ���ڷ� �ٲپ���
    nvl(expr1,expr2) : expr1�� null�̸� expr2 ������ ��ȯ�ϴ� �Լ�
    nvl2(expr1,expr2,expr3) : expr1�� null1�� ���� null�� �ƴϸ� expr2,
                              null�̸� expr3�� ��ȯ�ϴ� �Լ�
    nullif(expr1,expr2) : expr1�� expr2�� ���Ͽ� ������ null, �ٸ��� expr1 ��ȯ
    coalesce(expr1,expr2,...exprn) : ��Ͽ��� ù��°�� null�ƴ� expr�� ��ȯ
    || : ���տ����� ex) select uname || '�� ����� ' || aver || '�Դϴ�' 
    
3. ���� �Լ�
    abs(-7) : 7, ���밪�� ����ϴ� �Լ�
    mod(1500, 200) : 100, 1500 / 200 �� �������� ��ȯ�ϴ� �Լ�
    ceil(1.123) ; 2 :       �Ҽ��� ù°�ڸ����� �ش� ���� �ø� ó���� ������ ��ȯ�ϰ�
    ceil(-1.623) ; -1 :     �ش� �����ٴ� ũ���� ���� �����ϴ� �ּҰ��� ���ϴ� �Լ�
    
    floor(1.123)  :         �Ҽ��� ù°�ڸ����� �ش� ���� ���� ó���� ������ ��ȯ�ϰ� 
    floor(-1.123) :         �ش� �����ٴ� ������ ���� �����ϴ� �ִ밪�� ���ϴ� �Լ�
    round(n,m) : �ش� ���� n���� m�ڸ����� �ݿø��ϴ� �Լ�
    trunc(n.m) : �ش� ���� n���� m�ڸ����� �����ϴ� �Լ�
    to_number : ���ڿ��� ���������� �ٲ��ش�.
                      
4. ��¥ �Լ�
    sysdate : ���� ��¥, �ð� ex) select sysdate from dual;
    extract(year from sysdate) : sysdate���� ����� ����(year,month,day)
    months_between(sysdate, to_date('2014-12-11')) : ù��° ��¥����
                                        �ι�° ��¥ ���� ���� ���� ��ȯ�ϴ� �Լ�
    to_date() : ���ڿ��� ��¥������ ��ȯ
    add_months(sysdate, 5) : �ش� ��¥���� ���� ���� ���� ��¥�� ��ȯ
    next_day(sysdate, '�ݿ���') : �ش� ��¥���� ���ʷ� �����ϴ� �ش� ������ ��¥�� ��ȯ
    last_day(sysdate) : �ش� ��¥�� ���ԵǾ� �ִ� ���� ������ ��¥�� ��ȯ
5. ����ȯ �Լ�
    to_char(���� ��¥,'���ϴ� ���') - ���ڿ� ��¥�� ���ڷ� ��ȯ���ش�
    to_number('1')
    to_date('����','��¥����')
    
6. if�� ���� �Լ�
    decode : decode(�÷�,����1,���1,����2,���2)
    case(case when then else end) :
        case
              when ����1 then ����1�� ���� ��� ����
              when ����2 then ����2�� ���� ��� ����
              else ����1�� ����2 ��� �͵� ���� �ƴ� ��� ����
        end