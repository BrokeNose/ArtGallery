<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이미지 위에서 마우스 휠을 돌려보세요..<br>
<img id="oImage" src="http://www.blueb.co.kr/SRC/javascript/image/test.jpg" onmousewheel="Picture()">
</body>
<SCRIPT>
var count = 10;
function Picture()
{
count = Counting(count);
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
    oImage.style.zoom = count + '0%';    
}
</SCRIPT>
</html>