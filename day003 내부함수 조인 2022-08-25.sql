-- 형(data type) 변환 함수 : 숫자, 문자, 날짜 데이터형을 다른 데이터형으로 변환하는 함수
-- 데이터 타입 종류 : number, character date
-- to_number()
-- to_char() : 날짜형 또는 숫자형을 문자형으로 변환하는 함수
-- to_date()

-- to_char() : 날짜형 또는 숫자형을 문자형으로 변환하는 함수 --
SELECT SYSDATE FROM dual;

-- format(서식): (yy / yyyy),  (mm / m),  (dd)
SELECT SYSDATE, to_char(SYSDATE,'yyyyy-mm-dd') FROM dual;

-- 사원들의 입사일을 출력하되, 요일을 함께 출력하시오.
SELECT ename, hiredate, to_char(hiredate,'yyyy-mm-dd day') FROM emp;

-- 현재 시스템의 날짜와 시간을 출력하는 쿼리문 작성
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss') FROM dual;

-- L : 각 지역별 통화 기호가 붙는다.
-- 숫자를 대신 사용되는 기호 : 0과 9 
-- 에이터에 값이 8 => 서식기호 00점 : 08점 또는 or 99점 : 8점
-- 1000 => 서식기호 0,000원 : 1,000원
-- 8000 => 서식기호 0,000원 : 0,800원
-- 자릿수가 맞지 않을 경우 0은 0으로 채우고 9는 채우지 않는다.
SELECT ename, sal, to_char(sal,'L999,999') FROM emp;

-- to_date : *문자형*을 날짜형으로 변환하는 함수
-- 기본 날짜 형식 : yy/mm/dd
-- 123456-0 주민등록증 앞자리 날짜형으로 변환하는 것을 활용할 수 있다
SELECT ename, hiredate, to_date(substr(hiredate,7,2),'dd')
FROM emp;
WHERE to_date(19810220,'yyyy-mm-dd day');

-- to_number : 문자나 날짜 형식의 데이터를 숫자형으로 변환하는 함수
-- 20,000과 10,000 값 사이의 차를 알아보는 쿼리문
SELECT to_char(to_number('20,000','99,999') - to_number('10,000','99,999'),'99,999')
FROM dual;

-- NVL(value,대체값)함수 : NULL을 다른 값으로 변환하는 함수
-- 직원의 연봉을 게산해 출력하는 쿼리문을 기술
-- 연봉을 직원의 급여 * 12 + comm
SELECT ename, sal, sal*12 + NVL(comm,0) as "연봉"
FROM emp;

-- GROUP BY (Group Function) : 하나 이상의 행을 그룹으로 묶어서 연산을 하는 함수
-- SUM : 해당 컴럼에 총합을 구하는 함수
-- 사원들의 급여의 총합을 출력하는 쿼리문을 기술
SELECT ename, sum(sal)
FROM emp;

-- comm의 총합을 구하시오
-- 그룹함수는 다른 연산자와 갈리 해당 컬럼값이 NULL인 것은 제외하고 계산한다.
SELECT sum(comm) FROM emp;

-- avg() : 해당 컬럼괎에 평균을 구하는 함수
-- 직원 급여의 평균을 계산하는 쿼리문을 기술하시오
SELECT ROUND(avg(sal)) FROM emp;

-- MAX/MIN 최댓값과 최소괎
-- 가정 급여와 낮은 겨여를 추출
SELECT MAX(sal) "최대급여", MIN(sal) "최소급여"
FROM emp;

-- 가장 높은 급여를 받는 직원의 이름과 급여를 추출
SELECT ename, sal
FROM emp
GROUP BY 
HAVING sal = MAX(sal) , sal = MIN(sal);

-- count() : 조건에 맞는 행의 개수를 반환하는 함수
-- count() : 함수에 특정 컬럼을 답으면 해당 컬럼에 값을 담고 있는 행의 개수를 반환
-- count() : 함수는 NULL 값에 대한 개수를 세지 않는다
-- 직원의 수를 추출하는 쿼리문 기술하시오
SELECT COUNT(ename) FROM emp;
SELECT COUNT(comm) FROM emp;

--Q 직원들이 담당하는 업무의 건수를 계산하여 추출
SELECT COUNT(DISTINCT job)  FROM emp;

-- GROUP BY 절
-- 특정 칼럼을 기준으로 그룹화하여 해당 그룸화하여 해당 그룹에 존재하는 레코드를 대상으로 소집
-- 그룹함수를 사용하되, 특정 컬럼을 대상으로 적용하지를 기술할 때 
-- Q 부서별 급여의 합을 출력하는 쿼리문을 기술하시오
SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno;

-- Q 소속부서별 급여의 총합과 평균급여를 추출하는 쿼리를 기술히시오
-- 단, 부서번호, 총급여, 평균급여 라는 컴럼명을 표시하시오.
SELECT deptno "부서번호", SUM(sal) "총급여", ROUND(AVG(sal)) "평균급여"
FROM emp
GROUP BY deptno;

-- 부서별 사원수와 커미션을 받는 사원의 수를 추출하는 쿼리문을 기술하시오
SELECT deptno, COUNT(*), COUNT(comm)
FROM emp
WHERE 
GROUP BY deptno;

-- HAVING 절 : GROUP BY에 의한 조건
-- Q부설별 평균급여를 출력하시오
SELECT deptno, ROUND(AVG(sal))
FROM emp
GROUP BY deptno
HAVING AVG(sal) >= 2000;

-- Q 부서별 직위별로 직급단위 급여의 평균을 추출하시오
SELECT deptno, job, TRUNC(AVG(sal))
FROM emp
GROUP BY deptno, job
ORDER BY deptno;

SELECT deptno, ename, AVG(sal)
FROM emp
WHERE sal <= 3000
GROUP BY deptno;
HAVING AVG(sal) >= 2000; -- 틀림

-- JOIN 조인 : 하나 이상의 테이블을 연결하여 
-- 직원이름, 부서본호, 부서명을 추출하시오
-- 직접연결연산자(direct 연산자 : .)
SELECT ename, e.deptno, dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- cartesian product: 카디션 프로덕트
-- 두 개 이상의 테이블에 존재하는 모든 데이터를 검색 결과로 갖는다.
-- 두 개 이상의 테이블에 공통에 컬럼이 존재하지 않을 경우
SELECT * 
FROM emp, dept;

-- equal join : 공통의 컬럼을 대상으로 테이블을 연결하는 기능
-- Q 사원정보를 출력하되, 해당 사원의 부서에 대한 상세 정보가 삼세출력 되도록 하시오
SELECT empno, ename, e.deptno, dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- 이름이 SCOTT인 사원의 부서명을 찾아 이름과 부서명이 출력하시오
SELECT ename, dname
FROM emp, dept
WHERE ename = 'SCOTT' AND emp.deptno = dept.deptno;

-- 서브쿼리 : 쿼리안에 또 다른 쿼리를 담아서 표현하는 것
SELECT dname
FROM dept
WHERE deptno IN (SELECT deptno
                 FROM emp
                 WHERE ename = 'SCOTT');

-- 급여가 2500이하 이고, 사원번호가 9999 이하인 사원의 정보를 출력하시오
SELECT empno, ename, sal, e.deptno, dname, loc
FROM emp e, dept d
WHERE sal <= 2500 AND empno <= 9999 AND e.deptno = d.deptno;

-- non-equi join : 동알한 컬럼의 값이 없고 크거나 작거나 하는 경우
SELECT ename, sal, grade
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal;

-- Q *********************
SELECT ename, dname, grade
FROM emp e, dept d, salgrade s
WHERE e.deptno = d.deptno AND sal BETWEEN losal AND hisal;

-- self-join : 자기 자신과 조인을 하는 기법
-- 일반적으로 조인은 여러개의 테이블을 연결하는 기법이지만 하나의 테이블 안에서
-- 조인을 해야 정보를 얻어내는 경우에 사용한다.
-- Q 직원 테이블을 이용하여 해당 직원의 상사의 이름을 보이시오
SELECT e.ename, m.ename
FROM emp e, emp m
WHERE e.MGR = m.empno;

-- OUTER JOIN : 외부조인
-- 조인 조건에 맞고하지 않는 행도 나타내는 조인 기법 (NULL)
-- Left outer Join / Right Outer join
SELECT e.ename, m.ename
FROM emp e, emp m
WHERE e.MGR = m.empno(+); -- (+) 오른쪽에 있으면 Left outer join이다

-- 서브쿼리
SELECT dname 
FROM dept
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE ename = 'SCOTT');
                
-- 단일행 서브 쿼리 : 수행 결과가 오직 하나의 행으로만 반환하는 것
-- 단일행 비교 연산자 : = (같다), <>(같지않다), >, >=, <, <=
-- Q 사원들의 평균보다 더 많은 급여를 받는 사원의 이름을 추출
SELECT ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal)
             FROM emp);
             
-- Q scott의 급여와 동일하거나 더 많이 받는 사원의 이름과 급여를 추출하시오
SELECT ename, sal
FROM emp
WHERE sal >= (SELECT sal
              FROM emp
              WHERE ename = 'SCOTT');
              
-- 다중행 서브 쿼리 : 서브쿼리의 결과가 두 개 이상인 것
-- 다중행 연산자 : IN, ANY, some, all,

-- IN : 메인 쿼리의 비교 조건이 서브쿼리의 결과 중에서 하나라도 일치하면 참
-- 급여가 3000 이상 받는 직원의 부서와 동일한 부서에 근무하는 직원의 정보를 추출
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 3000 
AND deptno IN (SELECT DISTINCT deptno
               FROM emp);

SELECT, sal, deptno
FROM emp
-- WHERE deptno IN (10,20) = WHERE deptno IN (10 or DESTINCT 20)

-- any, some : 메인 쿼리의 비교 조건이 서브쿼리의 결과와 하나 이상 일치하념 참
-- < any : 찾은 값에 대하여 하나라도 크면 참
-- > any : 찾은 값에 대하여 하나라도 작으면 참
-- 부서번호가 30번인 사원의 급여중 가장 작은 값(950) 보다 높은 급여를 받는 사원에 정보 보시이소

SELECT ename, sal
FROM emp
WHERE sal > any (SELECT sal 
                 FROM emp 
                 WHERE deptno = 30);

-- all : 메인 쿼리의 비교 조건이 서브쿼리의 결과와 모두 일치하면 참
-- < all : 최소값 반환
-- > all : 최댓값 반환
-- 부서번호가 30번인 사원의 급여중 가장 많이 받는 사원보다 더 높은 급여를 받는 사원 정보 추출 
SELECT sal FROM emp WHERE deptno = 30;

SELECT ename, sal
FROM emp
WHERE sal > all (SELECT sal 
                 FROM emp 
                 WHERE deptno = 30);

-- EXISTS : 메인 쿼리의 비교 조건이 서브쿼리의 결과중에 만족하는 값이 하나라도 존재하면 참
-- IN, any, some 있는 값을 가지고 함
-- EXISTS 값이 존재 하느냐 않느냐 
-- deptno가 10, 20ㅇ니 데이터가 존재한다면 , emp 테이블에 해당 컬럼을 ㅜ출
SELECT ename,deptno, sal
FROM emp
WHERE deptno IN (10, 20);

SELECT ename,deptno, sal
FROM emp
WHERE deptno FROM dept d WHERE d.deptno 