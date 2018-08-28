<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
	<div class="row">
		<img src="${pageContext.request.contextPath }/resources/images/rem.jpg" class="img-responsive img-detail" alt="Responsive image"/>
	</div>
	<div class="text-center">
		<h2>대제목아티스트이름, 재료종류, 화파종류, 작품이름 </h2>
		<h3>소제목</h3>
		<h4>세부데이터</h4>
		<p>상세설명Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
		Doloribus obcaecati at quod 
		doloremque molestiae vero asperiores necessitatibus aut enim quis. 
		Ut distinctio accusantium vitae dicta 
		quos et perspiciatis minus excepturi.</p>	
	</div>
	<br />
	<h4><i class="fas fa-kiss-wink-heart"></i> 작가의 다른 작품</h4>
  	<div class="row">	  	
  		<c:forEach var="tmp" items="${list }">
	  		<div class="col-md-3 col-sm-6 col-xs-6">
		  		<a href="detail.jsp?seq=${tmp.aseq }"><img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${tmp.imagepath }" class="img-responsive" alt="Responsive image"/></a>
		  	</div>
  		</c:forEach>
	  	
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


<br />
</div><!-- //container -->
<jsp:include page="footer.jsp"/>
</body>
</html>
