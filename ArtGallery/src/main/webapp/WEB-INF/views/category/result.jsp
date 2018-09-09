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
	<c:if test="${not empty searchKeyword }">
		<h4><strong>${searchKeyword }</strong> 검색 내용 입니다.</h4>
	</c:if>
	<br />
	<c:if test="${empty list }">
		<h3>검색 결과가 없습니다.</h3>
	</c:if>
	
	<c:if test="${not empty cateDto && not empty artResult}">
	
			<div class="thumbnail-wrapper col-md-6 col-sm-6 col-xs-12">
				<h3>${cateDto.name }</h3>
				<p>${cateDto.remark }</p>
				<%-- <p>${cateDto.seq }</p>
				<p>${cateDto.code }</p>
				<p>${cateDto.codename }</p>
				<p>${cateDto.imagepath }</p>
				<p>${cateDto.artcount }</p> --%>
			</div>
			<div class="thumbnail-wrapper col-md-6 col-sm-6 col-xs-12">
				<c:forEach var="tmp" items="${artResult }">
					<div class="thumnail-wrapper col-md-4 col-sm-4 col-xs-4">
						<div class="thumbnail">				
							<div class="centered">		
								<a href="detail.do?seq=${cateDto.seq }">													
									<div class="thumb_title TT" title="${tmp.title }">${tmp.title }</div>
									<div class="overlay"><img src="${configDto.httpPath}${pageContext.request.contextPath }${tmp.imagepath }" /></div>						
								</a>	
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
	<hr />	
	</c:if>
	

  	<c:if test="${not empty list }">
  		<h3><strong>${searchKeyword }</strong> 키워드의 관련 작품들 입니다.</h3>
  	</c:if>
	<c:forEach var="dto" items="${list }">
	<div class="thumbnail-wrapper col-md-2 col-sm-3 col-xs-6">
		<div class="thumbnail">
			<div class="centered">
				<a href="${pageContext.request.contextPath }/art/detail.do?cseq=${dto.cseq}&seq=${dto.seq }" title="${dto.title }">
					<img src="${configDto.httpPath}${pageContext.request.contextPath }${dto.imagepath }">					
				</a>
			</div>
		</div>
	</div>
	<%-- <p>title: ${dto.title }</p>
	<p>seq: ${dto.seq }</p>
	<p>createyear: ${dto.createyear}</p>
	<p>artsize: ${dto.artsize }</p>
	<p>imagepath: ${dto.imagepath }</p>
	<p>viewcount ${dto.viewcount}</p>
	<p>regdate ${dto.regdate }</p>
	<p>artist ${dto.artist }</p>
	<p>painter ${dto.painter }</p>
	<p>material: ${dto.material }</p>
	
	<p>code: ${dto.code }</p> --%>
	<%-- <p>cseq: ${dto.cseq }</p> --%>
	</c:forEach>
	
	

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