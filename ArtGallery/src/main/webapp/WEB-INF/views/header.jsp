<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-default navbar-fixed-top" >
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${pageContext.request.contextPath }/">
      	<span style="color: #333;"><i class="fas fa-university"></i> <strong>ArtGallery</strong></span>
      </a>
    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
        	<li class="dropdown">
	          	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">카테고리 <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="${pageContext.request.contextPath }/category/list.do?soncategorytype=A">아티스트</a></li>
		            <li><a href="${pageContext.request.contextPath }/category/list.do?soncategorytype=M">재료</a></li>
		            <li><a href="${pageContext.request.contextPath }/category/list.do?soncategorytype=P">화파</a></li>		           
		          </ul>
	        </li>
	       	<li><a id="showBtn" href="#">의견보내기 </a></li>
	       	<c:if test="${not empty id}">
       			<li><a href="${pageContext.request.contextPath }/auction/house.do">경매</a></li>
	        </c:if>
        </ul>
      	<ul class="nav navbar-nav navbar-right">
      		<c:choose>
      			<c:when test="${not empty id }">      		
      				<li><a ><strong>${id }</strong>님 반갑습니다.</a></li>
      				<li><a href="javascript:signOut()" title="로그아웃"><span style="font-size:1.3em;color: #333;"><i class="fas fa-sign-out-alt"></i></span></a></li>
      				<li><a href="${pageContext.request.contextPath }/user/info.do" title="회원정보"><span style="font-size:1.3em;color: #333;"><i class="fas fa-user-tie"></i></span></a></li>
					<li><a href="${pageContext.request.contextPath }/art/favorArtList.do" title="관심작품"><span style="font-size:1.3em;color: #333;"><i class="fas fa-heart"></i></span></a></li>
      			</c:when>
      			<c:otherwise>
      				<li><a id="signinForm" href="#" title="로그인"><span style="font-size:1.3em;color: #333;"><i class="fas fa-user"></i></span></a></li>
	        		<li><a href="${pageContext.request.contextPath }/user/signup_form.do" title="회원가입"><span style="font-size:1.3em;color: #333;"><i class="fas fa-user-plus"></i></span></a></li>
      			</c:otherwise>
      		</c:choose>
	        <li><a href="#" title="검색" id="search_icon"><span style="font-size:1.3em;color: #333;"><i class="fas fa-search"></i></span></a></li>
	       	<c:if test="${roll eq 'A' }">
	        	<li style="margin-right:10px"><a href="${pageContext.request.contextPath }/admin/home.do" title="관리자"><span style="font-size:1.3em;color: #333;"><i class="fas fa-users-cog"></i></span></a>
	        	</li>
	        	<span class="badge" style="position:absolute;right:-5px;margin-right:10px;margin-top:10px;background-color: #cc0000;">14</span>
	        	
	        </c:if>
      	</ul>
    </div>
  </div>
</nav>
<style>
	.h_s {
		display: none;
	}
</style>
<!-- search// -->
<div id="search_box" class="h_s"> 	
 	<div class="navbar-header" style="; width:100%;">
 		<a class="navbar-brand" href="#" id="search_close">
	      	<span style="color: #333;"><i class="fas fa-arrow-left"></i> </span>
	    </a>
		<form class="navbar-form navbar-left" role="search">
		  <div class="form-group">
		    <input type="text" class="form-control" placeholder="Search">
		  </div>
		  <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>		
		</form>		
 	</div> 	
</div>
<!-- modal// -->
<div class="modal fade" id="myModal">
	<!-- modal-lg  | default | modal-sm -->	
	<div class="modal-dialog modal-sm"> <!--크기옵션 xs md lg-->
		<div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span>&times;</span><span class="sr-only">모달 닫기</span></button>
	        <h4 class="modal-title">의견보내기</h4>
	      </div>
	      <div class="modal-body">
	        <textarea class="form-control" rows="10"></textarea>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary">의견보내기</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script>
	$("#signinForm").click(function(){
		var currentPathname=$(location).attr('pathname');
		var currentParam=$(location).attr('search');
		var currentUrl=currentPathname+currentParam;
		$("#signinForm").attr("href", "${pageContext.request.contextPath }/user/signin_form.do?url="+currentUrl)
	});
	
	//모달이 완전히 보여졌을때 실행할 함수 등록
	$("#myModal").on("shown.bs.modal", function(){});
	//모달이 완전히 숨겨졌을때 실행할 함수 등록
	$("#myModal").on("hidden.bs.modal", function(){});


	$("#showBtn").click(function(){
		$("#myModal").modal("show");	
	});
	
	//search box open
	$("#search_icon").click(function() {
		$("#search_box").css("display","block").animate({top:"0px"});
	});
	//search box close
	$("#search_close").click(function() {
		$("#search_box").css("display","none").animate({top:"-60px"});
	});
	
	function signOut() {
		confirm("로그아웃 됐습니다.");
		location.href="${pageContext.request.contextPath }/user/signout.do";
	};

</script>
