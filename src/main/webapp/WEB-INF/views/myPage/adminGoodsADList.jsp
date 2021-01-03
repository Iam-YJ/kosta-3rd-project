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
	<div class="adminRefundListSetcion">
		<div class="container-fluid">
			<div class="refundListTitle">
				<div class="row">
					<div class="col-xl">광고상품 조회</div>
				</div>
				<br>
			</div>
			<!-- OrderCancelListTitle -->
			<div class="OrderListInfo">
				<c:choose>
					<c:when test="${empty list}">
						등록된 광고 상품이 없습니다.
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="registerGoods">
							<div class="Orders border rounded" style="margin-bottom: 20px; padding-bottom: 10px">
								<div class="row" style="padding: 10px">
									<div class="col-xl" style="margin-left: 10px; text-align: left;">
										<b>상품고유번호 : ${registerGoods.regNo}</b>
									</div>
									<div class="col-xl" style="text-align: right;">
										카테고리 : ${registerGoods.mainCategories.mainCategoryName} -
										${registerGoods.subCategories.subCategoryName}
									</div>
								</div>
								<div class="row" style="padding: 10px">
									<div class="col-xl-8" style="text-align: left; margin-left: 10px;">
										상품명 : ${registerGoods.title}
									</div>
									<div class="col-xl" style="text-align: right; margin-left: 10px;">
										<b>광고사용중</b>
										<input type="button" value="취소하기" id="b" onclick="location.href='${pageContext.request.contextPath}/admin/myPage/goodsADListDelete/${registerGoods.regNo}'" /> </b>
									</div>
								</div>
								<!-- btn  -->
							</div>
							<!-- orders -->
						</c:forEach>
					
					</c:otherwise>
				</c:choose>
			

					
			</div>
			<!-- OrderListInfo -->
		</div>
		<!-- container-fluid -->
	</div>
	<!-- userOrderListSetcion -->


</body>
</html>