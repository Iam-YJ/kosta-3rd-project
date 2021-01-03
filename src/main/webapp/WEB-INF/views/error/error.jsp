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
<div class="container">
<h1> 에러페이지</h1><p>
<h3>메시지 : ${errMsg}</h3>
<a href="javascript:history.back()">뒤로가기</a>
<a href="${pageContext.request.contextPath}/">홈으로</a>
</div>
</body>
</html>