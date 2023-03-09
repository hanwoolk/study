-- drop table
DROP TABLE MVC_MEMBER;
CREATE TABLE MVC_MEMBER(
    mID         VARCHAR2(30)    PRIMARY KEY,
    mPW         VARCHAR2(30)    NOT NULL,
    mNAME       VARCHAR2(30)    NOT NULL,
    mEMAIL      VARCHAR2(30),
    mPHOTO      VARCHAR2(30)    DEFAULT 'NOIMG.JPG' NOT NULL,
    mBIRTH      DATE,
    mADDRESS    VARCHAR2(300),
    mRDATE      DATE            DEFAULT SYSDATE
);

-- DUMMY DATA
INSERT INTO MVC_MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('aaa','111','홍','aaa@aaa.com','go.jpg','1990-02-20',NULL);
INSERT INTO MVC_MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('bbb','111','김','bbb@bbb.com','han.jpg','1990-04-10','서울');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('gayun','1','김가연','gayun@naver.com','gayun.jpg','1972/09/09','광주광역시');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('gico','1','지코','gico@naver.com','gico.jpg','1992/09/14','서울시');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('go','1','고소영','go@naver.com','go.jpg','1972/10/06','서울시');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('ham','1','함소원','ham@naver.com','ham.jpg','1976/06/16','서울시');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('han','1','한지민','han@naver.com','han.jpg','1982/11/05','서울시');
--DAO에 들어갈 QUERY
  -- 1. ID중복체크
SELECT COUNT(*) FROM MVC_MEMBER WHERE mID='aaa';
  -- 2. JOIN
INSERT INTO MVC_MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('ccc','111','이','ccc@ccc.com','lee.jpg','1990-01-10','경기');
  -- 3. LOGIN
SELECT * FROM MVC_MEMBER WHERE mID = 'aaa' AND mPW = 111;
  -- 4. mID로 MemberDto 가져오기
SELECT * FROM MVC_MEMBER WHERE mID = 'aaa';

SELECT * FROM MVC_MEMBER;


SELECT * FROM MVC_MEMBER WHERE mID = 'aaa' AND mPW = 111;
  
  
  