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

	<%-- <c:forEach items="${list}" var="registerGoods">
   			 ${registerGoods.regNo}<br>
             ${registerGoods.title}<br>
             ${registerGoods.detail}<br>
             ${registerGoods.thumbnailImg}<br>
             ${registerGoods.adImg}<br>
             ${registerGoods.name}<br>
             ${registerGoods.options}<br>
             ${registerGoods.area}<br>
             ${registerGoods.method}<br>
             ${registerGoods.stock}<br>
  추가할 수량은? :
  <input type="hidden" name="addRegNo" value="${registerGoods.regNo}"/>
  <input type="text" name="addStock" id="addStock">
  <input type="button" value="추가" id="btn">
             ${registerGoods.price}<br>
             ${registerGoods.sellcount}<br>
             ${registerGoods.ad}<br>
             ${registerGoods.regDate}<br>
             ${registerGoods.mainCategories}<br>
             ${registerGoods.subCategories}<br>
             ${registerGoods.reviewList}<br>
             <p>
            
</c:forEach> --%>

	<form
		action="${pageContext.request.contextPath}/admin/myPage/updateGoods"
		method="post" id="addStockForm">
		<input type="hidden" name="regNo" id="regNo"> <input
			type="hidden" name="stock" id="stock">
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
								<div class="col-xl" style="margin-left: 40px;">
									<b>상품고유번호 : ${registerGoods.regNo}</b>
								</div>
								<div class="col-xl"
									style="text-align: right; margin-right: 40px;"></div>
							</div>
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="text-align: left; margin-left: 20px;">
									상품명 : ${registerGoods.name} &nbsp&nbsp&nbsp 재고량 :
									${registerGoods.stock}&nbsp&nbsp&nbsp 추가할 수량은? : <input
										type="hidden" name="addRegNo" value="${registerGoods.regNo}" />
									<input type="text" name="addStock" id="addStock"> <input
										type="button" value="추가" id="btn">
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





</body>
</html>