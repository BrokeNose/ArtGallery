<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<style type="text/css">
	.arrow_left {
		padding-top:250px;
		display: inline-block;
		float:left;
		width:30px;			
		
	}
	.arrow_right {
		padding-top:250px;
		display: inline-block;
		float:right;
		width:30px;
	}
	pre{
		border: 0px;
		background-color: #fff;
	}
</style>

</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	<div class="row">		
		<div class="col-xs-1 arrow_left"><span style="font-size:30px;"><i class="fas fa-arrow-circle-left"></i></span></div>
		<div class="col-xs-1 arrow_right"><span style="font-size:30px;"><i class="fas fa-arrow-circle-right"></i></span></div>
		<div class="col-xs-10 text-center">
			<img class="img-responsive" src="http://${configDto.ip}:8888${pageContext.request.contextPath }${dto.imagepath }"/>
		</div>			
	</div>
	<div class="text-left">
		<h2>${dto.title }</h2>
		<h4><c:forEach var="tmp" items="${aList }">
			<b>${tmp.name }</b> ${tmp.bdate }/${tmp.ddate }
		</c:forEach></h4>
		<pre>${dto.remark }</pre>	
	</div>
	<br />
	<h4><i class="fas fa-kiss-wink-heart"></i> 작가의 다른 작품</h4>
  	<div class="row">	  	
	  	<div class="col-md-3 col-sm-6 col-xs-6">
	  		<a href="detail.jsp"><img src="${pageContext.request.contextPath }/resources/images/rem.jpg" class="img-responsive" alt="Responsive image"/></a>
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


<br />
</div><!-- //container -->
<jsp:include page="../footer.jsp"/>
</body>
</html>
