-- TABLE & SEQUENCE DROP
DROP TABLE MVC_BOARD;
DROP SEQUENCE MVC_BOARD_SEQ;

-- TABLE & SEQUENCE CREATE
CREATE TABLE MVC_BOARD(
    bID         NUMBER(6),
    bNAME       VARCHAR2(50)    NOT NULL,
    bTITLE      VARCHAR2(100)   NOT NULL,
    bCONTENT    VARCHAR2(1000),
    bDATE       DATE            DEFAULT SYSDATE NOT NULL,   --작성일
    bHIT        NUMBER(6)       DEFAULT 0 NOT NULL,         --조회수  
    bGROUP      NUMBER(6)       NOT NULL, --원글이면 BID와 같고, 답변글의 경우 원글의 BGROUP과 같다
    bSTEP       NUMBER(3)       NOT NULL, -- 같은 그룹내 출력 순서                 
    bINDENT     NUMBER(3)       NOT NULL, -- 들여쓰기 정도
    bIP         VARCHAR2(20)    NOT NULL, -- 글쓴이 IP주소
    PRIMARY KEY(bID)
);

CREATE SEQUENCE MVC_BOARD_SEQ
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;

-- DUMMY DATA
INSERT INTO MVC_BOARD (bID, bNAME, BTITLE, bCONTENT, bGROUP, bSTEP, bINDENT, bIP)
        VALUES(MVC_BOARD_SEQ.NEXTVAL, '홍','제목',NULL,MVC_BOARD_SEQ.CURRVAL,0,0,'192.1.1.1');
INSERT INTO MVC_BOARD (bID, bNAME, BTITLE, bCONTENT, bGROUP, bSTEP, bINDENT, bIP)
        VALUES(MVC_BOARD_SEQ.NEXTVAL, '김','비와',NULL,MVC_BOARD_SEQ.CURRVAL,0,0,'192.1.1.2');  
SELECT * FROM MVC_BOARD;

    -- 2번글의 답글
INSERT INTO MVC_BOARD (bID, bNAME, BTITLE, bCONTENT, bGROUP, bSTEP, bINDENT, bIP)
        VALUES (MVC_BOARD_SEQ.NEXTVAL, '이','답','답', 2, 1, 1, '127.0.0.1');

-- DAO에 들어갈 QUERY
-- 1. 글 목록 (startRow ~ endRow까지) id=boardList
SELECT * FROM MVC_BOARD ORDER BY bGROUP DESC, bSTEP;
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT * 
            FROM MVC_BOARD ORDER BY bGROUP DESC, bSTEP)A)
    WHERE RN BETWEEN 2 AND 3;
    
-- 2. 전체 글 갯수 id=totCnt
SELECT COUNT(*) FROM MVC_BOARD;

-- 3. 원글쓰기 id=insert
INSERT INTO MVC_BOARD (bID, bNAME, BTITLE, bCONTENT, bGROUP, bSTEP, bINDENT, bIP)
        VALUES(MVC_BOARD_SEQ.NEXTVAL, '홍','TITLE',NULL,MVC_BOARD_SEQ.CURRVAL,0,0,'192.1.1.1');
        
-- 4. BID로 조회수 1회 올리기 id=hitUp
UPDATE MVC_BOARD SET bHIT = bHIT + 1 
    WHERE bID = 1;

-- 5. bID로 DTO 가져오기 (글 상세보기, 글수정 VIEW, 답변글VIEW) id=content
SELECT * FROM MVC_BOARD WHERE bID = 1;

-- 6. 수정 id=modify
UPDATE MVC_BOARD 
    SET bNAME       = '홍수정',
        bTITLE      = '제목바꿈',
        bCONTENT    = '본문바꿈',
        bIP         = '163.1.1.1'
    WHERE bID = 1;

-- 7. 글 삭제 id=delete
DELETE FROM MVC_BOARD WHERE BID = 1;
SELECT * FROM MVC_BOARD;
SELECT * FROM MVC_BOARD WHERE BNAME LIKE '%김%' AND BTITLE LIKE '%%' AND BDATE LIKE '%1990%';
-- 8. 답변글 달기 전 작업 (STEP ⓐ : 예시에서는 2번글의 답변) id=preReply
UPDATE MVC_BOARD SET BSTEP = BSTEP + 1 
    WHERE BGROUP = 2 AND BSTEP > 0;

-- 9. 답변글 쓰기 (예시: 2번의 답변) id=reply
INSERT INTO MVC_BOARD (bID, bNAME, bTITLE, bCONTENT, bGROUP, bSTEP, bINDENT, bIP)
        VALUES (MVC_BOARD_SEQ.NEXTVAL, '진','T',NULL,2,1,1,'126.1.1.1');
COMMIT;
