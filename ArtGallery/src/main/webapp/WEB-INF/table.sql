CREATE TABLE T_Category(
	seq NUMBER PRIMARY KEY,
	code CHAR(1) DEFAULT 'A',
	CONSTRAINT TCategory_code_ck CHECK (code in ('A', 'P', 'M')),    -- A: 아티스트, P: 화파, M: 재료
	name VARCHAR2(50),
	remark CLOB,
	imagepath VARCHAR2(200),
	bdate VARCHAR2(10),
	ddate VARCHAR2(10),
	viewcount NUMBER DEFAULT 0
);

CREATE SEQUENCE TCategory_seq;

CREATE UNIQUE INDEX IDX_TCategory_01 ON T_Category(code, name, seq);

CREATE UNIQUE INDEX IDX_TCategory_02 ON T_Category(code, viewcount desc, name, seq);


CREATE TABLE T_Art(
	seq NUMBER PRIMARY KEY,
	title VARCHAR2(200),
	createyear VARCHAR2(4),
	artsize VARCHAR2(100),
	remark CLOB, 
	imagepath VARCHAR2(200), --이미지 경로
	viewcount NUMBER, --작품에 대한 조회수
	regdate DATE DEFAULT SYSDATE  -- 등록일
);
CREATE SEQUENCE TArt_seq;

CREATE UNIQUE INDEX IDX_Tart_01 ON T_Art(title asc, seq desc);

CREATE UNIQUE INDEX IDX_Tart_02 ON T_Art(regdate desc, seq desc);

CREATE INDEX IDX_Tart_03 ON T_Art(viewcount desc, title desc);


CREATE TABLE T_ArtRel(
  	cseq NUMBER,
  	aseq NUMBER,
  	CONSTRAINT TArtRel_cseq_aseq_pk PRIMARY KEY(cseq, aseq),
		sortseq NUMBER
);

CREATE UNIQUE INDEX IDX_TartRel_01 ON T_ArtRel(aseq, cseq);

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

insert into t_artComment (num, writer,content, target_id, seq, comment_group, regdate)
values(TArtComment_seq.nextval, 'hyung', '1  test test test', null, 31, 1, sysdate);
insert into t_artComment (num, writer,content, target_id, seq, comment_group, regdate)
values(TArtComment_seq.nextval, 'hyung', '2  test test test', null, 31, 2, sysdate);
insert into t_artComment (num, writer,content, target_id, seq, comment_group, regdate)
values(TArtComment_seq.nextval, 'hyung', '3  test test test', null, 31, 3, sysdate);
insert into t_artComment (num, writer,content, target_id, seq, comment_group, regdate)
values(TArtComment_seq.nextval, 'hyung', '4  test test test', null, 31, 4, sysdate);
insert into t_artComment (num, writer,content, target_id, seq, comment_group, regdate)
values(TArtComment_seq.nextval, 'hyung', '5  test test test', null, 31, 5, sysdate);
insert into t_artComment (num, writer,content, target_id, seq, comment_group, regdate)
values(TArtComment_seq.nextval, 'hyung', '6  test test test', null, 31, 6, sysdate);
insert into t_artComment (num, writer,content, target_id, seq, comment_group, regdate)
values(TArtComment_seq.nextval, 'hyung', '7  test test test', null, 31, 7, sysdate);
insert into t_artComment (num, writer,content, target_id, seq, comment_group, regdate)
values(TArtComment_seq.nextval, 'hyung', '8  test test test', null, 31, 8, sysdate);
insert into t_artComment (num, writer,content, target_id, seq, comment_group, regdate)
values(TArtComment_seq.nextval, 'hyung', '9  test test test', null, 31, 9, sysdate);
insert into t_artComment (num, writer,content, target_id, seq, comment_group, regdate)
values(TArtComment_seq.nextval, 'hyung', '10  test test test', null, 31, 10, sysdate);


select * from t_artcomment;


CREATE SEQUENCE TArtComment_seq;

DROP TABLE T_CONFIG;

CREATE TABLE T_Config(
        code char(1) DEFAULT '1' PRIMARY KEY,
        pagerow NUMBER DEFAULT 5,
        CONSTRAINT TConfig_pagerow_ck CHECK (pagerow > 0),
        displayrow NUMBER DEFAULT 5,
        CONSTRAINT TConfig_displayrow_ck CHECK (displayrow > 0),
        ip       VARCHAR2(15),
        uploadRoot VARCHAR2(50)
);

DELETE FROM T_CONFIG;
INSERT INTO t_config(code, pagerow, displayrow, ip, uploadRoot)
VALUES('1', 10, 5, '192.168.0.200', '/upload');

-------------------------------------------------------------------------
drop view v_art;

CREATE VIEW V_ART AS
select a.seq, a.title, a.createyear, a.artsize, a.remark, a.imagepath, nvl(a.viewcount, 0) viewcount, a.regdate,
	   b.artist, b.painter, b.material,
	   d.seq as cseq, d.code, d.name
from t_art a, 
	(
		select aseq, max(decode(code, 'A', val)) artist, max(decode(code, 'P', val)) painter, max(decode(code, 'M', val)) material
		from (
			select  b.code, a.aseq, 
			        substr(xmlagg(xmlelement(a,',' || b.name) order by nvl(a.sortseq, 999), b.name).extract('//text()'), 2) val
			  from  t_artrel a, t_category b
			where a.cseq=b.seq
			group by b.code, a.aseq
			) b
		group by aseq
		order by aseq
	) b, t_artrel c, t_category d
where a.seq=b.aseq(+)
and   a.seq=c.aseq(+)
and   c.cseq=d.seq(+)
order by a.seq;


CREATE VIEW V_CATEGORY AS
SELECT seq, code, name
     , DECODE(code, 'A','아티스트', 'P','화파', 'M','재료') codeName,imagepath
	   , NVL((SELECT MAX(ROWNUM) FROM t_artrel a WHERE a.cseq=c.seq), 0) artCount
  FROM t_category c;

select * from v_category;

DROP VIEW V_CATEGORY;

-- 192.168.0.200 아닌 pc 
INSERT INTO t_config(code, pagerow, displayrow, ip, uploadRoot)
VALUES('1', 10, 5, 'localhost', '/upload');


-- 192.168.0.200 pc
INSERT INTO t_config(code, pagerow, displayrow, ip, uploadRoot)
VALUES('1', 10, 5, '192.168.0.200', '/upload');



<!-- 테스트 -->

SELECT  * 
		FROM    V_CATEGORY
		WHERE   code='A' 
		AND     seq != 354
	    AND     seq IN ( SELECT DISTINCT cseq 
	    				 FROM   t_artrel 
	    				 WHERE  aseq IN ( SELECT aseq FROM t_artrel WHERE cseq=354 )
	    			    )  


	    			    
/*
 Data dump
 C:\Users\acorn>exp userid=scott/tiger file='c:\ncs2018\exp.dmp' tables=(scott.t_art, 
 t_config, t_category, t_artcomment, t_artrel, t_user, t_favorart, t_favorcategory)
 
 
 Data import
 C:\Users\acorn>imp userid=scott/tiger owner=scott file='c:\ncs2018\exp.dmp'
*/	    			    
