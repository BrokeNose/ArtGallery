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
<jsp:include page="../header.jsp"/>
<div class="container">
	<br><br><br>
	<div class="text-center center-block" style="width:30%;">
	    <form class="form-signin">
	      <font size="30"><i class="fas fa-university"></i></font>
	      
	      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
	      <label for="inputEmail" class="sr-only">Email address</label>
	      <input type="email" id="inputEmail" class="form-control" placeholder="id" required autofocus>
	      <label for="inputPassword" class="sr-only">Password</label>
	      <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
	      <div class="checkbox mb-3">
	        <label>
	          <input type="checkbox" value="remember-me"> Remember me
	        </label>
	      </div>
	      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
	      
	    </form>
	</div><!-- //text-center center-block -->





</div><!-- //container -->
<jsp:include page="../footer.jsp"/>
</body>
</html>
