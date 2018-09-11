<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<style type="text/css">
	.arrow_left {
		padding-top: 250px;
		display: inline-block;
		float:left;
		width:30px;			
		
	}
	.arrow_right {
		padding-top:250px;
		display: inline-block;
		float:right;
		width:30px;
	}	
	.img_center{	
      max-width:70%;
      max-height:500px;
      text-align:center;
   	}
   	.relCategory a {
   		text-decoration: none;
   		color: rgb(51, 51, 51);
   		font-weight: bold;
   	}
	.info	{
		display: block;
	    padding: 9.5px;
	    margin: 0 0 10px;
	    font-size: 15px;
	    line-height: 1.42857143;
	    color: #333;
	    word-break: break-all;
	    word-wrap: break-word;
	    border-radius: 4px;
	}
	.bigImage{
		position: absolute;
		top:50px;
		left:0;
		right:0;
		bottom:0;
		background-color: #fff;
		display: none;			
		z-index: 10;
	}
	.zoom{		
		position: relative;
		left:100px;
		top:-20px; 
		
	}
	.zoom:hover{
		cursor:pointer;
	}	
	.multi-stage
	{
		max-width:none;
		-webkit-column-count:2;
		column-count:2;
		-webkit-column-gap:24px;
		column-gap:24px
	}
	/* 댓글 ----- */
	#modalComment{
		top: 25%;
	}
	.comments{
		overflow-y: scroll; 
		height:300px;
		clear: both;
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
	.muted{
		color: #888;
	}
	.comment_form{
		height: 100px;
		margin-bottom: 15px;
	}
	.comment_form form textarea, .comment_form form button{
		float: left;
	}
	.comments li{
		clear: left;
	}
	.comment_form form textarea{
		width: 90%;
		height: 100px;
	}
	.comment_form form button{
		height: 100px;
	}
	.loader{
		position: fixed;
		width:  99%;
		left: 0;
		bottom: 0;
		text-align: right;
		display: none;	/* 일단 숨기기 */
	}
	
		
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	<input type="hidden" id="seq" value="${dto.seq }"/>
	<div class="row">
		<div class="arrow_left">
		<c:if test="${dto.prevNum ne 0 }">
			<a href="javascript: goDetail(${dto.prevNum });">
				<span style="font-size:30px;"><i class="fas fa-arrow-circle-left"></i></span></a>
		</c:if></div>
		<div class="arrow_right">
		<c:if test="${dto.nextNum ne 0 }">
			<a href="javascript: goDetail(${dto.nextNum });">
				<span style="font-size:30px;"><i class="fas fa-arrow-circle-right"></i></span></a>
		</c:if></div>
		<div class="text-center">
			<img class="img_center" src="${configDto.httpPath}${pageContext.request.contextPath }${dto.imagepath }"/>
			<div class="zoom"><div class="zoom_bg"></div><span style="font-size:30px;color:#DC143C;"><i id="iZoom" class="fas fa-search-plus"></i></span></div>
		</div>	
	</div>
	<div class="relCategory text-left">
		<h2>${dto.title }</h2>
		<h4>
		<c:forEach var="tmp" items="${aList }" varStatus="status">
			<c:if test="${status.index > 0}">, </c:if> 
			<b><a href="../category/detail.do?seq=${tmp.cseq }">${tmp.name }</a></b>
			<c:set var="cyear" value="${tmp.bdate }/${tmp.ddate }"/>
		</c:forEach>
		<c:choose>
			<c:when test="${!empty dto.createyear }">
				${dto.createyear }
			</c:when>
			<c:otherwise>
				${cyear}
			</c:otherwise>
		</c:choose></h4>
		
		<a href="javascript:goFavorArt(${dto.seq });" title="관심작품">
			<span style="font-size:1.3em;color: #333;margin-right:10px;">
		<c:choose>
			<c:when test="${isFavorArt eq 'Y' }">
				<i id="iFavor" class="fas fa-heart"></i></span></a>	
			</c:when>
			<c:otherwise>
				<i id="iFavor" class="far fa-heart"></i></span></a>		
			</c:otherwise>	
		</c:choose>
		<a href="javascript:goComment(${dto.seq });" title="댓글">
			<span style="font-size:1.3em;color: #333;">
		<c:choose>
			<c:when test="${totalRow > 0 }">
				<i id="iComment" class="fas fa-comment-dots"></i></span></a>	
			</c:when>
			<c:otherwise>
				<i id="iComment" class="far fa-comment-dots"></i></span></a>		
			</c:otherwise>	
		</c:choose>			
		<br />
		<p class="info">
<c:if test="${not empty mList }">재료 : </c:if>		
<c:forEach var="tmp" items="${mList }"  varStatus="status">
	<c:if test="${status.index > 0}">, </c:if> 
	<a href="${pageContext.request.contextPath }/category/detail.do?code=M&seq=${tmp.cseq}">${tmp.name }</a>
</c:forEach>
		
<c:if test="${not empty pList }"><br />화파 : </c:if>		
<c:forEach var="tmp" items="${pList }"  varStatus="status">
	<c:if test="${status.index > 0}">, </c:if> 
	<a href="${pageContext.request.contextPath }/category/detail.do?code=P&seq=${tmp.cseq}">${tmp.name }</a>
</c:forEach>
		</p>		
		<p class="info <c:if test="${multiStage eq true }">multi-stage</c:if>" style="white-space:pre-wrap;">${dto.remark }</p>	
	</div>	
<br />
</div><!-- //container -->
<!-- image zoom -->
<div class="bigImage">
	<div class="row">
		<div class="text-center">
			<img id="zoomImage" class="img_center" src="${configDto.httpPath}${pageContext.request.contextPath }${dto.imagepath }" onmousewheel="Picture()" />
		</div>
	</div>
</div>
<!--  modal  -->
<div class="modal fade" id="modalComment">
	<!-- modal-lg  | default | modal-sm -->	
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span>&times;</span><span class="sr-only">모달 닫기</span></button>
				<h4 class="modal-title">댓글(감상평)</h4>
			</div>   				
			<div class="modal-body">
				
				<!-- 댓글을 작성할수 있는 폼 -->
				<div class="comment_form">
					<form method="post">
						<input type="hidden" name="writer" value="${id }" />
						<input type="hidden" name="target_id" value="" />
						<input type="hidden" name="comment_group" value="0" />
						<input type="hidden" name="seq" value="${dto.seq }"/>
						
						<textarea name="content"></textarea>
						<button type="submit">등록</button>
					</form>
				</div>
				
				<div class="comments">
					<div class="comments_count"></div>
					<ul>
						<li class="comment-clone" style="display:none">
							<dl>
								<dt>
									<span class="writer"></span>
									<span class="regdate"></span>										
								</dt>
								<dd>
									<span class="info" style="white-space:pre-wrap;"></span>
								</dd>
							</dl>									
						</li>	
					<c:forEach var="tmp" items="${commentList }">
						<li class="comment">
							<dl>
								<dt>
									<span>${tmp.writer }</span>
									<span>${tmp.regdate }</span>										
								</dt>
								<dd>
									<span class="info" style="white-space:pre-wrap;">${tmp.content }</span>
								</dd>
							</dl>									
						</li>
					</c:forEach>
					</ul>	
					<div class="loader">
						<img src="${pageContext.request.contextPath }/resources/images/loader.gif" alt="로딩 이미지" />
					</div>				
				</div> <!-- .comments  -->
			</div>
			<div class="modal-footer">
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<jsp:include page="../footer.jsp"/>
<script>
	//작품 상세정보
	function goDetail(seq){
<c:choose>
<c:when test="${!empty listMode and listMode eq 'favorite' }">
		location.href="favoriteDetail.do?seq="+seq
</c:when>
<c:when test="${!empty listMode and listMode eq 'search' }">
		location.href="searchDetail.do?searchKeyword=${param.searchKeyword}&seq="+seq
</c:when>
		<c:otherwise>
		location.href="detail.do?<c:if test="${!empty param.cseq  }">cseq=${param.cseq}</c:if>&sortField=${param.sortField}&searchKeyword=${param.searchKeyword}&searchCondition=${param.searchCondition}&seq="+seq
</c:otherwise>
</c:choose>
	}	

	// 이미지 확대 시작 -------------------
	var count = 10;
	function Picture(){
	count = Counting(count);
	if(count==10){
		$(".bigImage").hide();	
	}
	Resize(count);
	return false;
	}
	function Counting(count){   
	    if (event.wheelDelta >= 120)
	        count++;
	    else if (event.wheelDelta <= -120)
	        count--;   
	    return count; 
	}
	function Resize(count){    
		zoomImage.style.zoom = count + '0%';    
	}
	
	$("#iZoom").click(function(){
		zoomImage.style.zoom ='100%';
		count=10;
		$(".bigImage").show();	
	});
	$(".bigImage").click(function(){
		$(".bigImage").hide();		
	});
	
	// 이미지 확대  끝 -------------------
	
	
	// 댓글 시작 --------------------
<c:choose>
<c:when test="${!empty commentPageNum}">
	var cPageNum=${commentPageNum};
</c:when>
<c:otherwise>
	var cPageNum=0;
</c:otherwise>
</c:choose>
	function goComment(seq){
		//모달 보여주기
		$("#modalComment").modal("show");
	}
	
	$(".comments").scroll( function() {
		var elem = $(".comments");
		
		if ( elem[0].scrollHeight - elem.scrollTop() <= elem.outerHeight()) {
			//console.log("elem[0].scrollHeight - elem.scrollTop() : " + ( elem[0].scrollHeight - elem.scrollTop() ) );
			//console.log("elem.outerHeight() : " + elem.outerHeight());
			loadComments(false);			
		} 
	});
	
	function loadComments(isFirst){
		
		$(".loader").show();
		//.one("transitionend", function(){	});; hyung 모름
		
		var page=1;
		if (isFirst) {
			var cloneli = $('.comment-clone').clone();			
			$(".comments ul").empty("");
			$('.comments ul').append(cloneli);
		} else {
			page=cPageNum+1;
		}
		
		$.ajax({
			url:"commentListJson.do",
			method:"post",
			data:{"seq":${dto.seq},
				  "commentPageNum": page},
			success:function(data) {
				if ( data.length == 0 )  {
					alert('더이상 불러올 자료가 없습니다.');
				} else {
					cPageNum=page;	
					$.each( data, function( idx, value ) {
						var cloneli = $('.comment-clone').clone();
						cloneli.find(".writer").text(value.writer);
						cloneli.find(".regdate").text(value.regdate);
						cloneli.find(".info").text(value.content);
						cloneli.css("display","block").removeClass("comment-clone").addClass("comment");
						console.log(cloneli);
						$('.comments ul').append(cloneli);
					});					
				}
			},
			complete : function() {
				$(".loader").hide();
		    }
		});
	}
	
	//댓글 전송 이벤트가 일어 났을때 실행할 함수 등록
	$(".comment_form > form").submit(function(){
		
		var writer=$("[name=writer]").val();		
		if(writer==undefined||writer==""){//로그인 하지 않았으면
			alert("댓글(감상평)을 추가하려면, 로그인해야 합니다.");
			return false;//폼 전송 막기 
		}
		
		var content=$("[name=content]").val();		
		if(content==undefined||content<="    "){//작성글이 없으면
			alert("댓글(감상평)을 작성해주세요.");
			$("[name=content]").focus();
			return false;//폼 전송 막기 
		}
		
		// 추가
		var isSuccess=false;
		var param=$(this).serialize();	// this->form
		$.ajax({
			url:"comment_insertJson.do",
			method:"post",
			data: param,		//요청 파라미터
			success:function(data) {
				if(data.isSuccess){
					alert("등록했습니다.");
					isSuccess=true;				
					
					$("#iComment").removeClass("far");
					$("#iComment").addClass("fas");
				
					//댓글 로드
					loadComments(true);
					$("[name=content]").val("");
					return false;//폼 전송 막기 
				} else {
					alert("오류가 발생했습니다.\r\n다시 해주세요.");
					return false;
				}
			},
			complete : function() {
				return false;
		    }
		});
		return false;
	});
	
	// 댓글 시작 --------------------

	// 관심작품 
	function goFavorArt(seq){		
<c:choose>
<c:when test="${!empty id}">	
		$.ajax({
			url:"favoriteArt.do",
			method:"post",
			data:{"seq":seq},
			success:function(data) {
				if(data.isFavorInsert=='Y'){
					alert("관심작품에 등록했습니다.");
					$("#iFavor").removeClass("far");
					$("#iFavor").addClass("fas");
				} else {
					alert("관심작품에서 해지했습니다.");
					$("#iFavor").removeClass("fas");
					$("#iFavor").addClass("far");					
				}
			}			
		});
</c:when>
<c:otherwise>
		alert("관심작품에 추가하려면, 로그인해야 합니다.");
		return;
</c:otherwise>
</c:choose>
	}

</script>
</body>
</html>
