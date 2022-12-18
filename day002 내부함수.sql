-- comment(�ּ�) : ����� ��� ���� ������ ���� �� ����ϴ� ����
/* 
���� �ٿ� ���� �ּ��� ���� �� ����ϴ� ����
*/

show user  -- ���� ���� ������ Ȯ���ϴ� SQL PLUS��ɾ�

-- ���� ���ӵ� ������ ���Ե� ���̺� Ȯ��
-- tab == tables

SELECT * FROM tab; -- ��� ���̺� ��ȸ

-- DESC : 
--       (1) Ư�� ���̺��� ������ Ȯ���ϴ� ���
--       (2) ��ȸ�� ������������ ���
-- emp employee�� ���ڷ� Ư�� ȸ���� ���������� ��� �ִ� ���̺�
desc emp  --SQL���� �ƴϴ�
desc dept
SELECT * FROM dept;

-- SQL ��� : ���Ǿ�(DDL), ���۾�(DML), �����(DCL)
-- ���Ǿ� : create(����), later(����), drop(����)
-- ���۾� : SELECT(����), insert(����), update(����), dalete(����)
-- ����� : ���Ἲ ,  ������� , ���� �ο� ��
--         grant,  revoke ,  commit,  rollback
alter session set nls_date_format='RR/MM/DD';

drop table emp;
drop table dept;

CREATE TABLE DEPT
       (DEPTNO number(10),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) );

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'81-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'81-05-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'81-05-09',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'81-04-01',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'81-09-10',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'81-02-11',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'81-08-21',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'81-12-11',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'81-02-23',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'81-12-11',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'80-12-11',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'82-12-22',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

commit;

drop  table  salgrade;

create table salgrade
( grade   number(10),
  losal   number(10),
  hisal   number(10) );

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);

commit;

-- scott ������ ������ �ִ� ���̺��� ����� Ȯ��
SELECT * FROM tab;

--salgrade ���̺��� ���(����)�� Ȯ��
SELECT * FROM salgrade;

-- Q1. dept ���̺��� �μ������� ������ �ִ� ���̺��̴�. �μ������� ������ Ȯ��
SELECT * FROM dept;

-- �μ����̺�(DEPT)�� �μ�����(DNAME)�� ����
SELECT dname FROM dept;

-- �μ����̺�(dept)�� �μ��̸�(dname), ��ġ(loc), ����
SELECT dname, loc FROM dept;

-- EMP ���̺� 14���� ��� �����Ͱ� ����� ���� Ȯ�� �� �� �ִ�
SELECT * FROM emp;

SELECT empno, ename, job FROM emp;
--�����(keywrd) : �ǹ̿� �뵵�� ������ ��ɾ�� �ٸ� �뵵�� ����� �� ����

--���� ���̺��� �����̸��� �޿��� ����
SELECT ename, sal, sal+100 AS "�λ�޿�"
FROM emp;

-- �޿��� 2500�� �ʰ� �ϴ� ������ ������ �����Ͻÿ�
SELECT *
FROM emp
WHERE sal > 2500;

-- �������̺� ������ �μ���ȣ�� 20�� ����� ���� ������ ����
SELECT *
FROM EMP
WHERE deptno = 20;

-- �̸�(ename)�� FORD�� ����� ��� (empno), �̸� (ename), �޿�(sal)����
SELECT empno, ename, sal
FROM emp
WHERE ename = 'FORD';

-- ����, ��¥, �ð����� ����ǥ('',"") �ȿ� ��ƾ� �Ѵ�
-- �ʵ���� ��ҹ��ڸ� �������� ������, ���ڵ�� �ݵ�� ��ҹ��ڸ� �����ؾ��Ѵ�

-- �Ի����� 1982�� 1�� 1�� ������ ����� ������ �����Ͻÿ�.
SELECT *
FROM emp
WHERE hiredate >= '82/1/1';

-- ������ �μ���ȣ�� 10�� ������ ������ ����
SELECT *
FROM emp
WHERE deptno = 10;

-- ������ �μ���ȣ�� 10 �ƴ� ������ ������ ����
SELECT *
FROM emp
WHERE NOT deptno = 10; 
-- WHERE deptno != 10;
-- WHERE deptno <> 10;

-- �μ���ȣ�� 10�̰ų�  ����(JOB)'MANAGER'�� ������ ���� ����
SELECT *
FROM emp
WHERE (deptno = 10) OR (job = 'MANAGER');

-- -- �μ���ȣ�� 10�̰�  ����(JOB)'MANAGER'�� ������ ���� ����
SELECT *
FROM emp
WHERE (deptno = 10) AND (job = 'MANAGER');

-- �޿��� 2000 �̻� 300������ ��� ���
SELECT *
FROM emp
WHERE sal BETWEEN 2000 and 3000;
-- WHERE (sal >= 2000) AND (sal <= 3000);
-- BETWEEN : ������, ������, ��¥�� ��� ����� ����

--q �޿��� 2000 �̸��̰ų� 3000 �ʰ��� ���� ���� ����
SELECT *
FROM emp
WHERE sal NOT BETWEEN 2000 and 3000;
-- WHERE (sal <= 2000) OR (sal >= 3000);

-- IN ������ �Ǿ� �ֳ�
-- Ŀ�̼�(comm)�� 300 Ȥ�� 1400�� ����� ������ �����Ͻÿ�
SELECT *
FROM emp
WHERE comm IN (300, 1400);
-- WHERE comm = 300 OR comm = 1400;


-- Ŀ�̼�(comm)�� 300 Ȥ�� 1400 �ƴ� ����� ������ �����Ͻÿ�
SELECT *
FROM emp
WHERE comm NOT IN (300, 1400);
-- WHERE comm != 300 AND comm != 1400; �߿�*********

-- LIKE ~����, ó��
-- ���ϵ�ī�� ���� or ���� ���� : % , _

-- ����� �̸��� ù���ڰ� 'c'�� �����ϴ� ����� �̸��� �����Ͻÿ�
SELECT ename
FROM emp
WHERE ename LIKE 'C%'; --��

SELECT ename
FROM emp
WHERE ename NOT LIKE 'C%'; --��

SELECT ename
FROM emp
WHERE ename LIKE '%E%'; -- ���߿�

-- ����� �̸��� �� ��° ���ڰ� 'A'
SELECT ename
FROM emp
WHERE ename LIKE '_A%';

-- ����� �̸��� �� ��° ���ڰ� 'A' �ƴ� ����� �̸�
SELECT ename
FROM emp
WHERE ename NOT LIKE '_A%';

-- NULL �ǹ� : ��Ȯ��, �˼� ���� ��
-- NULL�� ���� �Ұ�, Ȱ��, �� �� �� ����
-- IN NULL, IN NOT NULL

--������̺� Ŀ�̼��� null�� ����� ������ �����Ͻÿ�
SELECT empno, ename, comm
FROM emp
WHERE comm IS NULL;

--������̺� Ŀ�̼��� null�� �ƴ� ����� ������ �����Ͻÿ�
SELECT empno, ename, comm
FROM emp
WHERE comm IS NOT NULL;

-- SELECT�� Ȯ���ؼ� ����ϴ� order by��
-- ���� : Ư�� �ʵ忡 ���� ������� �����ϴ� ��
-- ���Ĺ�� : �⺻ ASC(������), DESC(��������)
-- ����, ����, ��¥, NULL, 

-- ����� �޿��� �������� �������� �����Ͽ� �����Ͻÿ�.
SELECT *
FROM emp
ORDER BY sal ASC;

-- ���� �ֱٿ� �Ի��� ��������� ����
SELECT *
FROM emp
ORDER BY hiredate DESC;

-- ����� �޿��� �������� �������� �����ϵ� , ������ �޿��� �޴� ����� �̸����� �������� ���
SELECT *
FROM emp
ORDER BY sal, ename DESC;

-- DISTINCT : �ߺ��� �����ϰ� ���� *********
-- ��� ���̺��� �μ���ȣ�� ����
SELECT DISTINCT deptno
FROM emp;

-- ��Ī(Nick Name) : ����� ������ �ο�
SELECT ename, sal * 12 "����" -- AS ���� ����
FROM emp; 

-- ���Ῥ���� : SELECT�� ���ο� "||" ���ؿ� �÷��� Ư�� ���ڿ��� �߰��� ��, ���ڿ��� ���ڿ��� �����ϴ� ������ 
SELECT ename || '���� ������ '  || job || '�Դϴ�.'
FROM emp;

-- dual ���̺� : �� ���� ����� ����ϱ� ���� ����ϴ� �ӽ� ���̺�
-- ������ ���� :  30 * 50
SELECT 30 * 50
FROM dual;

desc dual;

SELECT *
FROM dual;

SELECT sysdate
FROM dual;

-- �����Լ� : ���� �����͸� ó���ϱ� ���� ����ϴ� �Լ�
-- abs : ���밪
SELECT -10, abs(-10)
FROM dual;

-- floor : �Ҽ��� �Ʒ��� ������ ������ �Լ� (�ݿø� ����)
SELECT 42.195, floor(42.195)
FROM dual;

-- round : Ư�� �ڸ������� �ݿø��ϴ� �Լ�
-- round (����, �ڸ���)
SELECT 34.5678, round(34.5678)
FROM dual;

SELECT 34.5678, round(34.5678,2)
FROM dual;

SELECT 34.5678, round(34.5678,-1) -- �Ҽ��� ���� ��ġ �� 4�� �ݿø� �ȵǴϱ� 0���� ����
FROM dual;

-- TRUNC : : Ư�� �ڸ������� �߶󳻴� �Լ�
-- TRUNC :����, �ڸ���)
-- �ڸ����� 2�� ��� : �Ҽ��� ���� ����° �ڸ����� ���� ���� ����
SELECT trunc(34.5678,2), 
trunc(34.5678,-1), -- 4�� 0����
trunc(34.5678),
trunc(34.5678,0) --�Ҽ��ڸ� �� ����
FROM dual;

-- MOD : �������� �ǵ��� �ִ� �Լ�
-- MOD (����, ������ ��)
SELECT MOD(27,2), MOD(27,5), MOD(27, 7)
from dual;

-- ���� ó�� �Լ� : ���� �����͸� ó���ϴ� �Լ� --
-- UPPER() : �빮�ڷ� ��ȯ
SELECT 'Welcome to oracle'"������", UPPER('Welcome to Oracle') "UPPER ����"
FROM dual;
    
-- LOWER() : �ҹ��ڷ� ��ȯ
SELECT 'Welcome to oracle'"������", LOWER('Welcome to Oracle') "LOWER ����"
FROM dual;

-- INITCAP() : ù�۸��� �빮�ڷ�, �������� �ҹ��ڷ� ��ȯ
SELECT 'WELCOME TO ORACLE'"������", INITCAP('WELCOME TO ORACLE') "INITCAP ����"
FROM dual;

-- LENGHT() : ���� ���̸� ���ϴ� �Լ�
SELECT LENGTH('Oracle'), LENGTH('����Ŭ')
FROM dual;

-- LENGTHB() : ���ڱ��̸�  ����Ʈ ���� �˷��ִ� �Լ�
SELECT LENGTHB('Oracle'), LENGTHB('����Ŭ')
FROM dual;

-- instr (in string) : Ư�� ������ ��ġ�� ���ϴ� �Լ�
SELECT INSTR('Welcome to Oracle', 'O') --�ڵ��� �ٸ��� (0���� �����ϴ� ���� �ƴϰ� 1���� ������)
FROM dual;

-- substr(���ڿ�, ������ġ, ���ڼ�) : ���ڿ����� ������ġ���� ���ڼ���ŭ ���� 
SELECT substr('Welcome to oracle',4,4)
FROM dual;

-- substr() : �Լ��� �ѱ�/���ڸ� 1����Ʈ�� ������, substrb()�� 2����Ʈ�� ����
-- substrb() : ���ڿ��� �Ϻκи� �����Ͷ�� ����Ʈ���� ����
SELECT SUBSTR('����������Ŭ', 3, 4),
SUBSTRB('����Ŭ����Ŭ', 3, 4)
FROM dual;



-- ��� �������̺��� ������� �Ի��Ͽ��� �Ի�⵵�� �Ի��� ���� ����
-- ��, ����� ����� �÷����� �����̸�, �⵵, ���� ���� �ǵ��� �Ͻÿ�.

--Q 9���� �Ի��� ����� ������ ����
SELECT ename "�����̸�", 19||SUBSTR(hiredate,1,2) "�⵵", SUBSTR(hiredate,4,2) "��"
FROM emp
WHERE SUBSTR(hiredate,4,2) = '09';

-- trim() : ���� ����
-- ltrim() /rtrim()
SELECT ltrim('  OORACLE')
FROM dual;

-- �������Լ� : ��¥�Լ�, ����ȯ�Լ�, �Ϲ��Լ�
-- ��¥�Լ� : date(��¥ ������) �ùٸ� ��¥�������� ��µ�
-- ��¥ + ���� : �־��� ��¥���� ������ �Ⱓ��ŭ ���� ��¥�� ����ؼ� ����
-- ��¥ - ���� : �־��� ��¥���� ������ �Ⱓ��ŭ ���� ��¥�� ���
-- ��¥ - ��¥ : �� ��¥������ �Ⱓ�� ����
-- SYSDATE : ���� �ý��ۿ� ��ϵ� ��¥�� ��ȯ
SELECT sysdate FROM dual;
-- sysdate + 1 : ����
-- sysdate - 1 : ����
-- months_between( , ) : �� ��¥������ �������� ���ϴ� �Լ�

-- Q. �������� ���̺��� �Ի糯¥�� �̿��Ͽ� �������� �ٹ��� �������� ����
SELECT ename, sysdate, hiredate, months_between(sysdate, hiredate) "�ٹ�������"
FROM emp;

-- add_months() : Ư�� �������� ���� ��¥�� ���ϴ� �Լ�
-- �Ի糯¥���� 4���� �߰��� ��¥�� �����ϱ��
SELECT ename, hiredate, add_months(hiredate,4)
FROM emp;

-- next_day : �ش� ��¥�������� ������ ��õ� ���Ͽ� �ش��ϴ� ��¥�� ��ȯ���ִ� �Լ� (�������� ������ ���ϱ���)
SELECT sysdate, next_day(sysdate, '������')
FROM dual;

-- last_day : �ش� ���� ������ ��¥�� ��ȯ�ϴ� �Լ�
-- �������� �Ի��� ���� ������ ���� ����
SELECT ename, hiredate, last_day(hiredate)
FROM emp;