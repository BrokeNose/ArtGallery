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
	
	
	tbody tr:hover {
    background-color: #ffff99;
    cursor: pointer;
	}	
	
</style>
</head>
<body>
<div class="container-fluid">
<jsp:include page="../inc/header.jsp">
	<jsp:param name="navMenu" value="category"/>
</jsp:include>
	<h4><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp;
		<c:choose>
			<c:when test="${categoryType eq 'A' }">아티스트 리스트</c:when>
			<c:when test="${categoryType eq 'M' }">재료 리스트</c:when>
			<c:when test="${categoryType eq 'P' }">화파 리스트</c:when>
		</c:choose>
	</h4>
	<div class="panel panel-default">
	  <div class="panel-body">
			<form action="adminCategory.do" class="form-inline" method="post" id="searchForm">
				<input type="hidden" name="categoryType" value="${categoryType} }"/>
				<div class="form-group">
					<input type="hidden" name="categorytype" value="${categoryType }"/>
					<select name="searchCondition" id="searchCondition" class="form-control">
						<c:choose>
							<c:when test="${categoryType eq 'A' }">
								<option value="name">아티스트명</option>
							</c:when>
							<c:when test="${categoryType eq 'M' }">
								<option value="name">재료명</option>
							</c:when>
							<c:when test="${categoryType eq 'P' }">
								<option value="name">화파명</option>
							</c:when>
						</c:choose>
						<option value="remark">비고</option>
					</select>
					<input id="searchKeyword" value="${searchKeyword }" type="text" name="searchKeyword" class="form-control" placeholder="검색어..." />
					<button id="search" class="btn btn-default">검색</button>
				</div>

				<div class="pull-right">
					<c:choose>
						<c:when test="${categoryType eq 'A' }">
							<button id="btnInsert" type="button" class="btn btn-primary" onclick="location.href='insertform.do?categoryType=${categoryType}'">아티스트 등록</button>
						</c:when>
						<c:when test="${categoryType eq 'M' }">
							<button id="btnInsert" type="button" class="btn btn-primary" onclick="location.href='insertform.do?categoryType=${categoryType}'">재료 등록</button>
						</c:when>
						<c:when test="${categoryType eq 'P' }">
							<button id="btnInsert" type="button" class="btn btn-primary" onclick="location.href='insertform.do?categoryType=${categoryType}'">화파 등록</button>
						</c:when>
					</c:choose>
				</div>	  
			</form>

	  </div><!-- /panel-body -->
	</div><!-- /panel -->
	
	<div class="table-responsive">
	  <table id="myTable" class="table table-bordered">
	  	<thead>
	  		<tr>
	  			<c:choose>
	  				<c:when test="${categoryType eq 'A' }">
			  			<td width="2%">#</td>
			  			<td width="10%">작가명</td>
			  			<td width="14%">출생일</td>
			  			<td width="14%">사망일</td>
			  			<td width="60%">비고</td>
			  			
			  		</c:when>
		  			<c:when test="${categoryType eq 'P' }">
			  			<td>#</td>
			  			<td>화파</td>
			  			<td>비고</td>
		  			</c:when>
		  			<c:when test="${categoryType eq 'M' }">
			  			<td>#</td>
			  			<td>재료</td>
			  			<td>비고</td>
		  			</c:when>
	  			</c:choose>
	  		</tr>
	  		  		
	  	</thead>
	  	<tbody>
	  		<c:forEach var="dto" items="${list }">
		  		<tr>
		  			<c:choose>
		  				<c:when test="${categoryType eq 'A' }">
				  			<td>${dto.seq }</td>
				  			<td>${dto.name }</td>
				  			<td>${dto.bdate }</td>
				  			<td>${dto.ddate }</td>
				  			<td>${dto.remark }</td>
			  			</c:when>
			  			<c:otherwise>
				  			<td>${dto.seq }</td>
				  			<td>${dto.name }</td>
				  			<td>${dto.remark }</td>
			  			</c:otherwise>
			  		</c:choose>
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
	//페이징처리
	function goPage(pageNum){
		location.href='adminCategory.do?categoryType=${categoryType}&searchKeyword=${searchKeyword}&searchCondition=${searchCondition}&pageNum='+pageNum;
	}
	
	/*
	//수정폼이동
	function goDetail(seq){
		location.href='updateform.do?pageNum=${pageNum}&searchKeyword=${searchKeyword}&searchCondition=${searchCondition}&seq='+seq;
	}
	*/
	
	$("tbody tr").click(function(){
    // 현재 클릭된 Row(<tr>)
    var tr = $(this);
    var td = tr.children();
		var seq = td.eq(0).text();
		location.href = "updateform.do?categoryType=${categoryType}&seq="+seq;
	});
</script>
</body>
</html>
