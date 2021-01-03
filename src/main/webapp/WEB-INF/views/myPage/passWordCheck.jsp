<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on("click", "[value='확인']", function(){
		var passWord = '${userList.passWord}';
		console.log(passWord);
		console.log($("input[name=passWord]").val());
		if(passWord==$("input[name=passWord]").val()) {
			location.href="${pageCotext.request.contextPath}/user/myPage?state=9"
		}else{
			alert("비밀번호를 확인해주세요")
		}
	})
})

</script>
</head>
<body>
<div class="pwdCheckSection">
	<div class="container-fluid">
		<div class="titleSection row">
			<div class="col-xl">
				개인정보 수정
			</div>
		</div>
		
		<div class="row" style="margin-top: 20px;">
			<div class="col-xl-2"></div>
			<div class="col-xl">
				<div class="row border rounded" style="padding: 20px;">
					<div class="col-xl">
						<div class="row">
							<div class="col-xl" style="text-align: center; margin: auto; font-size: 18px;">
								개인정보 수정을 위하여 비밀번호를 입력해주세요
							</div>
						</div>
						<div class="row">
							<div class="col-xl">
								<hr>
							</div>
						</div>
						<div class="row" style="height: 150px;">
							<div class="col-xl-3" style="margin-top: 28px; text-align: center;">
								비밀번호
							</div>
							<div class="col-xl" style="margin-top: 20px; text-align: center;">
								<input type="password" name = "passWord" class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-xl" style="text-align: right;">
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-xl" style="text-align: right;">
								<input type="button" name="passWordCheck" value="확인" class="btn btn-success">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-2"></div>
		</div>
	</div><!-- container-fluid -->
</div><!-- pwdCheckSection -->
</body>
</html>