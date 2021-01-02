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
<div class="userReviewSection">
	<div class="container-fluid">
		<div class=titleSection>
			<div class="row">
				<div class="col-xl" style="text-align: left;">
					내가 작성한 구매후기 목록
				</div>
			</div>
		</div>
		<c:choose>
			<c:when test="${empty reviewList}">
				<div class="row">
					<div class="col-xl">
						지금까지 작성한 구매후기가 없습니다.
						<a href="${pageContext.request.contextPath}/user/myPage">후기 작성하러 가기</a>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${reviewList}" var="review">
					<div class="row border rounded" style="margin-top: 20px;">
						<div class="col-xl-2" style="margin: auto; text-align: center; margin-top: 10px; margin-bottom: 10px;">
							<a href="${pageContext.request.contextPath}/main/goodsDetail/${review.registerGoods.regNo}">
								<img  class = "img-fluid" id="thumbnail"src="${pageContext.request.contextPath}/images/thumbnail/${review.registerGoods.thumbnailImg}">
							</a>
						</div>
						<div class="col-xl" style="margin: auto;">
							<div class="row">
								<div class="col-xl-1"></div>
								<div class="col-xl" style="text-align: left;">
									${review.registerGoods.title}
								</div>
								<div class="col-xl-3" style="text-align: right;">
									<fmt:parseDate value="${review.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
									<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
									${formatDate}
								</div>
							</div>
							<div class="row">
								<div class="col-xl-1"></div>
								<div class="col-xl" style="text-align: left;">
									<div class="row">
										<div class="col-xl">
											<hr>
										</div>
									</div>
									<div class="row">
										<div class="col-xl">
											${review.content}
										</div>
										<div class="col-xl-3" style="text-align: right; color: gray; font-size: 12px;">
											<a href="#" class="btn btn-outline-light" style="color: gray; font-size: 12px;" 
											data-toggle="collapse" data-target="#review${review.reviewNo}">수정</a>|
											<a href="${pageContext.request.contextPath}/user/myPage/deleteReview/${review.reviewNo}" class="btn btn-outline-light" style="color: gray; font-size: 12px;">삭제</a>
										</div>
									</div>
									<div id="review${review.reviewNo}" class="collapse">
									
										<form method="post" action="${pageContext.request.contextPath}/user/myPage/updateReview/${review.reviewNo}">
											<div class="row" style="margin-top: 5px; margin-bottom: 15px;">
												<div class="col-xl">
													<textarea rows="2" name="content" class="form-control">${review.content}</textarea>
												</div>
												<div class="col-xl-2" style="margin: auto; text-align: center;">
													<input type="submit" class="btn btn-outline-success" value="수정">
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-1"></div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</div><!-- container-fluid -->
</div><!-- userReviewSection -->
</body>
</html>