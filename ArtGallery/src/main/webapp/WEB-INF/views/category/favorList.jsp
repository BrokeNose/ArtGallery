<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	
	<h4><i class="fas fa-heart"></i> 관심작품</h4>
		
  	<div class="row">
  		<c:forEach var="dto" items="${list }">
	  		<div class="col-md-3 col-sm-6 col-xs-6" style="background-image: url('http://${configDto.ip}:8888${pageContext.request.contextPath }/${dto.imagepath }');">
		  		<a class="col-md-3 col-sm-6 col-xs-6" href="detail.do?seq=${dto.seq }&code=${dto.code }" style="background-image: url('http://${configDto.ip}:8888${pageContext.request.contextPath }/${dto.imagepath }');">
		  			<%-- <img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${dto.imagepath }" class="img-responsive" alt="Responsive image"/> --%>
		  			<p>${dto.name }</p>
		  			<strong>${dto.artcount }</strong>
		  		</a>
		  	</div>
  		</c:forEach>
	</div><!-- //아티스트 -->

</div>


<jsp:include page="../footer.jsp"/>
</body>
</html>
