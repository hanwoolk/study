--1. 회원가입 : 전화번호와 이름을 입력받아 회원가입(회원가입시 포인트는 1000점 제공
INSERT INTO CUSTOMER (CID,CTEL,CNAME) 
    VALUES (CSEQ.NEXTVAL,'010-6666-7777','홍길동');

-- 2. 폰4자리(FULL) 검색
    -- (1)폰 뒤4자리나 FULL번호를 입력받아 고객정보(ID, 전화, 이름, 포인트, 구매누적액, 고객레
    -- 벨, 레벨업을 위한 추가 구매할 금액) 를 구매누적액 큰 순으로 출력
SELECT C.* ,LEVELNAME,(NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL
        WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1)AND SUBSTR(CTEL,-4,4)=?
	ORDER BY CAMOUNT DESC;
    
    
    -- (2)출력 결과는 0행 이상

    
    
--3. 물품구입
    -- 고객id(번호)와 물품구매가격을 입력받아 구매 처리.
    -- (1) 구매누적금액에 금번 구매금액이 누적
    -- (2) 금번 구매누적금액의 5%포인트가 누적
    -- (3) 변경될 구매누적금액에 따라 고객의 레벨이 상향조정될 경우 고객 레벨이 상향
UPDATE CUSTOMER SET CAMOUNT = CAMOUNT + ? , CPOINT = CPOINT+(?*0.05) WHERE CID=?
    
    
    
    
--4. 고객 등급별 출력
    -- (1)어떤 레벨을 원하는지 데이터베이스의 레벨이름을 출력하며 특정 레벨명을 입력받는다.
    -- (2)해당 레벨 고객정보(ID, 전화, 이름, 포인트, 구매누적액, 고객레벨, 레벨업을 위한 추가 구
    -- 매할 금액)를 구매누적액 큰 순으로 출력
SELECT C.* , LEVELNAME, (NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL
				FROM CUSTOMER C, CLEVEL
                    WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1) AND LEVELNAME = ?
				ORDER BY CAMOUNT DESC; 
    
    
--5. 전체 출력
    -- 전체 고객정보(ID, 전화, 이름, 포인트, 구매누적액, 고객레벨, 레벨업을 위한 추가 구매할
    -- 금액)를 구매누적액 큰 순으로 출력
SELECT C.* , LEVELNAME, (NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL
	FROM CUSTOMER C, CLEVEL
	WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1)
	ORDER BY CAMOUNT DESC;
    
    
    
--6. 회원탈퇴 ? 전화번호를 입력받아 탈퇴처리
DELETE FROM CUSTOMER WHERE CTEL=?;
    
    
    
    
    
    
    
    
    
    
    
