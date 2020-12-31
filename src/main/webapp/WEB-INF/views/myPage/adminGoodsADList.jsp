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
				<c:if test="${empty list}">
					등록된 광고 상품이 없습니다.
				</c:if>

				<!--  -->
				<c:if test="${not empty list}">
					<c:forEach items="${list}" var="registerGoods">
						<div class="Orders border rounded"
							style="margin-bottom: 20px; padding-bottom: 10px">
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="margin-left: 40px;">
									<b>상품고유번호 : ${registerGoods.regNo}</b>
								</div>
								<div class="col-xl"
									style="text-align: right; margin-right: 40px;"></div>
							</div>
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="text-align: left; margin-left: 20px;">
									카테고리 : ${registerGoods.mainCategories.mainCategoryName} &nbsp -
									&nbsp ${registerGoods.subCategories.subCategoryName}
									&nbsp&nbsp&nbsp 상품명 : ${registerGoods.title}&nbsp&nbsp&nbsp&nbsp&nbsp
									<b>광고사용중 &nbsp&nbsp <input type="button" value="취소하기" id="b"
										onclick="location.href='${pageContext.request.contextPath}/admin/myPage/goodsADListDelete/${registerGoods.regNo}'" /> </b>

								</div>
							</div>
							<!-- btn  -->
						</div>
						<!-- orders -->
					</c:forEach>
				</c:if>
			</div>
			<!-- OrderListInfo -->
		</div>
		<!-- container-fluid -->
	</div>
	<!-- userOrderListSetcion -->


</body>
</html>