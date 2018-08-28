<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<style>
	.custom_div {
		overflow:hidden;
		}
		.custom_div div {
		min-height: 100%;
		padding: 10px;
		text-align: center;
		}
		#one {
		background-color: gray;
		float:left;
		margin-right:0px;
		width:50%;
		}
		#two {
		background-color: white;
		overflow:hidden;
		margin-right: 20px;
		margin: 1px;
		width:auto;
		min-height: 50%;
		}
		#three {
		background-color: yellow;
		margin-right:auto;
		margin-left:auto;
		width: 100%;
		}
		@media screen and (max-width: 600px) {
		#one {
		    float: none;
		    margin-right:0;
		    width:auto;
		}
	}
	
	/* 손대원 시험용입니다. */
	
	
		
		.wrapper{
			width: 100%;
			/* max-height: 599px; */
			height: 599px;
			border: 1px solid red;
			position: relative;
			overflow: hidden;
		}
		.wrapper img{
			width: 400px;
			float: left;
			position: absolute;
			top: 0;
		}
		
		.wrapper img:nth-child(1){
			margin-left: 0px;
		}
		.wrapper img:nth-child(2){
			margin-left: 400px;
		}
		.wrapper img:nth-child(3){
			margin-left: 800px;
		}
		.wrapper img:nth-child(4){
			margin-left: 1200px;
		}
		.wrapper img:nth-child(5){
			margin-left: 1600px;
		}
/* ----------------여기까지 son 시험용------------------ */

	
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="row">
<%-- 	<img src="${pageContext.request.contextPath }/resources/images/rem.jpg" class="img-responsive img-detail" alt="Responsive image"/>
 --%>	<img src="http://192.168.0.200:8888/artgallery/${dto.imagepath }" class="img-responsive img-detail" alt="Responsive image"/>
	
</div>
<div class="container">
	<div class="text-center">
		<h2>${dto.name }</h2>
		<c:choose>
			<c:when test="${empty dto.bdate }">
				<h3>-</h3>
			</c:when>
			<c:otherwise>
				<h3>${dto.bdate }~${dto.ddate }</h3>
			</c:otherwise>
		</c:choose>
		
		<p>${dto.remark }</p>	
	</div>
	<br />
	<h4><i class="fas fa-kiss-wink-heart"></i> 작가의 다른 작품</h4>
  	<div class="row">	  	
  		<div class="row">
  		<c:forEach var="dto" items="${artlist }">
	  		<div class="col-md-3 col-sm-6 col-xs-6">
		  		<a href="../art/detail.do?cseq=${dto.cseq }&seq=${dto.seq }">
		  			<img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${dto.imagepath }" class="img-responsive" alt="Responsive image"/>
		  			<%-- <img src="<c:out value="${pageContext.request.contextPath }/${dto.imagepath }"/>" class="img-responsive" alt="Responsive image"/> --%>
		  			<p>${dto.name }</p>
		  			<%-- <strong>${dto.artcount }</strong> --%>
		  		</a>
		  	</div>
  		</c:forEach>
	</div><!-- //아티스트 -->
	
	<hr />
	
	<h4><i class="fas fa-paint-brush"></i> 재료</h4>
  	<div class="row">	  	
	  	<c:forEach var="tmpM" items="${listM }">
  			<div class="col-md-3 col-sm-6 col-xs-6">
  				<a href="detail.do?seq=${tmpM.seq }">
		  			
		  			<img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${tmpM.imagepath }" class="img-responsive" alt="Responsive image"/>
		  			<%-- 
		  			<img src="<c:out value="${pageContext.request.contextPath }/${tmp.imagepath }"/>" class="img-responsive" alt="Responsive image"/>
		  			 --%>
		  			<p>${tmpM.name }</p>
			  		<p>${tmpM.artcount }</p>
		  		</a>
  			</div>
  		</c:forEach>	 
	</div><!-- //재료 -->
	<!-- 화파 -->
  	<h4><i class="fas fa-palette"></i> 화파</h4>
  	<div class="row">	  	
	  	<c:forEach var="tmpP" items="${listP }">
  			<div class="col-md-3 col-sm-6 col-xs-6">
  				<a href="detail.do?seq=${tmpP.seq }">
		  			
		  			<img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${tmpP.imagepath }" class="img-responsive" alt="Responsive image"/>
		  			<%-- 
		  			<img src="<c:out value="${pageContext.request.contextPath }/${tmp.imagepath }"/>" class="img-responsive" alt="Responsive image"/>
		  			 --%>
		  			<p>${tmpP.name }</p>
			  		<p>${tmpP.artcount }</p>
		  		</a>
  			</div>
  		</c:forEach>
	</div><!-- //화파 -->
	
<br />
</div><!-- //container -->


<!-- ----------------여기서부터 Son 시험용 ----------------------------------- -->
	<button id="moveBtn">&laquo;</button>
	<button id="nextBtn">&raquo;</button>
	<div class="wrapper">
		<c:forEach var="dto" items="${artlist }">
			<img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${dto.imagepath }" class="img-responsive" alt="Responsive image"/>
		</c:forEach>
		
	</div>
	<script>
		
		//현재 보여주고 있는 이미지의 인덱스
		var currentIndex=0;

		$("#moveBtn").click(function(){

			//만일 지금이 마지막 인덱스라면
			if (currentIndex==0) {
				alert("처음 사진  입니다.");
				return; // 함수 종료
			};
			//인덱스 증가 시키기
			currentIndex--;

			$("img").animate({
				left:"+=400px"
			});
		});

		$("#nextBtn").click(function(){

			//만일 지금이 마지막 인덱스라면
			if (currentIndex==4) {
				alert("끝 입니다.");
				return; // 함수 종료
			};
			//인덱스 증가 시키기
			currentIndex++;

			$("img").animate({
				left:"-=400px"
			});
		});
	</script>

<jsp:include page="../footer.jsp"/>
</body>
</html>
