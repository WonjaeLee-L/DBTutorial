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

-- join : �� �� �̻��� ���̺��� �������� ��ġ�� ��
-- ���� : full join : �� ���� ���̺��� ��� ��ġ�� ��
--          ����� n*m�� ����ŭ ������ �Ǿ� Ʃ���� ���������.
--       inner join : ������ �����Ѵ�. ������ ���� ��츸 �����Ѵ�.
--          ���� : �����̳�����(==), �񵿵��̳�����(!=)
--       outer join : �̳����� + ���ο� �������� ���� Ʃ�ñ��� ���
--          ���� : ���̺� ������ ��ġ�� ����
--                left outer join, right outer join
--    ������ ������ : � ���̺��� �����ұ�? � ������ ����ұ�?

-- full join..  ���� ������ ���� �ʴ´�. �ӵ� ������
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s,pp p;
-- inner join
  -- �����̳�����
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s,pp p
    where s.no=p.no;
  -- �����̳����� �ٸ� ǥ���
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s     -- ���⿡ left table�� �ְ�
    inner join pp p -- ���⿡ right table�� �־�� �Ѵ�.
    on s.no=p.no;
  -- �񵿵��̳�����
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s,pp p
    where s.no!=p.no;
-- outer join
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s     
    left outer join pp p -- left outer join/ left table : stu
    on s.no=p.no;
    -- inner join�� �⺻�����ϰ� join�� �������� ���� �ֵ� �����ϳ� null ������ ǥ��
    -- left outer�� left table�� right table�� ���ٰ� �����ϸ�
    -- kim�� right table�� pp�� ���⶧���� null�� ǥ��
    select s.no, s.name, p.no, p.e_name, p.e_point
    from stu1 s     
    right outer join pp p -- right outer join/ right table : pp
    on s.no=p.no;   -- �������������ְ� ��� inner join�� ����.
    -- right outer�� right table�� left table�� ���ٰ� �����ϸ�
    -- hong, lee ��� left�� �����Ͽ� inner join�� ����.

-- ������ �� �л����� �̸��� ����� ������ ����Ͻÿ�
-- 2���� ���̺��� ���ľ� �Ѵ�. // ����.. �׷��� ���� �÷��� ��ģ��. -- �̳�����
select s.name, p.e_name, p.e_point
from stu1 s, pp p
where s.no = p.no;

-- ȫ�浿�� �̸��� ����� ������ ����Ͻÿ�. �̳����� �ʿ�
select s.name, p.e_name, p.e_point
from stu1 s, pp p
where s.no = p.no and s.name='hong';

-- ������ ���� ���� �л����� �̸��� ����Ͻÿ�.
-- �̳����ο� �������� ���� Ʃ���� �����̹Ƿ� �ƿ��� ����
-- 1. left outer join �ذ�
select s.name
from stu1 s
left outer join pp p
on s.no = p.no
where p.no is null; -- ���������� pp table�� kim�� ���� �����Ƿ� null�� ǥ���Ǵ� ����
                    -- �̿��Ͽ� ������ ���� ���� �л� ���

// join ����
// ������ ����
// ������ ������ ���� ����ϴ���? ����..