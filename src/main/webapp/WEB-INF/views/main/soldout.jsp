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
			<div class="col-xl" style="margin: 15px">
				<span style="font-size: 30px;margin:auto">
				  품절 임박 상품입니다! 구매를 서둘러 주세요!
				</span>
			</div>
		</div><!-- row -->
<div class="row" id="content">
					<!-- goodListSection -->
					<c:forEach items="${registerGoods}" var="registerGoodsList">
						<div class="col-xl-3" style="padding-bottom: 30px">
							<div class="border">
								<div class="row">
									<div class="col-xl">
										<div class="goodsListImgSection">
											<a href="${pageContext.request.contextPath}/main/goodsDetail/${registerGoodsList.regNo}">
												<img alt="" class="img-fluid"
												src="${pageContext.request.contextPath}/images/thumbnail/${registerGoodsList.thumbnailImg}" >
											</a>
										</div><!-- goodsListImgSection -->
									</div><!-- col -->
								</div><!-- row 상품 리스트 썸네일영역 -->
								<div class="row">
								
									<div class="col-xl">
										<div class="goodsListExplainSection" style="padding-bottom: 10px">
											<hr>
											${registerGoodsList.title}<br>
											<fmt:formatNumber value="${registerGoodsList.price}" var="CommaPrice"/>
											${CommaPrice}원
										</div><!-- goodsListExplainSection -->
									</div><!-- col -->
								</div><!-- row 상품 리스트 설명영역 -->
							</div><!-- 상품리스트 1개 영역 -->
						</div><!-- col=3 -->
					</c:forEach>	
					
					<!-- End : goodListSection  -->
				</div><!-- row -->
</div>
</body>
</html>