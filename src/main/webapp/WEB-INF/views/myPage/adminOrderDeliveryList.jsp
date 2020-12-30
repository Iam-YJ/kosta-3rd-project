<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="adminRefundListSetcion">
		<div class="container-fluid">
			<div class="refundListTitle">
				<div class="row">
					<div class="col-xl">배송 내역</div>
				</div>
				<br>
			</div>
			<!-- OrderCancelListTitle -->
			<div class="OrderListInfo">
				<c:if test="${empty lastOrders}">
					배송 완료된 상품이 없습니다.
				</c:if>
				<c:if test="${empty newOrders}">
					배송준비중인 상품이 없습니다.
				</c:if>



				<div class="row">
					<div class="col-xl">배송 완료 상품</div>
				</div>
				<c:if test="${not empty newOrders}">
					<c:forEach items="${newOrders}" var="orders">
						<div class="Orders border rounded"
							style="margin-bottom: 20px; padding-bottom: 10px">
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="margin-left: 40px;">
									<b>주문번호 : ${orders.orderNo}</b>
								</div>
								<div class="col-xl"
									style="text-align: right; margin-right: 40px;">구매자 :
									${orders.userList.userId}</div>
							</div>
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="text-align: left; margin-left: 20px;">
									배송지 : ${orders.addr}</div>
							</div>


							<div class="row" style="padding: 10px">
								<div class="col-xl" style="text-align: left; margin-left: 20px;">
									주문일 : ${orders.orderdate}</div>
							</div>

							<!-- btn  -->
						</div>
						<!-- orders -->
					</c:forEach>
				</c:if>
				<br><hr><br>

				<div class="row">
					<div class="col-xl">배송 준비중 상품</div>
				</div>
				<c:if test="${not empty lastOrders}">
					<c:forEach items="${lastOrders}" var="orders">
						<div class="Orders border rounded"
							style="margin-bottom: 20px; padding-bottom: 10px">
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="margin-left: 40px;">
									<b>주문번호 : ${orders.orderNo}</b>
								</div>
								<div class="col-xl"
									style="text-align: right; margin-right: 40px;">구매자 :
									${orders.userList.userId}</div>
							</div>
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="text-align: left; margin-left: 20px;">
									배송지 : ${orders.addr}</div>
							</div>


							<div class="row" style="padding: 10px">
								<div class="col-xl" style="text-align: left; margin-left: 20px;">
									주문일 : ${orders.orderdate}</div>
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