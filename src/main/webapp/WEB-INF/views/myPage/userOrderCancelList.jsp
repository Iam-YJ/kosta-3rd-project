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
	<div class="userOrderCancelListSetcion">
		<div class="container-fluid">
			<div class="OrderCancelListTitle">
				<div class="row">
					<div class="col-xl">
						환불신청목록
					</div>
				</div>
			</div><!-- OrderCancelListTitle -->
			<div class="OrderListInfo">
				<c:choose>
					<c:when test="${empty refundList}">
						환불을 신청한 상품이 없습니다.
					</c:when>
					<c:otherwise>
					
						<c:forEach items="${refundList}" var="refund">
							<div class="Orders border rounded" style="margin-bottom: 20px; padding-bottom: 10px">
							 	<div class="row" style="padding: 10px">
							 		<div class="col-xl" style="text-align: left; margin-left: 20px;">
							 			<fmt:parseDate value="${refund.refundDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
										<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
										<b>${formatDate} 환불신청</b>
							 		</div>
							 		<div class="col-xl" style="text-align: right; margin-right: 20px;" >
							 			<b>${refund.refundState}</b>
							 		</div>
							 	</div>
							 	<div class="row" style="padding: 10px">
							 		<div class="col-xl" style="text-align: left; margin-left: 20px;">
							 			주문자 : ${refund.userList.name}
							 		</div>
							 		<div class="col-xl">
							 			<fmt:formatNumber value="${refund.orders.realpay - 2500}" var="CommaPrice"/>
							 			환불예상금액 : ${CommaPrice} 원
							 		</div>
							 	</div>
							 	<div class="row" style="padding: 10px">
							 		<div class="col-xl" style="text-align: left; margin-left: 20px;">
							 			환불사유 : ${refund.refundReason} 
							 		</div>
							 	</div>
							 	<c:forEach items="${refund.orders.list}" var="orderLine">
								 	<div class="row" ">
								 		<div class="col-xl-1"></div>
								 		<div class="col-xl border rounded" style="margin: 5px; padding: 10px;">
								 			<div class="row">
								 				<div class="col-xl-6">
								 					${orderLine.registerGoods.title}
								 				</div>
								 				<div class="col-xl-3">
								 					수량 : ${orderLine.quntity}
								 				</div>
								 				<div class="col-xl-3">
								 					<fmt:formatNumber value="${orderLine.totalPrice}" var="CommaTotalPrice"/>
													총액 : ${CommaTotalPrice} 원
								 				</div>
								 			</div>
								 		</div>
								 		<div class="col-xl-1"></div>
								 	</div>
							 	</c:forEach><!-- orderLine -->
							 	<div class="row">
							 		<div class="col-xl-1"></div>
							 		<div class="col-xl">
							 			<c:if test="${refund.refundState eq '환불거절'}">
								 			<div class="row" style="padding: 10px">
								 				<div class="col-xl" style="text-align: left; margin-left: 20px;">
								 					환불거절 사유 : ${refund.refundReply}
									 			</div>
											</div>		
										</c:if>
							 		</div>
		 							<div class="col-xl-1"></div>
							 	</div><!-- btn  -->
							</div><!-- orders -->
							
						</c:forEach>
					
					</c:otherwise>
				</c:choose>
			</div><!-- OrderListInfo -->
			
		</div><!-- container-fluid -->
	</div><!-- userOrderListSetcion -->

</body>
</html>