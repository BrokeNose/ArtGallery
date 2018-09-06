<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 작품</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<style>
	.con_left {
		display: inline-block;
	}
	.left {
		float: left;
	}
	.footer {
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	  /* Set the fixed height of the footer here */
	  height: 60px;
	  line-height: 60px; /* Vertically center the text there */
	  background-color: #f5f5f5;
	}
	
	.footer > .container_f {	
	  padding-right: 15px;
	  padding-left: 15px;
	}
	
	code {
	  font-size: 80%;
	}
</style>
</head>
<body>
<div class="container-fluid">
<jsp:include page="../inc/header.jsp">
	<jsp:param name="navMenu" value="user"/>
</jsp:include>
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
			    <li><a href="#">아이디</a></li>
			    <li><a href="#">이메일</a></li>			    
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
					<td>${tmp.rnum }</td>				
					<td>${tmp.id }</td>
					<td>${tmp.email }</td>
					<td>${tmp.regdate }</td>
					<td>${tmp.rollName }</td>
					<td><c:if test="${!empty tmp.deldate }">O</c:if></td>
				</tr>
			
			</c:forEach>
	  		
	  	
	  	</tbody>
	  </table>
	</div>
	<!-- Page navigation// -->
	<div class="text-center">
		<nav aria-label="Page navigation">
			<!-- 페이징 처리 -->
			<ul class="pagination">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li>
							<a href="javascript: goPage(${startPageNum-1 });" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
							<a href="javascript:" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
						<li class='<c:if test="${i eq pageNum }">active</c:if>'>
							<a href="javascript: goPage(${i });">${i }</a>
						</li>
				</c:forEach>
				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li>
							<a href="javascript: goPage(${endPageNum+1 });" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
							<!--  <a href="javascript: goPage(${endPageNum+1 });">&raquo;</a>-->
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
							<a href="javascript:" class="muted" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>		
			</ul>
		</nav>
	</div>
	<!-- //Page navigation -->
</div>
<script>
	//페이징처리
	function goPage(pageNum){
		location.href='userlist.do?searchKeyword=${searchKeyword}&searchCondition=${searchCondition}&pageNum='+pageNum;
	}
</script>
<jsp:include page="../inc/footer.jsp" />
	
</body>
</html>
