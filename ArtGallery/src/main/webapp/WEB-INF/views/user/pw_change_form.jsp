<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<title>비밀번호 변경</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<h3>비밀번호 변경 페이지입니다.</h3>
<div class="container">
	<div class="text-center center-block" style="width:30%;">
		<form action="pw_change.do" method="post" class="form-signin" id="pwdForm">
			<h1 class="h3 mb-3 font-weight-normal">Change password</h1>
			<label for="currentPwd">기존 비밀번호</label>
			<input type="password" name="currentPwd" id="currentPwd" class="form-control" placeholder="Password" required/>
			<span id="currentCheck"></span>
			<br />
			<label for="pwd">새 비밀번호</label>
			<input type="password" name="pwd" id="pwd" class="form-control" placeholder="Password" required/>
			<br />
			<label for="pwd2">새 비밀번호 확인</label>
			<input type="password" name="pwd2" id="pwd2" class="form-control" placeholder="Password" required/>
			<span id="pwdCheck"></span>
			<br />
			<button class="btn btn-lg btn-primary btn-block" type="submit">Confirm</button>
			<button class="btn btn-lg btn-primary btn-block" type="reset">Cancel</button>
		</form>
	</div>
</div>
<jsp:include page="../footer.jsp"/>
<script>
	var isCurrentPwdValid=false;
	var isNewPwdValid=false;
	//기존 비밀번호 입력란의 포커스가 사라지면 실행할 함수 등록
	$("#currentPwd").on("blur", function(){
		var inputPwd=$(this).val();
		$.ajax({
			url: "pw_check.do", 
			method: "post", 
			data: {inputPwd:inputPwd}, 
			success: function(responseData) {
				if(responseData.isValid) {
					$("#currentCheck").text("일치").css("color", "green");
					isCurrentPwdValid=true;
				} else {
					$("#currentCheck").text("불일치").css("color", "red");
					isCurrentPwdValid=false;
				}
			}
		});
	});
	$("#pwd2").on("input", function(){
		//입력한 비밀번호를 읽어와서 
		var pwd1=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		if(pwd1==pwd2) {
			$("#pwdCheck").text("");
			isNewPwdValid=true;
		} else {
			$("#pwdCheck").text("위와 같게 입력해주세요.").css("color", "red");
			isNewPwdValid=false;
		}
	});
	$("#pwdForm").on("submit", function() {
		if(!isCurrentPwdValid||!isNewPwdValid) {
			return false;
		}
	});
</script>
</body>
</html>