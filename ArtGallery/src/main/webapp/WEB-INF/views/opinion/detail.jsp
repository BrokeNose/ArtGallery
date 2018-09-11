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
	.content{
		border: 1px solid #ddd;
		
		margin-top:15px;
		margin-bottom:15px;
		padding:15px;
	}
	.content img{
		max-width: 95%;
	}
	.comments {
		margin-top:15px;
	}
	.comment{
		position: relative;
	}
	.comments ul {
		padding: 0;
		margin: 0;
		list-style-type: none;
	}
	.comments ul li{
		margin-top: 10px;
		border-top: 1px solid #888;
	}
	.comments li{
		clear: left;
	}
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 26px;
	}
	/* 댓글의 댓글 이미지 배치*/
	.comment .reply_icon{
		width: 8px;
		height: 8px;
		position: absolute;
		top: 10px;
		left: 30px;
	}
	.muted{
		color: #888;
	}	

</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	<h4><i class="fas fa-kiss-wink-heart"></i> 의견보내기</h4>
	<table class="table table-bordered">
		<tr>
			<th class="col-xs-1">글번호</th>
			<td class="col-xs-11">${dto.num }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
	</table>
	<div class="content">${dto.content }</div>
	
	<c:if test="${sessionScope.id eq dto.writer }">
		<div class="text-center">
		<a href="updateform.do?num=${dto.num }" class="btn btn-default">수정</a>
		<a href="javascript:deleteConfirm()" class="btn btn-primary">삭제</a>
		</div>
		<script>
			function deleteConfirm(){
				var isDelete=confirm("글을 삭제 하시겠습니까?");
				if(isDelete){
					var isSuccess=false;
					$.ajax({
						url:"delete.do",
						method:"get",
						data: {num: ${dto.num}},		//요청 파라미터
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
	</c:if>
		
	<!-- 댓글에 관련된 UI -->
	<div class="comments">
		<ul>
			<c:forEach var="tmp" items="${commentList }">
				<li class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >
					<c:if test="${tmp.num ne tmp.comment_group }">
						<img class="reply_icon" src="${pageContext.request.contextPath }/resources/images/re.gif"/>
					</c:if>	
				
					<dl>
						<dt>
							<img src="${pageContext.request.contextPath }/resources/images/user_image.gif"/>
							<span>${tmp.writer }</span>
							<span>${tmp.regdate }</span>							
						</dt>
						<dd>
							<c:if test="${tmp.num ne tmp.comment_group }">
								<i class="muted">${tmp.target_id }</i>
								<br/>
							</c:if>
							<pre>${tmp.content }</pre>
						</dd>
					</dl>	
				</li>
			</c:forEach>
		</ul>	
	</div>					
</div>
<jsp:include page="../footer.jsp"/>	

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>

</body>
</html>
