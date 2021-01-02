<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	calRealPay();
	
	function calRealPay(){
		//1. 사용가능 포인트랑 숫자비교 후 커지면 alert
		if($("#points").val() > ${requestScope.userList.points}){
			alert("사용 가능한 포인트를 초과하였습니다.");
			$("#points").val(0);
		} 

		//2. 사용 가능 일시 총 상품금액 + 배송비 - 포인트 계산 후 총 결제금액에 출력
		var totalCost = ${totalPrice} + 2500 - $("#points").val();
		$("#realPayCost").empty();
		$("#realPayCost").append(AddComma(totalCost)+" 원");
		$("#realPay").val(totalCost); 
	};
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp19226255'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	function payCard(totalPrice){
		IMP.request_pay({
		    pg : 'html5_inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '구입상품',
		    amount : totalPrice+2500-$("#points").val(),
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    opener.parent.location='${pageContext.request.contextPath}/user/myPage';
		    
		});
	}//function
	 
	$(document).on("keyup","#points",function(){
		calRealPay();
	});//pointsInput_keyup
	
	$(document).on("change","#points",function(){
		calRealPay();
	});//pointsInput_keyup
	
	//3자리마다 Comma넣어주는 함수
	function AddComma(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}//AddComma 
	
	$("#payBtn").click(function(){
		//shipping_addr 전달
		$("#shippingAddr").val($("#sample4_roadAddress").val());
		
		//point사용량 전달
		$("#usingPoints").val($("#points").val());
		//결제방법에 따라 결제창 연결해서 서브밋..
		var payMethod = $('input[name="payNo"]:checked').val();
		
		if(payMethod == 1){
			$("#orderPay").attr("action", "${pageContext.request.contextPath}/user/payMethod/card");
		}else if(payMethod == 2){
			 payCard(${totalPrice});
		}else if(payMethod == 3){
			$("#orderPay").attr("action", "action.jsp");
		}else if(payMethod == 4){
			$("#orderPay").attr("action", "action.jsp");
		}
		
		if(payMethod!=2){
			$('#orderPay').attr("target", "formInfo");
			window.open("", "formInfo", "height=500, width=500, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, left=50, top=50");
			$('#orderPay').submit();  
		}
	  

	})//payBtn_click
	
	
});//ready 


</script>

<script>

    function sample4_execDaumPostcode() {

        new daum.Postcode({

            oncomplete: function(data) {

                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                // 건물명이 있고, 공동주택일 경우 추가한다.

                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.

                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.

                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.

                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

 

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.

                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

 

                } else if(data.autoJibunAddress) {
                	
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

 

                } /* else {
                    document.getElementById('guide').innerHTML = '';
                }
 */
            }

        }).open();

    }

</script>
</head>
<body>

	<div class="orderSection">
		<div class="container">
			<div class="titleSection">
				<div class="row col-xl">주문&middot;결제</div>
			</div>
			<!-- titleSection -->
			<div class="buyerInfoSection">
				<div class="titleSection row col-xl">구매자 정보</div>
				<div class="ContentSection">
					<div class="row border border-left-0 border-right-0">
						<div class="TH col-xl-3">이름</div>
						<div class="TD col-xl">${requestScope.userList.name}</div>
					</div>
					<div class="row border border-left-0 border-right-0 border-top-0">
						<div class="TH col-xl-3">이메일</div>
						<div class="TD col-xl">${requestScope.userList.email}</div>
					</div>
					<div class="row border border-left-0 border-right-0 border-top-0">
						<div class="TH col-xl-3">연락처</div>
						<div class="TD col-xl">${requestScope.userList.phone}</div>
					</div>
				</div>
				<div class="titleSection row col-xl">배송지 정보</div>


				<div class="ContentSection">
					<div class="row border border-left-0 border-right-0">
						<div class="TH col-xl-3">받는 사람</div>
						<div class="TD col-xl">
							<input type="text" class="form-control" id="usr"
								value="${requestScope.userList.name}">
						</div>
					</div>

					<div class="row border border-left-0 border-right-0 border-top-0">
						<div class="TH col-xl-3">배송지 주소</div>
						<!-- 	<input type="text" class="form-control" id="addr" name = "addr"> -->
						<div class="TD col-xl">
							<div class="row">
								<div class="col-xl-9">
									<input type="hidden" class="form-control" id="sample4_postcode" placeholder="우편번호">
									<input type="text" class="form-control" id="sample4_roadAddress"  name="addr" placeholder="도로명주소"> 
									<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
								</div>
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
								class="btn btn-outline-success col-xl" style="margin: 0px 15px;">
							</div>
						</div>
					</div>
					
					<div class="row border border-left-0 border-right-0 border-top-0">
						<div class="TH col-xl-3">받는 사람 연락처</div>
						<div class="TD col-xl">
							<input type="text" class="form-control" id="phone"
								value="${requestScope.userList.phone}">
						</div>
					</div>
				</div>


			</div>
			<!-- buyerInfoSection -->
			<div class="goodsInfoSection">
				<div class="titleSection row col-xl">상품 목록</div>
				<div class="ContentSection">
					<div class="row border border-left-0 border-right-0">
						<div class="top col-xl"></div>
					</div>
					<div
						class="itemList row border border-left-0 border-right-0 border-top-0">
						<c:forEach items="${buyMap}" var="map">
							<div class="col-xl-9">
								<div class="row align-items-center" style="height: 45px">
									<div class="col-xl-9"
										style="text-align: center; font-size: 20px">
										<%-- ${buyMap.registerGoods.title} --%>
										${map.value.registerGoods.title}
									</div>
									<div
										class="col-xl-3 border border-left-0 border-top-0 border-bottom-0"
										style="text-align: right; font-size: 15px;">
										구매수량 :
										<%-- ${buyMap.cart.quantity} --%>
										${map.value.quantity} 개
									</div>
								</div>
							</div>
							<div class="col-xl-3"
								style="text-align: center; margin: auto; font-size: 20px; color: blue;"
								id="totalPrice">
								<input type="hidden"
									value="${map.value.registerGoods.price * map.value.quantity}"
									id="tp">
								<fmt:formatNumber
									value="${map.value.registerGoods.price * map.value.quantity}"
									var="CommaPrice" />
								${CommaPrice} 원
								<%--  <fmt:formatNumber value="${buyMap.registerGoods.price * buyMap.cart.quantity}" var="CommaPrice"/>
							 ${CommaPrice} 원  --%>
							</div>
						</c:forEach>
					</div>
					<!-- itemList -->
				</div>
			</div>
			<!-- goodsInfoSection -->
			<div class="priceInfoSection">
				<div class="titleSection row col-xl">결제 정보</div>
				<div class="ContentSection">
					<div class="row border border-left-0 border-right-0">
						<div class="TH col-xl-3">총 상품가격</div>
						<div class="TD col-xl">
							<fmt:formatNumber value="${totalPrice}" />
							원
						</div>
					</div>
					<div class="row border border-left-0 border-right-0 border-top-0">
						<div class="TH col-xl-3">배송비</div>
						<div class="TD col-xl">2,500 원</div>
					</div>
					<div class="row border border-left-0 border-right-0 border-top-0">
						<div class="TH col-xl-3">포인트사용</div>
						<div class="TD col-xl">
							<div class="row">
								<div class="col-xl-3">
									<input type="number" min="0"
										max="${requestScope.userList.points}" step="1"
										class="form-control" id="points" value="0">
								</div>
								<div class="col-xl" style="color: blue; margin: auto;">
									(사용가능 포인트 : ${requestScope.userList.points})</div>
							</div>

						</div>
					</div>
					<div class="row border border-left-0 border-right-0 border-top-0">
						<div class="TH col-xl-3">총 결제금액</div>
						<div class="TD col-xl" id="realPayCost">
							<fmt:formatNumber value="${totalPrice}" var="CommaPrice" />
							${CommaPrice} 원
						</div>
					</div>
					<div class="row border border-left-0 border-right-0 border-top-0">
						<div class="TH col-xl-3">결제 방법</div>
						<div class="TD col-xl">
							<div class="form-check-inline">
								<input type="radio" class="form-check-input" name="payNo"
									value="1" checked="checked">계좌이체
							</div>
							<div class="form-check-inline">
								<input type="radio" class="form-check-input" name="payNo"
									value="2" >신용/체크카드
							</div>
							<div class="form-check-inline">
								<input type="radio" class="form-check-input" name="payNo"
									value="3" disabled="disabled">휴대폰
							</div>
							<div class="form-check-inline">
								<input type="radio" class="form-check-input" name="payNo"
									value="4" disabled="disabled">무통장입금(가상계좌)
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- priceInfoSection -->
			<div class="payBtnSection">
				<div class="row">
					<div class="col-xl" style="text-align: center; margin: auto;">
						위 주문 내용을 확인하였으며, 회원 본인은 결제에 동의합니다.</div>
				</div>
				<form action="" method="post" id="orderPay">
					<div class="row">
						<div class="hiddendInfo">
							<input type="hidden" id="shippingAddr" name="shippingAddr" value="${requestScope.userList.addr}"> 
							<input type="hidden" id="totalPrice" name="totalPrice" value="${totalPrice + 2500}"> 
							<input type="hidden" id="realPay" name="realPay" value="0"> 
							<input type="hidden" id="usingPoints" name="usingPoints" value=0>
							<c:forEach items="${buyMap}" var="cart" varStatus="index">
								<input type="hidden" name="cartList[${index.count-1}].cartNo" value="${cart.value.cartNo}">
							</c:forEach>
							<!-- Cart List로 넘기는방법 찾자.. -->
						</div>
						<div class="col-xl" style="text-align: center; margin: auto;">
							<input type="button" class="btn btn-success" value="결제하기" 	id="payBtn">
						</div>
					</div>
				</form>
			</div>
			<!-- payBtnSection -->
		</div>
		<!-- container -->
	</div>
	<!-- OrderSection -->

</body>
</html>