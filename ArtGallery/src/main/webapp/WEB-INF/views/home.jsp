<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<style>
	a:hover {
		cursor: pointer;
  		text-decoration: none;
	}
	.content {
		position: relative;
	    width: 100%;
	    padding-top: 30%;
	    /* background-color: #e0e0e0; */
	}
	.bkImg {
		position: absolute;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    background-position: 50% 50%;
	    /* -webkit-background-size: cover; */
	    background-size: cover;
	}
	.title {
		position: relative;
	    width: 100%;
	    padding: 16px 4px 10px 10px;
	    text-align: left;
	}
	.today {
		display: block;
	    margin: 10px;
	    color: #fff;
	    font-size: 20px;
	    font-weight: bold;
	    text-transform: uppercase;
	}
	.todayA {
		margin: 10px;
	    color: #fff;
	    font-size: 30px;
	    font-weight: bold;
	    text-shadow: 2px 2px #000;	    
	}
	.img_preview {
		width: 100%;
		height:200px;
		
		background-origin: content-box;
		
	}
	.img_textbg {
		position: absolute;
		bottom:0;
		margin:5px;
		width: 96%;
		height:45px;
		background-color: rgba(0, 0, 0, 0.5);
		
	}
	.img_title {
		color: #fff;
		position: absolute;
		bottom:23px;
		left:10px;
		font-weight:bold;
	}
	.img_items {
		color: #fff;
		position: absolute;
		bottom:5px;
		left:10px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
	<section>
		<div class="row">			
				<a href="category/detail.do?seq=${today.seq }&code=A" class="">
					<div class="content">
						<div class="bkImg" style="background-image: url(${configDto.httpPath}${pageContext.request.contextPath }${today.imagepath })"></div>
						<div class="title">
							<span class="today">Today's Artist</span>
							<h1 class="todayA">${today.name }</h1>
						</div>
					</div>
				</a>			
		</div>
	</section>
	<br />
  	<!-- 아티스트 -->
  	<h4><i class="fas fa-kiss-wink-heart"></i> 아티스트</h4>
  	<div class="row">
  		<div class="wrapper">
  			<c:forEach var="tmpA" items="${listA }">
	  			<div class="col-md-2 col-sm-3 col-xs-6">
	  				<a href="category/detail.do?seq=${tmpA.seq }&code=A">
			  			<div class="img_preview" style="background:url(${configDto.httpPath}${pageContext.request.contextPath }${tmpA.imagepath });background-size: 100% 100%;">
			  				<div class="img_textbg ">			  				
			  				<div class="img_title">${tmpA.name }</div>
			  				<div class="img_items">항목 ${tmpA.artcount }개</div>
			  				</div>
			  				
			  			</div>
			  		</a>
	  			</div>
	  		</c:forEach>
  		</div>	
	</div><!-- //아티스트 -->
	<!-- 재료 -->
	<br />
  	<h4><i class="fas fa-paint-brush"></i> 재료</h4>
  	<div class="row">	  	
	  	<c:forEach var="tmpM" items="${listM }">
  			<div class="col-md-2 col-sm-3 col-xs-6">
  				<a href="category/detail.do?seq=${tmpM.seq }&code=M">
		  			<div class="img_preview" style="background:url(${configDto.httpPath}${pageContext.request.contextPath }${tmpM.imagepath });background-size: 100% 100%;">
		  				<div class="img_textbg ">	
		  				<div class="img_title">${tmpM.name }</div>
		  				<div class="img_items">항목 ${tmpM.artcount }개</div>
		  				</div>
		  			</div>
		  		</a>
  			</div>
  		</c:forEach>	 
	</div><!-- //재료 -->
	<!-- 화파 -->
	<br />
  	<h4><i class="fas fa-palette"></i> 화파</h4>
  	<div class="row">
  	  	<c:forEach var="tmpP" items="${listP }">
  			<div class="col-md-2 col-sm-3 col-xs-6">
  				<a href="category/detail.do?seq=${tmpP.seq }&code=P">
		  			<div class="img_preview" style="background:url(${configDto.httpPath}${pageContext.request.contextPath }${tmpP.imagepath });background-size: 100% 100%;">
		  				<div class="img_textbg ">	
		  				<div class="img_title">${tmpP.name }</div>
		  				<div class="img_items">항목 ${tmpP.artcount }개</div>
		  				</div>
		  			</div>
		  		</a>
  			</div>
  		</c:forEach>
	</div><!-- //화파 -->
</div><!-- //container -->

<br />

<jsp:include page="footer.jsp"/>
</body>
</html>