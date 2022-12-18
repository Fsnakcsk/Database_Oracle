-- comment(주석) : 샐행과 상관 없이 설명을 담을 때 사용하는 구문
/* 
여러 줄에 결쳐 주석을 담을 때 사용하는 구문
*/

show user  -- 현재 접속 계정을 확인하는 SQL PLUS명령어

-- 현재 접속된 계정에 포함된 테이블 확인
-- tab == tables

SELECT * FROM tab; -- 모든 테이블 조회

-- DESC : 
--       (1) 특정 테이블의 구조를 확인하는 명령
--       (2) 조회시 내림차순으로 출력
-- emp employee의 약자로 특정 회사의 직원정보를 담고 있는 테이블
desc emp  --SQL문이 아니다
desc dept
SELECT * FROM dept;

-- SQL 언어 : 정의어(DDL), 조작어(DML), 제어어(DCL)
-- 정의어 : create(생성), later(변경), drop(제거)
-- 조작어 : SELECT(추출), insert(삽입), update(수정), dalete(삭제)
-- 제어어 : 무결성 ,  병행수행 , 권한 부여 등
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

-- scott 계정이 가지고 있는 테이블의 목록을 확인
SELECT * FROM tab;

--salgrade 테이블의 목록(내용)을 확인
SELECT * FROM salgrade;

-- Q1. dept 테이블은 부서정보를 가지고 있는 테이블이다. 부서정보의 내용을 확인
SELECT * FROM dept;

-- 부서테이블(DEPT)에 부서리름(DNAME)만 추출
SELECT dname FROM dept;

-- 부서테이블(dept)에 부서이름(dname), 위치(loc), 추출
SELECT dname, loc FROM dept;

-- EMP 테이블에 14명의 사원 데이터가 저장된 것을 확인 할 수 있다
SELECT * FROM emp;

SELECT empno, ename, job FROM emp;
--예약어(keywrd) : 의미와 용도가 정해진 명령어로 다른 용도로 사용할 수 없음

--직원 테이블에서 직원이름과 급여를 추출
SELECT ename, sal, sal+100 AS "인상급여"
FROM emp;

-- 급여가 2500을 초과 하는 직원의 몰록을 추출하시오
SELECT *
FROM emp
WHERE sal > 2500;

-- 직원테이블에 직원중 부서번호가 20인 사원에 과한 정보를 추출
SELECT *
FROM EMP
WHERE deptno = 20;

-- 이름(ename)이 FORD인 사원의 사번 (empno), 이름 (ename), 급여(sal)추출
SELECT empno, ename, sal
FROM emp
WHERE ename = 'FORD';

-- 문자, 날짜, 시간등은 따움표('',"") 안에 담아야 한다
-- 필드명은 대소문자를 구별하지 않지만, 레코드는 반드시 대소문자를 구별해야한다

-- 입사일이 1982년 1월 1일 이후인 사원에 정보를 추출하시오.
SELECT *
FROM emp
WHERE hiredate >= '82/1/1';

-- 직원의 부서본호가 10인 직원의 정보를 추출
SELECT *
FROM emp
WHERE deptno = 10;

-- 직원의 부서본호가 10 아닌 직원의 정보를 추출
SELECT *
FROM emp
WHERE NOT deptno = 10; 
-- WHERE deptno != 10;
-- WHERE deptno <> 10;

-- 부서본호가 10이거나  직군(JOB)'MANAGER'인 직원의 정보 추출
SELECT *
FROM emp
WHERE (deptno = 10) OR (job = 'MANAGER');

-- -- 부서본호가 10이고  직군(JOB)'MANAGER'인 직원의 정보 추출
SELECT *
FROM emp
WHERE (deptno = 10) AND (job = 'MANAGER');

-- 급여가 2000 이상 300이하인 사원 사원
SELECT *
FROM emp
WHERE sal BETWEEN 2000 and 3000;
-- WHERE (sal >= 2000) AND (sal <= 3000);
-- BETWEEN : 숫자형, 문자형, 날짜형 모드 사용이 가능

--q 급여가 2000 미만이거나 3000 초과한 가원 정보 추출
SELECT *
FROM emp
WHERE sal NOT BETWEEN 2000 and 3000;
-- WHERE (sal <= 2000) OR (sal >= 3000);

-- IN 포함이 되어 있냐
-- 커미션(comm)이 300 혹은 1400인 사원의 정보를 추출하시오
SELECT *
FROM emp
WHERE comm IN (300, 1400);
-- WHERE comm = 300 OR comm = 1400;


-- 커미션(comm)이 300 혹은 1400 아닌 사원의 정보를 추출하시오
SELECT *
FROM emp
WHERE comm NOT IN (300, 1400);
-- WHERE comm != 300 AND comm != 1400; 중요*********

-- LIKE ~같이, 처럼
-- 와일드카드 문자 or 만능 문자 : % , _

-- 사원의 이름에 첫글자가 'c'로 시작하는 사원의 이름을 추출하시오
SELECT ename
FROM emp
WHERE ename LIKE 'C%'; --좌

SELECT ename
FROM emp
WHERE ename NOT LIKE 'C%'; --우

SELECT ename
FROM emp
WHERE ename LIKE '%E%'; -- 좌중우

-- 사원의 이름에 두 번째 글자가 'A'
SELECT ename
FROM emp
WHERE ename LIKE '_A%';

-- 사원의 이름에 두 번째 글자가 'A' 아닌 사람의 이름
SELECT ename
FROM emp
WHERE ename NOT LIKE '_A%';

-- NULL 의미 : 미확정, 알수 없는 값
-- NULL은 연산 불가, 활당, 비교 할 수 없다
-- IN NULL, IN NOT NULL

--사원테이블에 커미선이 null인 사원의 정보를 추출하시오
SELECT empno, ename, comm
FROM emp
WHERE comm IS NULL;

--사원테이블에 커미선이 null이 아닌 사원의 정보를 추출하시오
SELECT empno, ename, comm
FROM emp
WHERE comm IS NOT NULL;

-- SELECT와 확장해서 사용하는 order by절
-- 정렬 : 특정 필드에 따라 순서대로 나열하는 것
-- 정렬방식 : 기본 ASC(오름차), DESC(내림차순)
-- 숫자, 문자, 날짜, NULL, 

-- 사원의 급여를 기준으로 오름차순 정렬하여 추출하시오.
SELECT *
FROM emp
ORDER BY sal ASC;

-- 가장 최근에 입사한 사원순서로 추출
SELECT *
FROM emp
ORDER BY hiredate DESC;

-- 사원의 급여를 기준으로 오름차순 정렬하되 , 동일한 급여를 받는 사원의 이름으로 내림차순 출력
SELECT *
FROM emp
ORDER BY sal, ename DESC;

-- DISTINCT : 중복을 제거하고 추출 *********
-- 사원 테이블에서 부서번호를 추출
SELECT DISTINCT deptno
FROM emp;

-- 별칭(Nick Name) : 빌드명에 별명을 부여
SELECT ename, sal * 12 "연봉" -- AS 생략 가능
FROM emp; 

-- 연결연산자 : SELECT문 내부에 "||" 기준에 컬럼에 특정 문자열을 추가할 때, 문자열과 문자열을 연결하는 연산자 
SELECT ename || '씨의 직군은 '  || job || '입니다.'
FROM emp;

-- dual 테이블 : 한 행의 결과를 출력하기 위해 사용하는 임시 테이블
-- 간단한 계산식 :  30 * 50
SELECT 30 * 50
FROM dual;

desc dual;

SELECT *
FROM dual;

SELECT sysdate
FROM dual;

-- 숫자함수 : 숫자 데이터를 처리하기 위해 사용하는 함수
-- abs : 절대값
SELECT -10, abs(-10)
FROM dual;

-- floor : 소숫점 아래를 무조건 버리는 함수 (반올림 안함)
SELECT 42.195, floor(42.195)
FROM dual;

-- round : 특정 자릿수에서 반올림하는 함수
-- round (숫자, 자릿수)
SELECT 34.5678, round(34.5678)
FROM dual;

SELECT 34.5678, round(34.5678,2)
FROM dual;

SELECT 34.5678, round(34.5678,-1) -- 소수점 왼쪽 위치 즉 4가 반올림 안되니까 0으로 변함
FROM dual;

-- TRUNC : : 특정 자릿수에서 잘라내는 함수
-- TRUNC :숫자, 자릿수)
-- 자릿수에 2인 경우 : 소숫점 이하 세번째 자리에서 버림 연산 수행
SELECT trunc(34.5678,2), 
trunc(34.5678,-1), -- 4은 0으로
trunc(34.5678),
trunc(34.5678,0) --소숫자리 다 버림
FROM dual;

-- MOD : 나머지를 되돌려 주는 함수
-- MOD (숫자, 나누는 수)
SELECT MOD(27,2), MOD(27,5), MOD(27, 7)
from dual;

-- 문자 처리 함수 : 문자 데이터를 처리하는 함수 --
-- UPPER() : 대문자로 변환
SELECT 'Welcome to oracle'"적용전", UPPER('Welcome to Oracle') "UPPER 적용"
FROM dual;
    
-- LOWER() : 소문자로 변환
SELECT 'Welcome to oracle'"적용전", LOWER('Welcome to Oracle') "LOWER 적용"
FROM dual;

-- INITCAP() : 첫글만자 대문자로, 나무지는 소문자로 변환
SELECT 'WELCOME TO ORACLE'"적용전", INITCAP('WELCOME TO ORACLE') "INITCAP 적용"
FROM dual;

-- LENGHT() : 문자 길이를 구하는 함수
SELECT LENGTH('Oracle'), LENGTH('오라클')
FROM dual;

-- LENGTHB() : 문자길이를  바이트 수로 알려주는 함수
SELECT LENGTHB('Oracle'), LENGTHB('오라클')
FROM dual;

-- instr (in string) : 특정 문자의 위치를 구하는 함수
SELECT INSTR('Welcome to Oracle', 'O') --코딩과 다르게 (0부터 시작하는 것이 아니고 1부터 시작함)
FROM dual;

-- substr(문자열, 시작위치, 글자수) : 문자열에서 시작위치에서 글자수만큼 추출 
SELECT substr('Welcome to oracle',4,4)
FROM dual;

-- substr() : 함수는 한글/한자를 1바이트로 보지만, substrb()는 2바이트로 본다
-- substrb() : 문자열의 일부분만 가져와라는 바이트수로 추출
SELECT SUBSTR('엘컴투오라클', 3, 4),
SUBSTRB('오라클오라클', 3, 4)
FROM dual;



-- 사원 정보테이블에서 사원들의 입사일에서 입사년도와 입사한 달을 추출
-- 단, 추출된 결과의 컬럼명은 직원이름, 년도, 월이 추출 되도록 하시오.

--Q 9월에 입사한 사원의 정보를 추출
SELECT ename "직원이름", 19||SUBSTR(hiredate,1,2) "년도", SUBSTR(hiredate,4,2) "월"
FROM emp
WHERE SUBSTR(hiredate,4,2) = '09';

-- trim() : 공백 제거
-- ltrim() /rtrim()
SELECT ltrim('  OORACLE')
FROM dual;

-- 단일행함수 : 날짜함수, 형변환함수, 일반함수
-- 날짜함수 : date(날짜 디이터) 올바른 날짜형식으로 출력됨
-- 날짜 + 숫자 : 주어진 날짜부터 숫자의 기간만큼 지난 날짜를 계산해서 추출
-- 날짜 - 숫자 : 주어진 날짜에서 숫자의 기간만큼 이전 날짜를 계산
-- 날짜 - 날짜 : 두 날짜사이의 기간을 추출
-- SYSDATE : 현재 시스템에 등록된 날짜를 반환
SELECT sysdate FROM dual;
-- sysdate + 1 : 내일
-- sysdate - 1 : 어제
-- months_between( , ) : 두 날짜사이의 개월수를 구하는 함수

-- Q. 직원정보 테이블의 입사날짜를 이용하여 직원들의 근무한 개월수를 추출
SELECT ename, sysdate, hiredate, months_between(sysdate, hiredate) "근무개월수"
FROM emp;

-- add_months() : 특정 개월수를 더한 날짜를 구하는 함수
-- 입사날짜에서 4개월 추가한 날짜를 추출하기오
SELECT ename, hiredate, add_months(hiredate,4)
FROM emp;

-- next_day : 해당 날짜에서부터 시작해 명시된 요일에 해당하는 날짜를 반환해주는 함수 (다음주의 오늘의 요일까지)
SELECT sysdate, next_day(sysdate, '수요일')
FROM dual;

-- last_day : 해당 당의 마지막 날짜를 반환하는 함수
-- 직원들의 입사한 달의 마지막 날을 추출
SELECT ename, hiredate, last_day(hiredate)
FROM emp;