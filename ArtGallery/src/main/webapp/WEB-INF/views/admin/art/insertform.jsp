<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<h4><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; 작품정보 </h4>
	<form class="form-horizontal" action="insert.do" method="post" enctype="multipart/form-data">
	<div class="panel panel-default">	  
	  <div class="panel-body">	    
		  <div class="form-group">
		    <label class="col-sm-2 control-label">작품명</label>
		    <div class="col-sm-10">
		      	<input type="text" class="form-control" id="title" name="title">
		    </div>
		  </div>		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">제작년도</label>
		    <div class="col-sm-10">
		      	<input type="text" class="form-control" id="createyear" name="createyear">
		    </div>
		  </div>
		  <div class="form-group">
		  	<label class="col-sm-2 control-label">사이즈</label>
			<div class="col-sm-10">			     
		    	<input type="text" class="form-control" id="artsize" name="artsize">
	 		</div>
		  	</div>
		  <div class="form-group">
		  	<label class="col-sm-2 control-label">비고</label>
			<div class="col-sm-10">
			    <textarea name="remark" id="remark" class="form-control" rows="8"></textarea>
			</div>
		  </div>	
	  </div>
	  <div class="panel-footer">
	  	<div class="form-group">
		    <label for="" class="col-sm-2 control-label">작가명</label>
		    <div class="col-sm-8">
		      	<input type="text" class="form-control" id="" name="">
		    </div>
		    <button class="btn btn-default" type="submit">Button</button>
		      
		    
		</div>
	  	<div class="form-group">	  		
		    <label class="col-sm-2 control-label">재료</label>
		    <div class="col-sm-8">
		    	<input type="text" class="form-control" id="" name="">
		    </div>
		    <button class="btn btn-default" type="submit">Button</button>
		</div>
		<div class="form-group">	  		
		    <label class="col-sm-2 control-label">화파</label>
		    <div class="col-sm-8">	      
		      <input type="text" class="form-control" id="" name="">
		    </div>
		    <button class="btn btn-default" type="submit">Button</button>
		</div>	  
	  
	</div>
	</div><!-- //panel  -->	
		<!-- button // -->
		<div class="text-center">
			<button type="button" class="btn btn-primary">확인</button>
		  	<button type="button" class="btn btn-default">취소</button>
		</div>
		<!-- //button  -->
	</form>	
</div><!-- //container-fluid  -->


<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"  ></script>
</body>
</html>
