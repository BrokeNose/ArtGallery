<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/artgallery.css" />
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous" />
<style>
	.thumbnail-wrappper { 
		width: 25%; 
	} 
	.thumbnail { 
		position: relative;
		padding-top: 100%;
		  /* 1:1 ratio */ 
		overflow: hidden; 
		border:0;
		border-radius: 0;
	} 
	.thumbnail .centered {
	 	position: absolute; 
	 	top: 0; 
	 	left: 0; 
	 	right: 0; 
	 	bottom: 0; 
	 	
	 } 
	.thumbnail .centered img { 
		position: absolute; 
		top: 0; 
		left: 0; 
		max-width: 100%; 
		max-height:100%;
		height:100%;
		width:100%;
				
		 
	}
	.thumb_title1 {
		position: absolute; 
		bottom:5px;
		z-index:10000;
		color:#fff;
		font-weight:bold;
		left:5px;
		overflow: hidden; 
	 	text-overflow: ellipsis;
	 	white-space: nowrap; 
	 	width: 100%;
	}
	
	.thumb_items {
		position: absolute; 
		bottom:5px;
		z-index:2000;
		color:#fff;
		left:5px;
	}
	.overlay {
		
    	background-color: black;
    	position: absolute;
    	left: 0; top: 0; height: 100%; width: 100%;
		
	}
	body{padding-top: 70px;}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="resultContainer container">
	<div class="row">
		<c:if test="${not empty searchKeyword }">
			<h4><i class="fas fa-search"></i> 검색어: <strong>${searchKeyword }</strong>로 검색하셨습니다.</h4>
		</c:if>
		<c:if test="${empty list }">
			<h3>검색 결과가 없습니다.</h3>
		</c:if>
		<br />
		<c:if test="${not empty cateDto && not empty artResult}">	
			<div class="col-md-6 col-sm-6 col-xs-12">
				<h3>${cateDto.name }</h3>
				<p>${cateDto.remark }</p>
					<%-- <p>${cateDto.seq }</p>
					<p>${cateDto.code }</p>
					<p>${cateDto.codename }</p>
					<p>${cateDto.imagepath }</p>
					<p>${cateDto.artcount }</p> --%>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<c:forEach var="tmp" items="${artResult }">
					<div class="col-md-4 col-sm-4 col-xs-4">
						<div class="thumbnail">				
							<div class="centered">		
								<a href="detail.do?seq=${cateDto.seq }">													
									<div class="thumb_title TT" title="${tmp.title }">${tmp.title }</div>
									<div class="overlay"><img src="${configDto.httpPath}${pageContext.request.contextPath }${tmp.imagepath }" /></div>						
								</a>	
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		
		<hr style="width:100%;border-top: 2px solid #999;"/>	
		
		</c:if>
	</div>
	
	<div class="row">
	  	<c:if test="${not empty list }">
	  		<h3><strong>${searchKeyword }</strong> 키워드의 관련 작품들 입니다.  (${totalRow } 건)</h3>
	  	</c:if>
		<div id="clone" class="col-md-2 col-sm-3 col-xs-6" style="display:none">
			<div class="thumbnail">
				<div class="centered">
					<a href=""><img src=""></a>
				</div>
			</div>
		</div>
	
		
		<c:forEach var="dto" items="${list }">
		<div class="col-md-2 col-sm-3 col-xs-6">
			<div class="thumbnail">
				<div class="centered">
					<a href="${pageContext.request.contextPath }/art/searchDetail.do?&searchKeyword=${searchKeyword }&seq=${dto.seq }" title="${dto.title }">
						<img src="${configDto.httpPath}${pageContext.request.contextPath }${dto.imagepath }">					
					</a>
				</div>
			</div>
		</div>
		<%-- <p>title: ${dto.title }</p>
		<p>seq: ${dto.seq }</p>
		<p>createyear: ${dto.createyear}</p>
		<p>artsize: ${dto.artsize }</p>
		<p>imagepath: ${dto.imagepath }</p>
		<p>viewcount ${dto.viewcount}</p>
		<p>regdate ${dto.regdate }</p>
		<p>artist ${dto.artist }</p>
		<p>painter ${dto.painter }</p>
		<p>material: ${dto.material }</p>
		
		<p>code: ${dto.code }</p> --%>
		</c:forEach>
	</div>
</div>
<script>
	$(function(){
		$(".TT").tooltip({
			trigger:"hover",
			placement:"top"
		});
	}); 
	
	var pageNum=${pageNum};
	var isLoading=false;
	
	$(window).on("scroll", function(){
		
		if(pageNum==0)	return;
		
		//console.log("scroll");

		// 위쪽으로 스크롤된 길이 구하기
		var scrollTop=$(window).scrollTop();
		// window 높이
		var windowHeight=$(window).height();
		// document 높이
		var documentHeight=$(document).height();

		// 바닥까지(문서의 끝) 스크롤 했는지 여부
		var isBottom=(documentHeight-50)<=scrollTop+windowHeight;
	
		if (isBottom){
			
			if ( isLoading ) return;
			isLoading=true;
			
			var page=pageNum+1;
			
			$.ajax({
				url:"resultJson.do",
				method:"get",
				data:{"searchKeyword":"${searchKeyword}",
					  "pageNum": page},
				success:function(data) {
					if ( data.length == 0 )  {
						pageNum=0;
						//alert('더이상 불러올 자료가 없습니다.');
					} else {
						pageNum=page;	
						$.each( data, function( idx, value ) {
							console.log(value.title);
							url1="${pageContext.request.contextPath }/art/searchDetail.do?searchKeyword=${searchKeyword }&seq="+value.seq;
							url2="${configDto.httpPath}"+"${pageContext.request.contextPath }"+value.imagepath;
							var cloneDiv = $('#clone').clone();
							cloneDiv.find("a").attr("href", url1);
							cloneDiv.find("a").attr("title", value.title);
							cloneDiv.find("img").attr("src", url2);
							cloneDiv.css("display","block").attr("id", "");
							cloneDiv.appendTo(".resultContainer .row").hide().fadeIn(idx*400);
						});
						
					}
				},
				complete: function(){
					isLoading=false;
				}
			});
		}

	});
</script>

<jsp:include page="../footer.jsp"/>
</body>
</html>