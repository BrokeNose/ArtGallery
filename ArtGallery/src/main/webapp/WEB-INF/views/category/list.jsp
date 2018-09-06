<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />

<style>	
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
	
	.thumb_title {
		position: absolute; 
		bottom:25px;
		z-index:1000;
		color:#fff;
		font-weight:bold;
		left:5px;
		text-overflow: ellipsis;
	}
	.thumb_items {
		position: absolute; 
		bottom:5px;		
		color:#fff;
		left:5px;
		z-index:1000;
	}
	.overlay {
		
    	background-color: black;
    	position: absolute;
    	left: 0; top: 0; height: 100%; width: 100%;
		
	}
	body{padding-top: 70px;}
	

</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	<c:choose>
		<c:when test="${SonCategoryType eq 'A' }">
			<h4><i class="fas fa-kiss-wink-heart"></i> 아티스트</h4>
		</c:when>
		<c:when test="${SonCategoryType eq 'M' }">
			<h4><i class="fas fa-kiss-wink-heart"></i> 재료</h4>
		</c:when>
		<c:otherwise>
			<h4><i class="fas fa-kiss-wink-heart"></i> 화파</h4>
		</c:otherwise>
	</c:choose>
  	<div class="row">
  		<%-- <c:forEach var="dto" items="${list }">
	  		<div class="col-md-3 col-sm-6 col-xs-6" style="background-image: url('${configDto.httpPath}${pageContext.request.contextPath }${dto.imagepath }');">
		  		<a class="col-md-3 col-sm-6 col-xs-6" href="detail.do?seq=${dto.seq }&code=${dto.code }" style="background-image: url('${configDto.httpPath}${pageContext.request.contextPath }${dto.imagepath }');">
		  			<img src="${configDto.httpPath}${pageContext.request.contextPath }${dto.imagepath }" class="img-responsive" alt="Responsive image"/>
		  			<p>${dto.name }</p>
		  			<strong>${dto.artcount }</strong>
		  		</a>
		  	</div>
  		</c:forEach> --%>
  		<c:forEach var="dto" items="${list }">
			<div class="TT thumbnail-wrapper col-md-2 col-sm-3 col-xs-6"  title="${dto.name }">
				
				<div class="thumbnail">				
					<div class="centered">						
						<a href="detail.do?seq=${dto.seq }">													
							<div class="thumb_title">${dto.name }</div>
							<div class="thumb_items">항목 ${dto.artcount }개</div>	
							<div class="overlay"><img src="${configDto.httpPath}${pageContext.request.contextPath }${dto.imagepath }" /></div>						
						</a>						
					</div>
				</div>
			</div>
		</c:forEach>
	</div><!-- //아티스트 -->

</div>


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
