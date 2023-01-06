-- 프로그램 요구사항에 필요한 DML
-- 기능별 QUERY 작성(1, 2, 3)
--1
INSERT INTO PERSON 
    VALUES (pNO.NEXTVAL,'홍길동', 
    (SELECT jNO FROM JOB WHERE jNAME='가수'),95,95,95);

--2  직업별 조회후 총점을 추가하여 총점이 높은 순으로 이름(번호)로 출력 없으면 없다고 출력
SELECT ROWNUM RANK, A.*
  FROM (SELECT PNAME||'('||pNO||'번)' pNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT TOTAL
            FROM PERSON P, JOB J
            WHERE P.jNO=J.jNO AND jNAME='배우'
            ORDER BY TOTAL DESC) A;

--3. 데이터베이스에 입력된 사람 전체를 조회 후 총점을 추가하여 총점이 높은 순으로 출력한다
SELECT ROWNUM RANK, A.*
  FROM (SELECT PNAME||'('||pNO||'번)' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT TOTAL
            FROM PERSON P, JOB J
            WHERE P.jNO=J.jNO
            ORDER BY TOTAL DESC) A;