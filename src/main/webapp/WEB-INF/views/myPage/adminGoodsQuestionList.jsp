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
					<div class="col-xl">상품문의 내역</div>
				</div>
			</div>
			<!-- OrderCancelListTitle -->
			<div class="OrderListInfo">
				<c:if test="${empty refundList}">
					상품문의 내역이 없습니다.
				</c:if>

				<c:forEach items="${GoodsQuestionList}" var="refund">

					<div class="Orders border rounded"
						style="margin-bottom: 20px; padding-bottom: 10px">
						<div class="row" style="padding: 10px">
							<div class="col-xl" style="margin-left: 40px;">
								<b>문의 ID : ${refund.userList.userId}</b>
							</div>
							<div class="col-xl" style="text-align: right; margin-left: 20px;">등록일
								${refund.regDate}</div>

						</div>
						<div class="row" style="padding: 10px">
							<div class="col-xl" style="text-align: left; margin-left: 20px;">
								문의 내용 : ${refund.content}</div>
						</div>
						<div class="row" style="padding: 20px">
							${refund.goodsAnswer.content}

							<c:if test="${empty refund.goodsAnswer.content}">
								<div class="col-xl" style="text-align: right;">
									<%-- <a href="${pageContext.request.contextPath}/admin/myPage/orderRefundList/accessRefund/${refund.refundNo}" class="btn btn-success">환불승인</a> --%>
									<input type="button" class="btn btn-outline-success"
										value="답변하기" data-toggle="collapse"
										data-target="#rejectRefund${refund.qgoodsNo}">
								</div>

								<div class="col-xl-1"></div>
						</div>
						<!-- btn  -->
						<form
							action="${pageContext.request.contextPath}/admin/myPage/goodsQuestionListAnswer/${refund.qgoodsNo}"
							method="post">
							<div class="row collapse" id="rejectRefund${refund.qgoodsNo}">
								<div class="col-xl-1"></div>
								<div class="col-xl-2" style="text-align: center; margin: auto;">
									답변내용 :</div>
								<input type="text" class="col-xl" id="refundReply"
									name="refundReply" style="margin: 0px 10px;"> <input
									type="submit" class="col-xl-1 btn btn-success"
									id="rejectSubmitBtn" value="제출" style="margin: 0px 10px;">
								<div class="col-xl-2"></div>
							</div>
							<!-- btn  -->
						</form>

						</c:if>
						
						<c:if test="${not empty refund.goodsAnswer.content}">
								<div class="col-xl" style="text-align: right;">
									<%-- <a href="${pageContext.request.contextPath}/admin/myPage/orderRefundList/accessRefund/${refund.refundNo}" class="btn btn-success">환불승인</a> --%>
									<input type="button" class="btn btn-outline-success"
										value="수정하기" data-toggle="collapse"
										data-target="#rejectRefund${refund.qgoodsNo}">
								</div>

								<div class="col-xl-1"></div>
						</div>
						<!-- btn  -->
						<form
							action="${pageContext.request.contextPath}/admin/myPage/goodsQuestionUpdateAnswer/${refund.goodsAnswer.agoodsNo}"
							method="post">
							<div class="row collapse" id="rejectRefund${refund.qgoodsNo}">
								<div class="col-xl-1"></div>
								<div class="col-xl-2" style="text-align: center; margin: auto;">
									수정내용 :</div>
								<input type="text" class="col-xl" id="refundReply"
									name="refundReply" style="margin: 0px 10px;"> <input
									type="submit" class="col-xl-1 btn btn-success"
									id="rejectSubmitBtn" value="제출" style="margin: 0px 10px;">
								<div class="col-xl-2"></div>
							</div>
							<!-- btn  -->
						</form>

						</c:if>


					</div>
					<!-- orders -->


				</c:forEach>
			</div>
			<!-- OrderListInfo -->

		</div>
		<!-- container-fluid -->
	</div>
	<!-- userOrderListSetcion -->



</body>
</html>