<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<style>
	.form-control-feedback, .help-block {
		display: none;
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	<h4><i class="fas fa-user-plus"></i> 회원가입</h4>
	<div class="panel panel-default">
	  <div class="panel-body">
	  	<form action="javascript:signUp()" method="post" class="form-horizontal" id="signupForm">
		  	 <div class="form-group">
			    <label for="id" class="col-sm-2 control-label">아이디</label>
			    <div class="col-sm-9">
			      <input type="text" class="form-control" name="id" id="id" placeholder="Id"/>
				  <span class="glyphicon glyphicon-remove form-control-feedback"></span>
				  <span class="glyphicon glyphicon-ok form-control-feedback"></span>
				  <p id="idCheckResult" class="help-block"></p>
			    </div>
			  </div>
		  <div class="form-group">
		    <label for="email" class="col-sm-2 control-label">이메일</label>
		    <div class="col-sm-9">
		      <input type="email" class="form-control" name="email" id="email" placeholder="Email"/>
		      <span class="glyphicon glyphicon-remove form-control-feedback"></span>
			  <span class="glyphicon glyphicon-ok form-control-feedback"></span>
			  <p class="help-block">이메일 형식에 맞게 입력하세요.</p>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword1" class="col-sm-2 control-label">비밀번호</label>
		    <div class="col-sm-9">
		      <input type="password" class="form-control" name="pwd" id="inputPassword1" placeholder="Password"/>
		      <span class="glyphicon glyphicon-remove form-control-feedback"></span>
			  <span class="glyphicon glyphicon-ok form-control-feedback"></span>
			  <p id="pwdError" class="help-block">아래의 비밀번호와 일치하지 않습니다.</p>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword2" class="col-sm-2 control-label">비밀번호 확인</label>
		    <div class="col-sm-9">
		      <input type="password" class="form-control" id="inputPassword2" placeholder="Password"/>
		      <span class="glyphicon glyphicon-remove form-control-feedback"></span>
			  <span class="glyphicon glyphicon-ok form-control-feedback"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-9">
		      <input type="hidden" class="form-control" name="roll" id="roll" value="U"/>
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
<jsp:include page="../footer.jsp"/>
<script>
	//폼의 유효성 여부
	var formValid=false;
	var idValid=false;
	var pwdValid=false;
	var emailValid=false;
	$("#signupForm").submit(function(){
		//만일 폼의 유효성 여부가 false 이면 
		if(formValid==false){
			return false;//폼 전송 막기
		}
	});
	//특수문자를 허용하지 않는 정규 표현식
	var idReg1=/^[a-zA-Z0-9]*$/;
	//영문자로 시작 해야되는 정규 표현식
	var idReg2=/^[a-zA-z]/;
	//최소 5글자 최대 10글자를 검증할 정규 표현식
	var idReg3=/^.{4,11}$/;
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
					var result1=idReg1.test(inputId);
					var result2=idReg2.test(inputId);
					var result3=idReg3.test(inputId);
					if(result1==false) {
						idValid=false;
						$("#idCheckResult").text("특수문자는 허용하지 않습니다.").show();
					} else if(result2==false) {
						idValid=false;
						$("#idCheckResult").text("영문자로 시작하세요.").show();
					} else if(result3==false) {
						idValid=false;
						$("#idCheckResult").text("최소 4글자 최대 11글자 이내로 입력하세요.").show();
					} else {
						idValid=true;
						$("#idCheckResult").text("사용가능한 아이디입니다.").show();
					}
					setValid($("#id"), idValid);
				} else {
					idValid=false;
					$("#idCheckResult")
					.text("존재하는 아이디입니다.")
					.show();
					setValid($("#id"), idValid);
				}
			}
		});
	});
	//이메일 유효성 검사
	var emailReg=/^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+\%]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,}){1,2}$/;
	$("#email").on("input", function(){
		//입력한 이메일 주소를 읽어와서
		var inputEmail=$(this).val();
		//이메일 정규 표현식 통과 여부
		var result=emailReg.test(inputEmail);
		if(result) {
			emailValid=true;
			$(this).parent().find(".help-block").hide();
		} else {
			emailValid=false;
			$(this).parent().find(".help-block").show();
		}
		setValid($(this), emailValid);
	});
	//비밀번호 동일 체크
	$("#inputPassword1, #inputPassword2").on("input", function(){
		//입력한 비밀번호를 양쪽 모두 읽어온다.
		var inputPwd1=$("#inputPassword1").val();
		var inputPwd2=$("#inputPassword2").val();
		//비밀번호를 같게 입력했는지 여부
		var isEqual=inputPwd1==inputPwd2;
		$("#pwdError").hide();
		//일단 true 로 해놓고
		isPwdValid=true;
		if(isEqual){
			pwdValid=true;
		} else {
			$("#pwdError").show();
			pwdValid=false;
		}
		setValid($("#inputPassword1"), pwdValid);
	});
	//색상과 아이콘을 바꾸는 함수
	function setValid($input, isValid){
		//일단 .has-success 와 .has-error 를 제거 한후 
		$input.parent().removeClass("has-success has-error");
		//일단 feedback 아이콘을 모두 안보이게 한후 
		$input.parent().find(".form-control-feedback").hide();
		if(isValid){//아이디를 제대로 입력한 경우 
			$input
			.parent()
			.addClass("has-success")
			.find(".glyphicon-ok")
			.show();
		}else{//정규 표현식을 어느 하나라도 통과 하지 못한 경우 
			$input
			.parent()
			.addClass("has-error")
			.find(".glyphicon-remove")
			.show();
		}
		//가입 버튼 상태 변화 시키기
		allValid();
	};
	function allValid() {
		if(idValid&&emailValid&&pwdValid) {
			formValid=true;
			$("button[type=submit]").attr("disabled", false);
		} else {
			formVlaid=false;
			$("button[type=submit]").attr("disabled", true);
		}
	};
	//회원가입 요청시 실행할 함수
	function signUp() {
		var param=$("#signupForm").serialize();
		$.ajax({
			url:"signup.do", 
			method:"post", 
			data:param, 
			success:function(responseData) {
				if(responseData.signupSuccess) {
					var result=confirm(responseData.msg);
					if(result) {
						location.href="signin_form.do?url=${url }";
					} 
				} else {
					alert("회원가입 실패!");
				}
				
			}
		});
	};
</script>
</body>
</html>