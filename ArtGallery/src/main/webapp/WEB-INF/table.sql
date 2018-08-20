CREATE TABLE T_Category(
	seq NUMBER PRIMARY KEY,
	code CHAR(1) DEFAULT 'A',
	CONSTRAINT TCategory_code_ck CHECK (code in ('A', 'P', 'M')),    -- A: 아티스트, P: 화파, M: 재료
	name VARCHAR2(50),
	remark CLOB,
	imagepath VARCHAR2(200),
	bdate VARCHAR2(10),
	ddate VARCHAR2(10)
);
CREATE SEQUENCE TCategory_seq;

-- sample data
insert into T_Category(seq, code, engname, korname, remark, imagepath, bdate, ddate) 
values (TCategory_seq.NEXTVAL, 'A', 'sejan', '세잔', null, null, '1800/01/01 AM 10:10:10', null);

CREATE TABLE T_Art(
	seq NUMBER PRIMARY KEY,
	title VARCHAR2(100),
	createyear VARCHAR2(4),
	artsize VARCHAR2(20),
	remark CLOB, 
	imagepath VARCHAR2(200), --이미지 경로
	viewcount NUMBER --작품에 대한 조회수
);
CREATE SEQUENCE TArt_seq;

CREATE TABLE T_ArtRel(
  	cseq NUMBER,
  	aseq NUMBER,
  	CONSTRAINT TArtRel_cseq_aseq_pk PRIMARY KEY(cseq, aseq)
);

CREATE TABLE T_User(
	id VARCHAR2(11) PRIMARY KEY,
	pwd VARCHAR2(60),
	email VARCHAR2(50),
	roll CHAR(1) DEFAULT 'U', --관리자 여부
	CONSTRAINT TUser_roll_ck CHECK (roll in ('A', 'U')),
	regdate DATE DEFAULT SYSDATE, --최초 아이디 만든 날짜
	delDate DATE --아이디 삭제한 날짜
);

CREATE TABLE T_FavorArt(
	id VARCHAR2(11),
	aseq NUMBER,
	regdate DATE DEFAULT SYSDATE,
  	CONSTRAINT TFavorArt_pk PRIMARY KEY(id, aseq)
);

CREATE TABLE T_FavorCategory(
	id VARCHAR2(11),
	cseq NUMBER,
  	CONSTRAINT TFavorCategory_pk PRIMARY KEY(id, cseq)
);

----------------------------------------------------------------------

-- 댓글 정보를 저장할 테이블
CREATE TABLE T_ArtComment(
	num NUMBER PRIMARY KEY, -- 댓글의 글번호
	writer VARCHAR2(11), -- 댓글 작성자
	content VARCHAR2(500), -- 댓글 내용
	target_id VARCHAR2(11), -- 댓글의 대상이 되는 아이디(글작성자)
	seq NUMBER, -- 댓글 그룹번호
	comment_group NUMBER, -- 원글에 달린 댓글 내에서의 그룹번호
	regdate DATE -- 댓글 등록일 
);

CREATE SEQUENCE TArtComment_seq;

CREATE TABLE T_Config(
        code char(1) PRIMARY KEY DEFAULT '1',
        pagerow NUMBER DEFAULT 5,
        CONSTRAINT TConfig_pagerow_ck CHECK (pagerow > 0),
        displayrow NUMBER DEFAULT 5,
        CONSTRAINT TConfig_displayrow_ck CHECK (displayrow > 0)
);
