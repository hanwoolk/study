<<<<<<< HEAD
--1. ȸ������ : ��ȭ��ȣ�� �̸��� �Է¹޾� ȸ������(ȸ�����Խ� ����Ʈ�� 1000�� ���� 
--(ctel,cname �Է¹޾� insert) public int insertCustomer (String ctel, String cname)
--public int insert Customer (CustomerDto)
INSERT INTO CUSTOMER (CID,CTEL,CNAME)
    VALUES (CSEQ.NEXTVAL,'010-6666-7777','ȫ�浿');


-- 2. ��4�ڸ�(FULL) �˻�
    -- (1)�� ��4�ڸ��� FULL��ȣ�� �Է¹޾� ������(ID, ��ȭ, �̸�, ����Ʈ, ���Ŵ�����, ����
    -- ��, �������� ���� �߰� ������ �ݾ�) �� ���Ŵ����� ū ������ ���
    -- (ctel, �Է¹޾� cid, ctel, cname, cpoint, camount, levelname, nextlavel)
    -- public ArrayList<CustomerDto> ctelGetCustomers(String searchTel)
    -- d
SELECT C.* ,LEVELNAME,(NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
        WHERE C.LEVELNO = L.LEVELNO AND CTEL LIKE '%'||'9999'
=======
--1. 회원가입 : 전화번호와 이름을 입력받아 회원가입(회원가입시 포인트는 1000점 제공
INSERT INTO CUSTOMER (CID,CTEL,CNAME) 
    VALUES (CSEQ.NEXTVAL,'010-6666-7777','홍길동');

-- 2. 폰4자리(FULL) 검색
    -- (1)폰 뒤4자리나 FULL번호를 입력받아 고객정보(ID, 전화, 이름, 포인트, 구매누적액, 고객레
    -- 벨, 레벨업을 위한 추가 구매할 금액) 를 구매누적액 큰 순으로 출력
SELECT C.* ,LEVELNAME,(NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL
        WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1)AND SUBSTR(CTEL,-4,4)=?
>>>>>>> 05197694d6a93c70fc7e6e8ad166510b2c715a08
	ORDER BY CAMOUNT DESC;
    
SELECT C.* ,LEVELNAME,HIC+1-CAMOUNT NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO = L.LEVELNO AND SUBSTR(CTEL,-4,4)='1111'
	ORDER BY CAMOUNT DESC; -- �ְ��� ��쿡 �߸�����

SELECT CNAME, CAMAOUNT, NVL(HIC,99999999)+1-CAMOUNT,
    (SELECT NVL(HIC,99999999)+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=4 AND CID=C.CID)
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO=L.LEVELNO; -- �̿��� �������� �����
    
SELECT C.* ,LEVELNAME,NVL(HIC,99999999)+1-CAMOUNT NEXTLEVEL
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO = L.LEVELNO AND SUBSTR(CTEL,-4,4)='1111'
	ORDER BY CAMOUNT DESC;

SELECT C.* ,LEVELNAME,NVL((SELECT NVL(HIC,99999999)+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=4 AND CID=C.CID),0) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO=L.LEVELNO AND CTEL LIKE '%'||'1111'; --DAO�� �� QUERY
    
    -- (2)출력 결과는 0행 이상

    
    
<<<<<<< HEAD
--3. ��ǰ����
    -- ��id(��ȣ)�� ��ǰ���Ű����� �Է¹޾� ���� ó��.
    -- (1) ���Ŵ����ݾ׿� �ݹ� ���űݾ��� ����
    -- (2) �ݹ� ���Ŵ����ݾ��� 5%����Ʈ�� ����
    -- (3) ����� ���Ŵ����ݾ׿� ���� ���� ������ ���������� ��� �� ������ ����
    -- (cid, price �Է¹޾� cpoint, camount, levelno update)
        -- public int buy(int cid, int price)
    -- �ٲ� �� ���� ��� (cid, ctel, cname, cpoint, camount, levelname, nextlavel)
        --public CustomerDto getCustomer(int cid)

    
--UPDATE CUSTOMER SET CAMOUNT = CAMOUNT + ? , CPOINT = CPOINT+(?*0.05) WHERE CID=?;
-- 1�ܰ� : CPOINT, CAMOUNT ����
UPDATE CUSTOMER 
    SET CPOINT = CPOINT + (2000000*0.05),
        CAMOUNT = CAMOUNT + 2000000
    WHERE CID = 1;
    ROLLBACK;
    SELECT * FROM CUSTOMER;
-- 2�ܰ� : ������ CAMOUNT�� ���� LEVELNO ����
SELECT CNAME, CAMOUNT, C.LEVELNO ������, L.LEVELNO �ٲ𷹺�
    FROM CUSTOMER C, CLEVEL L
    WHERE CAMOUNT BETWEEN LOC AND HIC;
    
UPDATE CUSTOMER
    SET LEVELNO = (SELECT L.LEVELNO
                     FROM CUSTOMER, CLEVEL L
                     WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,99999999) AND CID = 1)
    WHERE CID = 1; -- LEVELNO ����
-- DAO�� �� QUERY �ϼ� (1�ܰ� + 2�ܰ�)
UPDATE CUSTOMER 
    SET CPOINT = CPOINT + (1000000*0.05),
        CAMOUNT = CAMOUNT + 1000000,
        LEVELNO = (SELECT L.LEVELNO
                     FROM CUSTOMER, CLEVEL L
                     WHERE CAMOUNT+1000000 BETWEEN LOC AND HIC 
                            AND CID = 1)
    WHERE CID = 1;
=======
--3. 물품구입
    -- 고객id(번호)와 물품구매가격을 입력받아 구매 처리.
    -- (1) 구매누적금액에 금번 구매금액이 누적
    -- (2) 금번 구매누적금액의 5%포인트가 누적
    -- (3) 변경될 구매누적금액에 따라 고객의 레벨이 상향조정될 경우 고객 레벨이 상향
UPDATE CUSTOMER SET CAMOUNT = CAMOUNT + ? , CPOINT = CPOINT+(?*0.05) WHERE CID=?
>>>>>>> 05197694d6a93c70fc7e6e8ad166510b2c715a08
    
    
    ROLLBACK;
    SELECT * FROM CUSTOMER;
    
<<<<<<< HEAD
-- �� ��޸�� ����
    -- public ArrayList<String> getLevelNames()
SELECT LEVELNAME FROM CLEVEL;
    
--4. �� ��޺� ���
    -- (1)� ������ ���ϴ��� �����ͺ��̽��� �����̸��� ����ϸ� Ư�� �������� �Է¹޴´�.
    -- (2)�ش� ���� ������(ID, ��ȭ, �̸�, ����Ʈ, ���Ŵ�����, ������, �������� ���� �߰� ��
    -- ���� �ݾ�)�� ���Ŵ����� ū ������ ���
    -- levelname�� �Է¹޾� cid, ctel, cname, cpoint, camount, levelname, nextlavel ���)
    -- public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)
SELECT C.* , LEVELNAME, (NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL
    FROM CUSTOMER C, CLEVEL
    WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1) AND LEVELNAME = '�÷�Ƽ��'
    ORDER BY CAMOUNT DESC; 

SELECT C.* ,LEVELNAME,
    NVL((SELECT NVL(HIC,99999999)+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=4 AND CID=C.CID),0) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO=L.LEVELNO AND LEVELNAME = '�����'
    ORDER BY CAMOUNT DESC;
    
--5. ��ü ���
    -- ��ü ������(ID, ��ȭ, �̸�, ����Ʈ, ���Ŵ�����, ������, �������� ���� �߰� ������
    -- �ݾ�)�� ���Ŵ����� ū ������ ���
    -- (cid, ctel, cname, cpoint, camount, levelname, nextlavel ���)
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
    
--6. ȸ��Ż�� ? ��ȭ��ȣ�� �Է¹޾� Ż��ó��
    -- ctel�� �Է¹޾� delete
    -- public int deleteCustomer(String ctel)
DELETE FROM CUSTOMER WHERE CTEL='010-1111-1111';

ROLLBACK;
=======
    
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
    
    
    
    
    
    
    
>>>>>>> 05197694d6a93c70fc7e6e8ad166510b2c715a08
    
    
    
    
