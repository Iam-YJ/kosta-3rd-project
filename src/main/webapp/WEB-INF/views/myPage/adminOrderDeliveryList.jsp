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
<div class="goodsDetailBottom">
	<div class="refundListTitle">
				<div class="row">
					<div class="col-xl">배송 내역</div>
				</div>
				<br>
			</div>
		<ul class="nav nav-tabs row border">
			<li class="nav-item col-xl">
			  <a class="nav-link active btn btn-outline-success" data-toggle="tab" href="#home">배송 준비중 상품</a>
			</li>
			<li class="nav-item col-xl">
			  <a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu1">배송 중인 상품</a>
			</li>
			<li class="nav-item col-xl">
			  <a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu2">배송 완료된 상품</a>
			</li>
		
		</ul>

<div class="tab-content">
	<div id="home" class="tab-pane active"><br>
				<div class="OrderListInfo">
					<c:choose>
						<c:when test="${empty newOrders}">
							배송 준비중인 상품이 없습니다.
						</c:when>
					    <c:otherwise>
			
						<div class="row">
							<div class="col-xl">배송 준비인 상품</div>
						</div>
						
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
											<c:forEach items="${orders.list}" var="orderLine">
											   주문상품 : ${orderLine.registerGoods.title}<br>
											</c:forEach>
									</div>
		
									<div class="row" style="padding: 10px">
										<div class="col-xl" style="text-align: left; margin-left: 20px;">
											<fmt:parseDate value="${orders.orderdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
					 					<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
					 					주문일 ${formatDate}</div>
									</div>
		
									<!-- btn  -->
								</div>
								<!-- orders -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
						
				</div>
		</div>
	<div id="menu1" class="tab-pane fade"><br>
					<div class="OrderListInfo">
					<c:choose>
						<c:when test="${empty nowOrders}">
							배송 중인 상품이 없습니다.
						</c:when>
					    <c:otherwise>
			
						<div class="row">
							<div class="col-xl">배송 중인 상품</div>
						</div>
						
							<c:forEach items="${nowOrders}" var="orders">
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
											<c:forEach items="${orders.list}" var="orderLine">
											   주문상품 : ${orderLine.registerGoods.title}<br>
											</c:forEach>
									</div>
		
		
									<div class="row" style="padding: 10px">
										<div class="col-xl" style="text-align: left; margin-left: 20px;">
										<fmt:parseDate value="${orders.orderdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
					 					<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
					 					주문일 ${formatDate}</div>
									</div>
		
									<!-- btn  -->
								</div>
								<!-- orders -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
						
				</div>
		</div>
	<div id="menu2" class="tab-pane fade"><br>
					<div class="OrderListInfo">
					<c:choose>
						<c:when test="${empty lastOrders}">
							배송 완료된 상품이 없습니다.
						</c:when>
					    <c:otherwise>
			
						<div class="row">
							<div class="col-xl">배송 완료된 상품</div>
						</div>
						
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
											<c:forEach items="${orders.list}" var="orderLine">
											   주문상품 : ${orderLine.registerGoods.title}<br>
											</c:forEach>
									</div>
		
									<div class="row" style="padding: 10px">
										<div class="col-xl" style="text-align: left; margin-left: 20px;">
											<fmt:parseDate value="${orders.orderdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
					 					<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
					 					주문일 ${formatDate}</div>
									</div>
		
									<!-- btn  -->
								</div>
								<!-- orders -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
						
				</div>
			</div>
		</div>
	</div>

</body>
</html>