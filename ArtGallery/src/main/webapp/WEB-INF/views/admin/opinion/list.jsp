<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 작성자 : hyung -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 의견보내기</title>
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
	  position: relative;
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
	a:hover{
		text-decoration: none;
	}
	tbody tr:hover {
   		cursor: pointer;
	}
</style>
</head>
<body>
<div class="container-fluid">
	<jsp:include page="../inc/header.jsp">
		<jsp:param name="navMenu" value="opinion"/>
	</jsp:include>	
	<h4><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; 의견리스트 </h4>
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="form-inline" action="list.do" method="post">
				<div class="form-group">
					<select name="searchCondition" id="searchCondition" class="form-control">
						<option value="writer" 		<c:if test="${searchCondition eq 'writer' }">selected</c:if>>작성</option>
						<option value="title" 		<c:if test="${searchCondition eq 'title' }">selected</c:if>>제목</option>
						<option value="content" 		<c:if test="${searchCondition eq 'content' }">selected</c:if>>내용</option>
						<option value="titleContent" <c:if test="${searchCondition eq 'titleContent' }">selected</c:if>>제목+내용</option>
					</select>
					<input value="${searchKeyword }" type="text" name="searchKeyword" class="form-control" placeholder="검색어..." />
					<button class="btn btn-default" type="submit">검색</button>
					&nbsp;&nbsp;&nbsp;&nbsp;항목수 : ${totalRow }건
				</div>
				<div class="pull-right">
				</div>	  
			</form>
		</div><!-- /panel-body -->
	</div><!-- /panel -->
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th width="50%">제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>				  		
			</thead>
			<tbody>
			<c:forEach var="dto" items="${list }">
				<tr id="t${dto.num }">
					<td>${dto.rnum }</td>
					<td><a href="javascript:goDetail(${dto.num });">${dto.title }</a></td>
					<td>${dto.writer }</td>
					<td>${dto.viewCount }</td>
					<td>${dto.regdate }</td>
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
<jsp:include page="../inc/footer.jsp" />
<script>
	//$(function(){});
	

    $('table tbody tr').click(function(){ 
        var id=$(this).attr("id").substring(1);
        goDetail(id);
		//console.log(id);
    });
	//페이징처리
	function goPage(pageNum){
		location.href='list.do?searchKeyword=${searchKeyword}&searchCondition=${searchCondition}&pageNum='+pageNum;
	}
	//수정폼이동
	function goDetail(num){
		location.href='detail.do?pageNum=${pageNum}&searchKeyword=${searchKeyword}&searchCondition=${searchCondition}&num='+num;
	}
</script>
</body>
</html>
