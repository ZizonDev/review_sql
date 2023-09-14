--정렬을 위한 ORDER BY 절
SELECT * FROM EMP
ORDER BY SAL asc;           --asc는 오름차순을 의미.

--사원 번호를 기준으로 정렬하기
SELECT * FROM EMP
ORDER BY EMPNO desc;        --desc는 내림차순을 의미.

--여러 column 기준으로 정렬하기
SELECT * FROM EMP           --정렬조건이 없으면 기본적으로 오름차순 정렬.
ORDER BY SAL, ENAME;        --먼저 SAL 기준 오름차순 정렬 후, SAL이 같으면 ENAME 오름차순.
      
SELECT * FROM EMP
ORDER BY SAL, ENAME DESC;   --ENAME은 내림차순으로...

--연결 연산자(||) : SELECT문 조회 시 COLUMN 사이에 특정 문자를 넣고 싶을 때 사용.
SELECT ENAME || 'S JOB IS ' || JOB AS EMPLOYEE
FROM EMP;

-----------------------------------------------------------------------------------------------
--[실습 문제 1]
--1. 사원 이름이 S로 끝나는 사원 데이터 출력.
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

--2. 부서 30번에서 근무하는 사원 중 직책이 SALESMAN인 사원의 
--   사원 번호, 이름, 직책, 급여, 부서번호 출력.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 
AND JOB = 'SALESMAN';

--3. 부서 20번, 30번에서 근무하는 사원 중 급여가 2000 초과인 사원의
--   사원 번호, 이름, 급여, 부서 번호 출력.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(20,30) AND SAL > 2000;

--4. BETWEEN 연산자를 사용하지 않고 급여가 2000 이상, 3000 이하인 사원 데이터 출력.
SELECT *
FROM EMP
WHERE SAL >= 2000 AND sal <= 3000;

--5.사원 이름에 E가 포함되어 있는 30번 부서의 사원 중
--   급여가 1000~2000 사이가 아닌 사원 이름, 사원 번호, 급여, 부서 번호 출력.
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%' 
AND DEPTNO = 30
AND SAL NOT BETWEEN 1000 AND 2000;

--6. 추가 수당이 존재하지 않고 상급자가 존재하며, 직책이 MANAGER, CLERK인 사원 중
--   사원 이름의 두 번째 글자가 L이 아닌 사원의 정보 출력.
SELECT *
FROM EMP
WHERE COMM IS NULL 
AND MGR IS NOT NULL
AND JOB IN('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%'; 
-----------------------------------------------------------------------------------------------
--[실습 문제 2]
--1. EMP테이블에서 COMM의 값이 NULL이 아닌 직원 정보 조회.
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

--2. EMP테이블에서 COMM을 받지 못하는 직원 정보 조회.
SELECT *
FROM EMP
WHERE COMM IS NULL OR COMM = 0;

--3. EMP테이블에서 관리자가 없는 직원 정보 조회.
SELECT *
FROM EMP
WHERE MGR IS NULL;

--4. EMP테이블에서 급여를 많이 받는 직원 순으로 조회.
SELECT *
FROM EMP
ORDER BY SAL DESC;

--5. EMP테이블에서 급여가 같을 경우 COMM 기준 내림차순 정렬 조회.
SELECT *
FROM EMP
ORDER BY SAL DESC, COMM DESC;

--6. EMP테이블에서 사원 번호, 사원 이름, 직급, 입사일 조회. (입사일은 오름차순 정렬.)
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE ASC;

--7. EMP테이블에서 사원 번호, 사원 이름 조회. (사원 번호 기준 내림차순 정렬.)
SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO DESC;

--8. EMP테이블에서 사원 번호, 입사일, 사원 이름, 급여 조회.
--   (부서 번호 오름차순 정렬, 부서 번호가 같을 경우 입사일 기준 오름차순 정렬.)
SELECT EMPNO, HIREDATE, ENAME, SAL
FROM EMP
ORDER BY DEPTNO ASC, HIREDATE ASC;