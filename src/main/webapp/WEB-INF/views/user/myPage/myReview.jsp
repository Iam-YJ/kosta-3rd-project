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
리뷰내용 : ${review.content}<br>
작성날짜 : ${review.regDate}<br>
<a href="${pageConext.request.contextPath}/user/myPage/updateReviewForm/${review.reviewNo}">리뷰 수정하기</a><Br>
<a href="${pageContext.request.contextPath}/user/myPage/deleteReview/${review.reviewNo}">리뷰 삭제하기</a><br>
</c:forEach>
</body>
</html>