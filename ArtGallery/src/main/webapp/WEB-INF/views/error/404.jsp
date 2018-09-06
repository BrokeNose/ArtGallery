<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error/404.jsp</title>
<style>
	.btn {
	  display: inline-block;
	  padding: 6px 12px;
	  margin-bottom: 0;
	  font-size: 14px;
	  font-weight: normal;
	  line-height: 1.42857143;
	  text-align: center;
	  white-space: nowrap;
	  vertical-align: middle;
	  -ms-touch-action: manipulation;
	      touch-action: manipulation;
	  cursor: pointer;
	  -webkit-user-select: none;
	     -moz-user-select: none;
	      -ms-user-select: none;
	          user-select: none;
	  background-image: none;
	  border: 1px solid transparent;
	  border-radius: 4px;
	}
	.btn:focus,
	.btn:active:focus,
	.btn.active:focus,
	.btn.focus,
	.btn:active.focus,
	.btn.active.focus {
	  outline: 5px auto -webkit-focus-ring-color;
	  outline-offset: -2px;
	}
	.btn:hover,
	.btn:focus,
	.btn.focus {
	  color: #333;
	  text-decoration: none;
	}
	.btn:active,
	.btn.active {
	  background-image: none;
	  outline: 0;
	  -webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
	          box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
	}
	.btn-default {
	  color: #333;
	  background-color: #fff;
	  border-color: #ccc;
	}
	.btn-default:focus,
	.btn-default.focus {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #8c8c8c;
	}
	.btn-default:hover {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #adadad;
	}
	.btn-default:active,
	.btn-default.active,
	.open > .dropdown-toggle.btn-default {
	  color: #333;
	  background-color: #e6e6e6;
	  border-color: #adadad;
	}
	.btn-default:active:hover,
	.btn-default.active:hover,
	.open > .dropdown-toggle.btn-default:hover,
	.btn-default:active:focus,
	.btn-default.active:focus,
	.open > .dropdown-toggle.btn-default:focus,
	.btn-default:active.focus,
	.btn-default.active.focus,
	.open > .dropdown-toggle.btn-default.focus {
	  color: #333;
	  background-color: #d4d4d4;
	  border-color: #8c8c8c;
	}
	.btn-default:active,
	.btn-default.active,
	.open > .dropdown-toggle.btn-default {
	  background-image: none;
	}
	.btn-default.disabled:hover,
	.btn-default[disabled]:hover,
	fieldset[disabled] .btn-default:hover,
	.btn-default.disabled:focus,
	.btn-default[disabled]:focus,
	fieldset[disabled] .btn-default:focus,
	.btn-default.disabled.focus,
	.btn-default[disabled].focus,
	fieldset[disabled] .btn-default.focus {
	  background-color: #fff;
	  border-color: #ccc;
	}
	.btn-default .badge {
	  color: #fff;
	  background-color: #333;
	}
	a:link { 
    text-decoration: none;
	}
	
</style>
</head>
<body>
<body bgcolor="#28bebe" style="text-align: center;">
<img src="${pageContext.request.contextPath }/resources/images/404.jpg" alt="404 error" /><br/>
<a href="${pageContext.request.contextPath }/" class="btn btn-default"> 인덱스로 가기</a>
</body>
</html>