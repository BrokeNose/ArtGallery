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
  		<c:forEach var="dto" items="${list }">
	  		<div class="col-md-3 col-sm-6 col-xs-6">
		  		<a href="detail.do?seq=${dto.seq }">
		  			<c:url value="C:\ncs2018\Spring_work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ArtGallery\\${dto.imagepath }" var="imageURL"/>
		  			<img src="<c:out value="${imageURL }"/>" class="img-responsive" alt="Responsive image"/>
		  			<p>${dto.name }</p>
		  			<strong>${dto.artcount }</strong>
		  		</a>
		  	</div>
		  	<%-- <div class="col-md-3 col-sm-6 col-xs-6">
		  		<img src="${pageContext.request.contextPath }/resources/images/rem.jpg" class="img-responsive" alt="Responsive image"/>
		  	</div>
		  	<div class="col-md-3 col-sm-6 col-xs-6">
		  		<img src="${pageContext.request.contextPath }/resources/images/rem.jpg" class="img-responsive" alt="Responsive image"/>
		  	</div>
		  	<div class="col-md-3 col-sm-6 col-xs-6">
		  		<img src="C:\ncs2018\Spring_work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ArtGallery\${dto.imagepath }" class="img-responsive" alt="Responsive image"/>
		  	</div> --%>
  		</c:forEach>
	  	
	  	
	</div><!-- //아티스트 -->

</div>


<jsp:include page="footer.jsp"/>
</body>
</html>
