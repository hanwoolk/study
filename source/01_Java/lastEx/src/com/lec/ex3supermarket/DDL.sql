--1. 회원가입 : 전화번호와 이름을 입력받아 회원가입(회원가입시 포인트는 1000점 제공 
--(ctel,cname 입력받아 insert) public int insertCustomer (String ctel, String cname)
--public int insert Customer (CustomerDto)
INSERT INTO CUSTOMER (CID,CTEL,CNAME)
    VALUES (CSEQ.NEXTVAL,'010-6666-7777','홍길동');


-- 2. 폰4자리(FULL) 검색
    -- (1)폰 뒤4자리나 FULL번호를 입력받아 고객정보(ID, 전화, 이름, 포인트, 구매누적액, 고객레
    -- 벨, 레벨업을 위한 추가 구매할 금액) 를 구매누적액 큰 순으로 출력
    -- (ctel, 입력받아 cid, ctel, cname, cpoint, camount, levelname, nextlavel)
    -- public ArrayList<CustomerDto> ctelGetCustomers(String searchTel)
    -- d
SELECT C.* ,LEVELNAME,(NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
        WHERE C.LEVELNO = L.LEVELNO AND CTEL LIKE '%'||'9999'
	ORDER BY CAMOUNT DESC;
    
SELECT C.* ,LEVELNAME,HIC+1-CAMOUNT NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO = L.LEVELNO AND SUBSTR(CTEL,-4,4)='1111'
	ORDER BY CAMOUNT DESC; -- 최고레벨 경우에 잘못나옴

SELECT CNAME, CAMAOUNT, NVL(HIC,99999999)+1-CAMOUNT,
    (SELECT NVL(HIC,99999999)+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=4 AND CID=C.CID)
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO=L.LEVELNO; -- 이용할 서브쿼리 만들기
    
SELECT C.* ,LEVELNAME,NVL(HIC,99999999)+1-CAMOUNT NEXTLEVEL
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO = L.LEVELNO AND SUBSTR(CTEL,-4,4)='1111'
	ORDER BY CAMOUNT DESC;

SELECT C.* ,LEVELNAME,NVL((SELECT NVL(HIC,99999999)+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=4 AND CID=C.CID),0) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO=L.LEVELNO AND CTEL LIKE '%'||'1111'; --DAO에 들어갈 QUERY
    
    -- (2)출력 결과는 0행 이상

    
    
--3. 물품구입
    -- 고객id(번호)와 물품구매가격을 입력받아 구매 처리.
    -- (1) 구매누적금액에 금번 구매금액이 누적
    -- (2) 금번 구매누적금액의 5%포인트가 누적
    -- (3) 변경될 구매누적금액에 따라 고객의 레벨이 상향조정될 경우 고객 레벨이 상향
    -- (cid, price 입력받아 cpoint, camount, levelno update)
        -- public int buy(int cid, int price)
    -- 바뀐 고객 정보 출력 (cid, ctel, cname, cpoint, camount, levelname, nextlavel)
        --public CustomerDto getCustomer(int cid)

    
--UPDATE CUSTOMER SET CAMOUNT = CAMOUNT + ? , CPOINT = CPOINT+(?*0.05) WHERE CID=?;
-- 1단계 : CPOINT, CAMOUNT 수정
UPDATE CUSTOMER 
    SET CPOINT = CPOINT + (2000000*0.05),
        CAMOUNT = CAMOUNT + 2000000
    WHERE CID = 1;
    ROLLBACK;
    SELECT * FROM CUSTOMER;
-- 2단계 : 수정된 CAMOUNT에 따라 LEVELNO 조정
SELECT CNAME, CAMOUNT, C.LEVELNO 현레벨, L.LEVELNO 바뀔레벨
    FROM CUSTOMER C, CLEVEL L
    WHERE CAMOUNT BETWEEN LOC AND HIC;
    
UPDATE CUSTOMER
    SET LEVELNO = (SELECT L.LEVELNO
                     FROM CUSTOMER, CLEVEL L
                     WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,99999999) AND CID = 1)
    WHERE CID = 1; -- LEVELNO 수정
-- DAO에 들어갈 QUERY 완성 (1단계 + 2단계)
UPDATE CUSTOMER 
    SET CPOINT = CPOINT + (1000000*0.05),
        CAMOUNT = CAMOUNT + 1000000,
        LEVELNO = (SELECT L.LEVELNO
                     FROM CUSTOMER, CLEVEL L
                     WHERE CAMOUNT+1000000 BETWEEN LOC AND HIC 
                            AND CID = 1)
    WHERE CID = 1;
    
    
    ROLLBACK;
    SELECT * FROM CUSTOMER;
    
-- 고객 등급명들 추출
    -- public ArrayList<String> getLevelNames()
SELECT LEVELNAME FROM CLEVEL;
    
--4. 고객 등급별 출력
    -- (1)어떤 레벨을 원하는지 데이터베이스의 레벨이름을 출력하며 특정 레벨명을 입력받는다.
    -- (2)해당 레벨 고객정보(ID, 전화, 이름, 포인트, 구매누적액, 고객레벨, 레벨업을 위한 추가 구
    -- 매할 금액)를 구매누적액 큰 순으로 출력
    -- levelname을 입력받아 cid, ctel, cname, cpoint, camount, levelname, nextlavel 출력)
    -- public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)
SELECT C.* , LEVELNAME, (NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL
    FROM CUSTOMER C, CLEVEL
    WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1) AND LEVELNAME = '플래티넘'
    ORDER BY CAMOUNT DESC; 

SELECT C.* ,LEVELNAME,
    NVL((SELECT NVL(HIC,99999999)+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=4 AND CID=C.CID),0) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO=L.LEVELNO AND LEVELNAME = '브론즈'
    ORDER BY CAMOUNT DESC;
    
--5. 전체 출력
    -- 전체 고객정보(ID, 전화, 이름, 포인트, 구매누적액, 고객레벨, 레벨업을 위한 추가 구매할
    -- 금액)를 구매누적액 큰 순으로 출력
    -- (cid, ctel, cname, cpoint, camount, levelname, nextlavel 출력)
    -- public ArrayList<CustomerDto> getCustomers()
SELECT C.* , LEVELNAME, (NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL
	FROM CUSTOMER C, CLEVEL
	WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1)
	ORDER BY CAMOUNT DESC;
    
SELECT C.* ,LEVELNAME,
    NVL((SELECT NVL(HIC,99999999)+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=4 AND CID=C.CID),0) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO=L.LEVELNO
    ORDER BY CAMOUNT DESC;
    
--6. 회원탈퇴 ? 전화번호를 입력받아 탈퇴처리
    -- ctel을 입력받아 delete
    -- public int deleteCustomer(String ctel)
DELETE FROM CUSTOMER WHERE CTEL='010-1111-1111';

ROLLBACK;
    
    
    
    
    