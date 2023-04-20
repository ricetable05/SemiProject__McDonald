<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<h1>테스트입니다.</h1>

<form action="<%=request.getContextPath()%>/index.run" method="get">
   <input type="text" name="test" value="test"/>
   <input type="submit" value="전송"/>
</form>

</body>
</html>