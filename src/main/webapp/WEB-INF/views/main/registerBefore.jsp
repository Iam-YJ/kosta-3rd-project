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
	var checkResultId="";		
	$("#regForm").submit(function(){			
		if($("#regForm :input[name=id]").val().trim()==""){
			alert("아이디를 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=passWord]").val().trim()==""){
			alert("패스워드를 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=name]").val().trim()==""){
			alert("이름을 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=addr]").val().trim()==""){
			alert("주소를 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=phone]").val().trim()==""){
			alert("전화번호를 입력하세요");				
			return false;
		}	
	
			
	});//submit
	
	//아이디 체크...
	$("#regForm :input[name=userId]").keyup(function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/main/userIdCheck",
			dataType : "text",
			data:{
			"userId" : $(this).val()
			},
			success:function(result){						
				
				$("#idCheckView").html(result).css("background","red");
				if($(this).val()==""){$("#idCheckView").html("")}
				}
					
			//callback			
		});//ajax
	})
	
	//비밀번호 체크
	$("#regForm :input[name=passWordCheck]").keyup(function(){
		if($(this).val()==""){
			$("#pwdCheckSpan").html("");
		}
		if($("#regForm :input[name=passWord]").val() == $(this).val()){
				$("#pwdCheckSpan").html("비밀번호가 일치합니다.");
			}else{
				$("#pwdCheckSpan").html("비밀번호를 확인해주세요.");
			}
			
	});//user_pwdcheck_keyup
})
</script>
</head>
<body>

<div class="register_section">
	<div class="container">
		<div class="row">
			<div class="col-xl-3"></div>
			<div class="col-xl">
				<h3>회원가입</h3>
				<div class="registerForm border">
					<div class="row">
						<div class="col-xl" style="text-align: center;">
							<h5>
								L.P.Mall에 오신 것을 환영합니다<br>
								지금 회원 가입 하신 후 L.P.Mall에서 신선한<br>
								농산물 서비스를 만나보세요!<br>
							</h5>						
						</div>
					</div><!-- row -->
					<div class="row" style="margin: 10px">
						<a href="${pageContext.request.contextPath}/main/registerForm" class="btn btn-success col-xl">회원 가입하기</a>
					</div><!-- row -->
				</div><!-- registerForm -->
				
				<div class="social_registerForm border border-top-0">
					<div class="row">
						<div class="col-xl" style="text-align: left;">
							<h4>소셜정보로 회원가입</h4>	
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
								<br>
							</div>
						</div>
					</div><!-- row -->
				</div><!-- social_registerForm -->
				
			</div>
			<div class="col-xl-3"></div>
		</div><!-- row -->
	</div><!-- container -->
</div><!-- register_section -->




<h1>main/registerForm.jsp</h1>
<form action="${pageContext.request.contextPath}/main/register" id="regForm" method="post">
이름 : <input type="text" name = "name"><br>
아이디 : <input type="text" name = "userId"><span id="idCheckView"></span><br>
비밀번호 : <input type="password" name = "passWord"><Br>
비밀번호확인 : <input type="password" name = "passWordCheck"><span id="pwdCheckSpan"></span><br>
주소 : <input type="text" name = "addr"><Br>
전화번호 : <input type="text" name = "phone"><br>
E-Mail : <input type="text" name = "email"><br>
<input type="submit" value="Register Member">
</form>



</body>
</html>