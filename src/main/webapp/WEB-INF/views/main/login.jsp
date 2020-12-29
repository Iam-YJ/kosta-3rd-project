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

</script>
</head>
<body>

<div class="login_section">
	<div class="container">
		<div class="row">
			<div class="col-xl-3"></div>
			<div class="col-xl">
				<h3>로그인</h3>
					<ul class="nav nav-tabs row border">
						<li class="nav-item col-xl">
			  				<a class="nav-link active btn btn-outline-success" data-toggle="tab" href="#home">로그인</a>
						</li>
						<li class="nav-item col-xl">
			  				<a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu1">관리자 로그인</a>
						</li>
					</ul>
					<div class="home_login">	
						<div class="row border">
							<div class="col-xl">
								<div class="tab-content">
									<div id="home" class="tab-pane active"><br>
										<div class="userLogin">
											<form action="${pageContext.request.contextPath}/main/login" method="post" id="homeLoginForm">
												<div class="form-group">
													ID:
													<input type="text" class="form-control" name="userId">
												</div>
												<div class="form-group">
													PASSWORD:
													<input type="password" class="form-control" name="passWord">
												</div>
												<div class="row">
													<div class="col-xl-9">
														<a href="${pageContext.request.contextPath}/main/userForgetIdPwd">forgot ID or PassWord</a>
													</div>
													<input type="submit" class="btn btn-success col-xl" value="로그인" style="margin-right: 15px">
												</div>
											</form>
										</div>
									</div>
									<div id="menu1" class="tab-pane fade"><br>
										<div class="userLogin">
											<form action="${pageContext.request.contextPath}/admin/adminLogin" method="post" id="adminLoginForm">
												<div class="form-group">
													Admin_ID:
													<input type="text" class="form-control" name="adminId">
												</div>
												<div class="form-group">
													Admin_PASSWORD:
													<input type="password" class="form-control" name="password">
												</div>
												<div class="row">
													<div class="col-xl-9"></div>
													<input type="submit" class="btn btn-success col-xl" value="관리자 로그인" style="margin-right: 15px">
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="social_home">
						<div class="row border border-top-0">
							<div class="col-xl">
								<br>
								<h5>소셜정보로 로그인하기</h5>
							
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
												
												$("#userNobb").attr("href", "${pageContext.request.contextPath}/main/kakaoLogin/"+userEmail);
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
															window.location.replace("${pageContext.request.contextPath}/main/kakaoLogin/"+userEmail);
							
															}
														})
													},
													fail : function(error) {
														alert(JSON.stringify(error));
													}
												});
							
											</script>
											<div class="clearfix add_bottom_0"></div>
										</div>
									</form>
									<br>
								</div>
							</div>
						</div>
					</div><!-- social_home -->
				</div>
			<div class="col-xl-3"></div>
		</div><!-- row -->
	</div>
</div><!-- login_section -->

</body>
</html>