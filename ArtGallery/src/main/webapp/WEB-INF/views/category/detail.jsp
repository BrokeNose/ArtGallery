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
	
	.thumbnail-wrappper { 
		width: 25%; 
	} 
	.thumbnail { 
		position: relative;
		padding-top: 100%;
		  /* 1:1 ratio */ 
		  overflow: hidden; 
		border:0;
		border-radius: 0;
	} 
	.thumbnail .centered {
	 	position: absolute; 
	 	top: 0; 
	 	left: 0; 
	 	right: 0; 
	 	bottom: 0; 
	 	
	 } 
	.thumbnail .centered img { 
		position: absolute; 
		top: 0; 
		left: 0; 
		max-width: 100%; 
		max-height:100%;
		height:100%;
		width:100%;
		 
	}
	.img-thumb {
		width:100%;
		max-height: 250px; 
	}
	.thumb_title1 {
		position: absolute; 
		bottom:5px;
		z-index:10000;
		color:#fff;
		font-weight:bold;
		left:5px;
	}
	.thumb_title2 {
		position: absolute; 
		bottom:25px;
		z-index:10000;
		color:#fff;
		font-weight:bold;
		left:5px;
	}
	.thumb_items {
		position: absolute; 
		bottom:5px;
		z-index:2000;
		color:#fff;
		left:5px;
	}
	.div_center {
		margin: auto;
	    width: 70%;
	    padding: 10px;
	}		
		/* .wrapper{
			width: 100%;
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
		} */
/* ----------------여기까지 son 시험용------------------ */

	
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="row">
	<img src="http://192.168.0.200:8888/artgallery/${dto.imagepath }" class="img-detail" alt="Responsive image"/>
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
		
		<div class="div_center">${dto.remark }</div>
		
	</div>
	<br />
	
	<h4><i class="fas fa-kiss-wink-heart"></i> 작가의 다른 작품</h4>
  	<div class="row">  		
  		<%-- <c:forEach var="dto" items="${artlist  }">
	  		<div class="col-md-3 col-sm-6 col-xs-6 row-eq-height">
		  		<a href="../art/detail.do?cseq=${dto.cseq }&seq=${dto.seq }">
		  			<img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${dto.imagepath }" class="img-responsive" alt="Responsive image"/>
		  			<img src="<c:out value="${pageContext.request.contextPath }/${dto.imagepath }"/>" class="img-responsive" alt="Responsive image"/>
		  			<p>${dto.name }</p>
		  			<strong>${dto.artcount }</strong>
		  		</a>
		  	</div>
  		</c:forEach> --%>
  		<c:forEach var="dto" items="${artlist }">
			<div class="thumbnail-wrapper col-md-2 col-sm-3 col-xs-6">				
				<div class="thumbnail">
					<div class="centered">
						<a href="../art/detail.do?cseq=${dto.cseq }&seq=${dto.seq }" title="${dto.title }">
							<div class="thumb_title1">${dto.title }</div>
							<img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${dto.imagepath }" class="img-responsive img-thumb"/>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>	
	</div><!-- //작가의 다른작품 -->
  	<c:if test="${not empty ARellist }">
		<c:forEach var="Adto" items="${ARellist }">
			<h4><i class="fas fa-kiss-wink-heart"></i> 아티스트</h4>
		  	<div class="row">
		  		<div class="wrapper">
					<div class="thumbnail-wrapper col-md-2 col-sm-3 col-xs-6">
						<div class="thumbnail">
							<div class="centered">
								<a href="category/detail.do?seq=${Adto.seq }" title="${Adto.name }">
									<div class="thumb_title2">${Adto.name }</div>
				  					<div class="thumb_items">항목 ${Adto.artcount }개</div>
									<img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${Adto.imagepath }" class="img-responsive img-thumb">	
								</a>
							</div>
						</div>
					</div>
				</div>	
			</div><!-- //아티스트 -->
		</c:forEach>
	</c:if>
  	<c:if test="${not empty MRellist }">
		<h4><i class="fas fa-paint-brush"></i> 재료</h4>
	  	<div class="row">
	  		<c:forEach var="Mdto" items="${MRellist }">
				<div class="thumbnail-wrapper col-md-2 col-sm-3 col-xs-6">
					<div class="thumbnail">
						<div class="centered">
							<a href="category/detail.do?seq=${Mdto.seq }" title="${Mdto.name }">
								<img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${Mdto.imagepath }" class="img-responsive img-thumb"/>
								<div class="thumb_title2">${Mdto.name }</div>
								<div class="thumb_items">항목 ${Mdto.artcount }개</div>		  					
							</a>
						</div>
					</div>
					
				</div>
			</c:forEach>	 
		</div><!-- //재료 -->
	</c:if>
	<c:if test="${not empty PRellist }">
		<!-- 화파 -->
	  	<c:forEach var="Pdto" items="${PRellist }">
	  		<h4><i class="fas fa-palette"></i> 화파</h4>
	  		<div class="row">	
				<div class="thumbnail-wrapper col-md-2 col-sm-3 col-xs-6">
					<div class="thumbnail">
						<div class="centered">					
							<a href="category/detail.do?seq=${Pdto.seq }" title="${Pdto.name }">
								<img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${Pdto.imagepath }" class="img-responsive img-thumb">
								<div class="thumb_title2">${Pdto.name }</div>
			  					<div class="thumb_items">항목 ${Pdto.artcount }개</div>
							</a>
						</div>
					</div>
					
				</div>
			</div><!-- //화파 -->
		</c:forEach>
	</c:if>
	

</div><!-- //container -->
<br />

<jsp:include page="../footer.jsp"/>
<!-- ----------------여기서부터 Son 시험용 ----------------------------------- -->
	<%-- <button id="moveBtn">&laquo;</button>
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
	</script> --%>


</body>
</html>
