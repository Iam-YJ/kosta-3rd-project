<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
   <div class="row" style="background-color: #f0f6e8">
			<div class="col-xl" style="margin: 15px;">
				<span style="font-size: 25px;margin:auto">
				  고객님들의 따끈한 리뷰가 달린 상품은? 바로 구매하세요!
				</span>
			</div>
	</div><!-- row -->
		<div class="row" >
			<div class="col-xl" style="margin: 15px">
			</div>
	</div><!-- row -->
	<div class="row" id="content">
					<!-- goodListSection -->
					<c:forEach items="${review}" var="review">
						<div class="col-xl-3" style="padding-bottom: 30px">
							<div class="border">
								<div class="row">
									<div class="col-xl" style="text-align: center;margin:auto;">
										<div class="goodsListImgSection" >
											<a href="${pageContext.request.contextPath}/main/goodsDetail/${review.registerGoods.regNo}">
												<img alt=""  width="195.91px" height="250px"
												src="${pageContext.request.contextPath}/images/thumbnail/${review.registerGoods.thumbnailImg}" >
											</a>
										</div><!-- goodsListImgSection -->
									</div><!-- col -->
								</div><!-- row 상품 리스트 썸네일영역 -->
								<div class="row">
								
									<div class="col-xl">
										<div class="goodsListExplainSection" style="padding-bottom: 10px">
											<hr>
											${review.registerGoods.title}<br>
											<fmt:formatNumber value="${review.registerGoods.price}" var="CommaPrice"/>
											${CommaPrice}원
										</div><!-- goodsListExplainSection -->
									</div><!-- col -->
								</div><!-- row 상품 리스트 설명영역 -->
							  <div>
							   리뷰 : ${review.content}<br>
							   <fmt:parseDate value="${review.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
					 		   <fmt:formatDate value="${parseDateTime}" pattern="yyyy.MM.dd HH:mm" var="formatDate"/>
							   작성일 : ${formatDate}
							  </div>
							</div><!-- 상품리스트 1개 영역 -->
						</div><!-- col=3 -->
					</c:forEach>	
					
					<!-- End : goodListSection  -->
			</div><!-- row -->
</div>
</body>
</html>