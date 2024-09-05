drop table users;
drop table carinfo;

create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4),   --�ڵ��� ��ȣ
c_name varchar2(10),  -- �ڵ��� ����
 id varchar2(8));

insert into users values ('1111','kim','����');
insert into users values ('2222','lee','����');
insert into users values ('3333','park','����');
insert into users values ('4444','choi','����');

insert into carinfo values ('1234','����','1111');
insert into carinfo values ('3344','����','1111');
insert into carinfo values ('5566','����','3333');
insert into carinfo values ('6677','����','3333');
insert into carinfo values ('7788','����','4444');
insert into carinfo values ('8888','����','5555');

select * from users;
select * from carinfo;

1. ȸ���� �̸��� �ּҸ� ����Ͻÿ�.
   name�� addr�� users��.. ���� �ʿ� ����.
select name, addr from users;


2. ȸ���� �̸��� ������ �ڵ��� ��ȣ�� ����Ͻÿ�.
   �̸� users, �ڵ�����ȣ carinfo, ȸ���� ������ �ڵ��� : �̳�����
select u.name, c.c_num
from users u, carinfo c
where u.id=c.id;


3. �ڵ��� ��ȣ�� 7788�� �������� �̸��� �ּҸ� ����Ͻÿ�.
  �ڵ��� ��ȣ�� ������ where
  �������� �̸��� �ּҴ� users ������ �ڵ��� ��ȣ�� carinfo..
 -> 1. ������ �ؼ� �������� 7788�� �ڵ����� �������� ������ ��� > ����
select u.name, u.addr
from users u, carinfo c
where u.id=c.id and c.c_num=7788;
 -> 2. 7788�������� ȸ�����̵� �˻� �� �� ������� �� ������ ���� > ��������
select id from carinfo where c_num='7788';�� ���������� �̿�
select name,addr
from users
where id=(select id from carinfo where c_num='7788');


4. �ڵ����� �������� ���� ����� �̸��� �ּҸ� ����Ͻÿ�.
   �̸��� �ּҴ� users // �ڵ����� �������� ���� ����̶�� ����
                    carinfo ���̺��� ������ ���� �Ѵ�. �̳�����, �ƿ�������..
select u.*, c.*
from users u -- left table
left outer join carinfo c -- right table // left ���̺���
on u.id=c.id;                    -- �̳������ϰ� ���ο� �������� ���� Ʃ�� ǥ��
-> ���
select u.name, u.addr
from users u -- left table
left outer join carinfo c -- right table // left ���̺���
on u.id=c.id                    -- �̳������ϰ� ���ο� �������� ���� Ʃ�� ǥ��
where c.c_num is null;
-- left outer join�� ������ ���� (+)��ȣ�� ǥ���� �� �ִ�.
select u.name, u.addr
from users u, carinfo c  -- left table
where u.id=c.id(+) and c_name is null; -- �̰͵� left outer join. (+)ǥ�� ����
-- right outer join�� ������ ���� (+)��ȣ�� ǥ���� �� �ִ�.
select u.name, u.addr
from users u, carinfo c  -- right table
where u.id(+)=c.id and c_name is null; -- �̰͵� right outer join. (+)ǥ�� ����


5. ȸ���� ����� �ڵ��� ���� ����Ͻÿ�.
   ȸ���� ����, users�����δ� ȸ���� �ڵ����� �𸥴�. users�� carinfo ���̺��� ����
   �ʿ��� ������ �̳�����. �̳� ������ �� �Ŀ� ȸ������ �׷��� ����� ī���� ����
1) ���̺� ����
select u.*, c.*
from users u, carinfo c
where u.id=c.id;
2)
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by u.name; -- ���������� ���ɼ� -> u.id�� �׷�ȭ �Ѵ�.
3)
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by u.id; -- ���������� ���ɼ� -> u.id�� �׷�ȭ �Ѵ�. --> ������ ����.
                                        -- select u.name�� �������̴�..
4) ����
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id, u.name); -- group by�� ���ռӼ����� �����Ѵ�.
                        -- ��ȣ �� �� �Ӽ��� �ϳ��� ���� �׷�ȭ


6. 2�� �̻��� ������ ȸ���� �̸��� ������ �ڵ��� ���� ����Ͻÿ�.
   5�������� ���. ��, 2�� �̻��̶�� ���� �߰� ��
   ������ having(2�� �̻� ȸ�� �׷��� �Ұ��̹Ƿ�)
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id, u.name) having count(*) >= 2;
-- group by�� ���ռӼ����� ���ϴ� ����� ���� ������� �޾���.


7. �ڵ����� ��ϵǾ� �ִµ� �����ڰ� ���� �ڵ��� ��ȣ�� ����Ͻÿ�.
Tip, ���� ���� ���̺�� ���߿� ���� ���̺��� ������ ���.
 -> ���� ���� ���̺� carinfo, ������ users.
    �ڵ����� ��ϵǾ� �ִµ� �����ڰ� ������? �̳����� 
    �̳����ο� �������� ���ϴ� Ʃ���� ���Ѵ�? �ƿ�������
    �ƿ��� �����϶��� � ���̺��� left�� �� ���ΰ�? ù��° left ����
1) left outer join
select c.c_num
from carinfo c
left outer join users u
on u.id=c.id
where u.id is null;
2) left outer join - �ٸ� ǥ���
select c.c_num
from carinfo c,users u
where c.id = u.id(+) and u.id is null;
3) right outer join
select c.c_num
from users u
right outer join carinfo c
on u.id=c.id
where u.id is null;


-- ���� ���ʹ� 3�� ���̺��� �����ϴ� �����Դϴ�.

-- companycar ȸ�翡�� ������ �ڵ����� �ǹ�, 
carinfo�� �������� ������ �ڵ���

���� ���̺��� �����Ͻÿ�.
create table companycar(     -- �ڵ��� ����
c_num varchar2(4),   -- ����ȣ
c_com varchar2(30), 
c_name varchar2(10),  -- ���̸�
c_price number);  -- �� ����

���� Ʃ���� �����ϼ���
insert into companycar values ('1234','����','�ҳ�Ÿ',1000);
insert into companycar values ('3344','���','����',2000);
insert into companycar values ('7788','���','��2',800);
insert into companycar values ('9900','����','�׷���',2100);
commit;
select * from users;
select * from carinfo;
select * from companycar;


8. ���� �ڵ����� ����ȣ, ������, �ڵ�����, ������ ����Ͻÿ�.
1) carinfo ����, ����ȣ�� carinfo���� �ذ�,
2) ������, �ڵ�����, ������ companycar.
3) �̳����� �ʿ�
select c.c_num, cc.c_com, cc.c_name, cc.c_price
from carinfo c, companycar cc
where c.c_num = cc.c_num;


9. ȸ�翡�����Ŵ� �Ͽ����� �������� ���� �ڵ����� ����ȣ, ������, �ڵ��� �̸��� ���   
1) ���̺��� ���� ������ ���Ѵ�.
   companycar ���̺� ������ �ڵ��� ������ Ȯ��, �� �ڵ����� �����Ǿ����� Ȯ���ϱ� ����
   carinfo ���̺� Ȯ��.
2) ������ �ڵ����� �̳�����. �������� ���� �ڵ����� �ƿ��� ����
3) companycar�� left table�� ����
select c.c_num, c.c_com, c.c_name
from companycar c
left outer join carinfo cc
on c.c_num = cc.c_num
where cc.c_num is null;


10. �ڵ��� ������ 1000���� �̻��� �ڵ����� �ڵ��� ��ȣ�� ����Ͻÿ�.
1) �ڵ����� ���������� companycar���� �ذ� ����
   �ڵ����� ���� ���� companycar���� �ذ� ����. ���� �ʿ� ����
select c_num
from companycar
where c_price >= 1000;


11. ������ �ڵ��� �߿� ȸ�翡�� ������ �ڵ����� �ƴ� �ڵ��� ��ȣ�� ����Ͻÿ�.
1) ���� ���̺��� carinfo, companycar
2) outer join -> carinfo ���̺��� left
select c.c_num
from carinfo c
left outer join companycar cc
on c.c_num = cc.c_num
where cc.c_com is null;


12. ��� ����� ������ ����Ͻÿ�. �̸�, �������� �ڵ�����ȣ, �ڵ����̸�
1) ���� ���̺��� users, carinfo, companycar
2) �����ؼ� ����� ���� ���̺��� users.name carinfo.c_num companycar.c_name
   ��, ���̺� 3���� ����. �̶��� ������ ���ϰ� ������� 2���� �����ϰ�
   �� ����� �� ���̺�� ���� ���̺��� �����Ѵ�.
select u.name, NVL(c.c_num,'����'), NVL(cc.c_name,'����')
from users u
left outer join carinfo c
on u.id=c.id
left outer join companycar cc   -- �̷��� �ٷ� �ڿ� �ٸ� ������ ������,
on c.c_num=cc.c_num;            -- ������ �������� �� �� �ִ�.

-- ����
���̺��� ������ �ߺ��� �ּ�ȭ �ϱ� ���� ����ȭ �Ǿ�� �ϰ�,
����ȭ�� ���̺��� �и��ϴ� �ǹ̰� �ִ�.
�׷���, ���񽺸� �̿��ϴ� �� ���忡����
2�� �̻��� ���̺��� ������ �Ǿ���ϴ� ��찡 �ִ�.
�׷��� ����ȭ�� �������� �����̰�, ������ ���񽺸� �����ϴ� ������ ����̴�.
�׷���, 2�� �̻��� ���̺��� ���εǾ�� �ϴ� ���񽺴�, ���񽺰� �̿�ɶ�����
db�� ���� ������ ����ؾ� �Ѵ�. ������ �����ϹǷ� �����ϰ� �� ����� �����غ���.
�ذ�å�� �������� ���̺��� �����ϵ�, ���� ����� ��ģ ������ ���̺��� ����� ���̴�.
������ ���̺��� �������� ���̺��� �����ͷ� ������� �ִ�.
�̷� ������ ���̺��� ���� �Ѵ�.