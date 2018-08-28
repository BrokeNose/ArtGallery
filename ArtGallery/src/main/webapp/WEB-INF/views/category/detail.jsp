<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<style>
	.custom_div {
		overflow:hidden;
		}
		.custom_div div {
		min-height: 100%;
		padding: 10px;
		text-align: center;
		}
		#one {
		background-color: gray;
		float:left;
		margin-right:0px;
		width:50%;
		}
		#two {
		background-color: white;
		overflow:hidden;
		margin-right: 20px;
		margin: 1px;
		width:auto;
		min-height: 50%;
		}
		#three {
		background-color: yellow;
		margin-right:auto;
		margin-left:auto;
		width: 100%;
		}
		@media screen and (max-width: 600px) {
		#one {
		    float: none;
		    margin-right:0;
		    width:auto;
		}
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="row">
<%-- 	<img src="${pageContext.request.contextPath }/resources/images/rem.jpg" class="img-responsive img-detail" alt="Responsive image"/>
 --%>	<img src="http://192.168.0.200:8888/artgallery/${dto.imagepath }" class="img-responsive img-detail" alt="Responsive image"/>
	
</div>
<div class="container">
	<div class="text-center">
		<h2>${dto.name }</h2>
		<c:choose>
			<c:when test="${empty dto.bdate }">
				<h3>-</h3>
			</c:when>
			<c:otherwise>
				<h3>${dto.bdate }~${dto.ddate }</h3>
			</c:otherwise>
		</c:choose>
		
		<p>${dto.remark }</p>	
	</div>
	<br />
	<h4><i class="fas fa-kiss-wink-heart"></i> 작가의 다른 작품</h4>
  	<div class="row">	  	
  		<div class="row">
  		<c:forEach var="dto" items="${artlist }">
	  		<div class="col-md-3 col-sm-6 col-xs-6">
		  		<a href="../art/detail.do?cseq=${dto.cseq }&seq=${dto.seq }">
		  			<img src="http://${configDto.ip}:8888${pageContext.request.contextPath }/${dto.imagepath }" class="img-responsive" alt="Responsive image"/>
		  			<%-- <img src="<c:out value="${pageContext.request.contextPath }/${dto.imagepath }"/>" class="img-responsive" alt="Responsive image"/> --%>
		  			<p>${dto.name }</p>
		  			<%-- <strong>${dto.artcount }</strong> --%>
		  		</a>
		  	</div>
  		</c:forEach>
	</div><!-- //아티스트 -->
	
	<hr />
	
<br />
</div><!-- //container -->


<jsp:include page="../footer.jsp"/>
</body>
</html>
