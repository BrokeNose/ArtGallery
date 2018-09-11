<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
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
	.table-responsive {
		width: 100%;
		min-height: .01%;
		overflow-x: auto;
	}
	div.table {
		width: 100%;
	  	max-width: 100%;
	  	margin-bottom: 1rem;
	  	background-color: transparent;
		display: table;
		border-spacing: 0;
 		border-collapse: collapse;
 		border: 1px solid #ddd;
	}
	div.table > div.thead > div.tr > div.th, 
	div.table > div.tbody > div.tr > div.td, 
	div.table > div.tbody > form.tr > div.td {
		padding: 8px;
		line-height: 1.42857143;
		vertical-align: top;
		border-top: 1px solid #ddd;
	}
	div.table > div.thead > div.tr > div.th {
		vertical-align: bottom;
		border-bottom: 2px solid #ddd;
	}
	div.table > div.thead:first-child > div.tr:first-child > div.th{
		border-top: 0;
	}
	div.table-bordered {
		border: 1px solid #ddd;
	}
	div.table-bordered > div.thead > div.tr > div.th, 
	div.table-bordered > div.tbody > div.tr > div.td, 
	div.table-bordered > div.tbody > form.tr > div.td {
		border: 1px solid #ddd;
	}
	div.table-bordered > div.thead > div.tr > div.th {
		border-bottom-width: 2px;
	}
	.table-responsive > div.table {
    	margin-bottom: 0;
  	}
	div.thead {
		display: table-header-group;
	}
	div.thead > div.td {
		border-bottom-width: 2px;
	}
	div.tbody {
		display: table-row-group;
	}
	div.tr {
		display: table-row;
	}
	form.tr {
		display: table-row;
	}
	div.th {
		display: table-cell;
		padding: 0;
		text-align: left;
	}
	div.td {
		display: table-cell;
		padding: 0;
	}
	.table-hover > div.tbody > div.tr:hover {
	  background-color: #f5f5f5;
	}
	form.updateForm {
		display: none;
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
	  <div class="table table-bordered table-hover">
		<div class="thead">
			<div class="tr">
				<div class="th">#</div>
				<div class="th">아이디</div>
				<div class="th">이메일</div>
				<div class="th">등록일</div>
				<div class="th">권한</div>
				<div class="th">탈퇴 여부</div>
				<div class="th">수정</div>
				<div class="th">탈퇴</div>
				<div class="th">삭제</div>
			</div>
		</div>
	  	<c:forEach var="tmp" items="${list }">
	  	<div class="tbody">
			<div class="tr">
				<div class="td">${tmp.rnum }</div>
				<div class="td">${tmp.id }</div>
				<div class="td">${tmp.email }</div>
				<div class="td">${tmp.regdate }</div>
				<div class="td">${tmp.rollName }</div>
				<div class="td"><c:if test="${!empty tmp.deldate }">O</c:if></div>
				<div class="td"><a href="javascript:" class="toggleForm">수정</a></div>
				<div class="td"><a href="leave.do?id=${tmp.id }">탈퇴</a></div>
				<div class="td"><a href="javascript:deleteConfirm('${tmp.id }')">삭제</a></div>
			</div>
  			<form class="tr updateForm" action="update.do">
				<div class="td"><input type="hidden" name="rnum" value="${tmp.rnum }"/></div>
				<div class="td"><input type="hidden" name="id" value="${tmp.id }"/></div>
				<div class="td"><input type="text" name="email" value="${tmp.email }"/></div>
				<div class="td"><input type="hidden" name="regdate" value="${tmp.regdate }"/></div>
				<div class="td"><input type="text" name="roll" value="${tmp.roll }"/></div>
				<div class="td"><input type="text" name="deldate" value="${tmp.deldate }"/></div>
				<div class="td"><button type="submit" class="btn btn-primary">완료</button></div>
				<div class="td"></div>
				<div class="td"></div>
			</form>
		</div>
		</c:forEach>
	  </div>
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
	function goPage(pageNum) {
		location.href='userlist.do?searchKeyword=${searchKeyword}&searchCondition=${searchCondition}&pageNum='+pageNum;
	}
	//정보 수정
	//수정 폼 보이기
	$(".toggleForm").click(function() {
		if($(this).text()=="수정") {
			$(this).text("취소");
			$(this).parent().parent().parent().find(".updateForm").css("display", "table-row");
		} else {
			$(this).text("수정");
			$(this).parent().parent().parent().find(".updateForm").css("display", "none");
		}
	});
	//삭제 함수
	function deleteConfirm(id) {
		var isDelete=confirm("이 사용자 정보를 삭제하시겠습니까?");
		if(isDelete) {
			location.href="delete.do?id="+id;
		}
	}
</script>
<jsp:include page="../inc/footer.jsp" />
	
</body>
</html>
