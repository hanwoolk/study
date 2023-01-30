<<<<<<< HEAD
--1. È¸¿ø°¡ÀÔ : ÀüÈ­¹øÈ£¿Í ÀÌ¸§À» ÀÔ·Â¹Þ¾Æ È¸¿ø°¡ÀÔ(È¸¿ø°¡ÀÔ½Ã Æ÷ÀÎÆ®´Â 1000Á¡ Á¦°ø 
--(ctel,cname ÀÔ·Â¹Þ¾Æ insert) public int insertCustomer (String ctel, String cname)
--public int insert Customer (CustomerDto)
INSERT INTO CUSTOMER (CID,CTEL,CNAME)
    VALUES (CSEQ.NEXTVAL,'010-6666-7777','È«±æµ¿');


-- 2. Æù4ÀÚ¸®(FULL) °Ë»ö
    -- (1)Æù µÚ4ÀÚ¸®³ª FULL¹øÈ£¸¦ ÀÔ·Â¹Þ¾Æ °í°´Á¤º¸(ID, ÀüÈ­, ÀÌ¸§, Æ÷ÀÎÆ®, ±¸¸Å´©Àû¾×, °í°´·¹
    -- º§, ·¹º§¾÷À» À§ÇÑ Ãß°¡ ±¸¸ÅÇÒ ±Ý¾×) ¸¦ ±¸¸Å´©Àû¾× Å« ¼øÀ¸·Î Ãâ·Â
    -- (ctel, ÀÔ·Â¹Þ¾Æ cid, ctel, cname, cpoint, camount, levelname, nextlavel)
    -- public ArrayList<CustomerDto> ctelGetCustomers(String searchTel)
    -- d
SELECT C.* ,LEVELNAME,(NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
        WHERE C.LEVELNO = L.LEVELNO AND CTEL LIKE '%'||'9999'
=======
--1. íšŒì›ê°€ìž… : ì „í™”ë²ˆí˜¸ì™€ ì´ë¦„ì„ ìž…ë ¥ë°›ì•„ íšŒì›ê°€ìž…(íšŒì›ê°€ìž…ì‹œ í¬ì¸íŠ¸ëŠ” 1000ì  ì œê³µ
INSERT INTO CUSTOMER (CID,CTEL,CNAME) 
    VALUES (CSEQ.NEXTVAL,'010-6666-7777','í™ê¸¸ë™');

-- 2. í°4ìžë¦¬(FULL) ê²€ìƒ‰
    -- (1)í° ë’¤4ìžë¦¬ë‚˜ FULLë²ˆí˜¸ë¥¼ ìž…ë ¥ë°›ì•„ ê³ ê°ì •ë³´(ID, ì „í™”, ì´ë¦„, í¬ì¸íŠ¸, êµ¬ë§¤ëˆ„ì ì•¡, ê³ ê°ë ˆ
    -- ë²¨, ë ˆë²¨ì—…ì„ ìœ„í•œ ì¶”ê°€ êµ¬ë§¤í•  ê¸ˆì•¡) ë¥¼ êµ¬ë§¤ëˆ„ì ì•¡ í° ìˆœìœ¼ë¡œ ì¶œë ¥
SELECT C.* ,LEVELNAME,(NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL
        WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1)AND SUBSTR(CTEL,-4,4)=?
>>>>>>> 05197694d6a93c70fc7e6e8ad166510b2c715a08
	ORDER BY CAMOUNT DESC;
    
SELECT C.* ,LEVELNAME,HIC+1-CAMOUNT NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO = L.LEVELNO AND SUBSTR(CTEL,-4,4)='1111'
	ORDER BY CAMOUNT DESC; -- ÃÖ°í·¹º§ °æ¿ì¿¡ Àß¸ø³ª¿È

SELECT CNAME, CAMAOUNT, NVL(HIC,99999999)+1-CAMOUNT,
    (SELECT NVL(HIC,99999999)+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=4 AND CID=C.CID)
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO=L.LEVELNO; -- ÀÌ¿ëÇÒ ¼­ºêÄõ¸® ¸¸µé±â
    
SELECT C.* ,LEVELNAME,NVL(HIC,99999999)+1-CAMOUNT NEXTLEVEL
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO = L.LEVELNO AND SUBSTR(CTEL,-4,4)='1111'
	ORDER BY CAMOUNT DESC;

SELECT C.* ,LEVELNAME,NVL((SELECT NVL(HIC,99999999)+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=4 AND CID=C.CID),0) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO=L.LEVELNO AND CTEL LIKE '%'||'1111'; --DAO¿¡ µé¾î°¥ QUERY
    
    -- (2)ì¶œë ¥ ê²°ê³¼ëŠ” 0í–‰ ì´ìƒ

    
    
<<<<<<< HEAD
--3. ¹°Ç°±¸ÀÔ
    -- °í°´id(¹øÈ£)¿Í ¹°Ç°±¸¸Å°¡°ÝÀ» ÀÔ·Â¹Þ¾Æ ±¸¸Å Ã³¸®.
    -- (1) ±¸¸Å´©Àû±Ý¾×¿¡ ±Ý¹ø ±¸¸Å±Ý¾×ÀÌ ´©Àû
    -- (2) ±Ý¹ø ±¸¸Å´©Àû±Ý¾×ÀÇ 5%Æ÷ÀÎÆ®°¡ ´©Àû
    -- (3) º¯°æµÉ ±¸¸Å´©Àû±Ý¾×¿¡ µû¶ó °í°´ÀÇ ·¹º§ÀÌ »óÇâÁ¶Á¤µÉ °æ¿ì °í°´ ·¹º§ÀÌ »óÇâ
    -- (cid, price ÀÔ·Â¹Þ¾Æ cpoint, camount, levelno update)
        -- public int buy(int cid, int price)
    -- ¹Ù²ï °í°´ Á¤º¸ Ãâ·Â (cid, ctel, cname, cpoint, camount, levelname, nextlavel)
        --public CustomerDto getCustomer(int cid)

    
--UPDATE CUSTOMER SET CAMOUNT = CAMOUNT + ? , CPOINT = CPOINT+(?*0.05) WHERE CID=?;
-- 1´Ü°è : CPOINT, CAMOUNT ¼öÁ¤
UPDATE CUSTOMER 
    SET CPOINT = CPOINT + (2000000*0.05),
        CAMOUNT = CAMOUNT + 2000000
    WHERE CID = 1;
    ROLLBACK;
    SELECT * FROM CUSTOMER;
-- 2´Ü°è : ¼öÁ¤µÈ CAMOUNT¿¡ µû¶ó LEVELNO Á¶Á¤
SELECT CNAME, CAMOUNT, C.LEVELNO Çö·¹º§, L.LEVELNO ¹Ù²ð·¹º§
    FROM CUSTOMER C, CLEVEL L
    WHERE CAMOUNT BETWEEN LOC AND HIC;
    
UPDATE CUSTOMER
    SET LEVELNO = (SELECT L.LEVELNO
                     FROM CUSTOMER, CLEVEL L
                     WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,99999999) AND CID = 1)
    WHERE CID = 1; -- LEVELNO ¼öÁ¤
-- DAO¿¡ µé¾î°¥ QUERY ¿Ï¼º (1´Ü°è + 2´Ü°è)
UPDATE CUSTOMER 
    SET CPOINT = CPOINT + (1000000*0.05),
        CAMOUNT = CAMOUNT + 1000000,
        LEVELNO = (SELECT L.LEVELNO
                     FROM CUSTOMER, CLEVEL L
                     WHERE CAMOUNT+1000000 BETWEEN LOC AND HIC 
                            AND CID = 1)
    WHERE CID = 1;
=======
--3. ë¬¼í’ˆêµ¬ìž…
    -- ê³ ê°id(ë²ˆí˜¸)ì™€ ë¬¼í’ˆêµ¬ë§¤ê°€ê²©ì„ ìž…ë ¥ë°›ì•„ êµ¬ë§¤ ì²˜ë¦¬.
    -- (1) êµ¬ë§¤ëˆ„ì ê¸ˆì•¡ì— ê¸ˆë²ˆ êµ¬ë§¤ê¸ˆì•¡ì´ ëˆ„ì 
    -- (2) ê¸ˆë²ˆ êµ¬ë§¤ëˆ„ì ê¸ˆì•¡ì˜ 5%í¬ì¸íŠ¸ê°€ ëˆ„ì 
    -- (3) ë³€ê²½ë  êµ¬ë§¤ëˆ„ì ê¸ˆì•¡ì— ë”°ë¼ ê³ ê°ì˜ ë ˆë²¨ì´ ìƒí–¥ì¡°ì •ë  ê²½ìš° ê³ ê° ë ˆë²¨ì´ ìƒí–¥
UPDATE CUSTOMER SET CAMOUNT = CAMOUNT + ? , CPOINT = CPOINT+(?*0.05) WHERE CID=?
>>>>>>> 05197694d6a93c70fc7e6e8ad166510b2c715a08
    
    
    ROLLBACK;
    SELECT * FROM CUSTOMER;
    
<<<<<<< HEAD
-- °í°´ µî±Þ¸íµé ÃßÃâ
    -- public ArrayList<String> getLevelNames()
SELECT LEVELNAME FROM CLEVEL;
    
--4. °í°´ µî±Þº° Ãâ·Â
    -- (1)¾î¶² ·¹º§À» ¿øÇÏ´ÂÁö µ¥ÀÌÅÍº£ÀÌ½ºÀÇ ·¹º§ÀÌ¸§À» Ãâ·ÂÇÏ¸ç Æ¯Á¤ ·¹º§¸íÀ» ÀÔ·Â¹Þ´Â´Ù.
    -- (2)ÇØ´ç ·¹º§ °í°´Á¤º¸(ID, ÀüÈ­, ÀÌ¸§, Æ÷ÀÎÆ®, ±¸¸Å´©Àû¾×, °í°´·¹º§, ·¹º§¾÷À» À§ÇÑ Ãß°¡ ±¸
    -- ¸ÅÇÒ ±Ý¾×)¸¦ ±¸¸Å´©Àû¾× Å« ¼øÀ¸·Î Ãâ·Â
    -- levelnameÀ» ÀÔ·Â¹Þ¾Æ cid, ctel, cname, cpoint, camount, levelname, nextlavel Ãâ·Â)
    -- public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)
SELECT C.* , LEVELNAME, (NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL
    FROM CUSTOMER C, CLEVEL
    WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1) AND LEVELNAME = 'ÇÃ·¡Æ¼³Ñ'
    ORDER BY CAMOUNT DESC; 

SELECT C.* ,LEVELNAME,
    NVL((SELECT NVL(HIC,99999999)+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=4 AND CID=C.CID),0) NEXTLEVEL 
    FROM CUSTOMER C, CLEVEL L
    WHERE C.LEVELNO=L.LEVELNO AND LEVELNAME = 'ºê·ÐÁî'
    ORDER BY CAMOUNT DESC;
    
--5. ÀüÃ¼ Ãâ·Â
    -- ÀüÃ¼ °í°´Á¤º¸(ID, ÀüÈ­, ÀÌ¸§, Æ÷ÀÎÆ®, ±¸¸Å´©Àû¾×, °í°´·¹º§, ·¹º§¾÷À» À§ÇÑ Ãß°¡ ±¸¸ÅÇÒ
    -- ±Ý¾×)¸¦ ±¸¸Å´©Àû¾× Å« ¼øÀ¸·Î Ãâ·Â
    -- (cid, ctel, cname, cpoint, camount, levelname, nextlavel Ãâ·Â)
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
    
--6. È¸¿øÅ»Åð ? ÀüÈ­¹øÈ£¸¦ ÀÔ·Â¹Þ¾Æ Å»ÅðÃ³¸®
    -- ctelÀ» ÀÔ·Â¹Þ¾Æ delete
    -- public int deleteCustomer(String ctel)
DELETE FROM CUSTOMER WHERE CTEL='010-1111-1111';

ROLLBACK;
=======
    
--4. ê³ ê° ë“±ê¸‰ë³„ ì¶œë ¥
    -- (1)ì–´ë–¤ ë ˆë²¨ì„ ì›í•˜ëŠ”ì§€ ë°ì´í„°ë² ì´ìŠ¤ì˜ ë ˆë²¨ì´ë¦„ì„ ì¶œë ¥í•˜ë©° íŠ¹ì • ë ˆë²¨ëª…ì„ ìž…ë ¥ë°›ëŠ”ë‹¤.
    -- (2)í•´ë‹¹ ë ˆë²¨ ê³ ê°ì •ë³´(ID, ì „í™”, ì´ë¦„, í¬ì¸íŠ¸, êµ¬ë§¤ëˆ„ì ì•¡, ê³ ê°ë ˆë²¨, ë ˆë²¨ì—…ì„ ìœ„í•œ ì¶”ê°€ êµ¬
    -- ë§¤í•  ê¸ˆì•¡)ë¥¼ êµ¬ë§¤ëˆ„ì ì•¡ í° ìˆœìœ¼ë¡œ ì¶œë ¥
SELECT C.* , LEVELNAME, (NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL
				FROM CUSTOMER C, CLEVEL
                    WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1) AND LEVELNAME = ?
				ORDER BY CAMOUNT DESC; 
    
    
--5. ì „ì²´ ì¶œë ¥
    -- ì „ì²´ ê³ ê°ì •ë³´(ID, ì „í™”, ì´ë¦„, í¬ì¸íŠ¸, êµ¬ë§¤ëˆ„ì ì•¡, ê³ ê°ë ˆë²¨, ë ˆë²¨ì—…ì„ ìœ„í•œ ì¶”ê°€ êµ¬ë§¤í• 
    -- ê¸ˆì•¡)ë¥¼ êµ¬ë§¤ëˆ„ì ì•¡ í° ìˆœìœ¼ë¡œ ì¶œë ¥
SELECT C.* , LEVELNAME, (NVL(HIC,CAMOUNT-1)-CAMOUNT+1) NEXTLEVEL
	FROM CUSTOMER C, CLEVEL
	WHERE CAMOUNT BETWEEN LOC AND NVL(HIC,CAMOUNT+1)
	ORDER BY CAMOUNT DESC;
    
    
    
--6. íšŒì›íƒˆí‡´ ? ì „í™”ë²ˆí˜¸ë¥¼ ìž…ë ¥ë°›ì•„ íƒˆí‡´ì²˜ë¦¬
DELETE FROM CUSTOMER WHERE CTEL=?;
    
    
    
    
    
    
    
>>>>>>> 05197694d6a93c70fc7e6e8ad166510b2c715a08
    
    
    
    
