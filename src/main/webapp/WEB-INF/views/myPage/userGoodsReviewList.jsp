<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="userCartSection">
	<div class="container-fluid">
		<div class=titleSection>
			<div class="row">
				<div class="col-xl" style="text-align: left;">
					나의 장바구니 목록
				</div>
			</div>
		</div>
	<c:forEach items="${review}" var="review">
		<div class="row border border-left-0 border-right-0">
			<div class="col-xl-2">
				<a href="${pageContext.request.contextPath}/main/goodsDetail/${review.registerGoods.regNo}">
					<img  class = "img-fluid" id="thumbnail"src="${pageContext.request.contextPath}/images/thumbnail/${review.registerGoods.thumbnailImg}">
				</a>
			</div>
			<div class="col-xl-4">
				<div class="row col-xl" style="font-size: 20px; padding: 10px;">
					${review.registerGoods.title}
				</div>
			</div>
			
			<div class="col-xl">
				리뷰내용 : ${review.content}<br>
				<fmt:parseDate value="${review.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
				<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
				등록일 : ${formatDate}<br>
				<a href="${pageConext.request.contextPath}/user/myPage/updateReviewForm/${review.reviewNo}">리뷰 수정하기</a>
				<a href="${pageContext.request.contextPath}/user/myPage/deleteReview/${review.reviewNo}">리뷰 삭제하기</a><br>
			</div>
		</div>
	</c:forEach>
</div>
</div>
</body>
</html>