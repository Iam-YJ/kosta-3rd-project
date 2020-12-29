<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불신청</title>

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
	$("#refundBtn").click(function(){
		
		if($('#refundReason').val() == ''){
			alert("환불사유를 입력해주세요");
			$('#refundReason').focus();
			return false;
		}
		
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/user/myPage/userOrderList/requestRefund/${orders.orderNo}',
			dataType : 'json',
			data :$('#refundForm').serialize(),
			success : function(result){
				if(result == 0){
					alert("환불신청이 완료되었습니다.");
				}else if(result == 1){
					alert("이미 환불신청되었습니다.");
				}
				opener.parent.location='${pageContext.request.contextPath}/user/myPage';
				window.close(); 
			},
			
		});//ajax
		
		
	})//refundBtn_btn
	
	
});//jquery_ready

</script>
</head>
<body>
	
<div class="refundFormSection">
	<div class="container">
		<div class ="titleSection row">
			<div class="col">
				환불신청
			</div>
		</div>
		<div class ="refundInfoSection">
			<div class="row">
				<div class="TH col-4">
					주문번호
				</div>
				<div class="TD col">
					${orders.orderNo}
				</div>
			</div>
			<div class="row">
				<div class="TH col-4">
					주문자
				</div>
				<div class="TD col">
					${orders.userList.name}
				</div>
			</div>
			<div class="row">
				<div class="TH col-4">
					주문일
				</div>
				<div class="TD col">
					<fmt:parseDate value="${orders.orderdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
					<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd"/>
				</div>
			</div>
			<div class="row">
				<div class="TH col-4">
					환불예상금액
				</div>
				<div class="TD col">
					<fmt:formatNumber value="${orders.realpay}"/> 원
				</div>
			</div>
			<form action="#" method="post" id="refundForm">
				<div class="row">
					<div class="TH col-4">
						환불사유
					</div>
					<div class="TD col">
						<input type="text" id="refundReason" name="refundReason">
					</div>
				</div>
				<div class="row">
					<div class="col" style="text-align: center; margin-top: 5px;">
						<input class="btn btn-success" type="button" id="refundBtn" value="환불신청">
					</div>
				</div>
			</form>
		</div>
	</div><!-- container -->
</div><!-- refundFormSection -->


</body>
</html>