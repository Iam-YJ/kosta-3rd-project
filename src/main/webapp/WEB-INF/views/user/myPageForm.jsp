<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	
	if(${state == null}){
		if(${sessionScope.userList.authority eq 'ROLE_USER'}){
			$("#myPageContentSection").empty();
			$("#myPageContentSection").load("${pageContext.request.contextPath}/user/myPage/userOrderList");
		}else if(${sessionScope.userList.authority eq 'ROLE_ADMIN'}){
			$("#myPageContentSection").empty();
			$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/newOrderList");
		} 
	}else{
		if(${state == 1}){
			adminOrderRefundList();
		}else if(${state == 2}) {
			userCartList();
		}else if(${state == 3}) {
			userWishList();
		}else if(${state == 4}){
			userGoodsReviewList();
		}else if(${state == 5}){
			adminGoodsADList();
		}else if(${state == 6}){
			adminGoodsQuestionList();
		}else if(${state == 7}){
			userPointDonate();
		}else if(${state == 8}){
			userGoodsQuestionList();
		}
	}
		
	 
	
})//ready
function userOrderList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/user/myPage/userOrderList");
}

function userOrderCancelList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/user/myPage/userOrderCancelList");
}

function userGoodsQuestionList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/user/myPage/userGoodsQuestionList");
}

function userGoodsReviewList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/user/myPage/userGoodsReviewList");
}

function userWishList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/user/myPage/userWishList");
}

function userCartList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/user/myPage/userCartList");
}

function passWordCheck(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/user/myPage/passWordCheck");
}

function userPointGradeList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/user/myPage/userPointGradeList");
}

function userPointDonate(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/user/myPage/userPointDonate");
}

/*  ---------------------------------------------------------------- */
  
function adminInsertGoodsForm(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/insertGoodsForm");
}

function adminGoodsList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/goodsList");
}
function adminNewOrderList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/newOrderList");
}
function adminOrderDeliveryList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/orderDeliveryList");
}
function adminOrderRefundList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/orderRefundList");
}
function adminGoodsStockList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/goodsStockList");
}
function adminGoodsADList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/goodsADList");
}
function adminGoodsQuestionList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/goodsQuestionList");
}
function adminGoodsReviewList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/goodsReviewList");
}
function adminCategoryList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/categoryList");
}
function adminProfit(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/profit");
}
function adminClientList(){
	$("#myPageContentSection").empty();
	$("#myPageContentSection").load("${pageContext.request.contextPath}/admin/myPage/clientList");
}

</script>
</head>
<body>
	<div class="myPageFrame">
		<div class="container">
			<div class="row">
				<div class="col-xl-3">
					<div class="row">
						<div class="col-xl"
							style="background-color: #d5edb4; text-align: center; padding: 50px; font-size: 30px">
							<b>마이페이지</b>
						</div>
					</div>
					<div class="row">
						<div class="col-xl" style="background-color: #f0f6e8">
							<div class="myPageMenuSection">
								<c:choose>
									<c:when
										test="${sessionScope.userList.authority eq 'ROLE_USER'}">
										<div class="row col-xl" style="margin-top: 15px">
											<h4>
												<b>My 쇼핑</b>
											</h4>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="userOrderList()">주문목록/배송 조회</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="userOrderCancelList()">환불신청내역 조회</a>
										</div>


										<div class="row col-xl" style="margin-top: 50px">
											<h4>
												<b>My 활동</b>
											</h4>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="userGoodsQuestionList()">상품 문의내역 조회</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="userGoodsReviewList()">구매후기 내역 조회</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="userWishList()">찜 목록 조회</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="userCartList()">장바구니 목록 조회</a>
										</div>

										<div class="row col-xl" style="margin-top: 50px;">
											<h4>
												<b>My 정보</b>
											</h4>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="passWordCheck()">개인정보확인/수정</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="userPointGradeList()">등급 조회</a>
										</div>
										<div class="row col-xl" style="margin-bottom: 15px">
											<a href="#" onclick="userPointDonate()">포인트 기부</a>
										</div>
									</c:when>
									<c:when
										test="${sessionScope.userList.authority eq 'ROLE_ADMIN'}">
										<div class="row col-xl" style="margin-top: 15px">
											<h4>
												<b>상품관련</b>
											</h4>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="adminInsertGoodsForm()">상품등록</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="adminGoodsList()">판매상품목록 조회</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="adminNewOrderList()">신규 주문조회</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="adminOrderDeliveryList()">상품 배송조회</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="adminOrderRefundList()">환불신청 상품조회</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="adminGoodsStockList()">재고량 조회</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="adminGoodsADList()">광고상품 조회</a>
										</div>


										<div class="row col-xl" style="margin-top: 50px">
											<h4>
												<b>게시판 관련</b>
											</h4>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="adminGoodsQuestionList()">상품문의 내역</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="adminGoodsReviewList()">구매후기내역</a>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="adminCategoryList()">상품 카테고리</a>
										</div>

										<div class="row col-xl" style="margin-top: 50px">
											<h4>
												<b>홈페이지 관련</b>
											</h4>
										</div>
										<div class="row col-xl">
											<a href="#" onclick="adminProfit()">매출조회</a>
										</div>
										<div class="row col-xl" style="margin-bottom: 15px">
											<a href="#" onclick="adminClientList()">회원조회</a>
										</div>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl">
					<div class="myPageContentSection" id="myPageContentSection">
						<!-- 내용이 들어갈 구간입니다 -->
					</div>
				</div>
			</div>
		</div>
		<!-- container -->
	</div>
	<!-- myPageFrame -->
</body>
</html>