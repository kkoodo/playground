--==============================================================================
-- WORK PROCESS
-- 1. USER INPUT TEXT TO FUNCTION
-- 2. FUNCTION READ ALL ROWS IN TBL_LETTER TABLE
-- 3. EACH ROW INPUT 'vENCRYPTED_TEXT' BY CURSOR
-- 4. 'vENCRYPTED_TEXT' IS DECRYTING BY 'SELECT INTO' CLAUSE
-- 5. THE RESULT IS INPUT 'vDECRYPTED_TEXT', AND RETURN
--==============================================================================
--DROP FUNCTION FUNC_GRAMMER;
--==============================================================================
CREATE OR REPLACE FUNCTION FUNC_GRAMMER
(
    vINPUT_TEXT TBL_LETTER.INPUT_TEXT%TYPE
)
RETURN VARCHAR2
IS
    -- PREVENT ORA-14551 | USING SENTENCE LIKE 'PRAGMA AUTONOMOUS_TRANSACTION;'
    PRAGMA AUTONOMOUS_TRANSACTION;
    CURSOR ROW_CUR      IS SELECT * FROM TBL_LETTER ORDER BY NUM;
    vROW_NUM            NUMBER;
    vNUM                TBL_LETTER.NUM%TYPE;
    vENCRYPTED_TEXT     TBL_LETTER.INPUT_TEXT%TYPE;
    vROW_LENGTH         NUMBER;
    vDATE               TBL_LETTER.TIME%TYPE;
    vDECRYPTED_LETTER   VARCHAR2(3);
    vDECRYPTED_TEXT     TBL_LETTER.INPUT_TEXT%TYPE;
    vCHAT_ROW           TBL_LETTER.INPUT_TEXT%TYPE;
    vCHAT_LOG           VARCHAR2(4000);
BEGIN
    vROW_NUM            := SEQ_LETTER.NEXTVAL;   
    INSERT INTO TBL_LETTER (NUM, INPUT_TEXT, TIME) VALUES (vROW_NUM, vINPUT_TEXT, TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS'));
    COMMIT;
    
    FOR TBL_ROW IN ROW_CUR
    LOOP
        vNUM            := TBL_ROW.NUM;
        vENCRYPTED_TEXT := TBL_ROW.INPUT_TEXT;
        vROW_LENGTH     := LENGTH(TBL_ROW.INPUT_TEXT);
        vDATE           := TBL_ROW.TIME;
        
--        DBMS_OUTPUT.PUT_LINE(vNUM || ' | ' || '[' || vROW_LENGTH || '] ' || vENCRYPTED_TEXT || ' | ' || vDATE);
        
        FOR I IN 1..vROW_LENGTH
        LOOP
            SELECT NVL(MAX(OUTPUT_WORD), 'X')
              INTO vDECRYPTED_LETTER
              FROM TBL_GRAMMER 
             WHERE INPUT_WORD = SUBSTR(vENCRYPTED_TEXT, I, 1);
             
            vDECRYPTED_TEXT := vDECRYPTED_TEXT || vDECRYPTED_LETTER;    
        END LOOP;
        
--        DBMS_OUTPUT.PUT_LINE('DECRYT : ' || vDECRYPTED_TEXT);
        
        vCHAT_LOG := vCHAT_LOG
                    ||LPAD(TO_CHAR(vNUM), 3, '0') || ' | ' 
                    || RPAD(vDECRYPTED_TEXT, 70, ' ') || ' | ' 
                    || vDATE || CHR(13) || CHR(10);
        
        vDECRYPTED_TEXT := NULL;
        
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('+----- WELCOME -----+' || CHR(10) || vCHAT_LOG);

    RETURN vCHAT_LOG;
END;
/    