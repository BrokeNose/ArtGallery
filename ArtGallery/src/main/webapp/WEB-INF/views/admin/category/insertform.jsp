<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 작성자 : hyung -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 작품</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.con_left {
		display: inline-block;
	}
	.left {
		float: left;
	}
</style>
</head>
<body>
<div class="container-fluid">
	<jsp:include page="../inc/header.jsp">
		<jsp:param name="navMenu" value="art"/>
	</jsp:include>
	
	<c:choose>
		<c:when test="${categoryType eq 'A' }">
			<h4><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; 아티스트정보 </h4>
		</c:when>
		<c:when test="${categoryType eq 'M' }">
			<h4><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; 재료정보 </h4>
		</c:when>
		<c:when test="${categoryType eq 'P' }">
			<h4><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; 화파정보 </h4>
		</c:when>
	</c:choose>
	<form class="form-horizontal" action="insert.do" method="post" enctype="multipart/form-data" id="insertForm">
		<input type="hidden" name="code" value="${categoryType}"/>
		<div class="panel panel-default">	  
		  <div class="panel-body">	 
		  	<c:choose>
		  		<c:when test="${categoryType eq 'A' }">
					  <div class="form-group">
					    <label class="col-sm-2 control-label">아티스트명</label>
					    <div class="col-sm-10">
					      	<input type="text" class="form-control" id="name" name="name">
					    </div>
					  </div>
						<div class="form-group">
					    <label class="col-sm-2 control-label">출생일</label>
					    <div class="col-sm-10">
					      	<input type="date" class="form-control" id="bdate" name="bdate">
					    </div>
					  </div>		  
						<div class="form-group">
					    <label class="col-sm-2 control-label">사망일</label>
					    <div class="col-sm-10">
					      	<input type="date" class="form-control" id="ddate" name="ddate">
					    </div>
					  </div>		  
					  <div class="form-group">
					  	<label class="col-sm-2 control-label">비고</label>
							<div class="col-sm-10">
							    <textarea name="remark" id="remark" class="form-control" rows="8"></textarea>
							</div>
					  </div>
					  <div class="form-group">
					  	<label class="col-sm-2 control-label">이미지</label>
							<div class="col-sm-10">			     
						    	<input type="file" class="form-control" id="file" name="file">
					 		</div>
					  </div>	
		  		</c:when>
		  		
		  		<c:when test="${categoryType eq 'M' }">
					  <div class="form-group">
					    <label class="col-sm-2 control-label">재료명</label>
					    <div class="col-sm-10">
					      	<input type="text" class="form-control" id="name" name="name">
					    </div>
					  </div>
					  <div class="form-group">
					  	<label class="col-sm-2 control-label">비고</label>
							<div class="col-sm-10">
							    <textarea name="remark" id="remark" class="form-control" rows="8"></textarea>
							</div>
					  </div>
					  <div class="form-group">
					  	<label class="col-sm-2 control-label">이미지</label>
							<div class="col-sm-10">			     
						    	<input type="file" class="form-control" id="file" name="file">
					 		</div>
					  </div>			  		
		  		</c:when>
		  		
		  		<c:when test="${categoryType eq 'P' }">
					  <div class="form-group">
					    <label class="col-sm-2 control-label">화파명</label>
					    <div class="col-sm-10">
					      	<input type="text" class="form-control" id="name" name="name">
					    </div>
					  </div>
					  <div class="form-group">
					  	<label class="col-sm-2 control-label">비고</label>
							<div class="col-sm-10">
							    <textarea name="remark" id="remark" class="form-control" rows="8"></textarea>
							</div>
					  </div>
					  <div class="form-group">
					  	<label class="col-sm-2 control-label">이미지</label>
							<div class="col-sm-10">			     
						    	<input type="file" class="form-control" id="file" name="file">
					 		</div>
					  </div>			  		
		  		</c:when>		  		
		  		
		  	</c:choose>   
			</div>
		</div><!-- //panel  -->	
		<!-- button // -->
		<div class="text-center">
			<button type="button" class="btn btn-primary" id="btnSave">확인</button>
		  <button type="button" class="btn btn-default" id="btnCancel">취소</button>
		</div>
		<!-- //button  -->
	</form>	
</div><!-- //container-fluid  -->

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"  ></script>
<script>
	$("#btnCancel").click(function(){
		var isOk=confirm("작성을 취소하시겠습니까?\r\n목록으로 되돌아갑니다.");
		if(isOk){
			history.back();
			return;
		}		
	});
	
	$("#btnSave").click(function(){
		var FileFilter = /\.(jpg|gif|tif|bmp|png)$/i;
		var extArray = new Array(".jpg", ".gif", ".tif", ".bmp", ".png");     
		
		if($("#title").val()<= '   '){
			alert('작품명을 입력바랍니다.');
			$("#title").focus();
			return;
		}
		if($("#file").val()<= '   '){
			alert('서비스 이미지를  선택바랍니다.');
			return;
		}
		
		if(!$("#file").val().match(FileFilter)){
			alert("다음 파일만 업로드가 가능합니다.\n\n"  + (extArray.join("  ")) + "\n\n 업로드할 파일을 "
				     + " 다시 선택하여 주세요.");
			return;
		}
		
		$("#insertForm").submit();
	});
</script>
</body>
</html>