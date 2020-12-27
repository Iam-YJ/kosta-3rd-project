<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/rpmall.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#payBtn").click(function(){

		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/user/payGoods',
			dataType : 'json',
			data :$('#payInfoForm').serialize(),
			success : function(result){
				if(result == 0){
					alert("결제가 완료되었습니다.");
					opener.parent.location='${pageContext.request.contextPath}/user/myPage';
					window.close(); 
				}else if(result == 1){
					alert("결제가 실패하였습니다.");
				}
			},
			
		});
	})//payBtnClick
});//jquery_ready
</script>
</head>
<body>
<div class="payCardSection">
	<div class="container"> 
		<div class="titleSection row-col">
			카드결제		
		</div>
		<div class="payInfoSection">
			<div class="row">
				<div class="TH col-3">
					주문자
				</div>
				<div class="TD col">
					${sessionScope.userList.name}
				</div>
			</div>
			<div class="row">
				<div class="TH col-3">
					배송주소
				</div>
				<div class="TD col">
					${shippingAddr}
				</div>
			</div>
			<div class="row">
				<div class="TH col-3">
					총 결제금액
				</div>
				<div class="TD col">
					<fmt:formatNumber value="${realPay}" var="CommaPrice"/>
					${CommaPrice} 원
				</div>
			</div>
		</div>
		<div class="payBtn Section">
			<div class="row" >
				<div class="col" style="text-align: center; margin-top: 10px">
					결제정보가 동일하면 결제버튼을 눌러주세요
				</div>
			</div>
			<div class="row" >
				<div class="col" style="text-align: center; margin-top: 10px">
					<form method="post" id="payInfoForm">
						<input type="button" class="btn btn-success" id="payBtn" value="결제">
						<input type="button" class="btn btn-outline-success" value="취소" onclick="window.close()">
						<input type="hidden" id="shippingAddr" name="shippingAddr" value="${shippingAddr}">
						<input type="hidden" id="totalPrice" name="totalPrice" value="${totalPrice}">
						<input type="hidden" id="realPay" name="realPay" value="${realPay}">
						<input type="hidden" id="regNo" name="regNo" value="${regNo}">
						<input type="hidden" id="quantity" name="quantity" value="${quantity}">
						<input type="hidden" id="unitPrice" name="unitPrice" value="${unitPrice}">
						<input type="hidden" id="unitTotalPrice" name="unitTotalPrice" value="${unitTotalPrice}">
						<input type="hidden" id="usingPoints" name="usingPoints" value="${usingPoints}">
						<input type="hidden" id="cartNo" name="cartNo" value="${cartNo}">
						<input type="hidden" id="payNo" name="payNo" value=2>
					</form>
				</div>
			</div>
		</div>
	</div>
</div><!-- payCardSection -->





</body>
</html>