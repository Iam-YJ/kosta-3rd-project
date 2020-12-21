<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>일치하는 정보가 없습니다.</h1>
<form action="${pageContext.request.contextPath}/main/login" method="post">
	<table style="width:350px">
		<tr>
			<td width="70px">ID</td>
			<td><input type="text" name="userId" size="30"></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td><input type="password" name="passWord" size="31"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>
</body>
</html>