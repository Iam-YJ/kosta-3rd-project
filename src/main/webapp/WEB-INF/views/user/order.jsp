<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


$(document).ready(function(){
	
	calRealPay();
	
	function calRealPay(){
		//1. 사용가능 포인트랑 숫자비교 후 커지면 alert
		if($("#points").val() > ${sessionScope.userList.points}){
			alert("사용 가능한 포인트를 초과하였습니다.");
			$("#points").val(0);
		} 
		
		//2. 사용 가능 일시 총 상품금액 + 배송비 - 포인트 계산 후 총 결제금액에 출력
		var totalCost = ${buyMap.registerGoods.price * buyMap.cart.quantity} + 2500 - $("#points").val();
		$("#realPayCost").empty();
		$("#realPayCost").append(AddComma(totalCost)+" 원");
		$("#realPay").val(totalCost); 
	};
	
	$(document).on("keyup","#points",function(){
		//console.log($(this).val());
		calRealPay();
		
	});//pointsInput_keyup
	
	$(document).on("change","#points",function(){
		//console.log($(this).val());
		//1. 사용가능 포인트랑 숫자비교 후 커지면 alert
		calRealPay();
	});//pointsInput_keyup
	
	//3자리마다 Comma넣어주는 함수
	function AddComma(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}//AddComma
	
	$("#payBtn").click(function(){
		//shipping_addr 전달
		$("#shippingAddr").val($("#addr").val());
		
		//point사용량 전달
		$("#usingPoints").val($("#points").val());
		//결제방법에 따라 결제창 연결해서 서브밋..
		var payMethod = $('input[name="payNo"]:checked').val();
		
		if(payMethod == 1){
			$("#orderPay").attr("action", "action.jsp");
		}else if(payMethod == 2){
			$("#orderPay").attr("action", "${pageContext.request.contextPath}/user/payMethod/card");
		}else if(payMethod == 3){
			$("#orderPay").attr("action", "action.jsp");
		}else if(payMethod == 4){
			$("#orderPay").attr("action", "action.jsp");
		}
		
		$('#orderPay').attr("target", "formInfo");
		window.open("", "formInfo", "height=500, width=500, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, left=50, top=50");
		$('#orderPay').submit();    

	})//payBtn_click
	
	
});//ready 


</script>
</head>
<body>

<div class="orderSection">
	<div class="container">
		<div class="titleSection">
			<div class="row col-xl">
				주문&middot;결제
			</div>
		</div><!-- titleSection -->
		<div class="buyerInfoSection">
			<div class="titleSection row col-xl">
				구매자 정보
			</div>
			<div class="ContentSection">
				<div class="row border border-left-0 border-right-0">
					<div class="TH col-xl-3">
						이름
					</div>
					<div class="TD col-xl">
						${sessionScope.userList.name}
					</div>
				</div>
				<div class="row border border-left-0 border-right-0 border-top-0">
					<div class="TH col-xl-3">
						이메일
					</div>
					<div class="TD col-xl">
						${sessionScope.userList.email}
					</div>
				</div>
				<div class="row border border-left-0 border-right-0 border-top-0">
					<div class="TH col-xl-3">
						연락처
					</div>
					<div class="TD col-xl">
						${sessionScope.userList.phone}
					</div>
				</div>
			</div>
			<div class="titleSection row col-xl">
				배송지 정보
			</div>
			<div class="ContentSection">
				<div class="row border border-left-0 border-right-0">
					<div class="TH col-xl-3">
						받는 사람
					</div>
					<div class="TD col-xl">
  						<input type="text" class="form-control" id="usr" value="${sessionScope.userList.name}">
					</div>
				</div>
				<div class="row border border-left-0 border-right-0 border-top-0">
					<div class="TH col-xl-3">
						배송지 주소
					</div>
					<div class="TD col-xl">
  						<input type="text" class="form-control" id="addr" value="${sessionScope.userList.addr}">
					</div>
				</div>
				<div class="row border border-left-0 border-right-0 border-top-0">
					<div class="TH col-xl-3">
						받는 사람 연락처
					</div>
					<div class="TD col-xl">
  						<input type="text" class="form-control" id="phone" value="${sessionScope.userList.phone}">
					</div>
				</div>
			</div>
		</div><!-- buyerInfoSection -->
		<div class="goodsInfoSection">
			<div class="titleSection row col-xl">
				상품 목록
			</div>
			<div class="ContentSection">
				<div class="row border border-left-0 border-right-0">
					<div class="top col-xl"></div>
				</div>
				<div class="itemList row border border-left-0 border-right-0 border-top-0">
				<c:forEach items="${buyMap}" var="map">
					<div class="col-xl-9">
						<div class="row align-items-center" style="height: 45px">
							<div class="col-xl-9" style="text-align: center; font-size: 20px">
								 <%-- ${buyMap.registerGoods.title} --%>  ${map.value.registerGoods.title}
							</div>
							<div class="col-xl-3 border border-left-0 border-top-0 border-bottom-0" style="text-align: right; font-size: 15px;">
								구매수량 : <%-- ${buyMap.cart.quantity} --%>  ${map.value.quantity} 개 
							</div>
						</div>
					</div>
					<div class="col-xl-3" style="text-align: center; margin: auto; font-size: 20px;  color: blue;" id="totalPrice" >
					<input type="hidden" value="${map.value.registerGoods.price * map.value.quantity}" id="tp">
						<fmt:formatNumber value="${map.value.registerGoods.price * map.value.quantity}" var="CommaPrice"/>
							${CommaPrice} 원
						<%--  <fmt:formatNumber value="${buyMap.registerGoods.price * buyMap.cart.quantity}" var="CommaPrice"/>
							 ${CommaPrice} 원  --%>
					</div>
					</c:forEach>
				</div><!-- itemList -->
			</div>
		</div><!-- goodsInfoSection -->
		<div class="priceInfoSection">
			<div class="titleSection row col-xl">
				결제 정보
			</div>
			<div class="ContentSection">
				<div class="row border border-left-0 border-right-0">
					<div class="TH col-xl-3">
						총 상품가격
					</div>
					<div class="TD col-xl">
						${totalPrice} 원
					</div>
				</div>
				<div class="row border border-left-0 border-right-0 border-top-0">
					<div class="TH col-xl-3">
						배송비
					</div>
					<div class="TD col-xl">
						2,500 원
					</div>
				</div>
				<div class="row border border-left-0 border-right-0 border-top-0">
					<div class="TH col-xl-3">
						포인트사용
					</div>
					<div class="TD col-xl">
						<div class="row">
							<div class="col-xl-3">
								<input type="number" min="0" max="${sessionScope.userList.points}" step="1" class="form-control" id="points" value="0">
							</div>						
							<div class="col-xl" style="color: blue; margin: auto;">
								(사용가능 포인트 : ${sessionScope.userList.points})	
							</div>
						</div>
						
					</div>
				</div>
				<div class="row border border-left-0 border-right-0 border-top-0">
					<div class="TH col-xl-3">
						총 결제금액
					</div>
					<div class="TD col-xl" id="realPayCost">
						<fmt:formatNumber value="${totalPrice}" var="CommaPrice"/>
							 ${CommaPrice} 원
					</div>
				</div>
				<div class="row border border-left-0 border-right-0 border-top-0">
					<div class="TH col-xl-3">
						결제 방법
					</div>
					<div class="TD col-xl">
						<div class="form-check-inline">
							<input type="radio" class="form-check-input" name="payNo" value="1" disabled="disabled">계좌이체
						</div>
						<div class="form-check-inline">
							<input type="radio" class="form-check-input" name="payNo" value="2" checked="checked">신용/체크카드
						</div>
						<div class="form-check-inline">
							<input type="radio" class="form-check-input" name="payNo" value="3" disabled="disabled">휴대폰
						</div>
						<div class="form-check-inline">
							<input type="radio" class="form-check-input" name="payNo" value="4" disabled="disabled">무통장입금(가상계좌)
						</div>
					</div>
				</div>
			</div>
		</div><!-- priceInfoSection -->
		<div class="payBtnSection" >
			<div class="row">
				<div class="col-xl" style="text-align: center; margin: auto;">
					위 주문 내용을 확인하였으며, 회원 본인은 결제에 동의합니다.
				</div>
			</div>
			<form action="" method="post" id="orderPay">
				<div class="row">
					<div class="hiddendInfo">
						<input type="hidden" id="shippingAddr" name="shippingAddr" value="${sessionScope.userList.addr}">
						<input type="hidden" id="totalPrice" name="totalPrice" value="${buyMap.registerGoods.price * buyMap.cart.quantity +2500}">
						<input type="hidden" id="realPay" name="realPay" value="0">
						<input type="hidden" id="regNo" name="regNo" value="${buyMap.registerGoods.regNo}">
						<input type="hidden" id="quantity" name="quantity" value="${buyMap.cart.quantity}">
						<input type="hidden" id="unitPrice" name="unitPrice" value="${buyMap.registerGoods.price}">
						<input type="hidden" id="unitTotalPrice" name="unitTotalPrice" value="${buyMap.registerGoods.price * buyMap.cart.quantity}">
						<input type="hidden" id="usingPoints" name="usingPoints" value=0>
						<input type="hidden" id="cartNo" name="cartNo" value="${buyMap.cart.cartNo}">
					</div>
					<div class="col-xl" style="text-align: center; margin: auto;">
						<input type="button" class="btn btn-success" value="결제하기" id="payBtn">
					</div>
				</div>
			</form>
		</div><!-- payBtnSection -->
	</div><!-- container -->
</div><!-- OrderSection -->

</body>
</html>