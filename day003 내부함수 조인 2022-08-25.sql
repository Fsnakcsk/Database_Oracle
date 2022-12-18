-- ��(data type) ��ȯ �Լ� : ����, ����, ��¥ ���������� �ٸ� ������������ ��ȯ�ϴ� �Լ�
-- ������ Ÿ�� ���� : number, character date
-- to_number()
-- to_char() : ��¥�� �Ǵ� �������� ���������� ��ȯ�ϴ� �Լ�
-- to_date()

-- to_char() : ��¥�� �Ǵ� �������� ���������� ��ȯ�ϴ� �Լ� --
SELECT SYSDATE FROM dual;

-- format(����): (yy / yyyy),  (mm / m),  (dd)
SELECT SYSDATE, to_char(SYSDATE,'yyyyy-mm-dd') FROM dual;

-- ������� �Ի����� ����ϵ�, ������ �Բ� ����Ͻÿ�.
SELECT ename, hiredate, to_char(hiredate,'yyyy-mm-dd day') FROM emp;

-- ���� �ý����� ��¥�� �ð��� ����ϴ� ������ �ۼ�
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss') FROM dual;

-- L : �� ������ ��ȭ ��ȣ�� �ٴ´�.
-- ���ڸ� ��� ���Ǵ� ��ȣ : 0�� 9 
-- �����Ϳ� ���� 8 => ���ı�ȣ 00�� : 08�� �Ǵ� or 99�� : 8��
-- 1000 => ���ı�ȣ 0,000�� : 1,000��
-- 8000 => ���ı�ȣ 0,000�� : 0,800��
-- �ڸ����� ���� ���� ��� 0�� 0���� ä��� 9�� ä���� �ʴ´�.
SELECT ename, sal, to_char(sal,'L999,999') FROM emp;

-- to_date : *������*�� ��¥������ ��ȯ�ϴ� �Լ�
-- �⺻ ��¥ ���� : yy/mm/dd
-- 123456-0 �ֹε���� ���ڸ� ��¥������ ��ȯ�ϴ� ���� Ȱ���� �� �ִ�
SELECT ename, hiredate, to_date(substr(hiredate,7,2),'dd')
FROM emp;
WHERE to_date(19810220,'yyyy-mm-dd day');

-- to_number : ���ڳ� ��¥ ������ �����͸� ���������� ��ȯ�ϴ� �Լ�
-- 20,000�� 10,000 �� ������ ���� �˾ƺ��� ������
SELECT to_char(to_number('20,000','99,999') - to_number('10,000','99,999'),'99,999')
FROM dual;

-- NVL(value,��ü��)�Լ� : NULL�� �ٸ� ������ ��ȯ�ϴ� �Լ�
-- ������ ������ �Ի��� ����ϴ� �������� ���
-- ������ ������ �޿� * 12 + comm
SELECT ename, sal, sal*12 + NVL(comm,0) as "����"
FROM emp;

-- GROUP BY (Group Function) : �ϳ� �̻��� ���� �׷����� ��� ������ �ϴ� �Լ�
-- SUM : �ش� �ķ��� ������ ���ϴ� �Լ�
-- ������� �޿��� ������ ����ϴ� �������� ���
SELECT ename, sum(sal)
FROM emp;

-- comm�� ������ ���Ͻÿ�
-- �׷��Լ��� �ٸ� �����ڿ� ���� �ش� �÷����� NULL�� ���� �����ϰ� ����Ѵ�.
SELECT sum(comm) FROM emp;

-- avg() : �ش� �÷����� ����� ���ϴ� �Լ�
-- ���� �޿��� ����� ����ϴ� �������� ����Ͻÿ�
SELECT ROUND(avg(sal)) FROM emp;

-- MAX/MIN �ִ񰪰� �ּҁ�
-- ���� �޿��� ���� �ܿ��� ����
SELECT MAX(sal) "�ִ�޿�", MIN(sal) "�ּұ޿�"
FROM emp;

-- ���� ���� �޿��� �޴� ������ �̸��� �޿��� ����
SELECT ename, sal
FROM emp
GROUP BY 
HAVING sal = MAX(sal) , sal = MIN(sal);

-- count() : ���ǿ� �´� ���� ������ ��ȯ�ϴ� �Լ�
-- count() : �Լ��� Ư�� �÷��� ������ �ش� �÷��� ���� ��� �ִ� ���� ������ ��ȯ
-- count() : �Լ��� NULL ���� ���� ������ ���� �ʴ´�
-- ������ ���� �����ϴ� ������ ����Ͻÿ�
SELECT COUNT(ename) FROM emp;
SELECT COUNT(comm) FROM emp;

--Q �������� ����ϴ� ������ �Ǽ��� ����Ͽ� ����
SELECT COUNT(DISTINCT job)  FROM emp;

-- GROUP BY ��
-- Ư�� Į���� �������� �׷�ȭ�Ͽ� �ش� �׷�ȭ�Ͽ� �ش� �׷쿡 �����ϴ� ���ڵ带 ������� ����
-- �׷��Լ��� ����ϵ�, Ư�� �÷��� ������� ���������� ����� �� 
-- Q �μ��� �޿��� ���� ����ϴ� �������� ����Ͻÿ�
SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno;

-- Q �ҼӺμ��� �޿��� ���հ� ��ձ޿��� �����ϴ� ������ ������ÿ�
-- ��, �μ���ȣ, �ѱ޿�, ��ձ޿� ��� �ķ����� ǥ���Ͻÿ�.
SELECT deptno "�μ���ȣ", SUM(sal) "�ѱ޿�", ROUND(AVG(sal)) "��ձ޿�"
FROM emp
GROUP BY deptno;

-- �μ��� ������� Ŀ�̼��� �޴� ����� ���� �����ϴ� �������� ����Ͻÿ�
SELECT deptno, COUNT(*), COUNT(comm)
FROM emp
WHERE 
GROUP BY deptno;

-- HAVING �� : GROUP BY�� ���� ����
-- Q�μ��� ��ձ޿��� ����Ͻÿ�
SELECT deptno, ROUND(AVG(sal))
FROM emp
GROUP BY deptno
HAVING AVG(sal) >= 2000;

-- Q �μ��� �������� ���޴��� �޿��� ����� �����Ͻÿ�
SELECT deptno, job, TRUNC(AVG(sal))
FROM emp
GROUP BY deptno, job
ORDER BY deptno;

SELECT deptno, ename, AVG(sal)
FROM emp
WHERE sal <= 3000
GROUP BY deptno;
HAVING AVG(sal) >= 2000; -- Ʋ��

-- JOIN ���� : �ϳ� �̻��� ���̺��� �����Ͽ� 
-- �����̸�, �μ���ȣ, �μ����� �����Ͻÿ�
-- �������Ῥ����(direct ������ : .)
SELECT ename, e.deptno, dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- cartesian product: ī��� ���δ�Ʈ
-- �� �� �̻��� ���̺� �����ϴ� ��� �����͸� �˻� ����� ���´�.
-- �� �� �̻��� ���̺� ���뿡 �÷��� �������� ���� ���
SELECT * 
FROM emp, dept;

-- equal join : ������ �÷��� ������� ���̺��� �����ϴ� ���
-- Q ��������� ����ϵ�, �ش� ����� �μ��� ���� �� ������ �＼��� �ǵ��� �Ͻÿ�
SELECT empno, ename, e.deptno, dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- �̸��� SCOTT�� ����� �μ����� ã�� �̸��� �μ����� ����Ͻÿ�
SELECT ename, dname
FROM emp, dept
WHERE ename = 'SCOTT' AND emp.deptno = dept.deptno;

-- �������� : �����ȿ� �� �ٸ� ������ ��Ƽ� ǥ���ϴ� ��
SELECT dname
FROM dept
WHERE deptno IN (SELECT deptno
                 FROM emp
                 WHERE ename = 'SCOTT');

-- �޿��� 2500���� �̰�, �����ȣ�� 9999 ������ ����� ������ ����Ͻÿ�
SELECT empno, ename, sal, e.deptno, dname, loc
FROM emp e, dept d
WHERE sal <= 2500 AND empno <= 9999 AND e.deptno = d.deptno;

-- non-equi join : ������ �÷��� ���� ���� ũ�ų� �۰ų� �ϴ� ���
SELECT ename, sal, grade
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal;

-- Q *********************
SELECT ename, dname, grade
FROM emp e, dept d, salgrade s
WHERE e.deptno = d.deptno AND sal BETWEEN losal AND hisal;

-- self-join : �ڱ� �ڽŰ� ������ �ϴ� ���
-- �Ϲ������� ������ �������� ���̺��� �����ϴ� ��������� �ϳ��� ���̺� �ȿ���
-- ������ �ؾ� ������ ���� ��쿡 ����Ѵ�.
-- Q ���� ���̺��� �̿��Ͽ� �ش� ������ ����� �̸��� ���̽ÿ�
SELECT e.ename, m.ename
FROM emp e, emp m
WHERE e.MGR = m.empno;

-- OUTER JOIN : �ܺ�����
-- ���� ���ǿ� �°����� �ʴ� �൵ ��Ÿ���� ���� ��� (NULL)
-- Left outer Join / Right Outer join
SELECT e.ename, m.ename
FROM emp e, emp m
WHERE e.MGR = m.empno(+); -- (+) �����ʿ� ������ Left outer join�̴�

-- ��������
SELECT dname 
FROM dept
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE ename = 'SCOTT');
                
-- ������ ���� ���� : ���� ����� ���� �ϳ��� �����θ� ��ȯ�ϴ� ��
-- ������ �� ������ : = (����), <>(�����ʴ�), >, >=, <, <=
-- Q ������� ��պ��� �� ���� �޿��� �޴� ����� �̸��� ����
SELECT ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal)
             FROM emp);
             
-- Q scott�� �޿��� �����ϰų� �� ���� �޴� ����� �̸��� �޿��� �����Ͻÿ�
SELECT ename, sal
FROM emp
WHERE sal >= (SELECT sal
              FROM emp
              WHERE ename = 'SCOTT');
              
-- ������ ���� ���� : ���������� ����� �� �� �̻��� ��
-- ������ ������ : IN, ANY, some, all,

-- IN : ���� ������ �� ������ ���������� ��� �߿��� �ϳ��� ��ġ�ϸ� ��
-- �޿��� 3000 �̻� �޴� ������ �μ��� ������ �μ��� �ٹ��ϴ� ������ ������ ����
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 3000 
AND deptno IN (SELECT DISTINCT deptno
               FROM emp);

SELECT, sal, deptno
FROM emp
-- WHERE deptno IN (10,20) = WHERE deptno IN (10 or DESTINCT 20)

-- any, some : ���� ������ �� ������ ���������� ����� �ϳ� �̻� ��ġ�ϳ� ��
-- < any : ã�� ���� ���Ͽ� �ϳ��� ũ�� ��
-- > any : ã�� ���� ���Ͽ� �ϳ��� ������ ��
-- �μ���ȣ�� 30���� ����� �޿��� ���� ���� ��(950) ���� ���� �޿��� �޴� ����� ���� �����̼�

SELECT ename, sal
FROM emp
WHERE sal > any (SELECT sal 
                 FROM emp 
                 WHERE deptno = 30);

-- all : ���� ������ �� ������ ���������� ����� ��� ��ġ�ϸ� ��
-- < all : �ּҰ� ��ȯ
-- > all : �ִ� ��ȯ
-- �μ���ȣ�� 30���� ����� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ��� ���� ���� 
SELECT sal FROM emp WHERE deptno = 30;

SELECT ename, sal
FROM emp
WHERE sal > all (SELECT sal 
                 FROM emp 
                 WHERE deptno = 30);

-- EXISTS : ���� ������ �� ������ ���������� ����߿� �����ϴ� ���� �ϳ��� �����ϸ� ��
-- IN, any, some �ִ� ���� ������ ��
-- EXISTS ���� ���� �ϴ��� �ʴ��� 
-- deptno�� 10, 20���� �����Ͱ� �����Ѵٸ� , emp ���̺� �ش� �÷��� ����
SELECT ename,deptno, sal
FROM emp
WHERE deptno IN (10, 20);

SELECT ename,deptno, sal
FROM emp
WHERE deptno FROM dept d WHERE d.deptno 