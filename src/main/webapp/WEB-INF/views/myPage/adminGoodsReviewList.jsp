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
<div class="container">

	
	
		<div class="adminRefundListSetcion">
		<div class="container-fluid">
			<div class="refundListTitle">
				<div class="row">
					<div class="col-xl">구매 후기 목록</div>
				</div>
			</div>
			<!-- OrderCancelListTitle -->
			<div class="OrderListInfo">
				<c:if test="${empty review}">
					상품후기 내역이 없습니다.
				</c:if>

				<c:forEach items="${review}" var="review">

					<div class="Orders border rounded"
						style="margin-bottom: 20px; padding-bottom: 10px">
						<div class="row" style="padding: 10px">
							<div class="col-xl" style="margin-left: 20px;">
								<b>문의 ID : ${review.userList.userId}</b>
							</div>
							<div class="col-xl" style="text-align: right; margin-left: 0px;">
								<fmt:parseDate value="${review.regDate}"
									pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
								<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd"
									var="formatDate" />
								등록일 : ${formatDate}

							</div>

						</div>

						<div class="row" style="padding: 10px">
							<div class="col-xl" style="text-align: left; margin-left: 20px;">
								<a
									href="${pageContext.request.contextPath}/main/goodsDetail/${review.registerGoods.regNo}" style="color: black">
									상품 제목 : ${review.registerGoods.title} </a>
							</div>
						</div>
						<div class="row" style="padding: 10px">
							<div class="col-xl" style="text-align: left; margin-left: 20px;">
								후기 내용 : ${review.content}
							</div>
						</div>
						</div>
				</c:forEach>
			</div>
			<!-- OrderListInfo -->

		</div>
	
	
</div>



</body>
</html>