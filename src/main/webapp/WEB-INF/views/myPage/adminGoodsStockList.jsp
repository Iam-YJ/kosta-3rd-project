<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(document).on("click", "#btn", function() {
			var addSt = $(this).prev().val();
			var addReNo = $(this).prev().prev().val();

			//alert(addSt+" , "+ addReNo);
			$("#regNo").val(addReNo);
			$("#stock").val(addSt);

			$("#addStockForm").submit();
		})
	});
</script>

</head>
<body>

	<form action="${pageContext.request.contextPath}/admin/myPage/updateGoods" method="post" id="addStockForm">
		<input type="hidden" name="regNo" id="regNo"> 
		<input type="hidden" name="stock" id="stock">
	</form>

	<!-- --------------------------------------- -->

	<div class="adminRefundListSetcion">
		<div class="container-fluid">
			<div class="refundListTitle">
				<div class="row">
					<div class="col-xl">재고량 조회</div>
				</div>
				<br>
			</div>
			<!-- OrderCancelListTitle -->
			<div class="OrderListInfo">
				<c:if test="${empty list}">
					등록된 상품이 없습니다.
				</c:if>
				<c:if test="${not empty list}">
					<c:forEach items="${list}" var="registerGoods">
						<div class="Orders border rounded"
							style="margin-bottom: 20px; padding-bottom: 10px">
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="margin-left: 10px;">
									<b>상품번호 : ${registerGoods.regNo}</b>
								</div>
							</div>
							<div class="row" style="padding: 10px">
								<div class="col-xl-4" style="text-align: left; margin-left: 10px;">
									상품명 : ${registerGoods.name}
								</div>
								<div class="col-xl-2" style="text-align: left;">
									 재고량 : ${registerGoods.stock}
								</div>
								<div class="col-xl" style="text-align: right;">
									추가할 수량 : <input type="hidden" name="addRegNo" value="${registerGoods.regNo}" />
												<input type="text" name="addStock" id="addStock">
									 	<input type="button" value="추가" id="btn">
								</div>
							</div>
							<!-- btn  -->
						</div>
						<!-- orders -->
					</c:forEach>
				</c:if>
				<br>
				<hr>
				<br>





			</div>
			<!-- OrderListInfo -->
		</div>
		<!-- container-fluid -->
	</div>
	<!-- userOrderListSetcion -->



<form action="${pageContext.request.contextPath}/admin/myPage/updateGoods" method="post" id="addStockForm">
   <input type="hidden" name="regNo"  id="regNo">
   <input type="hidden" name="stock"  id="stock">
</form>




</body>
</html>