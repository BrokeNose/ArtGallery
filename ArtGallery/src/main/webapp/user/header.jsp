<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="main.jsp">
      	<span style="color: #333;"><i class="fas fa-university"></i> ArtGallery</span>
      </a>
    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
        	<li class="dropdown">
	          	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">카테고리 <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="list.jsp">아티스트</a></li>
		            <li><a href="#">재료</a></li>
		            <li><a href="#">화파</a></li>		           
		          </ul>
	        </li>
	       	<li><a href="#">의견보내기 </a></li>
	        <li class="disabled"><a href="#">shop</a></li>
        </ul> 	
      	<ul class="nav navbar-nav navbar-right">
	        <li><a href="#" alt="logout"><span style="font-size:1.3em;color: #333;"><i class="fas fa-sign-out-alt"></i></span></a></li>
	        <li><a href="#" alt="userinfo"><span style="font-size:1.3em;color: #333;"><i class="fas fa-user-tie"></i></span></a></li>
	        <li><a href="#" alt="login"><span style="font-size:1.3em;color: #333;"><i class="fas fa-user"></i></span></a></li>
	        
	        <li><a href="#" alt="favorite"><span style="font-size:1.3em;color: #333;"><i class="fas fa-heart"></i></span></a></a></li>
	        <li><a href="#" alt="search"><span style="font-size:1.3em;color: #333;"><i class="fas fa-search"></i></span></a></a></li>
	        
	        <li><a href="#" alt="admin"><span style="font-size:1.3em;color: #333;"><i class="fas fa-users-cog"></i></span></a></a></li>
       
      	</ul>
    </div>
    
  </div>
</nav>
