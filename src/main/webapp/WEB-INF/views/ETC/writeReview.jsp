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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#reviewInsertBtn").click(function(){
		if( $("#content").val() == null || $("#content").val() == "" ){
			alert("후기를 입력해주세요.");
			$("#content").focus();
			return false;
		}
		
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/user/myPage/insertReview/${registerGoods.regNo}',
			dataType : 'json',
			data :$('#reviewInsertForm').serialize(),
			success : function(result){
				if(result == 0){
					alert("후기등록이 완료되었습니다.");
				}else if(result == 1){
					alert("후기등록에 실패하였습니다.");
				}
				opener.parent.location='${pageContext.request.contextPath}/user/myPage?state=4';
				window.close(); 
			}
		});//ajax
		
	})//reviewInsertBtn_click
	
});//jquery_ready

</script>
</head>
<body>
<div class="goodsReivewInsertSection">
	<div class="container">
		<div class ="titleSection row">
			<div class="col">
				구매후기 작성
			</div>
		</div>
		<div class ="goodsInfoSection">
			<div class="row">
				<div class="col TH" style="text-align: center; margin: auto;">
					상품이름
				</div>
			</div>
			<div class="row">
				<div class="col TD" style="text-align: center; margin: auto; padding: 20px;">
					${registerGoods.title}
				</div>
			</div>
			<div class="row">
				<div class="col TH" style="text-align: center; margin: auto;">
					구매 후기
				</div>
			</div>
			<form id="reviewInsertForm" method="post" action="">
				<div class="row">
					<div class="col TD" style="text-align: center; margin: auto; padding: 20px;">
						<textarea rows="5" id="content" name="content" class="form-control"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-6 TD" style="text-align: right; margin: auto;">
						<input id="reviewInsertBtn" class="btn btn-success" type="button" value="후기등록"> 
					</div>
					<div class="col-6 TD" style="text-align: left; margin: auto;">
						<input class="btn btn-outline-success" type="reset" value="다시작성">
					</div>
				</div>
			</form>
		</div>
	</div><!-- container -->
</div><!-- goodsReivewInsertSection -->
	
</body>
</html>