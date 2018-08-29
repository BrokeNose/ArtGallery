<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<style type="text/css">
	.arrow_left {
		padding-top:250px;
		display: inline-block;
		float:left;
		width:30px;			
		
	}
	.arrow_right {
		padding-top:250px;
		display: inline-block;
		float:right;
		width:30px;
	}	
	.img_center{	
      max-width:70%;
      max-height:500px;
      text-align:center;
   	}
	.info
	{   display: block;
	    padding: 9.5px;
	    margin: 0 0 10px;
	    font-size: 15px;
	    line-height: 1.42857143;
	    color: #333;
	    word-break: break-all;
	    word-wrap: break-word;
	    border-radius: 4px;
	}
	.bigImage{
		position: absolute;
		top:60px;
		left:0;
		right:0;
		bottom:0;
		background-color: #fff;
		display: none;			
		z-index: 10;
	}
	.zoom{		
		position: relative;
		left:200px;
		top:-20px;
		
	}	
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	<input type="hidden" id="seq" value="${dto.seq }"/>
	<div class="row">
		<div class="arrow_left">
			<a href="javascript: goDetail(${dto.prevNum });">
				<span style="font-size:30px;"><i class="fas fa-arrow-circle-left"></i></span></a></div>
		<div class="arrow_right">
			<a href="javascript: goDetail(${dto.nextNum });">
			<span style="font-size:30px;"><i class="fas fa-arrow-circle-right"></i></span></a></div>
		<div class="text-center">
			<img class="img_center" src="http://${configDto.ip}:8888${pageContext.request.contextPath }${dto.imagepath }"/>
			<div class="zoom"><span style="font-size:30px;"><i class="fas fa-search-plus"></i></span></div>	
			
		</div>			
	</div>
	<div class="text-left">
		<h2>${dto.title }</h2>
		<h4><c:forEach var="tmp" items="${aList }">
			<b>${tmp.name }</b>
			<c:set var="cyear" value="${tmp.bdate }/${tmp.ddate }"/> 
		</c:forEach>
		<c:choose>
			<c:when test="${!empty dto.createyear }">
				${dto.createyear }
			</c:when>
			<c:otherwise>
				${cyear}
			</c:otherwise>
		</c:choose></h4>
		
		<a href="javascript:goFavorArt(${dto.seq });">
			<span style="font-size:1.3em;color: #333;">
		<c:choose>
			<c:when test="${isFavorArt eq 'Y' }">
				<i id="iFavor" class="fas fa-heart"></i></span></a>	
			</c:when>
			<c:otherwise>
				<i id="iFavor" class="far fa-heart"></i></span></a>		
			</c:otherwise>	
		</c:choose>
		<br />
		<p class="info">
<c:if test="${not empty mList }">재료 : </c:if>		
<c:forEach var="tmp" items="${mList }">
	<a href="${pageContext.request.contextPath }/category/detail.do?code=M&seq=${tmp.cseq}">${tmp.name }</a>
</c:forEach>
		
<c:if test="${not empty pList }"><br />화파 : </c:if>		
<c:forEach var="tmp" items="${pList }">
	<a href="${pageContext.request.contextPath }/category/detail.do?code=P&seq=${tmp.cseq}">${tmp.name }</a>
</c:forEach>
		</p>		
		<p class="info" style="white-space:pre-wrap;">${dto.remark }</p>	
	</div>	
	
<br />
</div><!-- //container -->
<!-- image zoom -->
<div class="bigImage">
	<div class="row">
		<div class="text-center">
			<img id="zoomImage" class="img_center" src="http://${configDto.ip}:8888${pageContext.request.contextPath }${dto.imagepath }" onmousewheel="Picture()" />
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"/>

<script>
	// 이미지 확대 시작 -------------------
	var count = 10;
	function Picture(){
	count = Counting(count);
	if(count==10){
		$(".bigImage").hide();	
	}
	Resize(count);
	return false;
	}
	function Counting(count){   
	    if (event.wheelDelta >= 120)
	        count++;
	    else if (event.wheelDelta <= -120)
	        count--;   
	    return count; 
	}
	function Resize(count){    
		zoomImage.style.zoom = count + '0%';    
	}
	
	$("#imgZoom").click(function(){
		zoomImage.style.zoom ='100%';
		count=10;
		$(".bigImage").show();	
	});
	$(".bigImage").click(function(){
		$(".bigImage").hide();		
	});
	
	// 이미지 확대  끝 -------------------
	
	function goDetail(seq){
		if (seq>0){
			location.href="detail.do?cseq=${param.cseq}&searchKeyword=${param.searchKeyword}&searchCondition=${param.searchCondition}&seq="+seq
		}
	}	
	
	function goFavorArt(seq){		
	<c:choose>
		<c:when test="${!empty id}">
		$.ajax({
			url:"favoriteArt.do",
			method:"post",
			data:{"seq":seq},
			success:function(data) {
				if(data.isFavor=='Y'){
					alert("관심작품에 등록했습니다.");
					$("#iFavor").removeClass("far");
					$("#iFavor").addClass("fas");
				} else {
					alert("관심작품에서 해지했습니다.");
					$("#iFavor").removeClass("fas");
					$("#iFavor").addClass("far");					
				}
			}			
		});
		</c:when>
		<c:otherwise>
			alert("관심작품에 추가하려면, 로그인해야 합니다.");
			return;
		</c:otherwise>
	</c:choose>
	}
</script>
</body>
</html>
