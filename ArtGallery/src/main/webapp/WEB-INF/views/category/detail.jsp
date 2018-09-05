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
	.thumb_bg{
		position: absolute;
		bottom:0;
		margin:0;
		width: 100%;
		height:100%;
		background-color: rgba(0, 0, 0, 0.2);
		z-index:5000;
	}
	body{padding-top: 70px;}
		
		

	
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="row">
	<img src="${configDto.httpPath}${pageContext.request.contextPath }${dto.imagepath }" class="img-detail" alt="Responsive image"/>
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
	
	<h4><i class="fas fa-kiss-wink-heart"></i> ${dto.name }의 다른 작품</h4>
  	<div class="row">  
  		<c:forEach var="dto" items="${artlist }">
			<div class="thumbnail-wrapper col-md-2 col-sm-3 col-xs-6 TT" title="${dto.title }">				
				<div class="thumbnail">
					<div class="centered">
						<a href="../art/detail.do?cseq=${dto.cseq }&seq=${dto.seq }">
							<div class="thumb_bg">	
							<div class="thumb_title1">${dto.title }</div>
							</div>
							<img src="${configDto.httpPath}${pageContext.request.contextPath }${dto.imagepath }" class="img-responsive img-thumb"/>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>	
	</div><!-- //작가의 다른작품 -->
  	<c:if test="${not empty ARellist }">
		<h4><i class="fas fa-kiss-wink-heart"></i> 아티스트</h4>
	  	<div class="row">
			<c:forEach var="Adto" items="${ARellist }">
		  		<div class="wrapper">
					<div class="thumbnail-wrapper col-md-2 col-sm-3 col-xs-6 TT"  title="${Adto.name }">
						<div class="thumbnail">
							<div class="centered">
								<a href="detail.do?seq=${Adto.seq }">
								<div class="thumb_bg">	
									<div class="thumb_title2">${Adto.name }</div>
				  					<div class="thumb_items">항목 ${Adto.artcount }개</div>
				  				</div>
									<img src="${configDto.httpPath}${pageContext.request.contextPath }${Adto.imagepath }" class="img-responsive img-thumb">	
								</a>
							</div>
						</div>
					</div>
				</div>	
			</c:forEach>
		</div><!-- //아티스트 -->
	</c:if>
  	<c:if test="${not empty MRellist }">
		<h4><i class="fas fa-paint-brush"></i> 재료</h4>
	  	<div class="row">
	  		<c:forEach var="Mdto" items="${MRellist }">
				<div class="thumbnail-wrapper col-md-2 col-sm-3 col-xs-6 TT" title="${Mdto.name }" >
					<div class="thumbnail">
						<div class="centered">
							<a href="detail.do?seq=${Mdto.seq }">
							<div class="thumb_bg">	
								<div class="thumb_title2">${Mdto.name }</div>
								<div class="thumb_items">항목 ${Mdto.artcount }개</div>	
							</div>
							<img src="${configDto.httpPath}${pageContext.request.contextPath }${Mdto.imagepath }" class="img-responsive img-thumb"/>
									  					
							</a>
						</div>
					</div>
					
				</div>
			</c:forEach>	 
		</div><!-- //재료 -->
	</c:if>
	<c:if test="${not empty PRellist }">
		<!-- 화파 -->
		<h4><i class="fas fa-palette"></i> 화파</h4>
		<div class="row">	
	  		<c:forEach var="Pdto" items="${PRellist }">
				<div class="thumbnail-wrapper col-md-2 col-sm-3 col-xs-6 TT" title="${Pdto.name }">
					<div class="thumbnail">
						<div class="centered">					
							<a href="detail.do?seq=${Pdto.seq }" >
							<div class="thumb_bg">	
								<div class="thumb_title2">${Pdto.name }</div>
			  					<div class="thumb_items">항목 ${Pdto.artcount }개</div>
			  				</div>
							<img src="${configDto.httpPath}${pageContext.request.contextPath }${Pdto.imagepath }" class="img-responsive img-thumb">
								
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div><!-- //화파 -->
	</c:if>
</div><!-- //container -->
<br />
<script>
$(function(){
	$(".TT").tooltip({
		trigger:"hover",
		placement:"top"
	});
}); 
</script>
<jsp:include page="../footer.jsp"/>
</body>
</html>
