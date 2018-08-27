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
</head>
<body>
<jsp:include page="header.jsp"/>
<h3>인덱스 페이지 입니다.</h3>
<a href="admin/adminCategory.do?categorytype=A">아티스트</a>
<br />
<a href="user/list.do?soncategorytype=A">메인에서 아티스트</a>
<a href="user/list.do?soncategorytype=M">메인에서 재료</a>
<a href="user/list.do?soncategorytype=P">메인에서 화파</a>
<a href="${pageContext.request.contextPath }/admin">Admin</a>
<div class="container">
	<div class="row">
   		<div class="jumbotron">   			
  			<h1>Today's Artist</h1>
  			<div style="backgrount-image=''"></div>
 			<p><a class="btn btn-primary btn-lg" href="user/list.do?soncategorytype=A" role="button">view more</a></p>
		</div>
  	</div>
  	<!-- 아티스트 -->
  	<h4><i class="fas fa-kiss-wink-heart"></i> 아티스트</h4>
  	<div class="row">  	
	  	<div class="col-md-3 col-sm-6 col-xs-6">
	  		<img src="${pageContext.request.contextPath }/resources/images/rem.jpg" class="img-responsive" alt="Responsive image"/>
	  	</div>
	  	<div class="col-md-3 col-sm-6 col-xs-6">
	  		<img src="${pageContext.request.contextPath }/resources/images/rem.jpg" class="img-responsive" alt="Responsive image"/>
	  	</div>
	  	<div class="col-md-3 col-sm-6 col-xs-6">
	  		<img src="${pageContext.request.contextPath }/resources/images/rem.jpg" class="img-responsive" alt="Responsive image"/>
	  	</div>
	  	<div class="col-md-3 col-sm-6 col-xs-6">
	  		<img src="${pageContext.request.contextPath }/resources/images/rem.jpg" class="img-responsive" alt="Responsive image"/>
	  	</div>
	  	<div class="col-md-3 col-sm-6 col-xs-6">
	  		<img src="${pageContext.request.contextPath }/resources/images/rem.jpg" class="img-responsive" alt="Responsive image"/>
	  	</div>
	  	
	</div><!-- //아티스트 -->
	<!-- 재료 -->
  	<h4><i class="fas fa-paint-brush"></i> 재료</h4>
  	<div class="row">	  	
	  	<div class="col-md-3 col-sm-6 col-xs-6">
	  	
	  	
	  	</div>	 
	</div><!-- //재료 -->
	<!-- 화파 -->
  	<h4><i class="fas fa-palette"></i> 화파</h4>
  	<div class="row">	  	
	  	<div class="col-md-3 col-sm-6 col-xs-6">
	  	
	  	
	  	
	  	</div>
	  	
	</div><!-- //화파 -->
 
</div><!-- //container -->



<jsp:include page="footer.jsp"/>
</body>
</html>