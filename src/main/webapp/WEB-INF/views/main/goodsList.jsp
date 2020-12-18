<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<a href="#">홈</a>
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
			<div class="col-xl-2">
			</div>
			<div class="col-xl" style="margin: 15px">
				<c:forEach items="${goodsListMap.mainCategories}" var="mainCate">
					<span style="padding-right: 20px; font-size: 20px">
						<a href="#">${mainCate.mainCategoryName}</a>
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
								<a href="#">${mainCate.mainCategoryName}</a>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
					
					<!-- 그그그그그그 메인카테고리가 있을때  메인카테고리에 대한 서브카테고리 출력-->
					
					</c:otherwise>
				</c:choose>
			</div><!-- col-2 -->
						
			<div class="col-xl-10">
				<div class="row">
					<div class="col-xl" style="margin: 10px">
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
					<div class="col-xl">
						<c:forEach items="${goodsListMap.registerGoodsList}" var="registerGoodsList">
						thumbnail : ${registerGoodsList.thumbnailImg}<br>
						상품명 : ${registerGoodsList.title}<br>
						상품가격 : ${registerGoodsList.price}<hr>
						</c:forEach>	
					</div><!-- col -->
				</div><!-- row -->
			</div><!-- col-10 -->
		</div><!-- row -->
	</div><!-- container -->
</div><!-- goodsList -->


	



</body>
</html>