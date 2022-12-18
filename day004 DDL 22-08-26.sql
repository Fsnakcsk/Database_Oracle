-- DDL : CREATE table - ���ο� ���̺��� �����ϴ�  SQL ��ɾ�
CREATE TABLE emp01(
    empno NUMBER(4),
    ename VARCHAR2(20),
    sal NUMBER(7,2) -- 7�ڸ����� 
);

desc emp01

-- ���̺����
DROP table emp02;

-- ���� ���̺� Ȯ��
SELECT * FROM emp;
-- ���ο� ���̺��� ������ �� ������ ���̺�� ������ ������ �̷���� ���̺� ������
-- ���� �Ӹ� �ƴ϶� ������� ������ �����Ѵ�.
CREATE TABLE emp02 AS SELECT * FROM emp;
SELECT * FROM emp02;

-- ������ ���̺� �Ϻ� �ʵ带 �����ؼ� ���ο� ���̺� ����
CREATE TABLE emp03 AS SELECT empno, ename FROM emp;
SELECT * FROM emp03;

-- ���� ���̺��� ������ �̿��Ͽ� ���ο� ���̺� ����
CREATE TABLE emp05 AS SELECT * FROM emp WHERE 1=0; 
DESC emp05;
SELECT * FROM emp05;
-- 1��0�� ���� �� �����ϱ� �׷��� �̽��Ͻ� ������ ���� �ʾ� ���� �Ǵ� ���� ������ �����ϰ� ��

-- �μ���ȣ�� 10���� ������ ������ Ȯ��
SELECT * FROM emp WHERE deptno =10;
CREATE TABLE emp04 AS SELECT *
                      FROM emp
                      WHERE deptno = 10;
SELECT * FROM emp04;

-- DDL : ALTER TABLE ���� �ķ��� (�߰�, ����, ����)�� ���
-- ALTER TABLE ~ ADD : ���� ���̺� ���ο� �Ӽ��� �߰��ϴ� ��ɾ�
DESC emp01;
ALTER TABLE emp01 ADD job VARCHAR2(9);

-- ALTER MODIFY : ���� ���̺� �Ӽ��� �����ϴ� ��ɾ�
-- ������ �Ӽ��� �ڷᰡ ���� ��� : ������Ÿ�� ����, �ķ��� ũ�� ���� ���� (������ ���ǵ� �� ����)
-- ������ �Ӽ��� �ڷᰡ �ִ� ��� : ������ Ÿ�� ���� �Ұ��� => �����ϵ� ���� ������ Ÿ�� ũ�⺸�� Ŀ�� ��, ������ �ȵ�.
-- �ν��Ͻ��� �����ϴ��� CHAR�� CHACHAR2 ������ Ÿ���� ������ ����
SELECT * FROM emp01;
ALTER TABLE emp01 MODIFY job VARCHAR2(30);

-- ALTER TABLE ���̺�� DROP COLUMN : ���̺� �����ϴ� �÷��� ����
ALTER TABLE emp01 DROP COLUMN job;

-- DDL : DROP TABLE : ���̺��� �����ϴ� ��ɾ�
-- �� �� ���ŵ� ���̺��� ������ �� ����.
-- ROLLBACK ����

DESC emp01
DROP TABLE emp01;

-- ���̺� ������ ������ ����
-- ���Ἲ ���� ���ǿ� �ִ� ���̺��� ������ �� ����
-- �����ϰ��� �ϴ� ���̺��� ��Ű�� ����Ű�� �ٸ� ���̺��� �����ϰ� �ִ� ���

-- DDl - rename ���̺�� to ���ο� �̸�: ���̺���� ����
-- ������ ����ϴ� ���̺��� �̸��� ����
SELECT * FROM test;
RENAME emp05 to test;

-- --------------------------------------------------------------------------------------------

-- DML : ���۾�, �ν��Ͻ� ������ ����
-- DML : SELECT, FROM, WHERE
--        ��ȸ    �ּ�    ����
SELECT empno, job, sal
FROM emp;


-- INSERT -------------------------------------------

SELECT empno, job, sal
FROM emp
-- WHERE /* ��/���� */; /* = <> != > >= < <= */


-- INSERT INTO ~ VALUES ~ -------------------------------------------
CREATE TABLE dept01 AS SELECT * FROM dept WHERE 1=0;
DESC dept01
SELECT * FROM dept01;

INSERT INTO dept01 VALUES(10, 'ACCOUNTING', 'NEW YOURK');

INSERT INTO dept01 (deptno, dname) 
            VALUES(20, 'RESEARCH');

INSERT INTO dept01 (deptno, dname, loc)
            VALUES(30, 'SALES', 'CHICAGO');
            
CREATE TABLE sample(
    h_no NUMBER PRIMARY KEY, -- �⺻Ű(��ü ���Ἲ ����)
    h_name VARCHAR2(10) NOT NULL,
    score NUMBER
);

INSERT INTO sample (h_no, h_name, score)
            VALUES(1234, 'AAA', 88);
            
INSERT INTO sample (h_no, h_name, score)
            VALUES(1234, 'BBB', 99);
            
INSERT INTO sample (h_no, h_name, score)
            VALUES(2345, 'BBB', 89);

INSERT INTO sample (h_no, h_name, score)
            VALUES(3456, 'CCC', 97);
            
INSERT INTO sample (h_no, h_name, score)
            VALUES(7777,'ddd', 100);
            
SELECT * FROM sample;


-- UPDATE ���̺�� SET �ʵ�� -------------------------------------------
-- WHERE ���� ������� ���� ���, ��� ���ڵ忡 ���� ����ȴ�.
DROP TABLE emp01;
CREATE TABLE emp01 AS SELECT * FROM emp;
SELECT * FROM emp01;

-- ��� ����� �μ���ȣ�� 30������ ����
UPDATE emp01
SET deptno = 30;

-- ����� �޿��� 10% �λ��ϴ� �ϴ� ������ �ۼ�
UPDATE emp01
SET sal = sal*1.1;

-- ��� ������ �Ի����� ��÷� �����Ͻÿ�
UPDATE emp01
SET hiredate = sysdate;

--���̺� ����
DROP TABLE emp01;
CREATE TABLE emp01 AS SELECT * FROM emp;

UPDATE emp01
SET deptno = 40
WHERE deptno = 10;

-- Q job�� MANAGER�� ������ �޿��� 10% �λ��ϴ� �������� ����Ͻÿ�
UPDATE emp01
SET sal = sal*1.1
WHERE job = 'NAMAGER';

-- Q 1981�⿡ �Ի��� ������ �Ի����� ���÷� �����Ͻÿ�
UPDATE emp01
SET hiredate = sysdate
WHERE substr(hiredate,1,2) = '81';

--���̺� ����
DROP TABLE emp01;
CREATE TABLE emp01 AS SELECT * FROM emp;
SELECT * FROM emp01;

-- Q. scoot ����� �μ���ȣ�� 20, job�� MANAGER�� �����Ͻÿ�
UPDATE emp01
SET job = 'MANAGER', deptno = 20
WHERE ename = 'SCOTT';

-- Q. soctt�� �Ի糯¥�� ���÷�, �޿��� 50����, Ŀ�̼��� 400����
UPDATE emp01
SET hiredate = sysdate, sal = 50, comm = 400
WHERE ename = 'SCOTT';

-- Q.�μ���ȣ�� 20���� �μ��� �������� �μ���ȣ�� 40���� ���������� ����
UPDATE dept01
SET loc = (SELECT loc
           FROM dept01
           WHERE deptno = 40)
WHERE deptno = 20;

-- DELETE ~ FROM ~(WHWERE) -------------------------------------------
-- WHERE�� ������� ������ �� �� �����ϰ� ��.***
-- Q. �μ���ȣ�� 30���� ���ڵ带 �����Ͻÿ�
DROP TABLE dept01;
CREATE TABLE dept01 AS SELECT * FROM dept;
SELECT * FROM dept01;

DELETE
FROM dept01
WHERE deptno = 30;

DROP TABLE emp01;
CREATE TABLE emp01 AS SELECT * FROM emp;

--���̺� ����
DROP TABLE emp01;
CREATE TABLE emp01 AS SELECT * FROM emp;
SELECT * FROM emp01;  -- ���
SELECT * FROM dept01; -- �μ�

-- Q. ������̺� �μ��� 'SALES'�� �μ��� �ٹ��ϴ� ��� ������� �����Ͻÿ�
DELETE 
FROM emp01
WHERE deptno = (SELECT deptno
                FROM dept01
                WHERE dname = 'SALES');

-- DCL ���Ἲ, ������� ���� Ʈ�����ó�� ----------------------------
-- COMMIT : ���� ������ �����ͺ��̽��� ���� ����,
-- �ڵ� commit �Ǵ� ��� : DDL, DCL ��ɹ��� ����Ǵ� ���, ��������
-- �ڵ� ROLLBACK �Ǵ� ��� : ����������, ���� Ȥ�� ��ǻ�� �ٿ�
-- ROLLBACK : ���� ���·� �ǵ�����
drop table dept01;
CREATE TABLE dept01 AS SELECT * FROM dept;
SELECT * FROM dept01;
--
DELETE FROM dept01;
ROLLBACK;
--
DELETE 
FROM dept01
WHERE deptno = 20;
COMMIT;
ROLLBACK; -- COMMIT �ϰ��� �ٽ� ROLLBACK �� �� ����, �̹� ���� �߱� �����̴�.
-- 

-- ���Ἲ ���� ���� : ��ȿ�� �˻� ��Ģ --
-- ���̺� �������� �ڷᰡ �ԷµǴ� ���� �����ϱ� ���� ���̺��� ������ �� ������
-- ���Ἲ : ��Ȯ���� ����
-- ���� ���� : �ٶ������� ���� �������� ������ ������.

SELECT * FROM emp;
DESC emp;
SELECT * FROM dept;
DESC dept;

-- PRIMARY KEY (�⺻Ű) NULL, �ߺ��� ������� �ʰ� �ĺ��� ������ ������ ���̾�� ��.
DROP TABLE dept01;
CREATE TABLE dept01 AS SELECT * FROM dept;

SELECT * FROM dept01;
INSERT INTO dept01 VALUES(10, 'TEST', 'BUSAN');

DROP TABLE dept02;
CREATE TABLE dept02(
    deptno NUMBER(2) PRIMARY KEY,
    dname VARCHAR2(20),
    loc VARCHAR(20)
);

INSERT INTO dept02 VALUES(10,'ACCOUNTING', 'NEW YORK');
INSERT INTO dept02 VALUES(10,'TEST', 'BUSAM');
INSERT INTO dept02 VALUES(20,'RESEARCH', 'DALLAS');
INSERT INTO dept02 VALUES(30,'SALLES', 'CHICAGO');
INSERT INTO dept02 VALUES(40,'TEST', 'BOSTON');
INSERT INTO dept02 VALUES(50,'TEST2', 'BOSTON2');

-- �⺻Ű�� �ܷ�Ű ����
DROP TABLE emp06;
select * FROM dept02;
CREATE TABLE emp06(
    empno NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(10) NOT NULL,
    job VARCHAR2(9),
    deptno NUMBER(2) REFERENCES dept02(deptno)
);

select * from emp06;
INSERT INTO emp06 VALUES(1111,'aaa','a',10);
INSERT INTO emp06 VALUES(2222,'bbb','b',20);
INSERT INTO emp06 VALUES(3333,'ccc','c',30);
INSERT INTO emp06 VALUES(4444,'ccc','c',40);
INSERT INTO emp06 VALUES(5555,'ccc','c',50);


-- QQQQQQQQQQQQQQ --


