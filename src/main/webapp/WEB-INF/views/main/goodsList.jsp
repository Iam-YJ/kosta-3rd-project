<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="goodsList">
	<div class="container">
		<div class="row">
			<div style="margin: 5px 0px;">
				<div class="col-xl">
					<a href="${pageContext.request.contextPath}/main/goodsList/0/0/0">홈</a>
					<c:choose>
						<c:when test="${goodsListMap.main==0}">
							 > 전체상품조회
						</c:when>
						<c:otherwise>
							 > ${goodsListMap.registerGoods.mainCategories.mainCategoryName}
							 
							 <c:choose>
								<c:when test="${goodsListMap.sub==0}">
									 > 전체상품조회
								</c:when>
								<c:otherwise>
									 > ${goodsListMap.registerGoods.subCategories.subCategoryName}
								</c:otherwise>
							</c:choose>
							 
						</c:otherwise>
					</c:choose>
				
				</div><!-- col-xl -->
			</div>
		</div><!-- row -->
		
		
		<div class="row" style="background-color: #f0f6e8">
			<div class="col-xl-2"></div>
			<div class="col-xl" style="margin: 15px">
				<c:forEach items="${goodsListMap.mainCategories}" var="mainCate">
					<span style="padding-right: 20px; font-size: 20px">
						<a href="${pageContext.request.contextPath}/main/goodsList/${mainCate.mainCategoryNo}/0/0">${mainCate.mainCategoryName}</a>
					</span>
				</c:forEach>	
			</div>
		</div><!-- row -->
		
		<div class="row">
			<div class="col-xl-2" style="background-color: #f0f6e8">
				<c:choose>
					<c:when test="${goodsListMap.main==0}">
						<c:forEach items="${goodsListMap.mainCategories}" var="mainCate">
							<div style="font-size: 20px; margin:10px 5px">
								<a href="${pageContext.request.contextPath}/main/goodsList/${mainCate.mainCategoryNo}/0/0">${mainCate.mainCategoryName}</a>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div style="font-size: 20px; margin:10px 5px">
							${goodsListMap.registerGoods.mainCategories.mainCategoryName}
						</div>
						<c:forEach items="${goodsListMap.registerGoods.mainCategories.subCategoryList}" var="subCate" varStatus="subIndex">
							<div style="font-size: 14px; margin:10px 5px">
								<a href="${pageContext.request.contextPath}/main/goodsList/${goodsListMap.registerGoods.mainCategories.mainCategoryNo}/${subCate.subCategoryNo}/0">${subCate.subCategoryName}</a>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div><!-- col-2 -->
						
			<div class="col-xl-10">
				<div class="row">
					<div class="col-xl" style="margin-top: 20px">
						<!-- select box구간 -->
						
						<div class="row">
							<div class="col-xl-10"></div>
							<div class="col-xl-2">
								<div class="form-group" style="text-align: right;">
									<select class="form-control" id="sel1" name="sellist1">
										<option value="1">최신순</option>
										<option value="2">인기순</option>
										<option value="3">가격순</option>
									</select>
								</div>	
							</div>
						</div><!-- row -->
						
						<!-- select box구간  끝-->
					</div>					
				</div><!-- row -->
				
				<div class="row">
					<!-- goodListSection -->
					<c:forEach items="${goodsListMap.registerGoodsList}" var="registerGoodsList">
						<div class="col-xl-3" style="padding-bottom: 30px">
							<div class="border">
								<div class="row">
									<div class="col-xl">
										<div class="goodsListImgSection">
											<a href="${pageContext.request.contextPath}/main/goodsDetail/${registerGoodsList.regNo}">
												<img alt="" class="center-block"
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
			</div><!-- col-10 -->
		</div><!-- row -->
	</div><!-- container -->
</div><!-- goodsList -->


	



</body>
</html>