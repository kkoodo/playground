DROP TABLE TBL_PRTC_LOG;
CREATE TABLE TBL_PRTC_LOG   
(
    ROW_NUM NUMBER, STATUS VARCHAR2(6), STEP VARCHAR2(2)
  , ST_TIME TIMESTAMP, UP_TIME TIMESTAMP, FN_TIME TIMESTAMP, ER_TIME TIMESTAMP
  , ERR_CD NUMBER, ERR_MSG VARCHAR2(100)
);

DROP TABLE TBL_PRTC_BEFORE;
CREATE TABLE TBL_PRTC_BEFORE
(ID VARCHAR2(4), NAME VARCHAR2(30), USERNAME VARCHAR2(20), EMAIL VARCHAR2(50), PHONE VARCHAR2(30), CONTENTS VARCHAR2(255), CREATE_TIME TIMESTAMP);

INSERT INTO TBL_PRTC_BEFORE VALUES('1', 'Leanne Graham', 'Bret', 'Sincere@april.biz', '1-770-736-8031 x56442', 'Please contact Leanne Graham in case of any problems. The number is [1-770-736-8031 x56442]. If Bret are absent, please leave an email to [Sincere@april.biz]. Thank you.', SYSDATE);
INSERT INTO TBL_PRTC_BEFORE VALUES('2', 'Ervin Howell', 'Antonette', 'Shanna@melissa.tv', '010-692-6593 x09125', 'Please contact Ervin Howell in case of any problems. The number is [010-692-6593 x09125]. If Antonette are absent, please leave an email to [Shanna@melissa.tv]. Thank you.', SYSDATE);
INSERT INTO TBL_PRTC_BEFORE VALUES('3', 'Clementine Bauch', 'Samantha', 'Nathan@yesenia.net', '1-463-123-4447', 'Please contact Clementine Bauch in case of any problems. The number is [1-463-123-4447]. If Samantha are absent, please leave an email to [Nathan@yesenia.net]. Thank you.', SYSDATE);
INSERT INTO TBL_PRTC_BEFORE VALUES('4', 'Patricia Lebsack', 'Karianne', 'Julianne.OConner@kory.org', '493-170-9623 x156', 'Please contact Patricia Lebsack in case of any problems. The number is [493-170-9623 x156]. If Karianne are absent, please leave an email to [Julianne.OConner@kory.org]. Thank you.', SYSDATE);
INSERT INTO TBL_PRTC_BEFORE VALUES('5', 'Chelsey Dietrich', 'Kamren', 'Lucio_Hettinger@annie.ca', '(254)954-1289', 'Please contact Chelsey Dietrich in case of any problems. The number is [(254)954-1289]. If Kamren are absent, please leave an email to [Lucio_Hettinger@annie.ca]. Thank you.', SYSDATE);
INSERT INTO TBL_PRTC_BEFORE VALUES('6', 'Mrs. Dennis Schulist', 'Leopoldo_Corkery', 'Karley_Dach@jasper.info', '1-477-935-8478 x6430', 'Please contact Mrs. Dennis Schulist in case of any problems. The number is [1-477-935-8478 x6430]. If Leopoldo_Corkery are absent, please leave an email to [Karley_Dach@jasper.info]. Thank you.', SYSDATE);
INSERT INTO TBL_PRTC_BEFORE VALUES('7', 'Kurtis Weissnat', 'Elwyn.Skiles', 'Telly.Hoeger@billy.biz', '210.067.6132', 'Please contact Kurtis Weissnat in case of any problems. The number is [210.067.6132]. If Elwyn.Skiles are absent, please leave an email to [Telly.Hoeger@billy.biz]. Thank you.', SYSDATE);
INSERT INTO TBL_PRTC_BEFORE VALUES('8', 'Nicholas Runolfsdottir V', 'Maxime_Nienow', 'Sherwood@rosamond.me', '586.493.6943 x140', 'Please contact Nicholas Runolfsdottir V in case of any problems. The number is [586.493.6943 x140]. If Maxime_Nienow are absent, please leave an email to [Sherwood@rosamond.me]. Thank you.', SYSDATE);
INSERT INTO TBL_PRTC_BEFORE VALUES('9', 'Glenna Reichert', 'Delphine', 'Chaim_McDermott@dana.io', '(775)976-6794 x41206', 'Please contact Glenna Reichert in case of any problems. The number is [(775)976-6794 x41206]. If Delphine are absent, please leave an email to [Chaim_McDermott@dana.io]. Thank you.', SYSDATE);
INSERT INTO TBL_PRTC_BEFORE VALUES('10', 'Clementina DuBuque', 'Moriah.Stanton', 'Rey.Padberg@karina.biz', '024-648-3804', 'Please contact Clementina DuBuque in case of any problems. The number is [024-648-3804]. If Moriah.Stanton are absent, please leave an email to [Rey.Padberg@karina.biz]. Thank you.', SYSDATE);

DROP TABLE TBL_PRTC_AFTER;
CREATE TABLE TBL_PRTC_AFTER
(ID VARCHAR2(4), NAME VARCHAR2(30), USERNAME VARCHAR2(20), EMAIL VARCHAR2(50), PHONE VARCHAR2(30), CONTENTS VARCHAR2(255), UPDATE_TIME TIMESTAMP);

