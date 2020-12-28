<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="newOrderListSetcion">
		<div class="container-fluid">
			<div class="OrderListTitle">
				<div class="row">
					<div class="col-xl">
						신규주문목록
					</div>
				</div>
			</div><!-- userOrderListTitle -->
			<div class="OrderListInfo">
				<c:forEach items="${orderList}" var="orders">
					<div class="Orders border rounded" style="margin-bottom: 20px; padding-bottom: 10px">
					 	<div class="row" style="padding: 10px">
					 		<div class="col-xl" style="text-align: left; margin-left: 20px;">
					 			<fmt:parseDate value="${orders.orderdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
								<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
								<b>${formatDate} 주문</b>
					 		</div>
					 		<div class="col-xl" style="text-align: right; margin-right: 20px;" >
					 			<b>${orders.delState}</b>
					 		</div>
					 	</div>
					 	<c:forEach items="${orders.list}" var="orderLine">
						 	<div class="row">
						 		<div class="col-xl-1"></div>
						 		<div class="col-xl border rounded" style="margin: 5px">
						 			<div class="row">
						 				<div class="col-xl-2">
						 					<a href="${pageContext.request.contextPath}/main/goodsDetail/${orderLine.registerGoods.regNo}">
												<img alt="" class="img-fluid"
												src="${pageContext.request.contextPath}/images/thumbnail/${orderLine.registerGoods.thumbnailImg}" >
											</a>
						 				</div>
						 				<div class="col-xl-7" style="margin: auto;">
						 					<div class="row">
						 						<div class="col-xl" style="padding: 5px">
						 								${orderLine.registerGoods.title}
						 						</div>
						 					</div>
						 					<div class="row">
						 						<div class="col-xl" style="padding: 5px">
						 						<fmt:formatNumber value="${orderLine.totalPrice}" var="CommaPrice"/>
													${CommaPrice} 원
						 						</div>
						 					</div>
						 				</div>
						 			</div>
						 		</div>
						 		<div class="col-xl-1"></div>
						 	</div>
					 	</c:forEach><!-- orderLine -->
					 	<div class="row">
					 		<div class="col-xl" style="text-align: right">
					 			<a href="" class="btn btn-success">상품출고//위에 내용 바꿔야함 ..</a>
					 		</div>
					 		<div class="col-xl-1"></div>
					 	</div><!-- btn  -->
					</div><!-- orders -->
					
				</c:forEach>
			</div><!-- OrderListInfo -->
			
		</div><!-- container-fluid -->
	</div><!-- userOrderListSetcion -->



</body>
</html>