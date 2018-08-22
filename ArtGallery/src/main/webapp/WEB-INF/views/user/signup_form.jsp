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
	  	<form action="signup.do" method="post" class="form-horizontal" id="signupForm">
		  	 <div class="form-group">
			    <label for="id" class="col-sm-2 control-label">아이디</label>
			    <div class="col-sm-9">
			      <input type="text" class="form-control" name="id" id="id" placeholder="Id">
			      <span id="checkResult"></span>
			    </div>
			  </div>
		  <div class="form-group">
		    <label for="email" class="col-sm-2 control-label">이메일</label>
		    <div class="col-sm-9">
		      <input type="email" class="form-control" name="email" id="email" placeholder="Email">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword1" class="col-sm-2 control-label">비밀번호</label>
		    <div class="col-sm-9">
		      <input type="password" class="form-control" name="pwd" id="inputPassword1" placeholder="Password">
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
<script>
	//폼의 유효성 여부
	var formValid=false;
	$("#signupForm").submit(function(){
		//만일 폼의 유효성 여부가 false 이면 
		if(formValid==false){
			return false;//폼 전송 막기
		}
	});
	//아이디 입력란에 입력했을때 실행할 함수 등록 
	$("#id").on("input", function() {
		//입력한 아이디를 읽어와서
		var inputId=$(this).val();
		//ajax 요청을 이용해서 서버에 보낸다.
		$.ajax({
			url:"checkid.do",
			method:"post",
			data:{"inputId":inputId},
			success:function(responseData) {
				if(responseData.canUse) {
					formValid=true;
					$("#checkResult")
					.text("사용가능")
					.css("color","#00ff00");
				} else {
					formValid=false;
					$("#checkResult")
					.text("사용불가")
					.css("color","#ff0000");
				}
			}
		});
	});
</script>
</body>
</html>
