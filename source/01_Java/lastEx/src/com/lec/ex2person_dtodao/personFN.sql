-- ���α׷� �䱸���׿� �ʿ��� DML
-- ��ɺ� QUERY �ۼ�(1, 2, 3)
--1
INSERT INTO PERSON 
    VALUES (pNO.NEXTVAL,'ȫ�浿', 
    (SELECT jNO FROM JOB WHERE jNAME='����'),95,95,95);

--2  ������ ��ȸ�� ������ �߰��Ͽ� ������ ���� ������ �̸�(��ȣ)�� ��� ������ ���ٰ� ���
SELECT ROWNUM RANK, A.*
  FROM (SELECT PNAME||'('||pNO||'��)' pNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT TOTAL
            FROM PERSON P, JOB J
            WHERE P.jNO=J.jNO AND jNAME='���'
            ORDER BY TOTAL DESC) A;

--3. �����ͺ��̽��� �Էµ� ��� ��ü�� ��ȸ �� ������ �߰��Ͽ� ������ ���� ������ ����Ѵ�
SELECT ROWNUM RANK, A.*
  FROM (SELECT PNAME||'('||pNO||'��)' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT TOTAL
            FROM PERSON P, JOB J
            WHERE P.jNO=J.jNO
            ORDER BY TOTAL DESC) A;