<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
	<h4><i class="fas fa-user-tie"></i> 회원정보</h4>
	<div class="panel panel-default">
	  <div class="panel-body">
	  	<form action="update.do" method="post" class="form-horizontal">
		  	 <div class="form-group">
			    <label for="id" class="col-sm-2 control-label">아이디</label>
			    <div class="col-sm-9">
			      <input type="hidden" name="id" value="${id }"/>
			      <input type="text" class="form-control" id="id" disabled value="${id }"/>
			    </div>
			  </div>
		  <div class="form-group">
		    <label for="email" class="col-sm-2 control-label">이메일</label>
		    <div class="col-sm-9">
		      <input type="email" class="form-control" name="email" id="email" value="${dto.email }"/>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-9">
		      <input type="hidden" class="form-control" name="roll" id="roll" value="${dto.roll }"/>
		    </div>
		  </div>
		  <div class="form-group">
		  	<div class="col-sm-9">
		  	  <button type="submit" class="btn btn-default">수정 확인</button>
		  	</div>
		  </div> 
		</form>
	  </div><!-- panel-body -->
	</div><!-- panel -->
	
	


</div><!-- //container -->
<jsp:include page="footer.jsp"/>
</body>
</html>