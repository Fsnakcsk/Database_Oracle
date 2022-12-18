-- DDL : CREATE table - 새로운 테이블을 생성하는  SQL 명령어
CREATE TABLE emp01(
    empno NUMBER(4),
    ename VARCHAR2(20),
    sal NUMBER(7,2) -- 7자리까지 
);

desc emp01

-- 테이블삭제
DROP table emp02;

-- 기존 테이블 확인
SELECT * FROM emp;
-- 새로운 테이블을 생성할 때 기존에 테이블과 동일한 구조로 이루어진 테이블 생성시
-- 구조 뿐만 아니라 내용까지 복사해 생성한다.
CREATE TABLE emp02 AS SELECT * FROM emp;
SELECT * FROM emp02;

-- 기준의 테이블에 일부 필드를 복사해서 새로운 테이블 생성
CREATE TABLE emp03 AS SELECT empno, ename FROM emp;
SELECT * FROM emp03;

-- 기존 테이블의 구조만 이용하여 새로운 테이블 생성
CREATE TABLE emp05 AS SELECT * FROM emp WHERE 1=0; 
DESC emp05;
SELECT * FROM emp05;
-- 1과0은 같을 수 없으니까 그래서 이스턴스 조건이 맞지 않아 복사 되니 않음 구조만 복사하게 됨

-- 부서번호가 10번인 직원에 정보를 확인
SELECT * FROM emp WHERE deptno =10;
CREATE TABLE emp04 AS SELECT *
                      FROM emp
                      WHERE deptno = 10;
SELECT * FROM emp04;

-- DDL : ALTER TABLE 변경 컴럼의 (추가, 수정, 삭제)시 사용
-- ALTER TABLE ~ ADD : 기존 테이블에 새로운 속성을 추가하는 명령어
DESC emp01;
ALTER TABLE emp01 ADD job VARCHAR2(9);

-- ALTER MODIFY : 기존 테이블에 속성을 수정하는 명령어
-- 수정할 속성에 자료가 없는 경우 : 데이터타입 변경, 컴럼의 크기 변경 가능 (데이터 유실될 수 있음)
-- 수정할 속성에 자료가 있는 경우 : 데이터 타입 변경 불가능 => 가능하되 기존 데이터 타입 크기보다 커야 함, 작으면 안됨.
-- 인스턴스가 존재하더라도 CHAR와 CHACHAR2 사이의 타입은 변경이 가능
SELECT * FROM emp01;
ALTER TABLE emp01 MODIFY job VARCHAR2(30);

-- ALTER TABLE 테이블명 DROP COLUMN : 테이블에 존재하는 컬럼을 삭제
ALTER TABLE emp01 DROP COLUMN job;

-- DDL : DROP TABLE : 테이블을 제거하는 명령어
-- 한 번 제거된 테이블은 복구할 수 없다.
-- ROLLBACK 복원

DESC emp01
DROP TABLE emp01;

-- 테이블 삭제시 주의할 수항
-- 무결성 제약 조건에 있는 테이블은 삭제할 수 없다
-- 삭제하고자 하는 테이블의 고본키나 고유키를 다른 테이블에서 참조하고 있는 경우

-- DDl - rename 테이블명 to 새로운 이름: 테이블명을 변경
-- 기존에 사용하는 테이블의 이름을 변경
SELECT * FROM test;
RENAME emp05 to test;

-- --------------------------------------------------------------------------------------------

-- DML : 조작어, 인스턴스 단위로 조작
-- DML : SELECT, FROM, WHERE
--        조회    주소    조건
SELECT empno, job, sal
FROM emp;


-- INSERT -------------------------------------------

SELECT empno, job, sal
FROM emp
-- WHERE /* 참/거지 */; /* = <> != > >= < <= */


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
    h_no NUMBER PRIMARY KEY, -- 기본키(개체 무결성 제약)
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


-- UPDATE 테이블명 SET 필드명 -------------------------------------------
-- WHERE 절을 사용하지 않을 경우, 모든 레코드에 값이 변경된다.
DROP TABLE emp01;
CREATE TABLE emp01 AS SELECT * FROM emp;
SELECT * FROM emp01;

-- 모든 사원의 부서번호를 30번으로 수정
UPDATE emp01
SET deptno = 30;

-- 사원의 급여를 10% 인상하는 하는 쿼리문 작성
UPDATE emp01
SET sal = sal*1.1;

-- 모든 직원의 입사일을 노늘로 변경하시오
UPDATE emp01
SET hiredate = sysdate;

--테이블 제거
DROP TABLE emp01;
CREATE TABLE emp01 AS SELECT * FROM emp;

UPDATE emp01
SET deptno = 40
WHERE deptno = 10;

-- Q job이 MANAGER인 직원만 급여를 10% 인상하는 쿼리문을 기술하시오
UPDATE emp01
SET sal = sal*1.1
WHERE job = 'NAMAGER';

-- Q 1981년에 입사한 직원의 입사일을 오늘로 변경하시오
UPDATE emp01
SET hiredate = sysdate
WHERE substr(hiredate,1,2) = '81';

--테이블 제거
DROP TABLE emp01;
CREATE TABLE emp01 AS SELECT * FROM emp;
SELECT * FROM emp01;

-- Q. scoot 사원의 부서번호는 20, job은 MANAGER로 변경하시오
UPDATE emp01
SET job = 'MANAGER', deptno = 20
WHERE ename = 'SCOTT';

-- Q. soctt의 입사날짜를 오늘로, 급여는 50으로, 커미션은 400으로
UPDATE emp01
SET hiredate = sysdate, sal = 50, comm = 400
WHERE ename = 'SCOTT';

-- Q.부서번호가 20번이 부서의 지역명을 부서본호가 40번의 지역명으로 변경
UPDATE dept01
SET loc = (SELECT loc
           FROM dept01
           WHERE deptno = 40)
WHERE deptno = 20;

-- DELETE ~ FROM ~(WHWERE) -------------------------------------------
-- WHERE를 명시하지 않으면 싹 다 삭제하게 됨.***
-- Q. 부서번호가 30번인 레코드를 삭제하시오
DROP TABLE dept01;
CREATE TABLE dept01 AS SELECT * FROM dept;
SELECT * FROM dept01;

DELETE
FROM dept01
WHERE deptno = 30;

DROP TABLE emp01;
CREATE TABLE emp01 AS SELECT * FROM emp;

--테이블 제거
DROP TABLE emp01;
CREATE TABLE emp01 AS SELECT * FROM emp;
SELECT * FROM emp01;  -- 사원
SELECT * FROM dept01; -- 부서

-- Q. 사원테이블 부서명 'SALES'인 부서에 근무하는 모든 사원들을 삭제하시오
DELETE 
FROM emp01
WHERE deptno = (SELECT deptno
                FROM dept01
                WHERE dname = 'SALES');

-- DCL 무결성, 병행수행 권한 트랜잭션처리 ----------------------------
-- COMMIT : 변경 내용을 데이터베이스에 영구 저장,
-- 자동 commit 되는 경우 : DDL, DCL 명령문이 수행되는 경우, 정상종료
-- 자동 ROLLBACK 되는 경우 : 비정상종료, 정전 혹은 컴퓨터 다운
-- ROLLBACK : 지난 상태로 되돌리기
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
ROLLBACK; -- COMMIT 하고나서 다시 ROLLBACK 할 수 없다, 이미 저장 했기 때문이다.
-- 

-- 무결성 제약 조건 : 유효성 검사 규칙 --
-- 테이블에 부적절한 자료가 입력되는 것을 방지하기 위해 테이블을 생성할 때 설정함
-- 무결성 : 정확성을 유지
-- 제약 조건 : 바람직하지 않은 데이터의 저장을 방지함.

SELECT * FROM emp;
DESC emp;
SELECT * FROM dept;
DESC dept;

-- PRIMARY KEY (기본키) NULL, 중복을 허용하지 않고 식별이 가능한 유일한 값이어야 함.
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

-- 기본키와 외래키 설정
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


