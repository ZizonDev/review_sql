--DUAL TABLE : SYS 계정에서 제공하는 테이블.
--함수나 계산식을 테이블 참조 없이 실행해보기 위해 
--FROM 절에 사용하는 더미(DUMMY) 테이블
SELECT 20*30 FROM dual;
SELECT MOD(5, 4) FROM dual;

--문자 함수 : UPPER, LOWER, INITCAP
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

--UPPER 함수로 문자열 비교하기
SELECT *
FROM emp
WHERE UPPER(ename) = UPPER('james');

--오늘 날짜에 대한 정보 조회
SELECT SYSDATE FROM DUAL;

--EMP테이블에서 사원 번호, 사원 이름, 급여 조회
--(급여는 100단위 값만 출력, 급여 기준 내림차순 정렬)
SELECT EMPNO, ENAME, ROUND(SAL, -2)
FROM EMP
ORDER BY SAL DESC;

--EMP테이블에서 사원 번호가 홀수인 사원 조회
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 1;

--EMP테이블에서 사원 이름, 입사일 조회
--(입사일은 년도와 월을 분리 추출하여 출력)
SELECT ENAME, EXTRACT(YEAR FROM HIREDATE), EXTRACT(MONTH FROM HIREDATE)
FROM EMP;

--EMP테이블에서 9월에 입사한 직원 정보 조회
SELECT *
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 9;

--EMP테이블에서 81년도에 입사한 직원 정보 조회
SELECT *
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;

--EMP테이블에서 이름이 'E'로 끝나는 직원 정보 조회
SELECT *
FROM EMP
WHERE ENAME LIKE '%E';

--EMP테이블에서 이름의 세번째 글자가 'R'인 직원 정보 조회
SELECT *
FROM EMP
WHERE ENAME LIKE '__R%';

--EMP테이블에서 사원번호, 사원이름, 입사일, 입사일로부터 40년 되는 날짜 조회
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 40*12)
FROM EMP;

--EMP테이블에서 입사일로부터 38년 이상 근무한 직원 정보 조회
SELECT *
FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) / 12 >= 38;

--오늘 날짜에서 년도만 추출
SELECT EXTRACT(YEAR FROM SYSDATE)
FROM DUAL;

--자료형을 변환하는 형 변환 함수
--자동 형 변환 (EMPNO(NUMBER) + '500'(CHARACTER) -> NUMBER TYPE으로 자동 형 변환.)
SELECT EMPNO, ENAME, EMPNO + '500'
FROM EMP
WHERE ENAME = 'FORD';

--'ABC'는 숫자로 변환될 수 없기 때문에 ERROR 발생.
SELECT EMPNO, ENAME, EMPNO + 'ABC'
FROM EMP
WHERE ENAME = 'FORD';

--날짜, 숫자를 문자로 변환하는 TO_CHAR 함수
--주로 날짜 데이터를 문자 데이터로 변환하는 데 사용.
--JAVA의 SimpleDateFormat()과 유사함.
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "현재 날짜 시간"
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MON/DD HH24:MI:SS') AS "현재 날짜 시간"
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DDD HH24:MI:SS') AS "현재 날짜 시간"
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DAY HH24:MI:SS') AS "현재 날짜 시간"
FROM DUAL;

--다양한 형식으로 출력 하기
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS 세기,
    TO_CHAR(SYSDATE, 'YY') AS 연도,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS ') AS "년/월/일 시:분:초",
    TO_CHAR(SYSDATE, 'Q') AS 쿼터,
    TO_CHAR(SYSDATE, 'DD') AS 일,
    TO_CHAR(SYSDATE, 'DDD') AS 경과일,
    TO_CHAR(SYSDATE, 'HH') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH12') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH24') AS "24시간제",
    TO_CHAR(SYSDATE, 'W') AS 몇주차
FROM DUAL;

--여러 언어로 날짜(월) 출력하기
SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'MM') AS MM,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MON_KOR,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MON_ENG,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MONTH_KOR,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MONTH_ENG
FROM DUAL;

--여러 언어로 날짜(요일) 출력하기
SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'MM') AS MM,
     TO_CHAR(SYSDATE, 'DD') AS DD,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DY_KOR,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DY_ENG,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DAY_KOR,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DAY_JPN,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DAY_ENG
FROM DUAL;

--시간 형식 지정하여 출력하기
SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
     TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
     TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
FROM DUAL;

--숫자 데이터 형식을 지정하여 출력하기
SELECT SAL,
    TO_CHAR(SAL, '$999,999') AS SAL_S,
    TO_CHAR(SAL, '999,999') AS SAL_L,
    TO_CHAR(SAL, '999,999.00') AS SAL_1,
    TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
    TO_CHAR(SAL, '000999999.99') AS SAL_3,
    TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP

--TO_NUMBER() : NUMBER 타입으로 형 변환
SELECT TO_NUMBER('1300') - TO_NUMBER('1500')
FROM DUAL;

--TO_DATE() : 문자열로 명시된 날짜를 날짜 타입으로 형 변환
SELECT TO_DATE('23/09/15', 'YY/MM/DD')
FROM DUAL;

--1981년 6월 1일 이후에 입사한 사원 정보 출력하기
SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

--NULL 처리 함수 : NULL은 값이 할당되지 않음을 의미한다.
--NULL은 0과 공백과는 다른 의미를 갖는다. NULL은 연산 불가능.
--NVL( , ) : NVL(NULL인지 검사할 열, 앞의 열 데이터가 NULL인 경우 반환할 데이터)
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, NVL(COMM, 0), SAL+NVL(COMM, 0)
FROM EMP;

--NVL2( , , ) : NVL2(  , +NULL이 아닐 때 반환할 데이터 , NULL일 때 반환할 데이터)
SELECT EMPNO, ENAME, SAL, COMM, 
    NVL2(COMM, 'O', 'X') AS 성과급유무, 
    NVL2(COMM, SAL*12+COMM, SAL*12) AS 연봉
FROM EMP;

--NULLIF() : 두 값이 동일하면 NULL 반환, 동일하지 않으면 첫 번째 값 반환
SELECT NULLIF(10, 10), NULLIF('A', 'B')
FROM DUAL;

--DECODE : 주어진 데이터 값이 조건과 일치하면 해당 값 출력, OTEHRWISE 기본 값 출력.
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB,
        'MANAGER', SAL*1.1,
        'SALESMAN', SAL*1.05,
        'ANALYST', SAL,
        SAL*1.03) AS 연봉인상
FROM EMP;

--CASE 문
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL*1.03
    END AS 연봉인상
FROM EMP;

--열 값에 따라 출력 값이 달라지는 CASE 문
SELECT EMPNO, ENAME, COMM,
    CASE
        WHEN COMM IS NULL THEN '해당 사항 없음'
        WHEN COMM = 0 THEN '성과급 없음'
        WHEN COMM > 0 THEN '성과급 : ' || COMM
    END AS "성과급 기준"
FROM EMP;

------------------------------------------------------------------------------------
--[실습 문제 1]
SELECT EMPNO, RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
    ENAME, RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) = 5;

--[실습 문제 2]
SELECT EMPNO, ENAME, SAL, 
    TRUNC(SAL/21.5, 2) AS DAY_PAY, 
    ROUND(SAL/21.5/8, 1) AS TIME_PAY
FROM EMP;

--[실습 문제 3]
--TO CHAR : 날짜, 숫자 등의 값을 문자열로 변환
--NEXT_DAY(기준일자, 요일) : 기준일자 다음에 오는 날짜를 구하는 함수
--NVL(값, 지정값) : 값이 NULL이면 지정값으로 대체
SELECT EMPNO, ENAME, HIREDATE,
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), 'MON'), 'YYYY-MM-DD') AS R_JOB,
    NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM EMP;

--[실습 문제 4]
SELECT EMPNO, ENAME, MGR,
    CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR, 1, 2) = 75 THEN '5555'
        WHEN SUBSTR(MGR, 1, 2) = 76 THEN '6666'
        WHEN SUBSTR(MGR, 1, 2) = 77 THEN '7777'
        WHEN SUBSTR(MGR, 1, 2) = 78 THEN '8888'
        ELSE TO_CHAR(MGR)
    END AS CHG_MGR
FROM EMP;
------------------------------------------------------------------------------------
--다중 행 함수 : 여러 행에 대해 함수가 적용되어 하나의 결과를 나타냄.
--집계함수라고도 한다. LIKE SUM, AVG, ...
--이건 문제가 없음.
SELECT SUM(SAL)
FROM EMP;

--논리적 문제 발생.
SELECT SUM(SAL), EMPNO
FROM EMP;

--GROUP BY : BY 이후에 오는 기준에 따라 그룹으로 묶어 줌.
--부서 번호 별로 그룹핑 후 각 부서의 총 급여를 구하면 문제 해결. 
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO, SUM(SAL), COUNT(*), ROUND(AVG(SAL), 2), MAX(SAL), MIN(SAL)
FROM EMP
GROUP BY DEPTNO;