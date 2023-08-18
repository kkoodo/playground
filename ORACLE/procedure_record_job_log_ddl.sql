CREATE OR REPLACE PROCEDURE RECORD_JOB_LOG
(
    vLOG_ID     IN VARCHAR2 := NULL
  , vSTATUS     IN VARCHAR2 := NULL
  , vSTEP       IN VARCHAR2 := NULL
  , vERR_CD     IN VARCHAR2 := NULL
  , vERR_MSG    IN VARCHAR2 := NULL
)
IS
    vEXISTS_ROW TBL_PRTC_LOG.LOG_ID%TYPE;
    vREPET_CNT  NUMBER;
BEGIN
    IF vLOG_ID IS NULL THEN 
        RAISE_APPLICATION_ERROR(-20001, 'CHECK ARGUMENT. NULL TO LOG_ID');
    END IF;        
    IF vSTATUS IS NULL THEN 
        RAISE_APPLICATION_ERROR(-20002, 'CHECK ARGUMENT. NULL TO STATUS');
    END IF;
    IF vSTEP IS NULL THEN 
        RAISE_APPLICATION_ERROR(-20003, 'CHECK ARGUMENT. NULL TO STEP');
    END IF;

    --¢º IF WRITE LIKE THIS, WHEN EXCEPTION CAUSES, THEN OTHER STEPO ARE IGNORED
--    SELECT LOG_ID
--      INTO vEXISTS_ROW
--      FROM DUAL 
--     WHERE EXISTS (SELECT * FROM TBL_PRTC_LOG WHERE LOG_ID = vLOG_ID);
--    
--    EXCEPTION
--        WHEN NO_DATA_FOUND THEN vEXISTS_ROW := NULL;

    --¢º IT IS WORKING, BUT I CHOOSE ANOTHER WAY TO VERIFY DUPLICATION CASE
--    SELECT MAX(LOG_ID) 
--      INTO vEXISTS_ROW
--      FROM TBL_PRTC_LOG 
--     WHERE EXISTS (SELECT * FROM TBL_PRTC_LOG WHERE LOG_ID = vLOG_ID AND STATUS IN ('FINISH', 'ERROR'));
    
    CASE vSTATUS WHEN 'START' 
                 THEN INSERT INTO TBL_PRTC_LOG(LOG_ID, STATUS, STEP, ST_TIME, UP_TIME, FN_TIME, ER_TIME, ERR_CD, ERR_MSG)
                             VALUES (vLOG_ID, vSTATUS, vSTEP, SYSTIMESTAMP, NULL, NULL, NULL, NULL, NULL);
                 WHEN 'UPDATE' 
                 THEN UPDATE TBL_PRTC_LOG L
                         SET L.STATUS = vSTATUS
                           , L.STEP = vSTEP
                           , L.UP_TIME = SYSTIMESTAMP
                       WHERE L.LOG_ID = vLOG_ID;
                 WHEN 'FINISH' 
                 THEN UPDATE TBL_PRTC_LOG L
                         SET L.STATUS = vSTATUS
                           , L.STEP = vSTEP
                           , L.FN_TIME = SYSTIMESTAMP
                       WHERE L.LOG_ID = vLOG_ID;
                 WHEN 'ERROR' 
                 THEN UPDATE TBL_PRTC_LOG L
                         SET L.STATUS = vSTATUS
                           , L.STEP = vSTEP
                           , L.ER_TIME = SYSTIMESTAMP
                           , L.ERR_CD = vERR_CD
                           , L.ERR_MSG = vERR_MSG
                       WHERE L.LOG_ID = vLOG_ID;         
                 WHEN 'REPET' 
                 THEN SELECT SUBSTR(ERR_MSG, INSTR(ERR_MSG, '(') + 1, INSTR(ERR_MSG, ')') - INSTR(ERR_MSG, '(') - 1)
                        INTO vREPET_CNT
                        FROM TBL_PRTC_LOG
                       WHERE LOG_ID = vLOG_ID;     
                       
                       UPDATE TBL_PRTC_LOG L
                          SET L.ER_TIME = SYSTIMESTAMP
                            , L.ERR_MSG = 'THIS ROW ALREADY PROCESSED (' || TO_CHAR(NVL(vREPET_CNT, 0) + 1) || ') TIMES'
                        WHERE L.LOG_ID = vLOG_ID;               
                 END CASE;
                               
    COMMIT;

END;
/