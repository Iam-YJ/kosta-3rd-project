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
<c:forEach items="${review}" var="review">
상품번호 : ${review.registerGoods.regNo}<Br>
리뷰내용 : ${review.content}<br>
작성날짜 : ${review.regDate}<br>
</c:forEach>
</body>
</html>