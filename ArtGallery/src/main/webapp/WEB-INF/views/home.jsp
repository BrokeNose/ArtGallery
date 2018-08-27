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
<a href="${pageContext.request.contextPath }/admin">Admin</a>
<div class="container">
	<div class="row">
   		<div class="jumbotron">   			
  			<h1>Today's Artist</h1>
  			<div style="background-image='url:'"></div>
 			<p><a class="btn btn-primary btn-lg" href="#" role="button">view more</a></p>
		</div>
  	</div>
  	<!-- 아티스트 -->
  	<h4><i class="fas fa-kiss-wink-heart"></i> 아티스트</h4>
  	<div class="row">
  		<%-- 
  		<c:forEach var="tmp" items="${list }">
  			<div class="col-md-3 col-sm-6 col-xs-6">
  				<a href="detail.do?seq=${tmp.seq }">
		  			
		  			<img src="http://192.168.0.200:8888/artgallery/${dto.imagepath }" class="img-responsive" alt="Responsive image"/>
		  			
		  			<img src="<c:out value="${pageContext.request.contextPath }/${tmp.imagepath }"/>" class="img-responsive" alt="Responsive image"/>
		  			<p>${tmp.name }</p>
		  			<strong>${tmp.artcount }</strong>
		  		</a>
  			</div>
  		</c:forEach>
  		 --%>
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