<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
					<div class="col-xl">
						환불신청 목록
					</div>
				</div>
			</div><!-- OrderCancelListTitle -->
			<div class="OrderListInfo">
				<c:if test="${empty refundList}">
					환불신청 내역이 없습니다.
				</c:if>
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
					 	<div class="row" style="padding: 20px">
					 		<div class="col-xl-1"></div>
					 		<div class="col-xl" style="text-align: right;">
					 			<a href="${pageContext.request.contextPath}/admin/myPage/orderRefundList/accessRefund/${refund.refundNo}" class="btn btn-success">환불승인</a>
					 			<input type="button" class="btn btn-outline-success" value="환불거절"
					 			data-toggle="collapse" data-target="#rejectRefund${refund.refundNo}">
					 		</div>
	 						<div class="col-xl-1"></div>
					 	</div><!-- btn  -->
					 	<form action="${pageContext.request.contextPath}/admin/myPage/orderRefundList/rejectRefund/${refund.refundNo}"
					 			method="post">
					 	<div class="row collapse" id="rejectRefund${refund.refundNo}">
					 		<div class="col-xl-1"></div>
					 		<div class="col-xl-2" style="text-align: center; margin: auto;">
					 			거절이유 : 
					 		</div>
					 			<input type="text" class="col-xl" id="refundReply" name="refundReply" style="margin: 0px 10px;">
					 			<input type="submit" class="col-xl-1 btn btn-success" id="rejectSubmitBtn" value="제출" style="margin: 0px 10px;">
	 						<div class="col-xl-2"></div>
					 	</div><!-- btn  -->
					 	</form>
					</div><!-- orders -->
					
				</c:forEach>
			</div><!-- OrderListInfo -->
			
		</div><!-- container-fluid -->
	</div><!-- userOrderListSetcion -->



</body>
</html>