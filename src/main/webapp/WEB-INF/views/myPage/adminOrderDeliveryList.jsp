<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.goodsDetailBottom{width:700px; margin:0 auto;}
.ul {  float:left; text-align:center; }
.li { display:inline-block; text-align:center; }
</style>

<script type="text/javascript">
	
</script>
</head>
<body>

<div class="insertOrdersForm">
	<div class="container-fluid">
		<div class="titleSection">
			<div class="row">
				<div class="col-xl">
					상품 배송조회
				</div>
			</div>
		</div><!-- titleSection -->
	<div class="goodsDetailBottom">

		<ul class="nav nav-tabs row border">
			<li class="nav-item col-xl"><a
				class="nav-link active btn btn-outline-success" data-toggle="tab"
				href="#home">배송준비중</a></li>
			<li class="nav-item col-xl"><a
				class="nav-link btn btn-outline-success" data-toggle="tab"
				href="#menu2">배송중</a></li>
			<li class="nav-item col-xl"><a
				class="nav-link btn btn-outline-success" data-toggle="tab"
				href="#menu3">배송완료</a></li>
	

		</ul>
		<br> <br> <br>

		<!-- Tab panes -->
		<div class="tab-content">
	


			<div id="home" class="tab-pane active">
				<div class="goodsDetailInfo">
					<c:if test="${empty newOrders}">
									배송준비중인 상품이 없습니다.
								</c:if>
					<c:if test="${not empty newOrders}">
						<c:forEach items="${newOrders}" var="newOrders">
							<div class="Orders border rounded"
								style="margin-bottom: 20px; padding-bottom: 10px">
								<div class="row" style="padding: 10px">
									<div class="col-xl" style="margin-left: 30px;">
										<b>구매자 ID : ${newOrders.userList.userId}</b>
									</div>

									<div class="col-xl"
										style="text-align: right; margin-right: 40px;">
										<b>구매자 고유 번호 : ${newOrders.userList.userNo}</b>
									</div>
								</div>
								<div class="row" style="padding: 10px">
									<div class="col-xl"
										style="text-align: left; margin-left: 20px;">
										<fmt:parseDate value="${newOrders.orderdate}"
											pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
										<fmt:formatDate value="${parseDateTime}"
											pattern="yyyy. MM. dd" var="formatDate" />
										상품 구매일 : ${formatDate} 주문 <br> <br> 배송 주소 :
										${newOrders.addr}

									</div>


								</div>


							</div>
				<!-- orders -->
				</c:forEach>
				</c:if>
				</div>
			</div>
	




		<div id="menu2" class="tab-pane fade">
			<div class="goodsInfo">
				<c:if test="${empty nowOrders}">
									배송중인 상품이 없습니다.
								</c:if>

				<c:if test="${not empty nowOrders}">
					<c:forEach items="${nowOrders}" var="nowOrders">
						<div class="Orders border rounded"
							style="margin-bottom: 20px; padding-bottom: 10px">
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="margin-left: 30px;">
									<b>구매자 ID : ${nowOrders.userList.userId}</b>
								</div>

								<div class="col-xl"
									style="text-align: right; margin-right: 40px;">
									<b>구매자 고유 번호 : ${nowOrders.userList.userNo}</b>
								</div>
							</div>
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="text-align: left; margin-left: 20px;">
									<fmt:parseDate value="${nowOrders.orderdate}"
										pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
									<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd"
										var="formatDate" />
									상품 구매일 : ${formatDate} 주문 <br> <br> 배송 주소 :
									${nowOrders.addr}

								</div>
							</div>
						</div>
			<!-- orders -->
			</c:forEach>
			</c:if>
			</div>
		</div>
		

		<div id="menu3" class="tab-pane fade">
			<div class="goodsInfo">
				<c:if test="${empty lastOrders}">
									배송완료된 상품이 없습니다.
								</c:if>

				<c:if test="${not empty lastOrders}">
					<c:forEach items="${lastOrders}" var="lastOrders">
						<div class="Orders border rounded"
							style="margin-bottom: 20px; padding-bottom: 10px">
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="margin-left: 30px;">
									<b>구매자 ID : ${lastOrders.userList.userId}</b>
								</div>

								<div class="col-xl"
									style="text-align: right; margin-right: 40px;">
									<b>구매자 고유 번호 : ${lastOrders.userList.userNo}</b>
								</div>
							</div>
							<div class="row" style="padding: 10px">
								<div class="col-xl" style="text-align: left; margin-left: 20px;">
									<fmt:parseDate value="${lastOrders.orderdate}"
										pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
									<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd"
										var="formatDate" />
									상품 구매일 : ${formatDate} 주문 <br> <br> 배송 주소 :
									${lastOrders.addr}

								</div>


							</div>


						</div>
			<!-- orders -->
			</c:forEach>
			</c:if>
			</div>
		</div>

	</div>
	</div>
	</div>
	</div>
	
	<!-- goodsDetailBottom -->

</body>
</html>