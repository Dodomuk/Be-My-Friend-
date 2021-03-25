-- 쿼리 다중 실행 단축키 "ctrl + shift + enter"

-- /////////////////////////////////테이블 삭제 쿼리
drop table `user`;
drop table `user_resume`;
drop table `user_cover_letter`;
drop table `review`;
drop table `review_comment`;
drop table `qna`;
drop table `qna_comment`;
drop table `media`;
drop table `media_comment`;
drop table `law`;
drop table `law_comment`;
drop table `calendar`;
drop table `b_file`;
drop table `com_user`;
drop table `com_hire`;


-- ///////////////////////////////커밋
commit;

-- //////////////////////////////////////////////////예시 모음

-- insert into user(user_id,USER_PW,USER_NAME,USER_ADD,USER_TELL,USER_MAIL,USER_BIRTH,USER_ISLEAVE)
-- value('siderid94','123','동묵','서울서추구','010393899','siderid@naver.c','940717','1');

-- insert into user(user_id,USER_PW,USER_NAME,USER_ADD,USER_TELL,USER_MAIL,USER_BIRTH,USER_ISLEAVE)
-- value('siderid93333','123','동묵','서울서추구','010393899','siderid@naver.c','940717','1');

-- insert into review(user_id,review_title,review_content)
-- value("siderid94","aaaa","asadadasdade");
-- insert into review(review_no,user_id,review_title,review_content)
-- value(3,"siderid94","aaaa","asadadasdade");


-- ////////////////////////////////////////////////테이블 생성 
CREATE TABLE `USER` (
	`USER_ID`	VARCHAR(50)	NOT NULL    COMMENT '회원아이디',
	`USER_PW`	VARCHAR(100)	NOT NULL	COMMENT '회원패스워드',
	`USER_NAME`	VARCHAR(100)	NOT NULL	COMMENT '회원이름',
	`USER_ADD`	VARCHAR(200)	NOT NULL	COMMENT '회원주소',
	`USER_TELL`	VARCHAR(100)	NOT NULL	COMMENT '회원전화번호',
	`USER_MAIL`	VARCHAR(100)	NOT NULL	COMMENT '회원이메일',
	`USER_BIRTH`	VARCHAR(100)	NOT NULL	COMMENT '회원생년월일',
	`USER_JOINDATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '회원가입일자',
	`USER_ISLEAVE`	INT(11)	NOT NULL	DEFAULT 1	COMMENT '탈퇴여부(회원:1/탈퇴:0)'
);

CREATE TABLE `REVIEW` (
	`REVIEW_NO`	INT(11)	NOT NULL auto_increment primary key	COMMENT '후기번호',
	`USER_ID`	VARCHAR(50)	NOT NULL	COMMENT '회원아이디',
	`REVIEW_TITLE`	VARCHAR(100)	NOT NULL	COMMENT '후기제목',
	`REVIEW_CONTENT`	VARCHAR(2000)	NOT NULL	COMMENT '후기내용',
	`REVIEW_DATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '후기작성날짜'
);

CREATE TABLE `CALENDAR` (
	`CAL_NO`	INT(11)	NOT NULL  auto_increment primary key	COMMENT '달력번호',
	`EVENT_START_DATE`	DATE	NOT NULL,
	`EVENT_END_DATE`	DATE	NOT NULL,
	`EVENT_COM_NAME`	VARCHAR(100)	NOT NULL
);

CREATE TABLE `B_FILE` (
	`FILE_NO`	INT(11)	NOT NULL  auto_increment primary key	COMMENT '파일번호',
	`TYPE_IDX`	INT(11)	NOT NULL	COMMENT '게시판인덱스',
	`FILE_TITLE`	VARCHAR(100)	NOT NULL	COMMENT '파일제목',
	`FILE_CONTENT`	VARCHAR(2000)	NOT NULL	COMMENT '파일내용',
	`FILE_PATH`	VARCHAR(200)	NOT NULL	COMMENT '파일경로',
	`FILE_DATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록/수정일'
);

CREATE TABLE `COM_USER` (
	`COM_ID`	VARCHAR(100)	NOT NULL  	COMMENT '기업아이디',
	`COM_PW`	VARCHAR(100)	NOT NULL	COMMENT '기업패스워드',
	`COM_NAME`	VARCHAR(100)	NOT NULL	COMMENT '기업이름',
	`COM_ADDRESS`	VARCHAR(200)	NOT NULL	COMMENT '기업주소',
	`COM_TELL`	VARCHAR(100)	NOT NULL	COMMENT '기업전화번호',
	`COM_MAIL`	VARCHAR(100)	NOT NULL	COMMENT '메일주소',
	`COM_TYPE`	VARCHAR(100)	NOT NULL	COMMENT '기업 유형',
	`COM_NUM`	VARCHAR(100)	NOT NULL	COMMENT '기업번호',
	`COM_MANAGER`	VARCHAR(100)	NOT NULL	COMMENT '인사담당자',
	`COM_JOINDATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '기업가입일자',
	`COM_ISLEAVE`	INT	NOT NULL	DEFAULT 1	COMMENT '기업탈퇴여부(회원:1/탈퇴:0)',
	`COM_GRADE`	VARCHAR(100)	NOT NULL	DEFAULT 0	COMMENT '기업등급'
);

CREATE TABLE `QNA_COMMENT` (
	`QNA_COMMENT_NO`	INT(11)	NOT NULL  auto_increment primary key	COMMENT '댓글',
	`QNA_NO`	VARCHAR(100)	NOT NULL	COMMENT 'QNA 고유키',
	`USER_ID`	VARCHAR(50)	NOT NULL	COMMENT '회원아이디',
	`QNA_COMMENT_DATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '작성날짜',
	`QNA_COMMENT_CONTENT`	VARCHAR(1000)	NOT NULL	COMMENT 'QNA 댓글 내용'
);

CREATE TABLE `MEDIA_COMMENT` (
	`MEDIA_COMMENT_NO`	INT(11)	NOT NULL auto_increment primary key	COMMENT '댓글',
	`MEDIA_NO`	VARCHAR(100)	NOT NULL	COMMENT '매체정보키',
	`MEDIA_COMMENT_CONTENT`	VARCHAR(1000)	NOT NULL	COMMENT '정보 댓글 내용',
	`MEDIA_COMMENT_DATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '정보 댓글 작성날짜'
);

CREATE TABLE `LAW_COMMENT` (
	`LAW_COMMENT_NO`	INT(11)	NOT NULL auto_increment primary key	COMMENT '댓글',
	`LAW_NO`	VARCHAR(100)	NOT NULL	COMMENT '법률번호',
	`LAW_COMMENT_CONTENT`	VARCHAR(1000)	NOT NULL	COMMENT '법률 댓글 내용',
	`LAW_COMMENT_DATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '법률 댓글 작성날짜'
);

CREATE TABLE `LAW` (
	`LAW_NO`	INT(11)	NOT NULL auto_increment primary key	COMMENT '법률번호',
	`LAW_TITLE`	VARCHAR(100)	NOT NULL	COMMENT '법률제목',
	`LAW_CONTENT`	VARCHAR(2000)	NOT NULL	COMMENT '법률내용',
	`LAW_DATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '법률작성날짜'
);

CREATE TABLE `MEDIA` (
	`MEDIA_NO`	INT(11)	NOT NULL auto_increment primary key	COMMENT '매체정보키',
	`MEDIA_TITLE`	VARCHAR(100)	NOT NULL	COMMENT '정보제목',
	`MEDIA_CONTENT`	VARCHAR(2000)	NOT NULL	COMMENT '정보내용',
	`MEDIA_DATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '정보작성날짜'
);

CREATE TABLE `QNA` (
	`QNA_NO`	INT(11)	NOT NULL auto_increment primary key	COMMENT 'QNA 고유키',
	`USER_ID`	VARCHAR(50)	NOT NULL	COMMENT '회원아이디',
	`QNA_TITLE`	VARCHAR(100)	NOT NULL	COMMENT 'QNA제목',
	`QNA_CONTENT`	VARCHAR(2000)	NOT NULL	COMMENT 'QNA카테고리',
	`QNA_DATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '작성날짜'
);

CREATE TABLE `COM_HIRE` (
	`JOB_NO`	INT(11)	NOT NULL	COMMENT '채용번호',
	`COM_ID`	VARCHAR(100)	NOT NULL	COMMENT '기업아이디',
	`JOB_TITLE`	VARCHAR(100)	NOT NULL	COMMENT '채용공고제목',
	`JOB_DEADLINE`	VARCHAR(100)	NOT NULL	COMMENT '공고기간',
	`JOB_STEP`	VARCHAR(100)	NULL	COMMENT '전형절차',
	`JOB_TYPE`	VARCHAR(100)	NULL	COMMENT '채용형태',
	`JOB_PER_NUM`	VARCHAR(100)	NOT NULL	DEFAULT 0	COMMENT '채용인원',
	`JOB_DUTY`	VARCHAR(100)	NOT NULL	COMMENT '담당업무',
	`JOB_LOCATION`	VARCHAR(100)	NULL	COMMENT '채용지역',
	`JOB_CAREER`	VARCHAR(100)	NOT NULL	COMMENT '채용경력',
	`JOB_EDU`	VARCHAR(100)	NOT NULL	COMMENT '채용학력',
	`JOB_NEED`	VARCHAR(100)	NULL	COMMENT '필수요건',
	`JOB_PREPER`	VARCHAR(100)	NULL	COMMENT '우대요건',
	`JOB_WELFARE`	VARCHAR(100)	NULL	COMMENT '복리후생',
	`JOB_SALARY`	VARCHAR(100)	NULL	COMMENT '채용급여',
	`JOB_DATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '채용작성날짜',
	`JOB_IMAGE`	VARCHAR(100)	NULL	COMMENT '채용이미지'
);

CREATE TABLE `REVIEW_COMMENT` (
	`REVIEW_COMMENT_NO`	INT(11)	NOT NULL auto_increment primary key	COMMENT '댓글',
	`REVIEW_NO`	INT(11)	NOT NULL	COMMENT '취업면접후기 키',
	`USER_ID`	VARCHAR(50)	NOT NULL	COMMENT '회원아이디',
	`REVIEW_COMMENT_CONTENT`	VARCHAR(1000)	NOT NULL	COMMENT '후기 댓글 내용',
	`REVIEW_COMMENT_DATE`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '후기 댓글 작성날짜'
);

CREATE TABLE `USER_RESUME` (
	`USER_ID`	VARCHAR(50)	NOT NULL	COMMENT '회원아이디',
	`SCHOOL`	VARCHAR(100)	NULL	COMMENT '고등학교(0)/  대학2,3년(1)/  대학4년(2)',
	`SCH_MAJOR`	VARCHAR(100)	NULL	COMMENT '전공명',
	`SCH_SCORE`	VARCHAR(100)	NULL	COMMENT '학점',
	`SCH_STATUS`	VARCHAR(100)	NULL	COMMENT '졸업예정(0)/  졸업(1)/  재학중(2)/  중퇴(3)/  수료(4)/  휴학(5)',
	`SCH_ENROLL`	DATE	NULL	COMMENT '입학년월',
	`SCH_GRADUATE`	DATE	NULL	COMMENT '졸업년월',
	`CAR_COM`	VARCHAR(100)	NULL	COMMENT '경력회사',
	`CAR_DEPARTMENR`	VARCHAR(100)	NULL	COMMENT '경력부서',
	`CAR_POSITION`	VARCHAR(100)	NULL	COMMENT '경력직급',
	`CAR_ENTER`	DATE	NULL	COMMENT '경력입사년월',
	`CAR_QUIT`	DATE	NULL	COMMENT '경력퇴사년월',
	`CAR_SALARY`	VARCHAR(100)	NULL	COMMENT '경력연봉',
	`HOPE_STATUS`	VARCHAR(100)	NULL	COMMENT '희망연봉',
	`HOPE_WORK_PLACE`	VARCHAR(100)	NULL	COMMENT '희망근무지',
	`HOPE_SALARY`	VARCHAR(100)	NULL	COMMENT '희망연봉',
	`HOPE_POSITION`	VARCHAR(100)	NULL	COMMENT '희망분야'
);

CREATE TABLE `USER_COVER_LETTER` (
	`LETTER_IDX`	INT(11)	NOT NULL auto_increment primary key	COMMENT '자기소개서 번호',
	`USER_ID`	VARCHAR(50)	NOT NULL	COMMENT '회원아이디',
	`TITLE_FIR`	VARCHAR(100)	NULL	COMMENT '제목1',
	`TITLE_SEC`	VARCHAR(100)	NULL	COMMENT '제목2',
	`TITLE_THR`	VARCHAR(100)	NULL	COMMENT '제목3',
	`CONTENT_FIR`	VARCHAR(2000)	NULL	COMMENT '내용1',
	`CONTENT_SEC`	VARCHAR(2000)	NULL	COMMENT '내용2',
	`CONTENT_THIRD`	VARCHAR(2000)	NULL	COMMENT '내용3'
);

ALTER TABLE `USER` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`USER_ID`
);

ALTER TABLE `COM_USER` ADD CONSTRAINT `PK_COM_USER` PRIMARY KEY (
	`COM_ID`
);

ALTER TABLE `COM_HIRE` ADD CONSTRAINT `PK_COM_HIRE` PRIMARY KEY (
	`JOB_NO`
);

ALTER TABLE `USER_RESUME` ADD CONSTRAINT `PK_USER_RESUME` PRIMARY KEY (
	`USER_ID`
);

ALTER TABLE `USER_RESUME` ADD CONSTRAINT `FK_USER_TO_USER_RESUME_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
);

-- ///////////////////////////////////////테이블 인덱스값 자동 초기화 시퀀스 (동묵)
alter table review auto_increment=0;

set @COUNT = 0;  -- 다시 IDX를 0부터 시작하게 설정해줌 
UPDATE review set review_no = @COUNT:=@COUNT+1; --  행이 추가될때마다 UNQ_NUMBER 1씩 증가


alter table review_comment auto_increment=0;

set @COUNT = 0;  -- 다시 IDX를 0부터 시작하게 설정해줌 
UPDATE review_comment set review_comment_no = @COUNT:=@COUNT+1; --  행이 추가될때마다 UNQ_NUMBER 1씩 증가


alter table qna auto_increment=0;

set @COUNT = 0;  -- 다시 IDX를 0부터 시작하게 설정해줌 
UPDATE qna set qna_no = @COUNT:=@COUNT+1; --  행이 추가될때마다 UNQ_NUMBER 1씩 증가


alter table qna_comment auto_increment=0;

set @COUNT = 0;  -- 다시 IDX를 0부터 시작하게 설정해줌 
UPDATE qna_comment set qna_comment_no = @COUNT:=@COUNT+1; --  행이 추가될때마다 UNQ_NUMBER 1씩 증가


alter table media auto_increment=0;

set @COUNT = 0;  -- 다시 IDX를 0부터 시작하게 설정해줌 
UPDATE media set media_no = @COUNT:=@COUNT+1; --  행이 추가될때마다 UNQ_NUMBER 1씩 증가



alter table media_comment auto_increment=0;

set @COUNT = 0;  -- 다시 IDX를 0부터 시작하게 설정해줌 
UPDATE media_comment set media_comment_no = @COUNT:=@COUNT+1; --  행이 추가될때마다 UNQ_NUMBER 1씩 증가


alter table law auto_increment=0;

set @COUNT = 0;  -- 다시 IDX를 0부터 시작하게 설정해줌 
UPDATE law set law_no = @COUNT:=@COUNT+1; --  행이 추가될때마다 UNQ_NUMBER 1씩 증가


alter table law_comment auto_increment=0;

set @COUNT = 0;  -- 다시 IDX를 0부터 시작하게 설정해줌 
UPDATE law_comment set law_comment_no = @COUNT:=@COUNT+1; --  행이 추가될때마다 UNQ_NUMBER 1씩 증가



alter table user_cover_letter auto_increment=0;

set @COUNT = 0;  -- 다시 IDX를 0부터 시작하게 설정해줌 
UPDATE user_cover_letter set letter_idx = @COUNT:=@COUNT+1; --  행이 추가될때마다 UNQ_NUMBER 1씩 증가



-- /////////////////////////////////////'파일, 캘린더' 인덱스 값 초기화 시퀀스 쿼리alter
alter table calendar auto_increment=0;

set @COUNT = 0;  -- 다시 IDX를 0부터 시작하게 설정해줌 
UPDATE calendar set cal_no = @COUNT:=@COUNT+1; --  행이 추가될때마다 UNQ_NUMBER 1씩 증가


alter table b_file auto_increment=0;

set @COUNT = 0;  -- 다시 IDX를 0부터 시작하게 설정해줌 
UPDATE b_file set file_no = @COUNT:=@COUNT+1; --  행이 추가될때마다 UNQ_NUMBER 1씩 증가
