<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
</head>
<body>
<c:choose>
	<c:when test="${isSigninSuccess }">
		<div class="text-center "><br /><br /><br /><br /><br /><br />
		<span style="font-size:30px;"><i class="fas fa-smile-wink"></i></span>
		<br /><p><strong>${id }</strong>님 반갑습니다.</p><br /><br />
		<a href="${url }" class="btn btn-default btn-lg" role="button">ArtGallery 이용하기</a>
		</div>
	</c:when>
	<c:otherwise>
		<div class="text-center "><br /><br /><br /><br /><br /><br />
		<span style="font-size:30px;"><i class="fas fa-grin-beam-sweat"></i></span>
		<br /><p>${msg }</p><br /><br />
		<a href="signin_form.do?url=${url }" class="btn btn-default btn-lg" role="button">확인</a>
		</div>
	</c:otherwise>
</c:choose>
</body>
</html>