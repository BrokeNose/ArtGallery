<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- 홈 // -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="admin_art.jsp">ArtGallery Admin</a>
    </div>
	<!-- // 홈  -->    
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">작품<span class="sr-only">(current)</span></a></li>  
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">카테고리<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="adminCategory.do?categorytype=A">아티스트</a></li>
            <li><a href="adminCategory.do?categorytype=M">재료</a></li>
            <li><a href="adminCategory.do?categorytype=P">화파</a></li>
          </ul>
        </li>       
        <li><a href="list.jsp">회원</a></li> 
      </ul>

      <!-- right menu //  -->
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${pageContext.request.contextPath }/ "><span class="glyphicon glyphicon-picture" aria-hidden="true"></span></a></li>       
      </ul>
      <!-- // right menu -->
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
