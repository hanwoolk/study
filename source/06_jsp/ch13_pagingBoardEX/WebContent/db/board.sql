-- DROP & CREATE
DROP TABLE BOARD;
CREATE TABLE BOARD(
    NUM     NUMBER(5,0)     PRIMARY KEY,
    WRITER  VARCHAR2(30)    NOT NULL,
    SUBJECT VARCHAR2(100)   NOT NULL,
    CONTENT VARCHAR2(4000)  NOT NULL,
    EMAIL   VARCHAR2(30),
    READCOUNT   NUMBER(5,0) DEFAULT 0,
    PW      VARCHAR2(30)    NOT NULL,
    REF     NUMBER(5,0)     NOT NULL,
    RE_STEP NUMBER(3)       NOT NULL,
    RE_INDENT NUMBER(2)     NOT NULL,
    IP      VARCHAR2(30)    NOT NULL,
    RDATE   DATE            DEFAULT SYSDATE
);

SELECT * FROM BOARD;
-- 1. 글 갯수
SELECT COUNT(*) FROM BOARD;
-- 2. 글 목록(글 그룹이 최신인 글이 위로)
SELECT * FROM BOARD ORDER BY NUM DESC;
-- 2. 글 목록(20개씩 topN)
SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOARD ORDER BY NUM DESC) A)
    WHERE RN BETWEEN 11 AND 20;
-- 3. 글쓰기(원글쓰기) 
    -- 글번호(글 갯수)
SELECT NVL(MAX(NUM),0)+1 FROM BOARD;
    -- 글번호,글쓴이 ,글제목, 글본문, EMAIL, PW
INSERT INTO BOARD 
            (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)
            VALUES
            ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 'TEST1','제목1','본문1',NULL,'111',(SELECT NVL(MAX(NUM),0)+1 FROM BOARD),0,0,'192.169.0.1');

INSERT INTO BOARD 
            (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)
            VALUES
            ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 'TEST2','제목2','본문2',NULL,'111',(SELECT NVL(MAX(NUM),0)+1 FROM BOARD),0,0,'192.169.0.1');
-- 4. 글번호로 글 상세보기(DTO) 내용 가져오기
SELECT * FROM BOARD WHERE NUM=1;

-- 5. 조회수 올리기
UPDATE BOARD SET READCOUNT = READCOUNT+1 WHERE NUM=1;

-- 6. 글 수정
UPDATE BOARD SET SUBJECT = '수정된 제목1',
                 CONTENT = '수정된 본문1',
                 EMAIL   = 'TEST1@TEST1.COM',
                 PW      = '111',
                 IP      = '127,0,0,1'
             WHERE NUM=1;
-- 7. 글 삭제
COMMIT;
DELETE FROM BOARD WHERE NUM=1 AND PW='111';
ROLLBACK;

--조회수 조작
UPDATE BOARD SET READCOUNT = 20 WHERE NUM=1;
COMMIT;
SELECT * FROM BOARD;


