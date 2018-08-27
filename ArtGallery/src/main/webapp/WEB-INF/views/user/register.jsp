<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
	<h4><i class="fas fa-user-plus"></i> 회원가입</h4>
	<div class="panel panel-default">
	  <div class="panel-body">
	  	<form class="form-horizontal">
		  	 <div class="form-group">
			    <label for="id" class="col-sm-2 control-label">아이디</label>
			    <div class="col-sm-9">
			      <input type="email" class="form-control" id="id" placeholder="id">
			    </div>
			  </div>
		  <div class="form-group">
		    <label for="email" class="col-sm-2 control-label">이메일</label>
		    <div class="col-sm-9">
		      <input type="email" class="form-control" id="email" placeholder="Email">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword1" class="col-sm-2 control-label">비밀번호</label>
		    <div class="col-sm-9">
		      <input type="password" class="form-control" id="inputPassword1" placeholder="Password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword2" class="col-sm-2 control-label">비밀번호 확인</label>
		    <div class="col-sm-9">
		      <input type="password" class="form-control" id="inputPassword2" placeholder="Password">
		    </div>
		  </div>
		  
		  <div class="form-group ">
		    <div class="col-sm-offset-5 col-sm-7">
		      <button type="submit" class="btn btn-primary btn-lg">회원가입</button>
		    </div>
		  </div>
		</form>
	  </div><!-- panel-body -->
	</div><!-- panel -->
	
	


</div><!-- //container -->
<jsp:include page="footer.jsp"/>
</body>
</html>
