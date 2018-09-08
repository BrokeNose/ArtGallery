<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의견보내기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<style>
	a:hover{
		text-decoration: none;
	}
	tbody tr:hover {
   		cursor: pointer;
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	<div class="panel panel-default">
		<div class="panel-body form-inline">
			<div class="form-group">
				<h4><i class="fas fa-kiss-wink-heart"></i> 의견보내기&nbsp;(${totalRow }건)</h4>
			</div>
			<div class="pull-right">
				<button id="btnInsert" type="button" class="btn btn-primary">의견등록</button>
			</div>	
		</div><!-- /panel-body -->
	</div><!-- /panel -->
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th width="50%">제목</th>
				<th>답변수</th>
				<th>등록일</th>
				<!-- <th>삭제</th> -->
			</tr>	
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr id="t${tmp.num }">
				<td>${tmp.rnum }</td>
				<td><a href="javascript: goDetail(${tmp.num })">${tmp.title }</a></td>
				<td>${tmp.commentCount }</td>
				<td>${tmp.regdate }</td>
				<!-- <td>
						<a href="javascript:deleteConfirm(${tmp.rnum }, ${tmp.num })">삭제</a>					
				</td> -->
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

    $('table tbody tr').click(function(){ 
    	var id=$(this).attr("id").substring(1);
        goDetail(id);
		//console.log(id);
    });
    
    function goDetail(num){
    	location.href="detail.do?num="+num;
    }
    
	/* //삭제 확인을 하는 함수 
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
	*/
</script>
</body>
</html>