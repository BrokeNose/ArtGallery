select * from t_art where viewcount > 0;

update t_category set imagepath='/upload/P/1.jpg' where seq=1;
update t_category set imagepath='/upload/P/12.jpg' where seq=12;
update t_category set imagepath='/upload/P/22.jpg' where seq=22;
update t_category set imagepath='/upload/P/24.jpg' where seq=24;
update t_category set imagepath='/upload/P/25.jpg' where seq=25;
update t_category set imagepath='/upload/M/122.jpg' where seq=122;
update t_category set imagepath='/upload/M/123.jpg' where seq=123;
update t_category set imagepath='/upload/M/124.jpg' where seq=124;
update t_category set imagepath='/upload/M/127.jpg' where seq=127;
update t_category set imagepath='/upload/M/129.jpg' where seq=129;
update t_category set imagepath='/upload/M/130.jpg' where seq=130;
update t_category set imagepath='/upload/M/133.jpg' where seq=133;
update t_category set imagepath='/upload/M/134.jpg' where seq=134;
update t_category set imagepath='/upload/M/144.jpg' where seq=144;
update t_category set imagepath='/upload/M/164.jpg' where seq=164;
update t_category set imagepath='/upload/M/165.jpg' where seq=165;
update t_category set imagepath='/upload/M/181.jpg' where seq=181;
update t_category set imagepath='/upload/M/195.jpg' where seq=195;
update t_category set imagepath='/upload/M/198.jpg' where seq=198;
update t_category set imagepath='/upload/M/266.jpg' where seq=266;

update t_category set imagepath=null where seq=262;
update t_category set imagepath='/upload/A/362.jpg' where seq=362;

SELECT result2.* 
FROM (
		SELECT result1.*, ROWNUM rnum 
		FROM (
				SELECT DISTINCT seq, title, createyear, artsize, imagepath, viewcount, 
					TO_CHAR(regdate,'YYYY.MM.DD HH24:MI') AS regdate, regdate as regdate2, artist, painter, material 
					FROM v_art 
					ORDER BY regdate DESC, seq DESC 
			 ) result1 
		ORDER BY regdate DESC, seq DESC 
	  ) result2 
ORDER BY rnum
;

select * from t_art   ORDER BY regdate DESC, seq DESC;

insert into t_artrel(cseq, aseq, sortseq) values(374,109, 1);  -- 공동 db 추가 해야함. 

select imagepath from t_art ; 

update t_art set imagepath='/'||imagepath
where seq <= 109
;


update t_art set imagepath= substr(imagepath, 2)
where seq <= 109
;
select imagepath, substr(imagepath, 2) from t_art where seq <= 109;

select imagepath from t_art;

--비밀번호 1234
insert into t_user(id, pwd, email, roll, regdate)
values('hyung', '$2a$10$ieO.RCUjTR0T.I6jBgMEzOM.Jo4XVH9WERybs9.hx2OCqW4LXoG72', '1@1.com', 'A', sysdate);
insert into t_user(id, pwd, email, roll, regdate)
values('nalara', '$2a$10$ieO.RCUjTR0T.I6jBgMEzOM.Jo4XVH9WERybs9.hx2OCqW4LXoG72', '1@1.com', 'A', sysdate);
insert into t_user(id, pwd, email, roll, regdate)
values('ths8976', '$2a$10$ieO.RCUjTR0T.I6jBgMEzOM.Jo4XVH9WERybs9.hx2OCqW4LXoG72', '1@1.com', 'A', sysdate);

-- t_category

insert into t_category(seq, code, name) values(1, 'P', '근대미술');
insert into t_category(seq, code, name) values(2, 'P', '현대미술');
insert into t_category(seq, code, name) values(3, 'P', '초현실주의');
insert into t_category(seq, code, name) values(4, 'P', '추상화');
insert into t_category(seq, code, name) values(5, 'P', '바로크');
insert into t_category(seq, code, name) values(6, 'P', '인상주의');
insert into t_category(seq, code, name) values(7, 'P', '르네상스');
insert into t_category(seq, code, name) values(8, 'P', '낭만주의');
insert into t_category(seq, code, name) values(9, 'P', '고딕미술');
insert into t_category(seq, code, name) values(10, 'P', '팝 아트');
insert into t_category(seq, code, name) values(11, 'P', '미래파');
insert into t_category(seq, code, name) values(12, 'P', '표현주의');
insert into t_category(seq, code, name) values(13, 'P', '입체파');
insert into t_category(seq, code, name) values(14, 'P', '로코코');
insert into t_category(seq, code, name) values(15, 'P', '아르 누보');
insert into t_category(seq, code, name) values(16, 'P', '민속 예술');
insert into t_category(seq, code, name) values(17, 'P', '거리 미술');
insert into t_category(seq, code, name) values(18, 'P', '아르 데코');
insert into t_category(seq, code, name) values(19, 'P', '고전주의');
insert into t_category(seq, code, name) values(20, 'P', '신고전주의');
insert into t_category(seq, code, name) values(21, 'P', '추상표현주의');
insert into t_category(seq, code, name) values(22, 'P', '미니멀리즘');
insert into t_category(seq, code, name) values(23, 'P', '기하학적 추상');
insert into t_category(seq, code, name) values(24, 'P', '후기인상주의');
insert into t_category(seq, code, name) values(25, 'P', '이탈리아 르네상스');
insert into t_category(seq, code, name) values(26, 'P', '개념미술');
insert into t_category(seq, code, name) values(27, 'P', '우키요에');
insert into t_category(seq, code, name) values(28, 'P', '다다이즘');
insert into t_category(seq, code, name) values(29, 'P', '모더니즘');
insert into t_category(seq, code, name) values(30, 'P', '라파엘 전파');
insert into t_category(seq, code, name) values(31, 'P', '유미주의');
insert into t_category(seq, code, name) values(32, 'P', '매너리즘');
insert into t_category(seq, code, name) values(33, 'P', '대지 예술');
insert into t_category(seq, code, name) values(34, 'P', '아카데믹 미술');
insert into t_category(seq, code, name) values(35, 'P', '상징주의');
insert into t_category(seq, code, name) values(36, 'P', '키네틱 아트');
insert into t_category(seq, code, name) values(37, 'P', '포스트모더니즘');
insert into t_category(seq, code, name) values(38, 'P', '극사실주의');
insert into t_category(seq, code, name) values(39, 'P', '사회주의적 사실주의');
insert into t_category(seq, code, name) values(40, 'P', '플럭서스');
insert into t_category(seq, code, name) values(41, 'P', 'Photorealism');
insert into t_category(seq, code, name) values(42, 'P', '원시주의');
insert into t_category(seq, code, name) values(43, 'P', '데 스틸');
insert into t_category(seq, code, name) values(44, 'P', 'Color Field');
insert into t_category(seq, code, name) values(45, 'P', 'Dutch Golden Age');
insert into t_category(seq, code, name) values(46, 'P', '러시아 구성주의');
insert into t_category(seq, code, name) values(47, 'P', '옵아트');
insert into t_category(seq, code, name) values(48, 'P', '야수파');
insert into t_category(seq, code, name) values(49, 'P', 'Nihonga');
insert into t_category(seq, code, name) values(50, 'P', '빈 분리파');
insert into t_category(seq, code, name) values(51, 'P', 'Realism');
insert into t_category(seq, code, name) values(52, 'P', '전성기 르네상스');
insert into t_category(seq, code, name) values(53, 'P', 'American Impressionism');
insert into t_category(seq, code, name) values(54, 'P', 'Nouveau realisme');
insert into t_category(seq, code, name) values(55, 'P', '마술적 사실주의');
insert into t_category(seq, code, name) values(56, 'P', 'Hudson River School');
insert into t_category(seq, code, name) values(57, 'P', '영 브리티시 아티스트');
insert into t_category(seq, code, name) values(58, 'P', '신인상주의');
insert into t_category(seq, code, name) values(59, 'P', 'Art and Crafts movement');
insert into t_category(seq, code, name) values(60, 'P', '쉬프레마티슴');
insert into t_category(seq, code, name) values(61, 'P', '형이상학적 회화');
insert into t_category(seq, code, name) values(62, 'P', '할렘 르네상스');
insert into t_category(seq, code, name) values(63, 'P', '사회적 사실주의');
insert into t_category(seq, code, name) values(64, 'P', '자포니즘');
insert into t_category(seq, code, name) values(65, 'P', 'American modernism');
insert into t_category(seq, code, name) values(66, 'P', '신낭만주의');
insert into t_category(seq, code, name) values(67, 'P', 'Northern Renaissance');
insert into t_category(seq, code, name) values(68, 'P', 'Arte Povera');
insert into t_category(seq, code, name) values(69, 'P', '청기사파');
insert into t_category(seq, code, name) values(70, 'P', 'Sienese School');
insert into t_category(seq, code, name) values(71, 'P', '바르비종파');
insert into t_category(seq, code, name) values(72, 'P', 'Neo-expressionism');
insert into t_category(seq, code, name) values(73, 'P', '나비파');
insert into t_category(seq, code, name) values(74, 'P', 'American Realism');
insert into t_category(seq, code, name) values(75, 'P', '에콜 드 파리');
insert into t_category(seq, code, name) values(76, 'P', '신즉물주의');
insert into t_category(seq, code, name) values(77, 'P', 'Biomorphism');
insert into t_category(seq, code, name) values(78, 'P', 'Shin-hanga');
insert into t_category(seq, code, name) values(79, 'P', 'French Renaissance');
insert into t_category(seq, code, name) values(80, 'P', 'Ashcan School');
insert into t_category(seq, code, name) values(81, 'P', 'Caravaggisti');
insert into t_category(seq, code, name) values(82, 'P', '스페인 르네상스');
insert into t_category(seq, code, name) values(83, 'P', 'Tachisme');
insert into t_category(seq, code, name) values(84, 'P', 'Florentine painting');
insert into t_category(seq, code, name) values(85, 'P', 'German Renaissance');
insert into t_category(seq, code, name) values(86, 'P', 'Regionalism');
insert into t_category(seq, code, name) values(87, 'P', 'Tonalism');
insert into t_category(seq, code, name) values(88, 'P', 'Postminimalism');
insert into t_category(seq, code, name) values(89, 'P', '슈투름 운트 드랑');
insert into t_category(seq, code, name) values(90, 'P', 'Hague School');
insert into t_category(seq, code, name) values(91, 'P', 'Sosaku-hanga');
insert into t_category(seq, code, name) values(92, 'P', 'Dutch and Flemish Renaissance painting');
insert into t_category(seq, code, name) values(93, 'P', 'Nazarene movement');
insert into t_category(seq, code, name) values(94, 'P', '레요니슴');
insert into t_category(seq, code, name) values(95, 'P', 'Synthetism');
insert into t_category(seq, code, name) values(96, 'P', 'Luminism');
insert into t_category(seq, code, name) values(97, 'P', 'Antwerp school');
insert into t_category(seq, code, name) values(98, 'P', '섹숑도르');
insert into t_category(seq, code, name) values(99, 'P', 'Washington Color School');
insert into t_category(seq, code, name) values(100, 'P', 'Heidelberg School');
insert into t_category(seq, code, name) values(101, 'P', 'American Renaissance');
insert into t_category(seq, code, name) values(102, 'P', 'Utrecht Caravaggism');
insert into t_category(seq, code, name) values(103, 'P', 'Pennsylvania Impressionism');
insert into t_category(seq, code, name) values(104, 'P', 'Amsterdam Impressionism');
insert into t_category(seq, code, name) values(105, 'P', 'Bauhaus style');
insert into t_category(seq, code, name) values(106, 'P', 'Cleveland School');
insert into t_category(seq, code, name) values(107, 'P', 'Good Design');
insert into t_category(seq, code, name) values(108, 'P', 'Milanese School');
insert into t_category(seq, code, name) values(109, 'P', 'Paduan School');
insert into t_category(seq, code, name) values(110, 'P', 'Spanish Electricism');
insert into t_category(seq, code, name) values(111, 'P', 'Early renaissance');
insert into t_category(seq, code, name) values(112, 'P', '독일 표현주의');
insert into t_category(seq, code, name) values(113, 'P', 'Venetian school');
insert into t_category(seq, code, name) values(114, 'P', 'Norwich School');
insert into t_category(seq, code, name) values(115, 'P', '공공미술');
insert into t_category(seq, code, name) values(116, 'P', '자연주의');
insert into t_category(seq, code, name) values(117, 'P', '브뤼케');
insert into t_category(seq, code, name) values(118, 'P', 'School of Fontainebleau');
insert into t_category(seq, code, name) values(119, 'P', 'Bolognese School');
insert into t_category(seq, code, name) values(120, 'P', 'School of Ferrara');
insert into t_category(seq, code, name) values(121, 'P', '나이브 아트');
insert into t_category(seq, code, name) values(122, 'M', '종이');
insert into t_category(seq, code, name) values(123, 'M', '잉크');
insert into t_category(seq, code, name) values(124, 'M', '수채화');
insert into t_category(seq, code, name) values(125, 'M', '금속');
insert into t_category(seq, code, name) values(126, 'M', '직물');
insert into t_category(seq, code, name) values(127, 'M', 'Oil paint');
insert into t_category(seq, code, name) values(128, 'M', '암석');
insert into t_category(seq, code, name) values(129, 'M', '켄버스');
insert into t_category(seq, code, name) values(130, 'M', '흑연');
insert into t_category(seq, code, name) values(131, 'M', '점토');
insert into t_category(seq, code, name) values(132, 'M', '인그레이빙');
insert into t_category(seq, code, name) values(133, 'M', '목재');
insert into t_category(seq, code, name) values(134, 'M', '펜');
insert into t_category(seq, code, name) values(135, 'M', '사진');
insert into t_category(seq, code, name) values(136, 'M', '조각');
insert into t_category(seq, code, name) values(137, 'M', '종이갑');
insert into t_category(seq, code, name) values(138, 'M', '석기');
insert into t_category(seq, code, name) values(139, 'M', '은');
insert into t_category(seq, code, name) values(140, 'M', '안료');
insert into t_category(seq, code, name) values(141, 'M', '유리');
insert into t_category(seq, code, name) values(142, 'M', '에칭');
insert into t_category(seq, code, name) values(143, 'M', '금');
insert into t_category(seq, code, name) values(144, 'M', '연필');
insert into t_category(seq, code, name) values(145, 'M', '아크릴물감');
insert into t_category(seq, code, name) values(146, 'M', 'Gouache');
insert into t_category(seq, code, name) values(147, 'M', '색연필');
insert into t_category(seq, code, name) values(148, 'M', '고무');
insert into t_category(seq, code, name) values(149, 'M', '피혁');
insert into t_category(seq, code, name) values(150, 'M', '목화');
insert into t_category(seq, code, name) values(151, 'M', '도자기');
insert into t_category(seq, code, name) values(152, 'M', '청동');
insert into t_category(seq, code, name) values(153, 'M', '세라믹');
insert into t_category(seq, code, name) values(154, 'M', '템페라');
insert into t_category(seq, code, name) values(155, 'M', '비취');
insert into t_category(seq, code, name) values(156, 'M', '나뭇진');
insert into t_category(seq, code, name) values(157, 'M', '모래');
insert into t_category(seq, code, name) values(158, 'M', '상아');
insert into t_category(seq, code, name) values(159, 'M', '래커');
insert into t_category(seq, code, name) values(160, 'M', 'Fiberglass');
insert into t_category(seq, code, name) values(161, 'M', '구리');
insert into t_category(seq, code, name) values(162, 'M', '레이스');
insert into t_category(seq, code, name) values(163, 'M', '황동');
insert into t_category(seq, code, name) values(164, 'M', '명주');
insert into t_category(seq, code, name) values(165, 'M', '백악');
insert into t_category(seq, code, name) values(166, 'M', '강철');
insert into t_category(seq, code, name) values(167, 'M', '나일론');
insert into t_category(seq, code, name) values(168, 'M', '테라코타');
insert into t_category(seq, code, name) values(169, 'M', '스테인리스강');
insert into t_category(seq, code, name) values(170, 'M', '법랑');
insert into t_category(seq, code, name) values(171, 'M', '철');
insert into t_category(seq, code, name) values(172, 'M', '대리암');
insert into t_category(seq, code, name) values(173, 'M', '철사');
insert into t_category(seq, code, name) values(174, 'M', '사진 필름');
insert into t_category(seq, code, name) values(175, 'M', '플라스터');
insert into t_category(seq, code, name) values(176, 'M', '왁스');
insert into t_category(seq, code, name) values(177, 'M', '깃털');
insert into t_category(seq, code, name) values(178, 'M', '목탄');
insert into t_category(seq, code, name) values(179, 'M', '콘크리트');
insert into t_category(seq, code, name) values(180, 'M', 'Gold leaf');
insert into t_category(seq, code, name) values(181, 'M', '양모');
insert into t_category(seq, code, name) values(182, 'M', '라텍스');
insert into t_category(seq, code, name) values(183, 'M', '벽돌');
insert into t_category(seq, code, name) values(184, 'M', '스털링 실버');
insert into t_category(seq, code, name) values(185, 'M', '펠트');
insert into t_category(seq, code, name) values(186, 'M', '바니시');
insert into t_category(seq, code, name) values(187, 'M', '다이아몬드');
insert into t_category(seq, code, name) values(188, 'M', '터키옥');
insert into t_category(seq, code, name) values(189, 'M', '스투코');
insert into t_category(seq, code, name) values(190, 'M', '에폭시');
insert into t_category(seq, code, name) values(191, 'M', '스테인드 글라스');
insert into t_category(seq, code, name) values(192, 'M', '포일');
insert into t_category(seq, code, name) values(193, 'M', '흑단');
insert into t_category(seq, code, name) values(194, 'M', '폴리우레탄');
insert into t_category(seq, code, name) values(195, 'M', '크레용');
insert into t_category(seq, code, name) values(196, 'M', '마호가니');
insert into t_category(seq, code, name) values(197, 'M', '밧줄');
insert into t_category(seq, code, name) values(198, 'M', '레이드 페이퍼');
insert into t_category(seq, code, name) values(199, 'M', '화강암');
insert into t_category(seq, code, name) values(200, 'M', '목피');
insert into t_category(seq, code, name) values(201, 'M', '석영');
insert into t_category(seq, code, name) values(202, 'M', '조가비');
insert into t_category(seq, code, name) values(203, 'M', '실');
insert into t_category(seq, code, name) values(204, 'M', '호박');
insert into t_category(seq, code, name) values(205, 'M', '점판암');
insert into t_category(seq, code, name) values(206, 'M', '연철');
insert into t_category(seq, code, name) values(207, 'M', '폴리에스터');
insert into t_category(seq, code, name) values(208, 'M', 'Nacre');
insert into t_category(seq, code, name) values(209, 'M', '새틴');
insert into t_category(seq, code, name) values(210, 'M', '석류석');
insert into t_category(seq, code, name) values(211, 'M', '알루미늄');
insert into t_category(seq, code, name) values(212, 'M', '호마노');
insert into t_category(seq, code, name) values(213, 'M', '클리스털');
insert into t_category(seq, code, name) values(214, 'M', '석회암');
insert into t_category(seq, code, name) values(215, 'M', '경옥');
insert into t_category(seq, code, name) values(216, 'M', '퓨터');
insert into t_category(seq, code, name) values(217, 'M', '납');
insert into t_category(seq, code, name) values(218, 'M', '주철');
insert into t_category(seq, code, name) values(219, 'M', '아마포');
insert into t_category(seq, code, name) values(220, 'M', '페리도트');
insert into t_category(seq, code, name) values(221, 'M', 'India ink');
insert into t_category(seq, code, name) values(222, 'M', '백옥');
insert into t_category(seq, code, name) values(223, 'M', '호두');
insert into t_category(seq, code, name) values(224, 'M', '수은');
insert into t_category(seq, code, name) values(225, 'M', '우단');
insert into t_category(seq, code, name) values(226, 'M', 'Faience');
insert into t_category(seq, code, name) values(227, 'M', '신문용지');
insert into t_category(seq, code, name) values(228, 'M', '합판');
insert into t_category(seq, code, name) values(229, 'M', '공작석');
insert into t_category(seq, code, name) values(230, 'M', '적철석');
insert into t_category(seq, code, name) values(231, 'M', 'Enamel paint');
insert into t_category(seq, code, name) values(232, 'M', '엄니');
insert into t_category(seq, code, name) values(233, 'M', '물감');
insert into t_category(seq, code, name) values(234, 'M', 'Rhinestone');
insert into t_category(seq, code, name) values(235, 'M', 'Tracing paper');
insert into t_category(seq, code, name) values(236, 'M', '참나무속');
insert into t_category(seq, code, name) values(237, 'M', 'Levkas');
insert into t_category(seq, code, name) values(238, 'M', '장석');
insert into t_category(seq, code, name) values(239, 'M', 'Tortoiseshell');
insert into t_category(seq, code, name) values(240, 'M', '유성 파스텔');
insert into t_category(seq, code, name) values(241, 'M', 'Metallic paint');
insert into t_category(seq, code, name) values(242, 'M', '백금');
insert into t_category(seq, code, name) values(243, 'M', '도예');
insert into t_category(seq, code, name) values(244, 'M', '연옥');
insert into t_category(seq, code, name) values(245, 'M', '흑옥');
insert into t_category(seq, code, name) values(246, 'M', '무라노 유리');
insert into t_category(seq, code, name) values(247, 'M', '진사');
insert into t_category(seq, code, name) values(248, 'M', '플리카보네이트');
insert into t_category(seq, code, name) values(249, 'M', 'Encaustic painting');
insert into t_category(seq, code, name) values(250, 'M', '주트');
insert into t_category(seq, code, name) values(251, 'M', 'Carrara marble');
insert into t_category(seq, code, name) values(252, 'M', 'Graph paper');
insert into t_category(seq, code, name) values(253, 'M', 'Milk glass');
insert into t_category(seq, code, name) values(254, 'M', 'Brocade');
insert into t_category(seq, code, name) values(255, 'M', '사암');
insert into t_category(seq, code, name) values(256, 'M', 'Bisque porcelain');
insert into t_category(seq, code, name) values(257, 'M', '동석');
insert into t_category(seq, code, name) values(258, 'M', '티크');
insert into t_category(seq, code, name) values(259, 'M', '베이클라이트');
insert into t_category(seq, code, name) values(260, 'M', '단풍나무속');
insert into t_category(seq, code, name) values(261, 'M', '폴리프로필렌');
insert into t_category(seq, code, name) values(262, 'M', '아크릴수지');
insert into t_category(seq, code, name) values(263, 'M', '거즈');
insert into t_category(seq, code, name) values(264, 'M', '폴리스타이렌');
insert into t_category(seq, code, name) values(265, 'M', 'Masonite');
insert into t_category(seq, code, name) values(266, 'M', '상긴');
insert into t_category(seq, code, name) values(267, 'M', 'Vellum');
insert into t_category(seq, code, name) values(268, 'M', '셀룰로이드');
insert into t_category(seq, code, name) values(269, 'M', '콩테');
insert into t_category(seq, code, name) values(270, 'M', 'Travertine');
insert into t_category(seq, code, name) values(271, 'M', '밀랍');
insert into t_category(seq, code, name) values(272, 'M', 'Lusterware');
insert into t_category(seq, code, name) values(273, 'M', 'Sheet metal');
insert into t_category(seq, code, name) values(274, 'M', '캘러타이프');
insert into t_category(seq, code, name) values(275, 'M', 'Formica');
insert into t_category(seq, code, name) values(276, 'M', 'Hessian fabric');
insert into t_category(seq, code, name) values(277, 'M', '섬록암');
insert into t_category(seq, code, name) values(278, 'M', 'Parian marble');
insert into t_category(seq, code, name) values(279, 'M', 'Mohair');
insert into t_category(seq, code, name) values(280, 'M', '시폰');
insert into t_category(seq, code, name) values(281, 'M', '모슬린');
insert into t_category(seq, code, name) values(282, 'M', '플라스틱');
insert into t_category(seq, code, name) values(283, 'M', '소묘');
insert into t_category(seq, code, name) values(284, 'M', '모발');
insert into t_category(seq, code, name) values(285, 'M', '피부');
insert into t_category(seq, code, name) values(286, 'M', '잎');
insert into t_category(seq, code, name) values(287, 'M', '이');
insert into t_category(seq, code, name) values(288, 'M', '케이블');
insert into t_category(seq, code, name) values(289, 'M', '씨');
insert into t_category(seq, code, name) values(290, 'M', '뼈');
insert into t_category(seq, code, name) values(291, 'M', '접착제');
insert into t_category(seq, code, name) values(292, 'M', '보석');
insert into t_category(seq, code, name) values(293, 'M', '결정');
insert into t_category(seq, code, name) values(294, 'M', '진주');
insert into t_category(seq, code, name) values(295, 'M', '아연');
insert into t_category(seq, code, name) values(296, 'M', '석탄');
insert into t_category(seq, code, name) values(297, 'M', '알');
insert into t_category(seq, code, name) values(298, 'M', '리본');
insert into t_category(seq, code, name) values(299, 'M', '염료');
insert into t_category(seq, code, name) values(300, 'M', '규소');
insert into t_category(seq, code, name) values(301, 'M', '소나무속');
insert into t_category(seq, code, name) values(302, 'M', '버찌');
insert into t_category(seq, code, name) values(303, 'M', '니켈');
insert into t_category(seq, code, name) values(304, 'M', '사파이어');
insert into t_category(seq, code, name) values(305, 'M', '크로뮴');
insert into t_category(seq, code, name) values(306, 'M', '폴리에틸렌');
insert into t_category(seq, code, name) values(307, 'M', '신호');
insert into t_category(seq, code, name) values(308, 'M', '뿌리');
insert into t_category(seq, code, name) values(309, 'M', '주석');
insert into t_category(seq, code, name) values(310, 'M', '망가니즈');
insert into t_category(seq, code, name) values(311, 'M', '에메랄드');
insert into t_category(seq, code, name) values(312, 'M', '자수정');
insert into t_category(seq, code, name) values(313, 'M', '마노');
insert into t_category(seq, code, name) values(314, 'M', '삼베');
insert into t_category(seq, code, name) values(315, 'M', '자작나무속');
insert into t_category(seq, code, name) values(316, 'M', '코르크');
insert into t_category(seq, code, name) values(317, 'M', '레이온');
insert into t_category(seq, code, name) values(318, 'M', '가죽');
insert into t_category(seq, code, name) values(319, 'M', '유칼립투스');
insert into t_category(seq, code, name) values(320, 'M', '가문비나무');
insert into t_category(seq, code, name) values(321, 'M', '올리브색');
insert into t_category(seq, code, name) values(322, 'M', '코발트');
insert into t_category(seq, code, name) values(323, 'M', '황옥');
insert into t_category(seq, code, name) values(324, 'M', '능직');
insert into t_category(seq, code, name) values(325, 'M', '화장지');
insert into t_category(seq, code, name) values(326, 'M', '전나무속');
insert into t_category(seq, code, name) values(327, 'M', '라탄');
insert into t_category(seq, code, name) values(328, 'M', '현무암');
insert into t_category(seq, code, name) values(329, 'M', 'Spray painting');
insert into t_category(seq, code, name) values(330, 'M', '청금석');
insert into t_category(seq, code, name) values(331, 'M', '태피터');
insert into t_category(seq, code, name) values(332, 'M', '흑요석');
insert into t_category(seq, code, name) values(333, 'M', 'Photographic paper');
insert into t_category(seq, code, name) values(334, 'M', 'Damask');
insert into t_category(seq, code, name) values(335, 'M', '네온');
insert into t_category(seq, code, name) values(336, 'M', '파피루스');
insert into t_category(seq, code, name) values(337, 'M', '너도밤나무');
insert into t_category(seq, code, name) values(338, 'M', '부싯돌');
insert into t_category(seq, code, name) values(339, 'M', '규암');
insert into t_category(seq, code, name) values(340, 'M', '반 짱');
insert into t_category(seq, code, name) values(341, 'M', '결정편암');
insert into t_category(seq, code, name) values(342, 'M', '알라바스터');
insert into t_category(seq, code, name) values(343, 'M', 'Horeshair');
insert into t_category(seq, code, name) values(344, 'M', '아라비아검');
insert into t_category(seq, code, name) values(345, 'M', '아산암');
insert into t_category(seq, code, name) values(346, 'M', 'Chintz');
insert into t_category(seq, code, name) values(347, 'M', '코드');
insert into t_category(seq, code, name) values(348, 'M', '브로민화 은');
insert into t_category(seq, code, name) values(349, 'M', 'Silver halide');
insert into t_category(seq, code, name) values(350, 'M', 'Tulipwood');
insert into t_category(seq, code, name) values(351, 'M', 'Cartridge paper');
insert into t_category(seq, code, name) values(352, 'M', 'Paper negative');

-- t_category 아티스트
insert into t_category(seq, code, name, bdate, ddate, remark) values(353, 'A', '김홍도', '1745', '1806', '김홍도는 조선 후기의 화가이다. 본관은 김해, 자는 사능, 호는 단원·단구·서호·고면거사·취화사·첩취옹이다. 경기도 안산시 단원구는 그의 호 단원을 따온 이름이다. 정조 시대 때 문예부흥기의 대표적인 화가로 여겨진다. 그는 산수화, 풍속화에서 큰 비중을 차지하는 화가였지만 고사인물화 및 신선도, 화조화, 불화 등 모든 분야에서 독창적인 회화를 구축한 화가이기도 하다. 주로 어명·고관의 명, 양반의 청탁 을 받아 그림을 그렸지만, 한편으로는 양반사회에서 환영받지 못한 상민·중인·천민 등 일반 서민들의 일상생활을 그린 풍속화가로 우리에게 주목받고 있다. 또한 그는 그림만 그린 것은 아니고, 시도 써서 아들 김양기가 출판한 《단원유묵》이라는 문집도 있다. 확실한 출생 등은 아무도 모른다.');
update t_category set imagepath='upload/353/A.jpg' where seq=353;
insert into t_category(seq, code, name, bdate, ddate, remark) values(354, 'A', '가쓰시카 호쿠사이', '1760.10.31', '1849.5.10', '가츠시카 호쿠사이는 일본 에도 시대의 우키요에 화가이다. 삼라만상 그 어느 것도 그려냈으며, 전 생애 동안 3만 장을 넘는 작품을 발표하며 판화 외에 직접 그린 그림도 걸출했다. 고흐 등, 인상파의 색채에도 영향을 주었다.
대표작으로 《부악삼십육경》, 《호쿠사이 만화》 등이 있다.');
update t_category set imagepath='upload/354/A.jpg' where seq=354;
insert into t_category(seq, code, name, bdate, ddate, remark) values(355, 'A', '신윤복', '1758', '1858', '신윤복은 조선 후기의 관료이자 화가로서, 산수화와 풍속화를 잘 그렸다. 또한 양반 관료들의 이중성과 위선을 풍자한 그림, 여성들의 생활상을 그린 그림을 남기기도 했다.
화공 가문 출신으로 화원 신한평의 아들이며, 그 역시 도화서 화원으로 종삼품 서반 무관인 첨절제사를 지냈다. 본관은 고령, 자는 입부, 덕여이고, 본명은 가권, 호는 혜원이다. 대표작은 미인도·단오도 등이 있다. 조선전기의 문신, 학자 신말주의 후손이고, 일제 강점기의 역사학자 단재 신채호의 8대 방조가 된다.');
update t_category set imagepath='upload/355/A.jpg' where seq=355;
insert into t_category(seq, code, name, bdate, ddate, remark) values(356, 'A', ' 석도', '1642', '1707', '석도는 명말 청초의 화가이다. 본래 성은 주, 이름은 약극이며, 석도는 자이다. 호는 대척자·청상진인·고과화상·할존자 등이 있고 법호는 원제 등이 있다. 저서로 《화어록》을 남겼다.');
update t_category set imagepath='upload/356/A.jpg' where seq=356;
insert into t_category(seq, code, name, bdate, ddate, remark) values(357, 'A', '이중섭', '1916.4.10', '1956.9.6', '이중섭은 일제 강점기, 대한민국의 서양화가로 호는 대향, 본관은 장수이다.
이중섭의 작품에는 소.닭.어린이.가족 등이 가장 많이 등장하는데, 향토적 요소와 동화적이고 자전적인 요소가 주로 담겼다는 것이 소재상의 특징이라 할 수 있다. 《싸우는 소》, 《흰소》, 《움직이는 흰소》, 《소와 어린이》, 《황소》, 《투계》등은 향토성이 진하게 밴 대표적 작품이다. 《닭과 가족》, 《사내와 아이들》, 《길 떠나는 가족》과 그 밖에 수많은 은지화들은 동화적이고 자전적 요소가 강한 작품들이다.
');
update t_category set imagepath='upload/357/A.jpg' where seq=357;

insert into t_category(seq, code, name, bdate, ddate, remark) values(370, 'A', '렘브란트', '1606.7.15', '1669.10.4', '렘브란트 하르먼손 판 레인은 바로크 시대의 네덜란드 화가이다. 일반적으로 유럽 미술사에서 가장 위대한 화가이자 판화가 중 한 사람으로 여겨지며 네덜란드의 역사에서 가장 중요한 화가이기도 하다. 예술 분야에서 그의 기여는 역사가들이 소위 네덜란드 황금 시대라고 부르는 시대를 불러오게 하였다.');
update t_category set imagepath='upload/370/A.jpg' where seq=370;
insert into t_category(seq, code, name, bdate, ddate, remark) values(371, 'A', '구스타프 클림트', '1862.7.14', '1918.2.6', '구스타프 클림트 는 오스트리아의 상징주의 화가이자 빈 분리파 운동의 주요 회원이다.
클림트는 회화, 벽화, 스케치 등의 작품을 남겼다. 작품의 주요 주제는 여성의 신체로, 그의 작품은 노골적인 에로티시즘으로 유명하다.
1897년 ''빈 분리파’를 결성하여 반 아카데미즘 운동을 하였다. 1906년에는 ''오스트리아 화가 연맹’을 결성하여 전시 활동을 시작하였다. 클림트는 빈 아르누보 운동에 있어서, 가장 두드러진 미술가 중 하나였다. 한국에서는 ''유디트'', ''베토벤 프리즈''를 비롯한 200여점이 예술의 전당 한가람미술관에서 2009년 2월~5월 간 전시되었다.');
update t_category set imagepath='upload/371/A.jpg' where seq=371;
insert into t_category(seq, code, name, bdate, ddate, remark) values(372, 'A', '빈센트 반 고흐', '1853.3.30', '1890.7.29', '빈센트 빌럼 반 고흐는 네덜란드 화가로 일반적으로 서양 미술사상 가장 위대한 화가 중 한 사람으로 여겨진다. 그는 그의 작품 전부를 정신질환을 앓고 자살을 감행하기 전의 단지 10년 동안에 만들어냈다. 그는 생존기간 동안 거의 성공을 거두지 못하고 사후에 비로소 알려졌는데, 특히 1901년 3월 17일 파리에서 71점의 반 고흐의 그림을 전시한 이후 그의 명성은 급속도로 커졌다.
반 고흐는 흔히 후기인상주의 화가로 분류 되며, 또한 인상파, 야수파, 초기 추상화, 표현주의에 미친 영향이 막대하며 20세기 예술의 여러 다른 관점에서 보일 수 있다. 암스테르담에 있는 반 고흐 미술관은 반 고흐의 작품과 그의 동시대인들의 작품에 바쳐졌다. 네덜란드의 또 다른 도시인 오테를로에 있는 크뢸러-뮐러 박물관도 상당히 많은 빈센트 반 고흐 그림의 수집을 보유하고 있다.
반 고흐가 그린 몇몇 그림들은 세상에서 가장 비싼 그림들 사이에 순위가 매겨지기도 한다. 1987년 3월 30일에 반 고흐의 그림 ''아이리스''가 뉴욕의 소더비즈에서 5390만 미국 달러라는 기록으로 팔렸다. 1990년 5월 15일에 그의 ''가셰 박사의 초상''이 크리스티즈에서 8,250만 달러에 일본의 다이쇼와제지 명예회장 사이토 료에이에게 팔림에 따라, 새로운 최고가 기록을 세웠다. 당시 사이토가 지불한 8,250만 달러는 낙찰가 7,500만달러에 경매가 구전 10%가 가산된 금액이다. 이후 ''가셰 박사의 초상''은 미국의 수집가에게 4천 400만 달러에 다시 팔렸다.');
update t_category set imagepath='upload/372/A.jpg' where seq=372;
insert into t_category(seq, code, name, bdate, ddate, remark) values(373, 'A', '폴 세잔', '1839.1.19', '1906.10.22', '폴 세잔은 프랑스의 대표적 화가로서 현대 미술의 아버지이다.');
update t_category set imagepath='upload/373/A.jpg' where seq=373;
insert into t_category(seq, code, name, bdate, ddate, remark) values(374, 'A', '라파엘로 산치오', '1483', '1520.4.6', '라파엘로 산치오 다 우르비노는 르네상스 시대 이탈리아의 화가이다. 흔히 라파엘로 불린다.
《아테네 학당》을 그린 것으로 유명하다. <아테네 학당>은 플라톤, 유클리드, 아리스토텔레스 등 고대 그리스의 학자가 학당에 모인 것을 상상해서 그린 그림이다.');
update t_category set imagepath='upload/374/A.jpg' where seq=374;

-- t_art
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(1, 'Literati Gathering in the Western Garden on a Fan', '', '','작품유형: Oriental painting
권리: Korea Database Agency
재료: Light color on silk
Object Information: Painting on a Fan
Collection: National Museum of Korea', 'upload/353/0.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(2, 'Album of Genre Paintings', '', '','작품유형: Oriental painting
권리: Korea Database Agency
재료: Light color on paper
Descriptive Title: Ssireum, Korean Wrestling
Collection: National Museum of Korea', 'upload/353/1.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(3, '송호도', '1770', 'w72.7 x h130 cm','뒤에 소나무를 배경으로 호랑이가 산에서 나오는 모습인 출산호出山虎 형식의 호랑이 그림이다. 호랑이는 화면 오른쪽에서 왼쪽을 보고 있는 자세로 네 다리는 모두 지면에 닿았고, 특히 앞다리는 서로 교차하고 있다. 이러한 자세는 김홍도의 <송하맹호도>(호암미술관 소장)와 <죽하맹호도>(덕원미술관 소장)의 호랑이와 유사하다. 김홍도 영향으로 19세기 이후에는 많은 호랑이 그림이 제작되는데 이 작품은 배경이 되는 소나무의 수지법만이 김홍도와 비슷할 뿐 호랑이 모습은 사실성에서 점차 벗어나 도식화되는 경향을 보인다. 호랑이가 머리를 왼쪽으로 많이 돌려 등이 정면에서 보이는데 마치 띠를 이은 듯한 동그라미 무늬가 등줄기를 따라 이어지고 그 양 옆으로 이중의 띠무늬가 대칭적으로 나타난다. 동그라미 무늬는 꼬리까지 이어진 듯 꼬리에는 표범의 무늬가 있어 사실적인 호랑이와는 거리가 있다. 다만 몸 전면에 황색의 담채를 가한 후 그 위에 담묵의 세필을 가해 털의 질감을 표현하여 상당히 사실적인 털의 묘사가 눈에 띤다. 다른 호랑이 그림에서는 뾰족한 송곳니가 보이지 않는 반면 여기에는 약간 입을 벌리고 맹수다운 송곳니를 그려 후의 민화의 호랑이 그림으로 이어지는 전형前形이 되는 것으로 추측된다. 김홍도의 자인 ‘사능士能’이라는 주문방인이 찍혀 있는데 이는 후낙으로 판단된다.', 'upload/353/2.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(4, 'Banquet Hosted by the Governor of Pyeongan Province', '', '','작품유형: Oriental painting
권리: Korea Database Agency
재료: Light color on paper
Descriptive Title: Excursion on an Escorted Boat on a Moonlit Night
Collection: National Museum of Korea', 'upload/353/3.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(5, 'Album of Literati Scholars', '', '','작품유형: Oriental painting
권리: Korea Database Agency
재료: Ink on paper
Descriptive Title: Yi Yun-cheol
Collection: Ho-Am Art Museum
', 'upload/353/4.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(6, 'Album of Genre Paintings', '', '','작품유형: Oriental painting
권리: Korea Database Agency
재료: Light color on paper
Descriptive Title: A Dancing Boy
Collection: National Museum of Korea', 'upload/353/5.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(7, 'Men Under a Willow', '', '','작품유형: Oriental painting
권리: Korea Database Agency
재료: Light color on paper
Collection: National Museum of Korea', 'upload/353/6.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(8, 'Banquet Hosted by the Governor of Pyeongan Province', '', '','작품유형: Oriental painting
권리: Korea Database Agency
재료: Light color on paper
Descriptive Title: Banquet at Bubyeokru Pavilion
Collection: National Museum of Korea', 'upload/353/7.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(9, 'Album of Paintings by Kim Hong-do', '', '','작품유형: Oriental painting
권리: Korea Database Agency
재료: Light color on paper
Descriptive Title: Riding Leisurely on an Ox
Collection: Seoul National University Museum', 'upload/353/8.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(10, 'Procession to Anneung Royal Tomb', '', '','작품유형: Oriental painting
권리: Korea Database Agency
재료: Light color on silk
Collection: National Museum of Korea', 'upload/353/9.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(11, 'Woodcut', '1806', 'w380 x h250 mm','Place Part Of: Japan
작품유형: Woodcut
권리: http://creativecommons.org/publicdomain/mark/1.0/', 'upload/354/0.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(12, 'Woman Reading', '1822', '','제작자: Katsushika Hokusai
날짜: 1822
작품유형: Colour wood engraving
외부 링크: Bilbao Fine Arts Museum', 'upload/354/1.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(13, 'Yoshitsune Falls, from the series Famous Waterfalls in Various Provinces', '1833', '','제작자: Artist: Katsushika Hokusai
제작연도: 1833
위치: Japan
외부 링크: For more information about this and thousands of other works of art in the Freer|Sackler collection, please visit http://www.asia.si.edu/.
재료: Ink and color on paper; woodblock print
Historical Period: Edo period
Credit Line: Gift of the family of Eugene and Agnes E. Meyer
Collection: Freer Gallery of Ar', 'upload/354/2.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(14, 'Thirty-Six Views of Mount Fuji: The Great Wave Off the Coast of Kanagawa', '19C', '','제작자: Katsushika Hokusai
제작연도: Edo period, 19th century
Object Title: 冨嶽三十六景・神奈川沖浪裏
Object Notes(Japanese): 「冨嶽三十六景」は、富士山をテーマとした46枚揃のシリーズ。藍は当時流行の色で、この図は、主版も藍で摺られシャープな印象がもたらされている。大波が触手を伸ばしてせり上がる富士へと続く奥行き深い空間に、自然が人間のドラマのように描かれている。
Object Date: 江戸時代・19世紀
Medium(Japanese): 横大判　錦絵
Artist Name: 葛飾北斎筆', 'upload/354/3.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(15, 'The Kirifuri Waterfall at Mt. Kurokami', '1831', '37.16 x 24.45 cm','제작연도: ca. 1831
크기: Image: 14 5/8 x 9 5/8 inches (37.16 x 24.45 cm) Mat: 25 x 18 1/2 inches (63.5 x 46.99 cm)
Culture: Japanese
권리: Purchase: William Rockhill Nelson Trust
재료: Color woodblock print (oban)', 'upload/354/4.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(21, 'Lost-love shell (Katashigai) from the series ''A shell-matching game with Genroku thirty-six linked verses (Genroku kasen kai-awase)''', '1821', ' w17.8 x h19 cm','위치: Edo (Tokyo)
크기: w17.8 x h19 cm (image & sheet)
작품유형: Print
외부 링크: Art Gallery of South Australia
권리: Gift of Brian and Barbara Crisp in memory of their son Andrew 2005, © Art Gallery of South Australia
재료: shikishiban surimono, colour woodblock print', 'upload/354/5.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(16, 'Two Ladies with a Telescope, from Series Seven Habits of Grace and Disgrace', '1811', 'w24.8 x h36.8 cm','Kobe City Museum
　北斎（1760～1849）の大首絵（おおくびえ）美人図の代表的作品。春朗（しゅんろう）落款の時代を過ぎ、画技がとくに充実する、「可候」と名乗っていた時期の作で、日傘（ひがさ）を手にしたお歯黒の武家の妻と、島田髷（まげ）の娘が大きく描かれている。娘は和製と思われる朱塗りの遠目鏡（とおめがね）をのぞいている。「ななくせ」とあるため7枚揃とも考えられるが、他に「ほおずき」と通称される図が知られるにすぎない。「ほおずき」には手鏡が描かれており、新奇なガラス製品をあしらうシリーズものだったのかもしれない。一枚ものの雲母摺（きらず）りは、北斎作では珍しい。
　本図は、しかめっ面で遠眼鏡に夢中な娘の「癖」を、母親がたしなめている場面とも解釈されている。ちなみに川柳もたしなんだ北斎は下のような句を詠んでいる。
　「皮切りといふ面で見る遠眼鏡」', 'upload/354/6.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(17, 'Hokusai as an old man', '1849', '','제작연도: 1760-1849
위치: Japan
외부 링크: For more information about this and thousands of other works of art in the Freer|Sackler collection, please visit http://www.asia.si.edu/.
재료: Woodblock print: Ink on paper
Historical Period: Edo period
Credit Line: Gift of Charles Lang Freer
Collection: Freer Gallery of Art', 'upload/354/7.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(18, 'enju in Musashi Province (Bushu Senju)', '1833', '','제작연도: about 1829-1833
Series Title: Thirty-six Views of Mt. Fuji (Fugaku Sanjurokkei)
Rights: Public Domain
Medium / Support: ink on paper, color woodblock print
External Link: See this object at www.imamuseum.org
Department: Asian Art
Credit Line: Gift in memory of Charles C. Kryter
Creation Period: Edo
Accession Number: 45.66', 'upload/354/8.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(19, 'Thirty-Six Views of Mt.Fuji; Clear Weather with Southern Breeze', '1831', '','This is considered to be a depiction of the rare phenomenon on exceptionally clear early mornings from summer to fall in which the surface of Mount Fuji, flooded with the morning sun, is dyed red. It is colloquially known by the nickname “Aka Fuji (Red Fuji). Mount Fuji demonstrates complex and rich expression in this work through the beautiful gradation printing, which transitions from brown to red, and the grain of the woodblock that faintly emerges. It is a masterpiece that captures the beautiful and even solemn form of Mount Fuji emerging in the morning sun.', 'upload/354/9.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(22, 'A Woman Tuning a Geomungo', '', '','작품유형: Oriental painting
권리: Korea Database Agency
재료: Color on silk
Object Information: Early 19th century
Collection: National Museum of Korea', 'upload/355/0.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(23, '미인도(美人圖 )', '18C', ' 45.7㎝ X 114.2㎝','재단법인 아름지기
본 전시회의 전통복 재현 코너에서는 주로 각 시대의
대표적인 회화자료를 참고했다. 패턴개발 역시 학문적
고증에 의한 치수를 그대로 적용하기보다는 키 172㎝인
현대인의 체형에 맞게 조정했으며, 회화자료에서 보이
는 실루엣을 최대한 아름답게 표현할 수 있는 패턴을
개발했다

제작연도: 1700/1800
만든 위치: 한국
크기: 45.7㎝ X 114.2㎝
출처: 저고리, 그리고 소재를 이야기하다, 재단법인 아름지기
작품유형: 회화
권리: 간송미술문화재단 소장', 'upload/355/1.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(24, 'Secret Meeting at Night in Spring', '', 'w24 x h23.5 cm','작품유형: Oriental painting
권리: Korea Database Agency
재료: Paper
Collection: National Museum of Korea', 'upload/355/2.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(25, 'Two Lovers Under the Moon', '', 'w35.6 x h28.2 cm','작품유형: Oriental painting
권리: Korea Database Agency
재료: Color on paper
Collection: Gangsong Art Museum
', 'upload/355/3.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(26, 'Album of Obscene Paintings', '', 'w27.5 x h23.3 cm','날짜: 1758/1858
크기: w27.5 x h23.3 cm
작품유형: Oriental painting
권리: Korea Database Agency
재료: Ink and light color on paper
', 'upload/355/4.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(27, 'Visit to a Temple to Offer a Buddhist Prayer', '', '','제작자: Shin Yun-bok
날짜: 1758/1858
작품유형: Oriental painting
권리: Korea Database Agency
재료: Color on paper
Collection: Gangsong Art Museum
', 'upload/355/5.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(28, 'Playing Tuho, a Game of Throwing Sticks into a Large Canister', '', 'w35.6 x h28.2 cm','작품유형: Oriental painting
권리: Korea Database Agency
재료: Light color on paper
Collection: Gangsong Art Museum', 'upload/355/6.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(29, 'Visit to a Temple to Offer a Buddhist Prayer', '', '','작품유형: Oriental painting
권리: Korea Database Agency
재료: Color on paper
Collection: Gangsong Art Museum
', 'upload/355/7.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(30, 'Fighting in Front of Brothel', '', 'w35.6 x h28.2 cm','작품유형: Oriental painting
권리: Korea Database Agency
재료: Light color on paper
Collection: Gangsong Art Museum', 'upload/355/8.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(31, 'Secret Meeting at Night in Spring', '', 'w35.6 x h28.2 cm','크기: w35.6 x h28.2 cm
작품유형: Oriental painting
권리: Korea Database Agency
재료: Color on paper
Collection: Gangsong Art Museum', 'upload/355/9.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(32, 'Landscape', '1698', 'w582 x h1360 cm','n this work, which according to the inscription depicts Mr Ge’s mountain retreat, a dynamic formal structure underlies the apparent disorder of nature. A system of building a composition out of composite masses and intervening empty spaces is evident in the left middle ground of the landscape. But Daoji embellishes the landscape with surface texture and the effects of light and mist, a result of his intimate contact with nature during his wanderings in the mountains.

The years spent in Peking seem to have confirmed Daoji’s rejection of ‘fang ’ imitation and the adherence of the Orthodox school to styles and conventions of the past, which had become restrictive and stifling to creativity. Daoji advocated a return to a state prior to the formulation of old conventions and also reacted against the over-intellectualisation of painting: the concern with ideas and theories, composition and brushwork.

Text by Dr Mae Anna Pang © National Gallery of Victoria, Australia', 'upload/356/0.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(35, 'Boating on a Willow Stream', '1642', 'w54 x h127.4 cm','This work reflects the diversity of Shitao''s techniques. His use of wet brush and dry brush was well balanced, while indigo and washed ochre were used to bring out the lushness of the vegetation and the dampness of the mountain. Although Shitao was inspired by ancient masters, he was nevertheless able to find something new in what was old. The rocks in the painting have very peculiar shapes, presumably inspired by what he had seen on his travels to famous sites. The strokes are straightforward and without any restraint, revealing a kind of forthright innocence.

', 'upload/356/1.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(36, 'Album of Flowers and Portrait of Shitao: Flowering Crab Apple', '1698', '','제작연도: ca. 1698
위치: China, Jiangsu province, Yangzhou
외부 링크: For more information about this and thousands of other works of art in the Freer|Sackler collection, please visit http://www.asia.si.edu/.
재료: Ink and color on paper
Historical Period: Qing dynasty
Credit Line: Gift of Arthur M. Sackler
Collection: Arthur M. Sackler Gallery', 'upload/356/2.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(38, 'Listening to the Cry of a Partridge', '1675', '37 3/4 x 12 in. (image) 82 1/2 x 18 3/8 in. (overall)','Rights: Public Domain
Medium / Support: ink on paper
External Link: See this object at www.imamuseum.org
Dimensions: 37 3/4 x 12 in. (image) 82 1/2 x 18 3/8 in. (overall)
Department: Asian Art
Credit Line: Purchased to complement the Mr. and Mrs. Eli Lilly Collection of Chinese art through the bequest of Mrs. Enid Goodrich and the support of Lilly Endowment Inc.
Creation Period: Kangxi
Creation Dynasty: Qing dynasty
Accession Number: 2004.2', 'upload/356/3.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(39, 'Album of Flowers and Portrait of Shitao - Plum Blossoms and Bamboo', '1698', '','제작연도: ca. 1698
위치: China, Jiangsu province, Yangzhou
외부 링크: For more information about this and thousands of other works of art in the Freer|Sackler collection, please visit http://www.asia.si.edu/.
재료: Ink and color on paper
Historical Period: Qing dynasty
Credit Line: Gift of Arthur M. Sackler
Collection: Arthur M. Sackler Gallery', 'upload/356/4.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(40, 'Album of Flowers and Portrait of Shitao - Peonies', '1698', '','제작연도: ca. 1698
위치: China, Jiangsu province, Yangzhou
외부 링크: For more information about this and thousands of other works of art in the Freer|Sackler collection, please visit http://www.asia.si.edu/.
재료: Ink and color on paper
Historical Period: Qing dynasty
Credit Line: Gift of Arthur M. Sackler
Collection: Arthur M. Sackler Gallery', 'upload/356/5.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(41, 'Landscape', '1684', '','제작연도: 1684
위치: China
외부 링크: For more information about this and thousands of other works of art in the Freer|Sackler collection, please visit http://www.asia.si.edu/.
재료: Ink and color on paper
Historical Period: Qing dynasty
Credit Line: Purchase
Collection: Freer Gallery of Art', 'upload/356/6.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(42, 'Album of Flowers and Portrait of Shitao - Hibiscus', '1698', '','제작연도: ca. 1698
위치: China, Jiangsu province, Yangzhou
외부 링크: For more information about this and thousands of other works of art in the Freer|Sackler collection, please visit http://www.asia.si.edu/.
재료: Ink and color on paper
Historical Period: Qing dynasty
Credit Line: Gift of Arthur M. Sackler
Collection: Arthur M. Sackler Gallery', 'upload/356/7.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(43, 'Reminiscences of Nanjing: Washing the Inkstone', '1707', '','위치: China, Jiangsu Province, Yangzhou
외부 링크: For more information about this and thousands of other works of art in the Freer|Sackler collection, please visit http://www.asia.si.edu/.
재료: Ink and color on paper
Historical Period: Qing dynasty
Credit Line: Gift of Arthur M. Sackler
Collection: Arthur M. Sackler Gallery', 'upload/356/8.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(44, 'Music of Mountains and Waters', '1707', '','Music of Mountains and Waters came from scholar Zuo Si’s poem Hermit” in Jin Dynasty: not only stringed and woodwind instruments can produce music, so are mountains and waters. Stringed and woodwind instruments are synonymous with China ancient music, and this poem line means that the waters and mountains can also produce wonderful rhythm and sound. So when people wander in the scenery, they could also enjoy calm and cheer brought by music. Shi Tao choosing this subject shows he had such experience. According to the survey, the scene in the painting is from Mount Huangshan. Mount Huangshan is one of China’s top five mountains, and is located in Anhui province. Shi Tao was fond of painting Mount Huangshan. He lived in Xuancheng of Anhui for more than ten years, and would climb Mount Huangshan every year, sometimes even up to several times a year to admire Mount Huangshan in different seasons and different weather and then painted it. He once wrote a poem on the painting Mount Huangshan created in 1667: Mount Huangshan is my teacher and I am a friend of Mount Huangshan. Similar with their understanding of Bada Shanren, scholars nowadays also find Chinese paintings’ modernity from Shi Tao’s novel composition and unique perspective in his works.', 'upload/356/9.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(45, '호박', '1954', 'w26.5 x h42 cm','중섭(1916-1956)은 1930년대 한국 표현주의 미술의 대표적인 작가 중의 한 사람이다. 그는 표현주의적인 조형 체험을 받아들이면서 자신의 정신적인 주체 체험으로까지 승화시킨 작가로, 표현주의적인 강렬한 색감과 선묘 위주의 표현을 한국적인 감성 속에서 이루어 내었다. 이중섭의 작품에서 주요 소재로 나타나는 것은 소와 풍경 등이다. 그러나 그는 말년에 호박을 주제로 작품을 제작하였다. 이 당시 대표적인 작품으로는 <호박>과 <꽃>을 들 수 있다. <호박>도 말년에 그려진 작품으로 많은 사생을 통해서 호박을 완성시키고자 하였던 듯하다. <호박>(1954)은 조카 이영진의 회고대로 당시 이중섭이 정신 이상과 거식증으로 고생하기 전에 온통 노란색이었던 그의 방에서 호박에 집중하였던 듯하다. 호박을 관찰하고 그 특징을 체득하기 위해 속필로 즉흥적으로 표현한 호박은 그의 특유의 활달한 필치와 역동적인 힘의 분출을 느끼게 해준다. 자연스런 화면 구성과 대담하게 호박을 화면의 전면에 내세운 점등이 매우 특이하다. 그리고 이를 에워싸는 넝쿨, 줄기 등의 선은 작가의 특징인 주제를 에워싸고 모든 대상들을 이어주는 연결 고리로서 선을 사용하고 있다는 점이 이채롭다. 또한 호박과 넝쿨의 연초록과 꽃의 샛노란 색채의 조화도 매우 신선한데, 호박에는 페인팅 나이프로 채색을 시도하면서 새로운 회화적인 맛을 구현하고 있다. 이 작품은 또한 이중섭의 말년을 연구할 수 있는 중요한 미술사적인 가치가 있는 작품이다.', 'upload/357/0.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(46, '투계', '1955', 'w40.5 x h28.5 cm','이중섭의 <투계(鬪鷄)>(1955)는 전쟁의 어려움이 많던 수난의 시기에 제작되었다. 정신적 불안, 희망과 기대가 좌절된 삶, 생활고에의 시달림 등이 비극적이고 절망적인 성격의 작품을 그리게 한 것이다. 화면의 두 마리 새가 과격한 동태를 보이며 극도의 긴장감을 보여 주고 있다. 이것은 비정한 투쟁의 세계를 상징화한 것이다.', 'upload/357/1.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(47, 'Drawing on Aluminum Cigarette Packing Foil', '', 'w15 x h8.5 cm','작품유형: Western painting
권리: Korea Database Agency
재료: Scratching and oil painting on aluminum cigarette packing foil', 'upload/357/2.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(48, 'Flower and Children', '', 'w18.6 x h23 cm','크기: w18.6 x h23 cm
작품유형: Western painting
권리: Korea Database Agency
재료: Color on paper', 'upload/357/3.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(49, 'A Man and Children', '', 'w48 x h39.5 cm','크기: w48 x h39.5 cm
작품유형: Western painting
권리: Korea Database Agency
재료: Pencil and oil on paper
', 'upload/357/4.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(50, 'A White Bull', '', 'w41.3 x h30.5 cm','크기: w41.3 x h30.5 cm
작품유형: Western painting
권리: Korea Database Agency
재료: Oil on paper', 'upload/357/5.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(51, 'Flower and Boys', '', ' w14.7 x h19.5 cm','크기: w14.7 x h19.5 cm
작품유형: Western painting
권리: Korea Database Agency
재료: Pencil and crayon on paper', 'upload/357/6.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(52, 'The Kim Family', '', 'w49.5 x h32 cm','크기: w49.5 x h32 cm
작품유형: Western painting
권리: Korea Database Agency
재료: Pencil and oil on paper
', 'upload/357/7.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(53, 'Children Holding a String Together', '', 'w26.4 x h19.3 cm','크기: w26.4 x h19.3 cm
작품유형: Western painting
권리: Korea Database Agency
재료: Watercolor on paper
', 'upload/357/8.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(54, 'Two Boys and Deer', '', 'w17 x h13.8 cm','크기: w17 x h13.8 cm
작품유형: Western painting
권리: Korea Database Agency
재료: Watercolor on paper
', 'upload/357/9.jpg', 0, sysdate);

insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(57,'Self Portrait as the Apostle Paul', '1661', 'w770 x h910 mm','Here Rembrandt is 55 or 56 years old. He has portrayed himself as the apostle Paul, shown together with his traditional attributes: a sword - the hilt of which is sticking out of his coat - and a manuscript written in letters which resemble Hebrew. In Protestant circles St. Paul was revered as the most important preacher of the Word of God.
From the collections of Jabach (Paris), Corsini (Rome), Lord Kinnaird (Rossie Priory). Gift of Mr and Mrs De Bruijn-van der Leeuw, Muri, 1961.
', 'upload/370/1.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(59,'The Three Crosses', '1654', 'w17.69 x h15.81 in','Rembrandt''s grand interpretation of the Crucifixion probably developed in tandem with his Christ Presented to the People. It stated out as an operatic extravaganza performed in a radiating cone of light (see illustration). Rembrandt''s revision of the Crucifixion scene was even more radical than his obliteration of the crowd in the judgment scene.
He changed many details of the image. Note the horse in the earlier version; in the later one it has been reversed and received a rider. The centurion no longer looks up at Christ; instead, he bows his head in remorse. But most dramatically, Rembrandt took his etching needle firmly in hand to lacerate the printing plate, throwing the scene into chaos and darkness. He had never executed anything like this before or after. In fact, nothing would truly compare until the advent of expressionist art in the 20th century.
', 'upload/370/2.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(61,'Self-Portrait', '1658', 'w1038.35 x h1337.06 in','Of the many self-portraits Rembrandt painted over a lifetime, this is perhaps the greatest, not only for its poignant revelations of the self, but for his sure handling of paint. The initial effect on viewers is daunting, as though they are confronting an ill-tempered monarch. The strange costume he wears is timeless. In place of a crown, he wears a large velvet artist''s beret. He holds a painter''s stick as though it were a scepter. Yet this feeling of uneasy confrontation diminishes as we study the face. The wariness and impatience seem like a veil shadowing the man''s real expression, which is blurred and scarred—by time, by sorrows, and illness. Yet Rembrandt was only fifty-two in 1658 when he signed and dated this portrait. He was also a small man, but he portrayed his figure in monumental dimensions. It is almost as though he decided to pack his entire life into this image of himself, both what had gone before, and what lay ahead. The gigantic hands that loom before us are crucial to the portrait''s effect, reminding us of Rembrandt''s dependence on them.', 'upload/370/3.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(62,'Man in Armour', '19C', 'w301 x h400 cm','A variant on such bust-length figure studies as the Man in a Gorget and a Plumed Cap in the J. Paul Getty Museum, Malibu. DPG628 is probably a later imitation rather than the work of a pupil or follower.', 'upload/370/4.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(63,'Self-portrait wearing a Hat and two Chains', '1643', 'w548 x h720 mm','Rembrandt is considered one of the greatest masters in the history of painting, as well as a superb and prolific engraver. His distinctive use of chiaroscuro, with strong contrasts between light and shade, and the profoundly dramatic nature of his work, set him apart from other painters. These features are clearly apparent in his self-portraits, such as the one here, which provide a faithful reflection of his changing personal situation, his feelings and his moods throughout his life; almost as though they were a mirror of his soul. Detailed scientific analysis of this panel has confirmed beyond doubt that it is the work of Rembrandt rather than one of his students, and is indeed one of his finest self-portraits.', 'upload/370/5.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(64,'Self-Portrait Etching at a Window', '1648', '156 × 130 mm','No artist has probed the potential of self-portraiture with greater tenacity and variety than Rembrandt. Over the course of his long career, he made over eighty self-portraits in oil, in chalk, in pen and ink and wash, and in etching. A large portion of these self-examinations were created while he was a young man and served to spread his fame, while advertising his abilities in portraiture and dramatic expression. But perhaps Rembrandt’s most soul-searching and moving images date from the end of his career; characteristically, his self-scrutiny was first considered carefully in etching before being pursued in painting.
Unpretentious, “Self-Portrait at a Window,” reflects a traditional portrait type used since the fifteenth century. Not striking a pose, the artist is caught in the middle of his most intimate and natural activity, etching on a plate resting on a folded piece of cloth on top of several books. In this particularly fine impression of the finished print, Rembrandt’s gaze rivets the viewer with a soul-searching energy that seems capable of fueling his late, great painted investigations.
', 'upload/370/6.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(65,'Young Woman with a Carnation', '1656', 'w67.8 x h78.6 cm ','For many years this portrait has been part of the heart of the group of Rembrandt paintings at the National Gallery of Denmark. However, the picture’s authenticity has been challenged over the last decades, meaning that it should now be attributed to one of Rembrandt’s late students, probably Willem Drost.
Inspired by Rembrandt
The way the woman is depicted is very much inspired by Rembrandt, a portrayer of the soul, as is evident in the model’s calm and gently introvert expression that speaks of quiet contemplation. These features in particular place the picture so close to Rembrandt’s style that we must assume it was done under his supervision while Drost was still a student in his workshop.
The young woman
We do not know who the young woman is, but the dress with its square neckline, the blouse, and the elaborate headdress all belong to the early 16th century. Thus, it is difficult to determine whether this is a staged period portrait or a so-called tronie, a kind of anonymous presentation of characters popular in 17th century Holland.
The carnation in the woman’s hand is associated with engagement and marriage symbolism that was widespread in the 16th century, appearing in several female portraits from the time.
', 'upload/370/7.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(66,'Sketch for The Knight with the Falcon, known as The Crusader', '661', 'w55.5 x h68.5 cm','In 1911 the Rembrandt connoisseur and then director of Statens Museum for Kunst, Karl Madsen, found The Crusader in a remote corner of Fredensborg Castle where it had been placed in temporary storage. Despite Karl Madsen''s evident enthusiasm for the painting, its status was soon called into question, and in 1969 it was rejected as a Rembrandt. The most recent studies now tell us that the painting is a sketch for The Knight with the Falcon (Göteborgs Konstmuseum). X-rays support this assumption by demonstrating that the underlying layers of paint are built up in a manner typical of Rembrandt. The piece presumably depicts the Dutch Saint Bavo, and the painting has the convincing oscillation between the precise and the spontaneous that is so typical of Rembrandt. At the same time it exemplifies the pastose manner of painting characteristic of the artist''s late work. There are, however, some signs to suggest that parts of the painting were done by one of Rembrandt''s students, a common practice at the master''s workshop.', 'upload/370/8.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(67,'Man drawing from a cast', '1641', 'w65.5 x h95 mm','The etching is generally dated to around 1640 or 1641. It exists in three states, of which the last appears not to be by Rembrandt.', 'upload/370/9.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(68,'The baptism of the eunuch (Copy of a lost painting)', '1631', 'w90 x h115.1 cm','This painting has always been described in the arthistorical literature as an anonymous copy after Rembrandt''s painting of circa 1631.
', 'upload/370/10.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(69,'The Kiss', '1909', 'w180 x h180 cm','“The Kiss”, probably the most popular work by Gustav Klimt, was first exhibited in 1908 at the Kunstschau art exhibition on the site of today’s Konzerthaus. The Ministry bought it from there for the sum of 25,000 Kronen and thus secured for the state one of the icons of Viennese Jugendstil and indeed of European modern art. It undoubtedly represents the culmination of the phase known as the “Golden Epoch”. In this decade, the artist created a puzzling, ornamental encoded programme that revolved around the mystery of existence, love and fulfilment through art. Klimt gained initial inspiration for this in 1903 on a journey to Ravenna to see the Byzantine mosaics. In addition, the painting contains a myriad of motifs from various cultural epochs, above all from Ancient Egyptian mythology. Most recent research has, however, revealed that it is not enough to read the ornaments in the picture just as symbols rooted in tradition aiming to convey a timelessly valid message. They reveal more, such as references to Klimt’s love for Emilie Flöge and the artist’s exploration of the sculptor Auguste Rodin’s art.
', 'upload/371/1.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(71,'Nine Cartoons for the Execution of a Frieze for the Dining Room of Stoclet House in Brussels: Part 2, Expectation (Dancer)', '1911', '200 x 102 cm','Expectation, also called “The Dancer“, forms the conclusion of the Tree of Life, just like Fulfillment on the opposite side. For the figure of “The Dancer”, Klimt was strongly influenced by the protagonists of Modern Dance, such as Isadora Duncan, Loïe Fuller, or her Viennese counterpart Grete Wiesenthal. He also obviously borrows inspiration from Egyptian portrayals: apart from her upper body, which is shown en face, the dancer is seen from the side. 
Her oriental hand posture emphasizes the decorative headdress which, just as her bracelet, resembles designs of the Wiener Werkstätte.
', 'upload/371/2.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(72,'Nine Cartoons for the Execution of a Frieze for the Dining Room of Stoclet House in Brussels: Part 8, Fulfillment (Lovers)', '1911', '200 x 102 cm','The compositional addition to the depiction of Expectation is Fulfillment, also called “Lovers”, on the opposite side: a man in a red kimono standing with his legs apart, whose back is facing towards us, and a woman in a green dress covered with flowers in an intimate embrace. One can assume that the lovers are Gustav Klimt and Emilie Flöge. Klimt wrote Flöge in 1914 after his first inspection of the finished mosaic in Brussels that he was “most intensely” reminded of the troubles, pleasures, and worries during the creation of the work drawings in the Villa Oleander in Kammerl at Lake Atter.', 'upload/371/3.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(73,'Nine Cartoons for the Execution of a Frieze for the Dining Room of Stoclet House in Brussels: Part 5, Part of the tree of life', '1911', '200 x 102 cm','The central motif of the entire frieze is the sprawling Tree of Life, which spreads from the center across the whole long side of the dining room of the Stoclet House. Inspired by the Byzantine canon of form, the radical stylization of the tree with its far-reaching volute-like branches is filled with symbolism. The golden volutes bear Horus Falcons and Eyes of Horus as well as strongly stylized flowers and leaves and were most likely inspired by the Stoclets’ ancient Egyptian, antique, Byzantine collection. The entire composition was mirrored in the mosaic on the opposite wall and here the motif Expectation was integrated on the western and the motif Fulfillment on the eastern side. On these work drawings, Klimt added additional handwritten explanations for the production of the frieze.', 'upload/371/4.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(74,'Nine Cartoons for the Execution of a Frieze for the Dining Room of Stoclet House in Brussels: Part 4, Part of the tree of life', '1911', '200 x 102 cm','The central motif of the entire frieze is the sprawling Tree of Life, which spreads from the center across the whole long side of the dining room of the Stoclet House. Inspired by the Byzantine canon of form, the radical stylization of the tree with its far-reaching volute-like branches is filled with symbolism. The golden volutes bear Horus Falcons and Eyes of Horus as well as strongly stylized flowers and leaves and were most likely inspired by the Stoclets’ ancient Egyptian, antique, Byzantine collection. The entire composition was mirrored in the mosaic on the opposite wall and here the motif Expectation was integrated on the western and the motif Fulfillment on the eastern side. On these work drawings, Klimt added additional handwritten explanations for the production of the frieze.', 'upload/371/5.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(75,'Nine Cartoons for the Execution of a Frieze for the Dining Room of Stoclet House in Brussels: Part 7, Part of the tree of life', '1911', '200 x 102 cm','The central motif of the entire frieze is the sprawling Tree of Life, which spreads from the center across the whole long side of the dining room of the Stoclet House. Inspired by the Byzantine canon of form, the radical stylization of the tree with its far-reaching volute-like branches is filled with symbolism. The golden volutes bear Horus Falcons and Eyes of Horus as well as strongly stylized flowers and leaves and were most likely inspired by the Stoclets’ ancient Egyptian, antique, Byzantine collection. The entire composition was mirrored in the mosaic on the opposite wall and here the motif Expectation was integrated on the western and the motif Fulfillment on the eastern side. On these work drawings, Klimt added additional handwritten explanations for the production of the frieze.', 'upload/371/6.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(76,'Nine Cartoons for the Execution of a Frieze for the Dining Room of Stoclet House in Brussels: Part 1, Part of the tree of life', '1911', '200 x 102 cm','Contemporary Art
The central motif of the entire frieze is the sprawling Tree of Life, which spreads from the center across the whole long side of the dining room of the Stoclet House. Inspired by the Byzantine canon of form, the radical stylization of the tree with its far-reaching volute-like branches is filled with symbolism. The golden volutes bear Horus Falcons and Eyes of Horus as well as strongly stylized flowers and leaves and were most likely inspired by the Stoclets’ ancient Egyptian, antique, Byzantine collection. The entire composition was mirrored in the mosaic on the opposite wall and here the motif Expectation was integrated on the western and the motif Fulfillment on the eastern side. On these work drawings, Klimt added additional handwritten explanations for the production of the frieze.', 'upload/371/7.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(77,'Nine Cartoons for the Execution of a Frieze for the Dining Room of Stoclet House in Brussels: Part 3, Part of the tree of life', '1911', '200 x 102 cm','Contemporary Art
The central motif of the entire frieze is the sprawling Tree of Life, which spreads from the center across the whole long side of the dining room of the Stoclet House. Inspired by the Byzantine canon of form, the radical stylization of the tree with its far-reaching volute-like branches is filled with symbolism. The golden volutes bear Horus Falcons and Eyes of Horus as well as strongly stylized flowers and leaves and were most likely inspired by the Stoclets’ ancient Egyptian, antique, Byzantine collection. The entire composition was mirrored in the mosaic on the opposite wall and here the motif Expectation was integrated on the western and the motif Fulfillment on the eastern side. On these work drawings, Klimt added additional handwritten explanations for the production of the frieze.', 'upload/371/8.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(78,'Nine Cartoons for the Execution of a Frieze for the Dining Room of Stoclet House in Brussels: Part 9, Knight', '1911', '200 x 102 cm','On the narrow side of the dining room “The Knight” sits enthroned above a square and an area decorated with acanthus. He is the guardian between the depictions of Expectation and Fulfillment. The entire composition is composed of squares, triangles, and circles and therefore almost appears mathematically designed. With its extreme level of abstraction it is unique in Klimt’s work. For a long time, art history only referred to this piece of work as an “abstract composition” as no reference to a figural character was discovered in the figure. Only the late finding of a postcard in which Klimttold Emilie Flöge about the “Knight” clarified the identity of the “abstract composition.” The landlord Adolphe Stoclet, the patriarch of the family, is said to have taken his seat directly below the “Knight.”', 'upload/371/9.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(79,'Nine Cartoons for the Execution of a Frieze for the Dining Room of Stoclet House in Brussels: Part 6, Rosebush', '1911', '200 x 102 cm','설명 없음', 'upload/371/10.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(80,'Sunflowers', '1889', '','Van Gogh’s paintings of Sunflowers are among his most famous. He did them in Arles, in the south of France, in 1888 and 1889. Vincent painted a total of five large canvases with sunflowers in a vase, with three shades of yellow ‘and nothing else’. In this way, he demonstrated that it was possible to create an image with numerous variations of a single colour, without any loss of eloquence.
The sunflower paintings had a special significance for Van Gogh: they communicated ‘gratitude’, he wrote. He hung the first two in the room of his friend, the painter Paul Gauguin, who came to live with him for a while in the Yellow House. Gauguin was impressed by the sunflowers, which he thought were ‘completely Vincent’. Van Gogh had already painted a new version during his friend’s stay and Gauguin later asked for one as a gift, which Vincent was reluctant to give him. He later produced two loose copies, however, one of which is now in the Van Gogh Museum.', 'upload/372/1.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(81,'
Self-Portrait
', '1889', 'w540 x h650 mm','Like Rembrandt and Goya, Vincent van Gogh often used himself as a model; he produced over forty-three self-portraits, paintings or drawings in ten years. Like the old masters, he observed himself critically in a mirror. Painting oneself is not an innocuous act: it is a questioning which often leads to an identity crisis.

Thus he wrote to his sister: I am looking for a deeper likeness than that obtained by a photographer. And later to his brother: People say, and I am willing to believe it, that it is hard to know yourself. But it is not easy to paint yourself, either. The portraits painted by Rembrandt are more than a view of nature, they are more like a revelation.

In this head-and-shoulders view, the artist is wearing a suit and not the pea jacket he usually worked in. Attention is focused on the face. His features are hard and emaciated, his green-rimmed eyes seem intransigent and anxious. The dominant colour, a mix of absinth green and pale turquoise finds a counterpoint in its complementary colour, the fiery orange of the beard and hair. The model''s immobility contrasts with the undulating hair and beard, echoed and amplified in the hallucinatory arabesques of the background.', 'upload/372/2.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(82,'Bleaching Ground at Scheveningen', '1882', 'w54 x h31.8 cm','I also did a bleaching ground at Scheveningen right on the spot, washed in at one sitting, almost without preparation, on a piece of very coarse Torchon [paper], Vincent van Gogh wrote on 26 July 1882. Displaying his early accomplishment after only six months of working in and around The Hague, the recto and verso of this drawing together offer a fascinating glimpse into van Gogh''s working process. He probably began by drawing the Scheveningen woman on the verso. Possibly dissatisfied with its murky effect, he may also have cut down the sheet to its current dimensions. Recycling the high-quality Torchon paper, he turned the sheet over and painted this luminous scene in watercolors as he watched the women at work in the field. With the whites blowing from the fence, van Gogh retained the freshness of the moment and created a sense of motion within an otherwise still landscape. Divergent and well-observed details combine into a single overall scheme, conveying a sense of open outdoor space. Masterfully handling a difficult medium, van Gogh revealed the luminosity of watercolor and hinted at the expressiveness and colorful palette of his art to come.', 'upload/372/3.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(83,'Portrait of Joseph Roulin', '1889', 'w552 x h644 mm','This portrait of Joseph Roulin is one of six that van Gogh painted of his close friend, a postal employee in the southern French town of Arles. In 1888, van Gogh moved to Arles, a fifteen-hour train ride from Paris, in the hopes of creating an artist cooperative. The plan never came to fruition, and the artist found himself lonely and isolated—a situation exacerbated by his inability to speak the challenging local Provençal dialect. Van Gogh found comfort and companionship with the Roulin family, and they became the subjects of many of his most important paintings.

Van Gogh was drawn to Roulin''s distinctive facial features, his devotion to his wife and children, and to the exceptional kindness he demonstrated toward the artist (when van Gogh was hospitalized in 1888, Roulin looked after his studio and checked in on him repeatedly). In this portrait, believed to be painted from memory, Roulin is depicted in the postal uniform he always wore proudly, set against an imaginative backdrop of swirling flowers. In one of the many letters van Gogh sent to his brother Theo, he wrote that of all subjects, the modern portrait excited him the most. As he elaborated, I want to paint men and women with that something of the eternal which the halo used to symbolize, and which we try to convey by the actual radiance and vibration of our coloring.', 'upload/372/4.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(84,'Imperial Fritillaries in a Copper Vase', '1887', 'w60 x h76 cm','Fritillaries are bulbs which, like tulips, flower in spring. It is therefore easy to work out what time of year Van Gogh painted this picture. The variety which he represents is the imperial fritillary, which was grown in French and Dutch gardens at the end of the 19th century. It has an orange-red flower, with a long stem from which each bulb produces between three and ten flowers. So to compose this bouquet, Vincent used only one or two bulbs, placing the cut flowers in a copper vase.

When he produced this painting, Vincent was living in Paris and was in close contact with Paul Signac. It is not surprising, therefore, to note that Van Gogh applied some of the principles of Neo-Impressionist painting, of which Signac was one of the major figures: pointillist brushwork is used for the background, and a contrast of complementary colours, blue and orange, dominates the painting. However, the influence of these Neo-Impressionist theories remains limited. The separate brushstrokes were only used for a defined surface, the interplay of complementary colours did not limit Van Gogh in his choice of shades in any way, and finally, by choosing a still life, he was moving away from the themes treated by Seurat and his followers.

The painter Emile Bernard would later recall that Vincent was courting ‘La Segatori'', the Italian owner of the Tambourin café on the boulevard de Clichy, and used to give her paintings of flowers, which would last for ever. Thanks to painted bouquets like this one, the Tambourin would soon become a veritable artificial garden.', 'upload/372/5.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(85,'Montmartre: windmills and allotments', '1887', 'w810 x h448 cm','Van Gogh Museum
Van Gogh painted the foreground of this view of Montmartre with a fine brush, while the sky in the background he produced with broad brushstrokes. In Paris, Van Gogh frequently painted the picturesque windmills on the hill of Montmartre. In his day, Montmartre was still a partly rural area with allotment gardens and farms.', 'upload/372/6.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(86,'Restaurant Rispal at Asnières (Le restaurant Rispal à Asnières)', '1887', '106.68 x 93.98 x 11.43 cm','Van Gogh lived in Paris from March 1886 until February 1888 and regularly represented the industrial suburb of Asnières, to the northwest of the capital. Van Gogh was fascinated by scenes of café life, and here he represented a working-class restaurant, the name of which appears both on the side of the building and on a placard between two prominent trees to the right. The foreground figure wears the blue worker''s smock that van Gogh himself is known to have worn at this time. The relatively uniform flecks of bright color, particularly in the foliage, indicate van Gogh''s awareness of the work of the pointillists.', 'upload/372/7.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(87,'Street in Auvers-sur-Oise', '1890', 'w92.5 x h73.5 cm','Vincent van Gogh painted this work in the tiny town of Auvers-sur-Oise in the north of France, where he had gone on the advice of his brother Theo to be treated for his mental problems. Vincent eventually committed suicide there, and this is one of his last paintings. It came into the possession of the artist''s brother and then his widow, from whom Julien Leclercq purchased it. Leclercq was a French poet and art critic who organised the first van Gogh retrospective in Paris in 1901. He was married to the Finnish pianist Fanny Flodin, sister of the sculptor Hilda Flodin, and in 1903 Fanny sold the painting to the Antell delegation to be included in Ateneum''s collection. Thus Ateneum became the first museum in the world to own a Vincent van Gogh', 'upload/372/8.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(88,'Garden with Courting Couples: Square Saint-Pierre', '1887', '없음','This sunny park view is one of the largest canvases Vincent van Gogh ever produced in Paris. Inspired by the dots used by Pointillists, Van Gogh instead employed loose little paint stripes. He applied the paint in different directions and thicknesses, whereby each element—the air, vegetation and the figures—acquires its own particular texture. This helped him to create the effect of a radiant spring day, which fit the sense of intimacy and togetherness he wished to express.

Van Gogh himself called this work ''The garden with lovers''.', 'upload/372/9.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(89,'The Starry Night', '1889', 'w921 x h737 mm','Van Gogh''s night sky is a field of roiling energy. Below the exploding stars, the village is a place of quiet order. Connecting earth and sky is the flamelike cypress, a tree traditionally associated with graveyards and mourning. But death was not ominous for van Gogh. Looking at the stars always makes me dream, he said, Why, I ask myself, shouldn''t the shining dots of the sky be as accessible as the black dots on the map of France? Just as we take the train to get to Tarascon or Rouen, we take death to reach a star.

The artist wrote of his experience to his brother Theo: This morning I saw the country from my window a long time before sunrise, with nothing but the morning star, which looked very big. This morning star, or Venus, may be the large white star just left of center in The Starry Night. The hamlet, on the other hand, is invented, and the church spire evokes van Gogh''s native land, the Netherlands. The painting, like its daytime companion, The Olive Trees, is rooted in imagination and memory. Leaving behind the Impressionist doctrine of truth to nature in favor of restless feeling and intense color, as in this highly charged picture, van Gogh made his work a touchstone for all subsequent Expressionist painting.

The Museum of Modern Art, MoMA Highlights, New York: The Museum of Modern Art, revised 2004, originally published 1999, p. 35

Find out more about The Starry Night at:
mo.ma/starrynight', 'upload/372/10.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(90,'Young Italian Woman at a Table', '1900', 'w73.5 x h92.1 cm','Leaning on a fabric-covered table and resting her head in her hand, this young woman looks out with an enigmatic expression. Since the Renaissance, artists have used this pose to portray melancholy. The pose, combined with her hauntingly unreadable face, gives a human poignancy and psychological tension to the figure. Juxtaposing bold, individual strokes of color, Paul Cézanne built up the woman''s powerful physical presence and the space she occupies. As a twentieth-century painter and admirer of Cézanne observed, his later works, such as Young Italian Woman have an enormous sense of volume, breathing, pulsating, expanding, contracting, through his use of colors. While the woman''s form is convincing, the space behind and around her can appear contradictory and even confusing. How far away is the wall? Is the tabletop flat underneath the cloth? Does she sit or stand? These questions give tension and movement to an otherwise stable composition. From the 1890s until the end of his life, Cézanne painted a number of these grand figure studies, usually relying upon local workers or residents for his models.', 'upload/373/1.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(91,'Turn in the Road', '1881', 'w733 x h606 mm','During the 1870s, Cézanne admired and worked closely with Camille Pissarro, one of the most innovative Impressionist landscape painters. In comparison to Pissarro''s more straightforward views of the countryside, this bold landscape shows Cézanne''s interest in complex arrangements of shapes and spaces that challenge the viewer''s perceptions. In this painting, for example, the curving roadway draws us into deep space and at the same time forms a flattened shape on the surface of the painting. The first owner of this landscape was Cézanne''s contemporary Claude Monet.', 'upload/373/2.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(92,'Still Life with Apples', '1898', 'w927 x h686 mm','Throughout his life, the French painter Paul Cézanne returned again and again to the still life. Encompassing small—scale domestic scenes rather than grand public ones, still life was considered the lowliest of genres by the French Royal Academy, the official arbiter of great art in the nineteenth century. Yet in Still Life with Apples, Cézanne proved that this modest genre could be a vehicle for thinking through the Impressionist project of faithfully representing the appearance of light and space. Painting from nature is not copying the object, he wrote, it is realizing one''s sensations.

Cézanne consistently draws our attention to the quality of the paint and canvas, and we never lose ourselves in illusion. For example, the edges of the fruit in the bowl are hard to define, appearing to shift before our eyes. Cézanne''s scene defies the rules of linear perspective (a system for creating the illusion of space on a flat surface, wherein every object is seen from a single, fixed point of view) and instead gives us shifting views. The right corner of the table tilts forward, and fails to align with the left side; the pitcher, the bowl, and the glass all tilt to the left, as if magnetically drawn to the curtain. Even though the artist worked on this painting for a number of years, some areas of canvas are left bare, and others, like the drape of the tablecloth on the right edge of the table, appear unfinished. Still Life with Apples is more than an imitation of life—it is an exploration of seeing and the very nature of painting.', 'upload/373/3.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(93,'Sketch after Puget''s Milo of Croton', '1890', 'Sheet: 478 x 314 mm.','', 'upload/373/4.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(94,'Landscape with Village Church', '1885', 'w43.5 x h31 cm','Watercolours form a significant component of Cézanne’s oeuvre, though he only rarely dated his works. In a seminal study of Cézanne’s work published in 1927, Roger Fry observed that watercolour techniques played a considerable influence on the artist’s oil paintings, particularly in the period after 1885. After studying in Paris, Cézanne lived from 1873 to 1879 in the nearby town of Auvers-sur-Oise, following which he then returned to his roots in Provence. Following the example of Pissaro, who had encouraged the artist to experiment with Impressionism, he continually took inspiration from nature itself. He loved to walk or take a carriage to locations in the vicinity of Aix in order to paint outdoors – a habit he maintained into his old age. There he created watercolours of paths, forests, rivers, and mountains, painting views of L’Estaque and the mountain village of Gardanne, where he stayed for long periods on a number of occasions between 1885 and 1886. In his subtly nuanced watercolours, Cézanne gave the unpainted white portions of the paper a significant voice in the work’s visual language.', 'upload/373/5.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(95,'Paul Alexis Reading a Manuscript to Zola', '1870', 'w163 x h133,5 cm','', 'upload/373/6.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(96,'Small Bathers', '1897', 'Sheet: 223 x 273 mm.','내용 없음', 'upload/373/7.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(97,'The Eternal Feminine (L''Éternel Féminin)', '1877', '43.2 x 53 cm ','The nude played a central role in Paul Cézanne''s art throughout his career, but, paradoxically for an artist who usually drew from life, he seldom used nude models in his working process: he was said to be ill-at-ease with naked sitters. I paint still lifes, he once told Renoir, Women models frighten me. Cezanne contented instead with studying earlier artists and using the drawings after nude models that he had made in art school in Paris.

The meaning of this enigmatic painting is unclear, and it has been known by several titles. This woman is confronted by devotees from different arts and occupations, among them a mitered bishop, whose admiration seems intrusive, even aggressive. A painter sometimes identified as Eugène Delacroix stands at his easel painting the scene. The bald figure at the painting''s bottom may be Cézanne himself. Whether she encourages their adoration, passively accepts it, or is trapped by her cult is unclear. Like many of Cézanne''s nudes, the woman''s face is nearly blank, except for her red eye sockets. Around 1877 Cézanne began to use the parallel diagonal strokes seen here to impose order and to unify his picture''s surface.', 'upload/373/8.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(98,'The Buffet', '1877', '65.5 x 81 cm','Cézanne spent most of his life in the town where he was born, Aix-en-Provence. The Budapest still-life was made in the coastal town of Estaque near Aix and Marseille, where Cézanne moved several times.
When the picture was painted in the mid-1870s Cézanne was friends with the most important Impressionist painters: Pissarro, Monet and Renoir. At this time, the palette of his earlier so-called Baroque-style paintings gave way to lighter colours, but rather than the Impressionists'' method of painting he was preoccupied with capturing what is lasting and permanent. He regularly studied works in museums, plaster cast collections, and reproductions in art journals. Just as the poetry of Charles Baudelaire can be viewed as the culmination of previous movements, so can Cézanne''s still-lifes from the 1870s, for which he studied the compositions of Chardin and seventeenth-century Spanish still-life painters. Cézanne used what he learnt from still-lifes in his portraits and landscapes too.
The still-lifes make up a considerable part of his oeuvre, and several of them were expressions of the artist''s momentary state of mind. The Budapest still-life expresses symmetry in asymmetry. The top and the shelf of the buffet are linked by a full bottle of wine, as a solid point between the fragile white porcelain cups, the wine-glass, the rumpled white tea-cloth and the mound of feather-light ladyfingers.

Judit Geskó', 'upload/373/9.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(99,'Self-Portrait with a Hat', '1894', 'w501 x h612 cm','About 30 self-portraits by Cézanne are known. To Cézanne, who required months and sometimes years to complete one painting, the self-portrait was one of a small number of genres in which his working style did not cause problems with respect to his model. His head, torso, arms: he rendered them with a solidity that calls to mind geometric forms. Even a natural landscape changes if studied for too long. The light and the weather conditions change; flowers and fruit wither and die. Cézanne was trying to grasp the fundamental forms latent in natural phenomena, as they underwent constant change. This self-portrait is one he showed in his first solo exhibition. Subsequently, in 1920, a Japanese visitor purchased it in Paris; through the Shirakaba-ha or White Birch School, a literary group, it was introduced to the general public in Japan.', 'upload/373/10.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(100,'Madonna Terranuova', '1505', 'w88.5 x h88.5 cm','This picture was painted shortly after Raphael’s arrival in Florence and “was his fi rst attempt at the tondo format that was so popular in that city. The Madonna’s face was much more confi - dently composed than in his three earlier Berlin paintings. Leonardo’s infl uence is becoming stronger than Perugino’s. Details like the extreme foreshortening of Mary’s hand come from Leonardo, and possibly also the idea of showing the Christ Child with his legs crossed, although this pose could also derive from the Netherlands and a painter like Memling, for example, who is also echoed in the lavish attention paid to the landscape area. Northern aspects of the town featured more conspicuously in the under-drawing. A typically southern feature is the presence of holy children, above all the young John the Baptist.', 'upload/374/1.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(101,'The Holy Family', '1510', 'w907 x h1186 mm','The Morgan''s painting reproduces a famous composition by Raphael 
(1483–1520), which was probably commissioned by Pope Julius II (reigned 
1503–13) and given to the church of Santa Maria del Popolo in Rome. Long
considered lost, Raphael''s original painting, also known as the Madonna of Loreto,
likely is the one now in the Musée Condé, Chantilly. One of the 
numerous copies, now in Nijni Taghil, bears the date 1509, and thus 
possibly supplies a terminus ante quem for Raphael''s original.

The composition represents the Virgin raising a transparent veil from 
the infant Christ, just wakened from sleep. The child reaches to play 
with the veil, an allusion to Christ''s burial shroud and early death. 
The earliest published mention of Raphael''s original is made by Giorgio 
Vasari, the celebrated sixteenth-century biographer of the Italian 
masters. In the 1550 edition of his Lives of the Painters, Sculptors, and Architects,
he writes that Raphael painted a portrait of Pope Julius II in the same
year that he also painted a very beautiful Madonna, noting that both 
works were preserved in the church of Santa Maria del Popolo. In the 
last named picture, Vasari observes, which represents the Nativity of 
Christ, the Virgin is covering with a veil the divine Child, the 
expression of whose countenance is of such wonderful beauty and his 
whole person so clearly demonstrates the divinity of his origin that all
must perceive him to be truly the Son of God.

The above-mentioned portrait of Pope Julius II is probably the painting 
now in the National Gallery, London. It has been suggested that Pope 
Julius II, much distressed after his return from Bologna in 1511, 
donated both the Raphael portrait and Holy Family to the church 
of Santa Maria del Popolo, which the pope''s family had patronized for 
several generations. Both paintings were shown to the general public 
only on religious feast days, when the Holy Family was displayed on one of the church''s pillars.

In the Morgan version, as compared to the Chantilly original, the 
Virgin''s brooch has gained a pendant pearl and the drapery on the bed 
falls in more folds. The high quality and refined detail of the Morgan 
version distinguish it from most of the other extant examples of this 
composition. In all likelihood it was made by one of Raphael''s pupils 
during the master''s lifetime or shortly after his death.', 'upload/374/2.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(102,'A Kneeling Nude Woman with her Left Arm Raised', '1518', 'w187 x h279 cm','Raphael''s exquisite drawings reveal his meticulous preparation for the compositions he painted. Traditionally, young male assistants were used by Renaissance artists to model female figures, a practice Raphael followed in his early work. In Rome, however, he was one of the first to use female models for life drawing, as here. He also realised the potential of the new medium of red chalk for descriptive outlines and subtle modelling. This study and the smaller sketches next to it are connected with frescoes of Cupid and Psyche Raphael planned in 1518 for the villa beside the river Tiber of the wealthy banker Agostino Chigi.', 'upload/374/3.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(103,'The Elephant Hanno', '1516', 'w28.5 x h27.9 cm','This remarkable drawing correctly and precisely records the anatomy of the exotic animal; it is thus one of the earliest European depictions of an elephant to be drawn directly from life. The sheet shows the white Asian elephant who had been named Hanno, after the Carthaginian sovereign and seaman. The elephant was born in Cochin (India) in 1510 and then shipped to King Manuel I in Lisbon. In 1514, he then sent the elephant to Pope Leo X as a diplomatic gift; the latter accepted it enthusiastically. With his spirited tricks and his remarkable charms, Hanno effortlessly won the Pope’s heart. Leo X was inconsolable when the elephant died in 1518 – perhaps because of stress caused by his being exposed to ever-greater masses of spectators – and had Raphael paint a life-sized fresco portrait of Hanno on the wall of the Vatican''s gatehouse. The fresco and the architectural element were later destroyed during a modernization project. This sheet bears a contemporary copy of Raphael’s preliminary drawing.', 'upload/374/4.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(104,'The Small Cowper Madonna', '1505', 'w44 x h59.5 cm','', 'upload/374/5.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(105,'Sketch for an enthroned Virgin and Child with St. Nicholas of Tolentino', '1504', 'w154 x h233 mm','', 'upload/374/6.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(106,'Tapestry (Putti at Play, I.)', '1635', 'w270 x h310 cm','Museum of Applied Arts, Budapest
The series originally consisted of 20 parts ordered by Pope Leo X of the Medicis, for the Constantino Hall of the Vatican Palace. Each part is decorated with emblems of the Medici family. Opinions differ as to the identity of the artist who made the original cartoons; they were probably the work of Tommaso Vincidor and Giovanni da Udine, using the sketches of their master Raphael. The series was woven in the Brussels workshop of Pieter van Aelst, however, he died before the tapestry richly woven with gold was completed. It was transported to the Vatican only after the death of Leo X, there it remained apparently until 1790; after that date there is no information about the fate of the works. The subject children at play was a popular one in both Renaissance and Baroque art. The first person to concern himself with the story of the series was Müntz. He could reconstruct all the 20 pieces from inventories, contemporary and later sketches and engravings. As far as we know at present, the four tapestries in the Budapest Museum of Applied Arts are probably the only remnants of a series, woven without golden threads, made after the original cartoons. Experts, however, do not agree on the place and time of the execution of the copies. For a precise definition further research is required. (In 1994 two further tapestries of the set turned up through art trade – it can presently be seen in the Metropolitan Museum of New York). On the four tapestries are putti playing in front of a rich cluster of fruits intertwined with ribbons. One has an ostrich in the middle. On the second is a putto holding a yoke (the emblem of Pope Leo X) in its hand. On the third is a lion in the middle, with an orb on its head showing the sacred initials of Christ; the putti surrounding it are holding the crown and the sceptre of the Holy Roman Emperor, a papal tiara and the keys of St Peter. In the fourth are putti at play, with a peacock above them. A ring and three feathers (Medici emblems) appear on all pictures, on the meander frieze against a red background.', 'upload/374/7.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(107,'The Prophets Hosea and Jonah', '1510', 'w20 x h26.2 cm','', 'upload/374/8.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(108,'Bindo Altoviti', '1515', 'w438 x h597 cm','', 'upload/374/9.jpg', 0, sysdate);
insert into t_art(seq, title, createyear, artsize, remark, imagepath, viewcount, regdate) values(109,'La Madone de la maison d''Orléans', '1507', 'w230 x h310 cm','La Madone de la Maison d''Orléans appartenait aux collections des Orléans jusqu''à la Révolution. En 1791 Philippe-Egalité vendit ses peintures italiennes et le tableau passa en Angleterre, où le duc d''Aumale le racheta en 1869 en raison de sa provenance. C’est un tableau de dévotion privée de Raphaël jeune, l’iconographie est encore très médiévale. Le pot de tyriana à l''arrière-plan est un remède contre les morsures de serpent, symbole du mal. Le tyriana et la pomme sont donc l''image du rachat du péché par le Christ.', 'upload/374/10.jpg', 0, sysdate);


-- t_artrel
insert into t_artrel(cseq, aseq) values(353,1);
insert into t_artrel(cseq, aseq) values(164,1);							
insert into t_artrel(cseq, aseq) values(353,2);
insert into t_artrel(cseq, aseq) values(122,2);							
insert into t_artrel(cseq, aseq) values(353,3);
insert into t_artrel(cseq, aseq) values(122,3);							
insert into t_artrel(cseq, aseq) values(353,4);
insert into t_artrel(cseq, aseq) values(122,4);							
insert into t_artrel(cseq, aseq) values(353,5);
insert into t_artrel(cseq, aseq) values(122,5);
insert into t_artrel(cseq, aseq) values(123,5);						
insert into t_artrel(cseq, aseq) values(353,6);
insert into t_artrel(cseq, aseq) values(122,6);							
insert into t_artrel(cseq, aseq) values(353,7);
insert into t_artrel(cseq, aseq) values(122,7);							
insert into t_artrel(cseq, aseq) values(353,8);
insert into t_artrel(cseq, aseq) values(122,8);							
insert into t_artrel(cseq, aseq) values(353,9);
insert into t_artrel(cseq, aseq) values(122,9);							
insert into t_artrel(cseq, aseq) values(353,10);
insert into t_artrel(cseq, aseq) values(164,10);							
insert into t_artrel(cseq, aseq) values(354,11);
insert into t_artrel(cseq, aseq) values(22,11);							
insert into t_artrel(cseq, aseq) values(354,12);
insert into t_artrel(cseq, aseq) values(22,12);							
insert into t_artrel(cseq, aseq) values(354,13);
insert into t_artrel(cseq, aseq) values(22,13);
insert into t_artrel(cseq, aseq) values(122,13);
insert into t_artrel(cseq, aseq) values(123,13);					
insert into t_artrel(cseq, aseq) values(354,14);
insert into t_artrel(cseq, aseq) values(122,14);
insert into t_artrel(cseq, aseq) values(22,14);						
insert into t_artrel(cseq, aseq) values(354,15);
insert into t_artrel(cseq, aseq) values(122,15);							
insert into t_artrel(cseq, aseq) values(354,21);
insert into t_artrel(cseq, aseq) values(122,21);							
insert into t_artrel(cseq, aseq) values(354,16);
insert into t_artrel(cseq, aseq) values(122,16);							
insert into t_artrel(cseq, aseq) values(354,17);
insert into t_artrel(cseq, aseq) values(122,17);
insert into t_artrel(cseq, aseq) values(22,17);						
insert into t_artrel(cseq, aseq) values(354,18);
insert into t_artrel(cseq, aseq) values(122,18);
insert into t_artrel(cseq, aseq) values(22,18);						
insert into t_artrel(cseq, aseq) values(354,19);
insert into t_artrel(cseq, aseq) values(122,19);							
insert into t_artrel(cseq, aseq) values(355,22);
insert into t_artrel(cseq, aseq) values(164,22);							
insert into t_artrel(cseq, aseq) values(355,23);
insert into t_artrel(cseq, aseq) values(122,23);							
insert into t_artrel(cseq, aseq) values(355,24);
insert into t_artrel(cseq, aseq) values(122,24);							
insert into t_artrel(cseq, aseq) values(355,25);
insert into t_artrel(cseq, aseq) values(122,25);							
insert into t_artrel(cseq, aseq) values(355,26);
insert into t_artrel(cseq, aseq) values(122,26);
insert into t_artrel(cseq, aseq) values(123,26);						
insert into t_artrel(cseq, aseq) values(355,27);
insert into t_artrel(cseq, aseq) values(122,27);							
insert into t_artrel(cseq, aseq) values(355,28);
insert into t_artrel(cseq, aseq) values(122,28);							
insert into t_artrel(cseq, aseq) values(355,29);
insert into t_artrel(cseq, aseq) values(122,29);							
insert into t_artrel(cseq, aseq) values(355,30);
insert into t_artrel(cseq, aseq) values(122,30);							
insert into t_artrel(cseq, aseq) values(355,31);
insert into t_artrel(cseq, aseq) values(122,31);							
insert into t_artrel(cseq, aseq) values(356,32);
insert into t_artrel(cseq, aseq) values(122,32);
insert into t_artrel(cseq, aseq) values(123,32);						
insert into t_artrel(cseq, aseq) values(356,35);
insert into t_artrel(cseq, aseq) values(122,35);
insert into t_artrel(cseq, aseq) values(123,35);						
insert into t_artrel(cseq, aseq) values(356,36);
insert into t_artrel(cseq, aseq) values(122,36);
insert into t_artrel(cseq, aseq) values(123,36);						
insert into t_artrel(cseq, aseq) values(356,38);
insert into t_artrel(cseq, aseq) values(122,38);
insert into t_artrel(cseq, aseq) values(123,38);						
insert into t_artrel(cseq, aseq) values(356,39);
insert into t_artrel(cseq, aseq) values(122,39);
insert into t_artrel(cseq, aseq) values(123,39);						
insert into t_artrel(cseq, aseq) values(356,40);
insert into t_artrel(cseq, aseq) values(122,40);
insert into t_artrel(cseq, aseq) values(123,40);						
insert into t_artrel(cseq, aseq) values(356,41);
insert into t_artrel(cseq, aseq) values(122,41);
insert into t_artrel(cseq, aseq) values(123,41);						
insert into t_artrel(cseq, aseq) values(356,42);
insert into t_artrel(cseq, aseq) values(122,42);
insert into t_artrel(cseq, aseq) values(123,42);						
insert into t_artrel(cseq, aseq) values(356,43);
insert into t_artrel(cseq, aseq) values(122,43);
insert into t_artrel(cseq, aseq) values(123,43);						
insert into t_artrel(cseq, aseq) values(356,44);
insert into t_artrel(cseq, aseq) values(122,44);							
insert into t_artrel(cseq, aseq) values(357,45);
insert into t_artrel(cseq, aseq) values(127,45);
insert into t_artrel(cseq, aseq) values(129,45);						
insert into t_artrel(cseq, aseq) values(357,46);
insert into t_artrel(cseq, aseq) values(127,46);
insert into t_artrel(cseq, aseq) values(129,46);						
insert into t_artrel(cseq, aseq) values(357,47);
insert into t_artrel(cseq, aseq) values(127,47);
insert into t_artrel(cseq, aseq) values(12,47);						
insert into t_artrel(cseq, aseq) values(357,48);
insert into t_artrel(cseq, aseq) values(122,48);
insert into t_artrel(cseq, aseq) values(12,48);						
insert into t_artrel(cseq, aseq) values(357,49);
insert into t_artrel(cseq, aseq) values(144,49);
insert into t_artrel(cseq, aseq) values(122,49);
insert into t_artrel(cseq, aseq) values(12,49);					
insert into t_artrel(cseq, aseq) values(357,50);
insert into t_artrel(cseq, aseq) values(127,50);
insert into t_artrel(cseq, aseq) values(12,50);						
insert into t_artrel(cseq, aseq) values(357,51);
insert into t_artrel(cseq, aseq) values(144,51);
insert into t_artrel(cseq, aseq) values(122,51);
insert into t_artrel(cseq, aseq) values(195,51);
insert into t_artrel(cseq, aseq) values(12,51);
insert into t_artrel(cseq, aseq) values(1,51);			
insert into t_artrel(cseq, aseq) values(357,52);
insert into t_artrel(cseq, aseq) values(12,52);
insert into t_artrel(cseq, aseq) values(1,52);						
insert into t_artrel(cseq, aseq) values(357,53);
insert into t_artrel(cseq, aseq) values(124,53);
insert into t_artrel(cseq, aseq) values(122,53);
insert into t_artrel(cseq, aseq) values(12,53);					
insert into t_artrel(cseq, aseq) values(357,54);
insert into t_artrel(cseq, aseq) values(124,54);
insert into t_artrel(cseq, aseq) values(122,54);
insert into t_artrel(cseq, aseq) values(12,54);					
insert into t_artrel(cseq, aseq) values(370,57);
insert into t_artrel(cseq, aseq) values(127,57);
insert into t_artrel(cseq, aseq) values(129,57);				
insert into t_artrel(cseq, aseq) values(370,59);						
insert into t_artrel(cseq, aseq) values(370,61);
insert into t_artrel(cseq, aseq) values(127,61);
insert into t_artrel(cseq, aseq) values(129,61);				
insert into t_artrel(cseq, aseq) values(370,62);
insert into t_artrel(cseq, aseq) values(127,62);					
insert into t_artrel(cseq, aseq) values(370,63);
insert into t_artrel(cseq, aseq) values(127,63);					
insert into t_artrel(cseq, aseq) values(370,64);
insert into t_artrel(cseq, aseq) values(122,64);					
insert into t_artrel(cseq, aseq) values(370,65);						
insert into t_artrel(cseq, aseq) values(370,66);
insert into t_artrel(cseq, aseq) values(127,66);
insert into t_artrel(cseq, aseq) values(129,66);				
insert into t_artrel(cseq, aseq) values(370,67);						
insert into t_artrel(cseq, aseq) values(370,68);						
insert into t_artrel(cseq, aseq) values(371,69);
insert into t_artrel(cseq, aseq) values(127,69);
insert into t_artrel(cseq, aseq) values(129,69);				
insert into t_artrel(cseq, aseq) values(371,71);
insert into t_artrel(cseq, aseq) values(122,71);					
insert into t_artrel(cseq, aseq) values(371,72);
insert into t_artrel(cseq, aseq) values(122,72);					
insert into t_artrel(cseq, aseq) values(371,73);
insert into t_artrel(cseq, aseq) values(122,73);					
insert into t_artrel(cseq, aseq) values(371,74);
insert into t_artrel(cseq, aseq) values(122,74);					
insert into t_artrel(cseq, aseq) values(371,75);
insert into t_artrel(cseq, aseq) values(122,75);					
insert into t_artrel(cseq, aseq) values(371,76);
insert into t_artrel(cseq, aseq) values(122,76);					
insert into t_artrel(cseq, aseq) values(371,77);
insert into t_artrel(cseq, aseq) values(122,77);					
insert into t_artrel(cseq, aseq) values(371,78);
insert into t_artrel(cseq, aseq) values(122,78);					
insert into t_artrel(cseq, aseq) values(371,79);
insert into t_artrel(cseq, aseq) values(122,79);					
insert into t_artrel(cseq, aseq) values(372,80);						
insert into t_artrel(cseq, aseq) values(372,81);
insert into t_artrel(cseq, aseq) values(127,81);
insert into t_artrel(cseq, aseq) values(129,81);				
insert into t_artrel(cseq, aseq) values(372,82);
insert into t_artrel(cseq, aseq) values(124,82);					
insert into t_artrel(cseq, aseq) values(372,83);
insert into t_artrel(cseq, aseq) values(127,83);
insert into t_artrel(cseq, aseq) values(129,83);
insert into t_artrel(cseq, aseq) values(24,83);			
insert into t_artrel(cseq, aseq) values(372,84);
insert into t_artrel(cseq, aseq) values(127,84);
insert into t_artrel(cseq, aseq) values(129,84);				
insert into t_artrel(cseq, aseq) values(372,85);						
insert into t_artrel(cseq, aseq) values(372,86);
insert into t_artrel(cseq, aseq) values(127,86);
insert into t_artrel(cseq, aseq) values(129,86);				
insert into t_artrel(cseq, aseq) values(372,87);
insert into t_artrel(cseq, aseq) values(127,87);
insert into t_artrel(cseq, aseq) values(129,87);				
insert into t_artrel(cseq, aseq) values(372,88);						
insert into t_artrel(cseq, aseq) values(372,89);
insert into t_artrel(cseq, aseq) values(24,89);					
insert into t_artrel(cseq, aseq) values(373,90);
insert into t_artrel(cseq, aseq) values(127,90);
insert into t_artrel(cseq, aseq) values(129,90);				
insert into t_artrel(cseq, aseq) values(373,91);
insert into t_artrel(cseq, aseq) values(127,91);
insert into t_artrel(cseq, aseq) values(129,91);				
insert into t_artrel(cseq, aseq) values(373,92);
insert into t_artrel(cseq, aseq) values(127,92);
insert into t_artrel(cseq, aseq) values(129,92);
insert into t_artrel(cseq, aseq) values(24,92);			
insert into t_artrel(cseq, aseq) values(373,93);
insert into t_artrel(cseq, aseq) values(130,93);					
insert into t_artrel(cseq, aseq) values(373,94);
insert into t_artrel(cseq, aseq) values(124,94);
insert into t_artrel(cseq, aseq) values(144,94);
insert into t_artrel(cseq, aseq) values(122,94);			
insert into t_artrel(cseq, aseq) values(373,95);						
insert into t_artrel(cseq, aseq) values(373,96);
insert into t_artrel(cseq, aseq) values(195,96);					
insert into t_artrel(cseq, aseq) values(373,97);
insert into t_artrel(cseq, aseq) values(127,97);
insert into t_artrel(cseq, aseq) values(129,97);				
insert into t_artrel(cseq, aseq) values(373,98);
insert into t_artrel(cseq, aseq) values(127,98);
insert into t_artrel(cseq, aseq) values(129,98);				
insert into t_artrel(cseq, aseq) values(373,99);
insert into t_artrel(cseq, aseq) values(129,99);
insert into t_artrel(cseq, aseq) values(374,100);
insert into t_artrel(cseq, aseq) values(127,100);
insert into t_artrel(cseq, aseq) values(133,100);
insert into t_artrel(cseq, aseq) values(374,101);
insert into t_artrel(cseq, aseq) values(127,101);
insert into t_artrel(cseq, aseq) values(129,101);				
insert into t_artrel(cseq, aseq) values(374,102);
insert into t_artrel(cseq, aseq) values(266,102);					
insert into t_artrel(cseq, aseq) values(374,103);
insert into t_artrel(cseq, aseq) values(134,103);
insert into t_artrel(cseq, aseq) values(123,103);
insert into t_artrel(cseq, aseq) values(165,103);
insert into t_artrel(cseq, aseq) values(122,103);		
insert into t_artrel(cseq, aseq) values(374,104);
insert into t_artrel(cseq, aseq) values(127,104);					
insert into t_artrel(cseq, aseq) values(374,105);						
insert into t_artrel(cseq, aseq) values(374,106);
insert into t_artrel(cseq, aseq) values(164,106);
insert into t_artrel(cseq, aseq) values(181,106);				
insert into t_artrel(cseq, aseq) values(374,107);
insert into t_artrel(cseq, aseq) values(198,107);
insert into t_artrel(cseq, aseq) values(134,107);
insert into t_artrel(cseq, aseq) values(123,107);
insert into t_artrel(cseq, aseq) values(25,107);		
insert into t_artrel(cseq, aseq) values(374,108);
insert into t_artrel(cseq, aseq) values(127,108);
insert into t_artrel(cseq, aseq) values(374,109);

update t_artrel set sortseq=1 WHERE cseq=353 and aseq=1;
update t_artrel set sortseq=1 WHERE cseq=164 and aseq=1;
update t_artrel set sortseq=1 WHERE cseq=353 and aseq=2;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=2;
update t_artrel set sortseq=1 WHERE cseq=353 and aseq=3;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=3;
update t_artrel set sortseq=1 WHERE cseq=353 and aseq=4;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=4;
update t_artrel set sortseq=1 WHERE cseq=353 and aseq=5;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=5;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=5;
update t_artrel set sortseq=1 WHERE cseq=353 and aseq=6;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=6;
update t_artrel set sortseq=1 WHERE cseq=353 and aseq=7;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=7;
update t_artrel set sortseq=1 WHERE cseq=353 and aseq=8;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=8;
update t_artrel set sortseq=1 WHERE cseq=353 and aseq=9;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=9;
update t_artrel set sortseq=1 WHERE cseq=353 and aseq=10;
update t_artrel set sortseq=1 WHERE cseq=164 and aseq=10;
update t_artrel set sortseq=1 WHERE cseq=354 and aseq=11;
update t_artrel set sortseq=1 WHERE cseq=22 and aseq=11;
update t_artrel set sortseq=1 WHERE cseq=354 and aseq=12;
update t_artrel set sortseq=1 WHERE cseq=22 and aseq=12;
update t_artrel set sortseq=1 WHERE cseq=354 and aseq=13;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=13;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=13;
update t_artrel set sortseq=1 WHERE cseq=22 and aseq=13;
update t_artrel set sortseq=1 WHERE cseq=354 and aseq=14;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=14;
update t_artrel set sortseq=1 WHERE cseq=22 and aseq=14;
update t_artrel set sortseq=1 WHERE cseq=354 and aseq=15;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=15;
update t_artrel set sortseq=1 WHERE cseq=354 and aseq=16;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=16;
update t_artrel set sortseq=1 WHERE cseq=354 and aseq=17;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=17;
update t_artrel set sortseq=1 WHERE cseq=22 and aseq=17;
update t_artrel set sortseq=1 WHERE cseq=354 and aseq=18;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=18;
update t_artrel set sortseq=1 WHERE cseq=22 and aseq=18;
update t_artrel set sortseq=1 WHERE cseq=354 and aseq=19;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=19;
update t_artrel set sortseq=1 WHERE cseq=354 and aseq=21;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=21;
update t_artrel set sortseq=1 WHERE cseq=355 and aseq=22;
update t_artrel set sortseq=1 WHERE cseq=164 and aseq=22;
update t_artrel set sortseq=1 WHERE cseq=355 and aseq=23;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=23;
update t_artrel set sortseq=1 WHERE cseq=355 and aseq=24;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=24;
update t_artrel set sortseq=1 WHERE cseq=355 and aseq=25;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=25;
update t_artrel set sortseq=1 WHERE cseq=355 and aseq=26;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=26;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=26;
update t_artrel set sortseq=1 WHERE cseq=355 and aseq=27;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=27;
update t_artrel set sortseq=1 WHERE cseq=355 and aseq=28;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=28;
update t_artrel set sortseq=1 WHERE cseq=355 and aseq=29;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=29;
update t_artrel set sortseq=1 WHERE cseq=355 and aseq=30;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=30;
update t_artrel set sortseq=1 WHERE cseq=355 and aseq=31;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=31;
update t_artrel set sortseq=1 WHERE cseq=356 and aseq=32;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=32;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=32;
update t_artrel set sortseq=1 WHERE cseq=356 and aseq=35;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=35;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=35;
update t_artrel set sortseq=1 WHERE cseq=356 and aseq=36;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=36;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=36;
update t_artrel set sortseq=1 WHERE cseq=356 and aseq=38;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=38;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=38;
update t_artrel set sortseq=1 WHERE cseq=356 and aseq=39;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=39;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=39;
update t_artrel set sortseq=1 WHERE cseq=356 and aseq=40;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=40;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=40;
update t_artrel set sortseq=1 WHERE cseq=356 and aseq=41;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=41;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=41;
update t_artrel set sortseq=1 WHERE cseq=356 and aseq=42;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=42;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=42;
update t_artrel set sortseq=1 WHERE cseq=356 and aseq=43;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=43;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=43;
update t_artrel set sortseq=1 WHERE cseq=356 and aseq=44;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=44;
update t_artrel set sortseq=1 WHERE cseq=357 and aseq=45;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=45;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=45;
update t_artrel set sortseq=1 WHERE cseq=357 and aseq=46;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=46;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=46;
update t_artrel set sortseq=1 WHERE cseq=357 and aseq=47;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=47;
update t_artrel set sortseq=1 WHERE cseq=12 and aseq=47;
update t_artrel set sortseq=1 WHERE cseq=357 and aseq=48;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=48;
update t_artrel set sortseq=1 WHERE cseq=12 and aseq=48;
update t_artrel set sortseq=1 WHERE cseq=357 and aseq=49;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=49;
update t_artrel set sortseq=2 WHERE cseq=144 and aseq=49;
update t_artrel set sortseq=1 WHERE cseq=12 and aseq=49;
update t_artrel set sortseq=1 WHERE cseq=357 and aseq=50;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=50;
update t_artrel set sortseq=1 WHERE cseq=12 and aseq=50;
update t_artrel set sortseq=1 WHERE cseq=357 and aseq=51;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=51;
update t_artrel set sortseq=2 WHERE cseq=144 and aseq=51;
update t_artrel set sortseq=3 WHERE cseq=195 and aseq=51;
update t_artrel set sortseq=1 WHERE cseq=1 and aseq=51;
update t_artrel set sortseq=2 WHERE cseq=12 and aseq=51;
update t_artrel set sortseq=1 WHERE cseq=357 and aseq=52;
update t_artrel set sortseq=1 WHERE cseq=1 and aseq=52;
update t_artrel set sortseq=2 WHERE cseq=12 and aseq=52;
update t_artrel set sortseq=1 WHERE cseq=357 and aseq=53;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=53;
update t_artrel set sortseq=2 WHERE cseq=124 and aseq=53;
update t_artrel set sortseq=1 WHERE cseq=12 and aseq=53;
update t_artrel set sortseq=1 WHERE cseq=357 and aseq=54;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=54;
update t_artrel set sortseq=2 WHERE cseq=124 and aseq=54;
update t_artrel set sortseq=1 WHERE cseq=12 and aseq=54;
update t_artrel set sortseq=1 WHERE cseq=370 and aseq=57;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=57;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=57;
update t_artrel set sortseq=1 WHERE cseq=370 and aseq=59;
update t_artrel set sortseq=1 WHERE cseq=370 and aseq=61;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=61;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=61;
update t_artrel set sortseq=1 WHERE cseq=370 and aseq=62;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=62;
update t_artrel set sortseq=1 WHERE cseq=370 and aseq=63;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=63;
update t_artrel set sortseq=1 WHERE cseq=370 and aseq=64;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=64;
update t_artrel set sortseq=1 WHERE cseq=370 and aseq=65;
update t_artrel set sortseq=1 WHERE cseq=370 and aseq=66;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=66;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=66;
update t_artrel set sortseq=1 WHERE cseq=370 and aseq=67;
update t_artrel set sortseq=1 WHERE cseq=370 and aseq=68;
update t_artrel set sortseq=1 WHERE cseq=371 and aseq=69;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=69;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=69;
update t_artrel set sortseq=1 WHERE cseq=371 and aseq=71;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=71;
update t_artrel set sortseq=1 WHERE cseq=371 and aseq=72;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=72;
update t_artrel set sortseq=1 WHERE cseq=371 and aseq=73;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=73;
update t_artrel set sortseq=1 WHERE cseq=371 and aseq=74;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=74;
update t_artrel set sortseq=1 WHERE cseq=371 and aseq=75;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=75;
update t_artrel set sortseq=1 WHERE cseq=371 and aseq=76;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=76;
update t_artrel set sortseq=1 WHERE cseq=371 and aseq=77;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=77;
update t_artrel set sortseq=1 WHERE cseq=371 and aseq=78;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=78;
update t_artrel set sortseq=1 WHERE cseq=371 and aseq=79;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=79;
update t_artrel set sortseq=1 WHERE cseq=372 and aseq=80;
update t_artrel set sortseq=1 WHERE cseq=372 and aseq=81;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=81;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=81;
update t_artrel set sortseq=1 WHERE cseq=372 and aseq=82;
update t_artrel set sortseq=1 WHERE cseq=124 and aseq=82;
update t_artrel set sortseq=1 WHERE cseq=372 and aseq=83;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=83;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=83;
update t_artrel set sortseq=1 WHERE cseq=24 and aseq=83;
update t_artrel set sortseq=1 WHERE cseq=372 and aseq=84;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=84;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=84;
update t_artrel set sortseq=1 WHERE cseq=372 and aseq=85;
update t_artrel set sortseq=1 WHERE cseq=372 and aseq=86;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=86;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=86;
update t_artrel set sortseq=1 WHERE cseq=372 and aseq=87;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=87;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=87;
update t_artrel set sortseq=1 WHERE cseq=372 and aseq=88;
update t_artrel set sortseq=1 WHERE cseq=372 and aseq=89;
update t_artrel set sortseq=1 WHERE cseq=24 and aseq=89;
update t_artrel set sortseq=1 WHERE cseq=373 and aseq=90;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=90;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=90;
update t_artrel set sortseq=1 WHERE cseq=373 and aseq=91;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=91;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=91;
update t_artrel set sortseq=1 WHERE cseq=373 and aseq=92;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=92;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=92;
update t_artrel set sortseq=1 WHERE cseq=24 and aseq=92;
update t_artrel set sortseq=1 WHERE cseq=373 and aseq=93;
update t_artrel set sortseq=1 WHERE cseq=130 and aseq=93;
update t_artrel set sortseq=1 WHERE cseq=373 and aseq=94;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=94;
update t_artrel set sortseq=2 WHERE cseq=124 and aseq=94;
update t_artrel set sortseq=3 WHERE cseq=144 and aseq=94;
update t_artrel set sortseq=1 WHERE cseq=373 and aseq=95;
update t_artrel set sortseq=1 WHERE cseq=373 and aseq=96;
update t_artrel set sortseq=1 WHERE cseq=195 and aseq=96;
update t_artrel set sortseq=1 WHERE cseq=373 and aseq=97;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=97;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=97;
update t_artrel set sortseq=1 WHERE cseq=373 and aseq=98;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=98;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=98;
update t_artrel set sortseq=1 WHERE cseq=373 and aseq=99;
update t_artrel set sortseq=1 WHERE cseq=129 and aseq=99;
update t_artrel set sortseq=1 WHERE cseq=374 and aseq=100;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=100;
update t_artrel set sortseq=2 WHERE cseq=133 and aseq=100;
update t_artrel set sortseq=1 WHERE cseq=374 and aseq=101;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=101;
update t_artrel set sortseq=2 WHERE cseq=129 and aseq=101;
update t_artrel set sortseq=1 WHERE cseq=374 and aseq=102;
update t_artrel set sortseq=1 WHERE cseq=266 and aseq=102;
update t_artrel set sortseq=1 WHERE cseq=374 and aseq=103;
update t_artrel set sortseq=1 WHERE cseq=122 and aseq=103;
update t_artrel set sortseq=2 WHERE cseq=123 and aseq=103;
update t_artrel set sortseq=3 WHERE cseq=134 and aseq=103;
update t_artrel set sortseq=4 WHERE cseq=165 and aseq=103;
update t_artrel set sortseq=1 WHERE cseq=374 and aseq=104;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=104;
update t_artrel set sortseq=1 WHERE cseq=374 and aseq=105;
update t_artrel set sortseq=1 WHERE cseq=374 and aseq=106;
update t_artrel set sortseq=1 WHERE cseq=164 and aseq=106;
update t_artrel set sortseq=2 WHERE cseq=181 and aseq=106;
update t_artrel set sortseq=1 WHERE cseq=374 and aseq=107;
update t_artrel set sortseq=1 WHERE cseq=123 and aseq=107;
update t_artrel set sortseq=2 WHERE cseq=134 and aseq=107;
update t_artrel set sortseq=3 WHERE cseq=198 and aseq=107;
update t_artrel set sortseq=1 WHERE cseq=25 and aseq=107;
update t_artrel set sortseq=1 WHERE cseq=374 and aseq=108;
update t_artrel set sortseq=1 WHERE cseq=127 and aseq=108;

