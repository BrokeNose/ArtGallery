<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의견보내기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<h4><i class="fas fa-kiss-wink-heart"></i> 의견보내기&nbsp;(${totalRow }건)</h4>
			</div>
			<div class="pull-right">
				<button id="btnInsert" type="button" class="btn btn-primary">의견등록</button>
			</div>	
		</div><!-- /panel-body -->
	</div><!-- /panel -->
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th width="50%">제목</th>
				<th>조회수</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>	
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.rnum }</td>
				<td><a href="detail.do?num=${tmp.num }">${tmp.title }</a></td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.regdate }</td>
				<td>
					<c:if test="${tmp.writer eq id }">
						<a href="javascript:deleteConfirm(${tmp.rnum }, ${tmp.num })">삭제</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<jsp:include page="../footer.jsp"/>	
<script>
	$("#btnInsert").click(function(){
		location.href='insertform.do';			
	});

	//삭제 확인을 하는 함수 
	function deleteConfirm(rnum, num){
		var isDelete=confirm(rnum+"번 글을 삭제 하시겠습니까?");
		if(isDelete){
			var isSuccess=false;
			$.ajax({
				url:"delete.do",
				method:"get",
				data: {num: num},		//요청 파라미터
				success:function(data) {
					if(data.isSuccess){
						alert("삭제했습니다.");
						location.href="list.do";
					} else {
						alert("오류가 발생했습니다.\r\n다시 해주세요.");
					}
			    }
			});
		}
	}
</script>
</body>
</html>