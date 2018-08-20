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
<jsp:include page="header.jsp"/>
<div class="container">

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
	  	
	</div><!-- //아티스트 -->

</div>



<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"  ></script>

</body>
</html>
