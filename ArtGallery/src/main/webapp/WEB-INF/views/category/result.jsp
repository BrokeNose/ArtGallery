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
	.thumb_title1 {
		position: absolute; 
		bottom:5px;
		z-index:10000;
		color:#fff;
		font-weight:bold;
		left:5px;
		overflow: hidden; 
	 	text-overflow: ellipsis;
	 	white-space: nowrap; 
	 	width: 100%;
	}
	
	.thumb_items {
		position: absolute; 
		bottom:5px;
		z-index:2000;
		color:#fff;
		left:5px;
	}

</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	<c:if test="">
		<h4><i class="fas fa-heart"></i> 검색 내용 입니다.</h4>
	</c:if>
	
		
  	
	<c:forEach var="dto" items="${list }">
	<div class="thumbnail-wrapper col-md-2 col-sm-3 col-xs-6">
		<div class="thumbnail">
			<div class="centered">
				<a href="detail.do" title="${dto.title }">
					<div class="thumb_title1">${dto.title }</div>
					<div class="thumb_items"> ${dto.title }</div>
					<div class="thumb_items"> ${dto.seq }</div>
					<div class="thumb_items"> ${dto.createyear}</div>
					<div class="thumb_items"> ${dto.artsize }</div>
					<div class="thumb_items"> ${dto.imagepath }</div>
					<div class="thumb_items"> ${dto.viewcount}</div>
					<div class="thumb_items"> ${dto.regdate }</div>
					<div class="thumb_items"> ${dto.artist }</div>
					<div class="thumb_items"> ${dto.painter }</div>
					<div class="thumb_items"> ${dto.material }</div>
					<div class="thumb_items"> ${dto.cseq }</div>
					<div class="thumb_items"> ${dto.code }</div>
					<img src="${configDto.httpPath}${pageContext.request.contextPath }${dto.imagepath }">					
				</a>
			</div>
		</div>
	</div>
	</c:forEach>

</div>


<jsp:include page="../footer.jsp"/>
</body>
</html>