-- CustomerDao(아이디중복체크, 회원가입, 로그인, 상세보기(pk로dto가져오기), 정보수정, top-N 리스트, 회원수)
-- 1. 아이디 중복체크
SELECT COUNT(*) FROM CUSTOMER WHERE CID ='aaa';
-- 2. 회원가입
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH)
    VALUES  ('ggg','111','칠길동','010-7777-7777','ggg@ggg.com','안양시 7동','m','1997-7-7');
-- 3. 로그인
SELECT COUNT(*) FROM CUSTOMER WHERE CID = 'aaa' AND CPW = '111';
-- 4. 상세보기(pk로dto가져오기)
SELECT * FROM CUSTOMER WHERE CID = 'aaa';
-- 5. 정보수정
UPDATE CUSTOMER SET CPW         = '1111',
                    CNAME       = '김김김',
                    CTEL        = '010-777-7777',
                    CEMAIL      = 'GGG@GGG.com',
                    CADDRESS    = '서울시 7동',
                    CBIRTH      = '1990-3-3',
                    CGENDER     = 'f'
            WHERE CID = 'aaa';
-- 6. top-N 리스트
 -- 완성된 top-N
    SELECT * 
        FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT * 
                FROM CUSTOMER ORDER BY CID) A)
        WHERE RN BETWEEN 1 AND 3;
-- 7 . 회원수
SELECT COUNT(*) FROM CUSTOMER;
-- FileboardDao(top-N 리스트, 글갯수, 글쓰기(원글 1개쿼리, 답변글 2개쿼리), hit올리기, 글 상세보기, 글수정, 글삭제)
-- 1. 글 목록
    SELECT F.*, CNAME, CEMAIL
        FROM FILEBOARD F, CUSTOMER C
        WHERE F.CID = C.CID
        ORDER BY FREF DESC, FRE_STEP;
SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM(SELECT F.*, CNAME, CEMAIL
                FROM FILEBOARD F, CUSTOMER C
                WHERE F.CID = C.CID
                ORDER BY FREF DESC, FRE_STEP) A)
    WHERE RN BETWEEN 2 AND 3;
    
-- 2. 글 갯수
SELECT COUNT(*) FROM FILEBOARD;
-- 3. 글쓰기
INSERT INTO FILEBOARD 
           (FNUM, CID, FSUBJECT, FCONTENT, FFILENAME, FPW, FREF, FRE_STEP, FRE_LEVEL, FIP)
    VALUES (FILEBOARD_SEQ.NEXTVAL, 'ccc', '글3','본문',NULL,'1',
            FILEBOARD_SEQ.CURRVAL, 0, 0, '192.0.0.1');
SELECT * FROM FILEBOARD WHERE FNUM=4;
SELECT * FROM FILEBOARD;
-- 4. 답변글 쓰기 전 STEP A --4번글에 대한 답변글 쓰기 전작업
UPDATE FILEBOARD SET FRE_STEP = FRE_STEP+1 WHERE FREF=4 AND FRE_STEP>0;
-- 5. 답변글 쓰기 -- 4번글의 갑변
INSERT INTO FILEBOARD 
           (fNUM, CID, fSUBJECT, fCONTENT, fFILENAME, fPW, fREF, fRE_STEP, fRE_LEVEL, fIP)
    VALUES (FILEBOARD_SEQ.NEXTVAL, 'bbb', '글3-답1', null,null, '1', 4, 1, 1, '192.1.1.1');
-- 6. 글 상세보기
SELECT F.*, CNAME, CEMAIL FROM FILEBOARD F, CUSTOMER C WHERE F.CID=C.CID AND FNUM=149;
-- 7. 조회수 올리기
UPDATE FILEBOARD SET FHIT=FHIT+1 WHERE FNUM=4;
-- 8. 글수정
UPDATE FILEBOARD SET FSUBJECT  = '제목T',
                     FCONTENT  = '본문T',
                     FFILENAME = NULL,
                     FPW       = '111',
                     FIP       = '123,0,0,1'
            WHERE FNUM = 4;
-- 9. 글 삭제
COMMIT;
DELETE FROM FILEBOARD  WHERE FNUM=4 AND FPW=1;
ROLLBACK;
-- BookDao(top-N 리스트, 책갯수, 책등록, 상세보기)
SELECT * FROM BOOK ORDER BY BRDATE DESC;-- 신간 도서 순으로 전체 리스트 출력
SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK ORDER BY BRDATE DESC) A)
    WHERE RN BETWEEN 2 AND 3; -- 완성된 top-N

-- 2. 등록된 책 갯수
SELECT COUNT(*) FROM BOOK;

-- 3. 책등록
INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '이것은 자바다', 30000, 'noImg.png','NOTHING.JPG','책설명',20);
    
-- 4. 책 상세보기(bID로 dto가져오기)
SELECT * FROM BOOK WHERE BID=1;
select * from customer;
COMMIT;