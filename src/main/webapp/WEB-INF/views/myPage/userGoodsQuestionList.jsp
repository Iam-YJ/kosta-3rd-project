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
				<c:if test="${empty goodsQuestionList}">
					등록된 상품 문의가 없습니다.
				</c:if>

				<div class="row">
					<div class="col-xl">나의 상품 문의</div>
				</div>
				<c:if test="${not empty goodsQuestionList}">
					<c:forEach items="${goodsQuestionList}" var="q">
						<div class="Orders border rounded"
							style="margin-bottom: 20px; padding-bottom: 10px">
							<div class="row" style="padding: 10px">
								<div class="col-xl"
									style="text-align: right; margin-right: 40px;">문의 작성일 :
									${q.regDate}</div>
							</div>
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="text-align: left; margin-left: 20px;">
									문의 내용 : ${q.content}</div>
							</div>

							
						<c:if test="${not empty q.goodsAnswer.content }">
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="text-align: left; margin-left: 20px;">
									답변 내용 : ${q.goodsAnswer.content}</div>
							</div>
						</c:if>
						<c:if test="${empty q.goodsAnswer.content }">
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="text-align: left; margin-left: 20px;">
									답변이 등록되지 않았습니다. </div>
							</div>
						</c:if>
						
						
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