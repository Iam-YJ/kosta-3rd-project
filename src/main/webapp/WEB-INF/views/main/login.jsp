<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#find').click(function(){
		location.href="${pageContext.request.contextPath}/main/userForgetIdPwd";
	})
	
})
</script>
</head>
<body>
	<h1>main/login.jsp</h1>
	
	<form action="${pageContext.request.contextPath}/main/login" method="post">
	<table style="width:350px">
		<tr>
			<td width="70px">ID</td>
			<td><input type="text" name="userId" size="30"></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td><input type="password" name="passWord" size="31"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"><input type="button" value="ID/Password 찾기" id="find"></td>
			
		</tr>
	</table>
</form>
<br>
	<!-- Sign In Modal -->
	<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
		<div class="modal_header"></div>
		<form>
			<div class="sign-in-wrapper">
				<a href="#" class="social_bt kakao" id="kakao-login-btn"
					onclick=createLoginButton>Login with Kakao</a>
				<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
				<a id="kakao-login-btn"></a> <a
					href="http://developers.kakao.com/logout"></a>


				<script type='text/javascript'>
				$(function() {
					
					$("#userNobb").attr("href", "${pageContext.request.contextPath}/main/kakaoLogin/"+userNick+"/"+userEmail);
				});
					Kakao.init('7d207d89f9ff532fadc2f0761efa5f7f'); //아까 카카오개발자홈페이지에서 발급받은 자바스크립트 키를 입력함

					//카카오 로그인 버튼을 생성합니다. 

					Kakao.Auth.createLoginButton({
						container : '#kakao-login-btn',
						success : function(authObj) {
							Kakao.API.request({

								url : '/v2/user/me', 

								success : function(res) {

									//console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력

									var userEmail = res.kakao_account.email;
									var userNick = res.properties.nickname;
									console.log(userNick);
									console.log(userEmail);
									sessionStorage.setItem("userEmail",userEmail);
									/* 
									sessionStorage.setItem("userNo",userNo);
									var userNick = res.properties.nickname;
									var userAge = res.kakao_account.age_range;
									
									var userGender = res.kakao_account.gender; */
						
									
								//	window.location.replace("${pageContext.request.contextPath}/main/kakaoLogin");
								window.location.replace("${pageContext.request.contextPath}/main/kakaoLogin/"+userNick+"/"+userEmail);

								}
							})
						},
						fail : function(error) {
							alert(JSON.stringify(error));
						}
					})

				</script>
				<div class="clearfix add_bottom_0"></div>
			</div>
		</form>
	</div>
	<!-- /Sign In Modal -->
	<br>
	
	



</body>
</html>