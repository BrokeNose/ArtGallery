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
<jsp:include page="header.jsp"/>	
	<h4><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; 회원리스트 </h4>
	<div class="panel panel-default">
	  <div class="panel-body">
	  	<form class="form-inline">
		  <div class="form-group">		   
		    <div class="input-group">
		      <div class="dropdown con_left">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			    전체
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
			    <li><a href="#">아티스트</a></li>
			    <li><a href="#">재료</a></li>
			    <li><a href="#">화파</a></li>
			  </ul>
			  <div class="input-group">
			      <input type="text" class="form-control" placeholder="Search for...">
			      <span class="input-group-btn">
			        <button class="btn btn-default" type="button">Go!</button>
			      </span>
			  </div><!-- /input-group -->			  
			</div>		     
		   </div>
		  </div>
		  <div class="pull-right">
		  		  	<!-- <button type="button" class="btn btn-primary">작품등록</button>-->
		  </div>	  
		</form>
		
	  </div><!-- /panel-body -->
	</div><!-- /panel -->
	<div class="table-responsive">
	  <table class="table table-bordered">
	  	<thead>
	  		<tr>	  		
	  			<td>#</td>
	  			<td>아이디</td>
	  			<td>이메일</td>
	  			<td>등록일</td>
	  			<td>관리자여부</td>
	  			<td>삭제여부</td>
	  		</tr>	  		  		
	  	</thead>
	  	<tbody>
		  	<c:forEach var="tmp" items="${list }">
				<tr>
					<td></td>				
					<td>${tmp.id }</td>
					<td>${tmp.email }</td>
					<td>${tmp.regdate }</td>
					<td>${tmp.rollName }</td>
					<td></td>
				</tr>
			
			
			
			</c:forEach>
	  		
	  	
	  	</tbody>
	  </table>
	</div>
	<!-- Page navigation// -->
	<div class="text-center">
		<nav aria-label="Page navigation">
		  <ul class="pagination">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>
	<!-- //Page navigation -->
</div>




<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"  ></script>

</body>
</html>
