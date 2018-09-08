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
	
	.content{
		border: 1px solid #888888;
		box-shadow: 5px 5px 5px #888888;
		margin-top:15px;
		margin-bottom:15px;
		padding:15px;
	}
	.content img{
		max-width: 100%;
	}
	
	.comment{
		position: relative;
	}
	.comments {
		margin-top:20px;
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
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 26px;
	}
	.muted{
		color: #888;
	}	
	.comments li{
		clear: both;
	}
	.comments form textarea{
		width: 500px;
		height: 100px;
	}
	.comments form button{
		height: 100px;
	}
		
</style>
</head>
<body>
<div class="container-fluid">
	<jsp:include page="../inc/header.jsp">
		<jsp:param name="navMenu" value="opinion"/>
	</jsp:include>	
	<h4><span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; 의견 </h4>
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
	
	<!-- 댓글에 관련된 UI -->
	<div class="comments">
		<ul>
			<c:forEach var="tmp" items="${commentList }">
				<li class="comment">
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
		
		<!-- 원글에 댓글을 작성할수 있는 폼 -->
		<div class="comment_form">
		<h3>답변</h3>
			<form action="comment_insert.do" method="post">
				<input type="hidden" name="writer"  value="${id }" />
				<input type="hidden" name="ref_group"  value="${dto.num }"/>
				<input type="hidden" name="target_id" value="${dto.writer }"/>
				<textarea name="content"></textarea>
				<button type="submit">등록</button>
			</form>
		</div>
	</div>					
</div>
<br />
<jsp:include page="../inc/footer.jsp"/>	

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//로그인 했는지 여부
	var isLogin=${isLogin};
	
	//댓글 전송 이벤트가 일어 났을때 실행할 함수 등록
	$(".comment_form > form").submit(function(){
		if(!isLogin){//로그인 하지 않았으면
			var isGoLogin=confirm("로그인이 필요 합니다.");
			if(isGoLogin){
				//로그인 페이지로 이동하기
				location.href="${pageContext.request.contextPath}"+
					"/users/loginform.do"+
					"?url=${pageContext.request.contextPath}"+
					"/opinion/detail.do?num=${dto.num}";
			}
			return false;//폼 전송 막기 
		}
	});
	
</script>
</body>
</html>
