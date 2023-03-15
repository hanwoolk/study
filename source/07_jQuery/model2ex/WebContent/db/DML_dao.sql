-------------------------------------------------------------------------------
-------------------------------- MemberDao query-------------------------------
-------------------------------------------------------------------------------

-- (1-1) 회원id 중복체크
SELECT * FROM MVC_MEMBER WHERE MID='aaa';
-- (1-2) 회원 email 중복체크
SELECT COUNT(*) CNT FROM MVC_MEMBER WHERE MEMAIL='hong@naver.com';
-- (2) 회원가입
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('aaa','1','홍길동','hong@naver.com','NOIMG.JPG','1998/12/12','서대문');
COMMIT;
-- (3) 로그인
SELECT * FROM MVC_MEMBER WHERE mID='aaa' and mPW='1';
-- (4) mid로 dto가져오기(로그인 성공시 session에 넣기 위함)
SELECT * FROM MVC_MEMBER WHERE MID='aaa';
-- (5) 회원 정보 수정
UPDATE MVC_MEMBER 
    SET MPW       = '1',
        MNAME     = '송중기',
        MEMAIL    = 'SONG@S.COM',
        MPHOTO    = 'NOIMG.JPG',
        MBIRTH    = '1995-12-12',
        MADDRESS  = '서대문'
    WHERE MID = 'song';
-- (6)회원 리스트(TOP-N)
SELECT * FROM MVC_MEMBER ORDER BY MRDATE DESC; -- 신입회원순
SELECT *
    FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM MVC_MEMBER ORDER BY MRDATE DESC) A)
    WHERE RN BETWEEN 1 AND 3;
-- (7) 전체 등록된 회원수
SELECT COUNT(*) CNT FROM MVC_MEMBER;
-- (8) 회원탈퇴
DELETE FROM MVC_MEMBER WHERE MID='aaa';
COMMIT;

-------------------------------------------------------------------------------
-------------------------------- BoardDao query--------------------------------
-------------------------------------------------------------------------------

-- (1) 글 목록(startRow ~ endRow)
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
        FROM (SELECT * 
            FROM FILEBOARD ORDER BY FGROUP DESC, FSTEP) A)
    WHERE RN BETWEEN 1 AND 3;
-- (2) 글 갯수
SELECT COUNT(*) FROM FILEBOARD;
-- (3) 글 쓰기(원글쓰기)
INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME,
    fRDATE, fHIT, fGROUP, fSTEP, fINDENT, fIP)
    VALUES ((SELECT NVL(MAX(fID),0)+1 FROM FILEBOARD), 'go','글 제목','본문',
    'NOIMAGE.JPG',null,0,(SELECT NVL(MAX(fID),0)+1 FROM FILEBOARD),0,0,'192.0.0.1');
-- (4) hit 1회 올리기
UPDATE FILEBOARD SET fHIT = fHIT+1 WHERE fID = 1;
-- (5) 글 번호(fid)로 글전체 내용(BoardDto) 가져오기
SELECT * FROM FILEBOARD WHERE fID = 1;
-- (6) 글 수정하기(fid, ftitle, fcontent, ffilename, frdate(SYSDATE), fip 수정)
UPDATE FILEBOARD SET ftitle     = '수정된 제목',
                     fcontent   = NULL,
                     ffilename  = 'kim.JPG',
                     fip        = '190.0.0.1'
            WHERE fID = 1;
-- (7) 글 삭제하기(fid로)
DELETE FROM FILEBOARD WHERE fID = 1;
ROLLBACK;
-- (8) 답변글 쓰기 전 단계(원글의 fgroup과 같고, 원글의 fstep보다 크면 fstep을 하나 증가하기)
UPDATE FILEBOARD SET FSTEP = FSTEP + 1 WHERE FGROUP = 2 AND FSTEP > 0;
-- (9) 답변글 쓰기
INSERT INTO FILEBOARD (fID, mID, fTITLE, fCONTENT, fFILENAME,
    fRDATE, fHIT, fGROUP, fSTEP, fINDENT, fIP)
    VALUES ((SELECT NVL(MAX(fID),0)+1 FROM FILEBOARD), 'go','글 제목','본문',
    'NOIMAGE.JPG',null,0,1,1,1,'192.0.0.1');
-- (10) 회원탈퇴(mid로 작성글 삭제) return값 void
DELETE FROM FILEBOARD WHERE MID = 'go';
ROLLBACK;
COMMIT;

-------------------------------------------------------------------------------
-------------------------------- AdminDao query--------------------------------
-------------------------------------------------------------------------------

-- (1) admin 로그인
SELECT * FROM ADMIN WHERE aID = 'admin' AND aPW = 1;
-- (2) 로그인 후 세션에 넣을 AdiminDto 를 admin aid로 가져오기
SELECT * FROM ADMIN WHERE aID = 'admin';











