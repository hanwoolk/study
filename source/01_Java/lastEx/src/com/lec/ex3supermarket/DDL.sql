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
    
    -- (2)��� ����� 0�� �̻�

    
    
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
    
    
    ROLLBACK;
    SELECT * FROM CUSTOMER;
    
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
    
    
    
    
    