<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<h3>인덱스 페이지 입니다.</h3>
<a href="admin/adminCategory.do?categorytype=A">아티스트</a>
<br />
<a href="user/list.do?soncategorytype=A">메인에서 아티스트</a>
<a href="user/list.do?soncategorytype=M">메인에서 재료</a>
<a href="user/list.do?soncategorytype=P">메인에서 화파</a>
</body>
</html>