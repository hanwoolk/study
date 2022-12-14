-- 테이블 삭제
DROP TABLE STUDENT;
DROP TABLE MAJOR;

-- 테이블 생성
CREATE TABLE MAJOR(
    MAJOR_CODE          NUMBER(1),
    MAJOR_NAME          VARCHAR2(60),
    Major_OFFICE_LOC    VARCHAR2(10),
    PRIMARY KEY(MAJOR_CODE)
);
SELECT * FROM MAJOR;
DESC MAJOR;

CREATE TABLE STUDENT(
    student_code    NUMBER(3)       PRIMARY KEY,
    student_NAME    VARCHAR2(21),
    SCORE           NUMBER(3)       CHECK(SCORE BETWEEN 0 AND 100),
    MAJOR_CODE      NUMBER(1),
    FOREIGN KEY (MAJOR_CODE) REFERENCES MAJOR(MAJOR_CODE)
);
SELECT * FROM STUDENT;
DESC STUDENT;

-- DATA INSERT

--MAJOR
INSERT INTO MAJOR VALUES(1, '컴퓨터공학', 'A101호');
INSERT INTO MAJOR VALUES(2, '빅데이터', 'A102호');

--STUDENT
INSERT INTO STUDENT VALUES(101, '홍길동', 99, 1);
INSERT INTO STUDENT VALUES(102, '신길동', 100, 2);

-- 출력
-- 학번   이름  점수  학과코드    학과명     학과사무실
-- 101   홍길동 99     1       컴퓨터공학  A101호 
-- 101   신길동 100    2       빅데이터    A102호 

SELECT STUDENT_CODE 학번, STUDENT_NAME 이름, SCORE 점수, 
    S.MAJOR_CODE 학과코드, MAJOR_NAME 학과명, MAJOR_OFFICE_LOC 학과사무실
FROM MAJOR M, STUDENT S
WHERE M.MAJOR_CODE = S.MAJOR_CODE;