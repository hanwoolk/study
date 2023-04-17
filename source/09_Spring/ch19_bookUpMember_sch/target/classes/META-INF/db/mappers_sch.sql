--book
-- id = mainList (신간도서순 bookList)
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT * FROM BOOK ORDER BY BRDATE DESC)A) 
WHERE BNUM BETWEEN 1 AND 5;
-- id = bookList (startRow ~ endRow까지 schItem에따라 schWord로 검색한 bookList) 출력순서 : btitle 기준으로

    --(1)schItem이 null이거나 ''일 때
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT * FROM BOOK ORDER BY BTITLE)A) 
WHERE BNUM BETWEEN 1 AND 10;

    --(2)schItem이 all일 때
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT * FROM BOOK WHERE BTITLE LIKE '%'||'J'||'%' OR BWRITER LIKE '%'||'A'||'%' ORDER BY BTITLE)A) 
WHERE BNUM BETWEEN 1 AND 10;

    --(3)schItem이 btitle일 때
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT * FROM BOOK WHERE BTITLE LIKE '%'||'J'||'%' ORDER BY BTITLE)A) 
WHERE BNUM BETWEEN 1 AND 10;

    --(4)schItem이 bwriter일 때
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT * FROM BOOK WHERE BWRITER LIKE '%'||'A'||'%' ORDER BY BTITLE)A) 
WHERE BNUM BETWEEN 1 AND 10;

-- id = totCntBook (등록된 책 갯수)
SELECT COUNT(*) FROM BOOK;
    -- (1) schItem이 null이거나 ''일때
SELECT COUNT(*) FROM BOOK;
    -- (2) schItem이 'all'일때
SELECT COUNT(*) FROM BOOK WHERE BTITLE LIKE '%'||'J'||'%' OR BWRITER LIKE '%'||'A'||'%';
    -- (3) schItem이 'btitle 일때
SELECT COUNT(*) FROM BOOK WHERE BTITLE LIKE '%'||'J'||'%';
    -- (4) schItem이 'bwriter'일때
SELECT COUNT(*) FROM BOOK WHERE BWRITER LIKE '%'||'작가'||'%';
-- id = getDetailBook ( 책번호로 dto 가져오기)
SELECT * FROM BOOK WHERE BNUM = 1;
-- id = registerBook (책 등록)
INSERT INTO BOOK VALUES (BOOK_SQ.NEXTVAL, 'SPRING','김작가',SYSDATE, 'noImg.png','noImg.png','스프링개념서');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG1, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'JSP','박제이',SYSDATE, 'noImg.png','jsp 개념서');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG2, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'ORACLE','홍작가',SYSDATE, 'noImg.png','스프링개념서');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'JAVA','이자바',SYSDATE, '스프링개념서');
-- id = modifyBook( 책수정)
UPDATE BOOK SET BTITLE = 'SPRING',
                BWRITER = '김작가',
                BRDATE = SYSDATE,
                BIMG1 = 'noImg.png',
                BIMG2 = 'noImg.png',
                BINFO = '스프링개념서'
        WHERE BNUM = 1;
-- member
-- id = idConfirm(mid가 id인 데이터 갯수)
SELECT COUNT(*) FROM MEMBER WHERE MID='aaa';
SELECT * FROM MEMBER;
-- id = joinMember(회원가입)
INSERT INTO MEMBER(MID, MPW, MNAME, MMAIL, MPOST, MADDR) VALUES ('asdf','1','김이박','zool212@naver.com','11223','경기');
-- id = getDetailMember(mid로 Member dto 가져오기
SELECT * FROM MEMBER WHERE MID = 'asdf';
-- id = modifyMember(회원정보 수정)
UPDATE MEMBER SET MPW = '111',
                  MNAME = '최이박',
                  MMAIL = 'aaa@aaa.com',
                  MPOST = '443322',
                  MADDR = '서울'
            WHERE MID = 'asdf';
commit;