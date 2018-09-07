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
		border: 1px solid #888888;
		box-shadow: 5px 5px 5px #888888;
	}
	.content img{
		max-width: 100%;
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
		border-top: 1px solid #888;
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
	.comments li{
		clear: left;
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	<h4><i class="fas fa-kiss-wink-heart"></i> 의견보내기</h4>
	<table>
		<tr>
			<th>글번호</th>
			<td>${dto.num }</td>
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
		<a href="updateform.do?num=${dto.num }" class="btn btn-primary">수정</a>
		<a href="javascript:deleteConfirm()" class="btn btn-info">삭제</a>
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

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//로그인 했는지 여부
	var isLogin=${isLogin};
	
	//댓글 전송 이벤트가 일어 났을때 실행할 함수 등록
	$(".comment_form > form, .comment form").submit(function(){
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
	
	// 답글 링크를 눌렀을때 실행할 함수 등록 
	$(".comment .reply_link").click(function(){
		if($(this).text()=="답글"){
			$(this).text("취소");
		}else{
			$(this).text("답글");
		}
		
		$(this)
		.parent().parent().parent()
		.find("form")
		.slideToggle(200);
	});
</script>
</body>
</html>
