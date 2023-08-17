CREATE OR REPLACE PROCEDURE RUN_JOB
IS
    LOG_ID          TBL_PRTC_BEFORE.ID%TYPE;
    CURSOR          ROW_CUR IS SELECT * FROM TBL_PRTC_BEFORE ORDER BY ROWID;
    vSQL            CLOB    := NULL;
BEGIN
    
    FOR TBL_ROW IN ROW_CUR
    LOOP
        LOG_ID := TBL_ROW.ID;
        
        -- STEP1. START RECORDING TBL_PRTC_LOG TABLE AND THE STATUS IS 'START'
        RECORD_JOB_LOG(LOG_ID, 'START', '01');
        
        -- STEP2. SELECT ROW, AND PUT THEN INTO VARIABLE
        RECORD_JOB_LOG(LOG_ID, 'UPDATE', '02');
        
        vSQL := 'INSERT INTO TBL_PRTC_AFTER (ID, NAME, USERNAME, EMAIL, PHONE, CONTENTS, UPDATE_TIME) VALUES' || CHR(10) || '(';
        
        -- STEP3. IF PERSONAL INFORMATION EXIST, THEN REPLACE AS '*', AND WRITE DINAMIC QUERY
        RECORD_JOB_LOG(LOG_ID, 'UPDATE', '03');
        
        vSQL := vSQL || CHR(10) 
                || '''' || LPAD(TBL_ROW.ID, 4, '0') || '''' || ', '
                || '''' || SUBSTR(TBL_ROW.NAME, 1, INSTR(TBL_ROW.NAME, ' ')) || REGEXP_REPLACE(SUBSTR(TBL_ROW.NAME, INSTR(TBL_ROW.NAME, ' ') + 1), '[a-zA-Z]', '*') || '''' || ', '
                || '''' || REGEXP_REPLACE(SUBSTR(TBL_ROW.USERNAME, INSTR(TBL_ROW.USERNAME, ' ') + 1), '[a-zA-Z]', '*') || '''' || ', '
                || '''' || REGEXP_REPLACE(SUBSTR(TBL_ROW.EMAIL, 1, INSTR(TBL_ROW.EMAIL, '@')), '[a-zA-Z]', '*') || SUBSTR(TBL_ROW.EMAIL, INSTR(TBL_ROW.EMAIL, '@') + 1) || '''' || ', '
                                -- EX : (775)976-6794 x41206
                || '''' || CASE WHEN INSTR(TBL_ROW.PHONE, '(') > 0 AND INSTR(TBL_ROW.PHONE, '-', 1) > 0
                                THEN SUBSTR(TRIM(TBL_ROW.PHONE), 1, INSTR(TRIM(TBL_ROW.PHONE), ')')) 
                                     || REGEXP_REPLACE(SUBSTR(TRIM(TBL_ROW.PHONE), INSTR(TRIM(TBL_ROW.PHONE), ')') + 1, INSTR(TRIM(TBL_ROW.PHONE), '-') - INSTR(TRIM(TBL_ROW.PHONE), ')') - 1), '[0-9]', '*')
                                     || SUBSTR(TRIM(TBL_ROW.PHONE), INSTR(TRIM(TBL_ROW.PHONE), '-'))
                                -- EX : 586.493.6943 x140
                                WHEN INSTR(TBL_ROW.PHONE, '(') = 0 AND INSTR(TBL_ROW.PHONE, '-', 1) = 0
                                THEN SUBSTR(TRIM(TBL_ROW.PHONE), 1, INSTR(TRIM(TBL_ROW.PHONE), '.', 1))
                                     || REGEXP_REPLACE(SUBSTR(TRIM(TBL_ROW.PHONE), INSTR(TRIM(TBL_ROW.PHONE), '.', 1) + 1, INSTR(TRIM(TBL_ROW.PHONE), '.', 2)), '[0-9]', '*')
                                     || SUBSTR(TRIM(TBL_ROW.PHONE), INSTR(TRIM(TBL_ROW.PHONE), '.', 2) + 1)
                                -- EX : 493-170-9623 x156
                                ELSE SUBSTR(TRIM(TBL_ROW.PHONE), 1, INSTR(TRIM(TBL_ROW.PHONE), '-', 1))
                                     || REGEXP_REPLACE(SUBSTR(TRIM(TBL_ROW.PHONE), INSTR(TRIM(TBL_ROW.PHONE), '-', 1) + 1, INSTR(TRIM(TBL_ROW.PHONE), '-', 2)), '[0-9]', '*')
                                     || SUBSTR(TRIM(TBL_ROW.PHONE), INSTR(TRIM(TBL_ROW.PHONE), '-', 2) + 1)
                                END || '''' || ', '
                || 'NULL , '
                || 'SYSTIMESTAMP'
                || CHR(10) || ')';

        
        DBMS_OUTPUT.PUT_LINE('vSQL : ' || CHR(10) || vSQL);
        
        -- STEP4. IF WRITING QUERY FINISHED, UPDATE LOG'S STATUS TO 'UPDATE' AND EXECUTE DINAMIC QUERY
        RECORD_JOB_LOG(LOG_ID, 'UPDATE', '04');
        EXECUTE IMMEDIATE vSQL;        
        
        COMMIT;
        
        -- STEP5. IF EXECUTE COMMIT, THEN UPDATE LOG'S STATUS TO 'FINISH'
        RECORD_JOB_LOG(LOG_ID, 'FINISH', '05');
        
    END LOOP;
    
    -- STEP6. IF ERROR OCCURED, THEN CALL RECORD_JOB_LOG, AND UPDATE LOG'S STATUS TO 'ERROR'
    EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
    RECORD_JOB_LOG(LOG_ID, 'ERROR', '06', SQLCODE, SUBSTR(SQLERRM, 12));
    
END;
/