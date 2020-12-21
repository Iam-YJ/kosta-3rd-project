<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  font: 13px/20px "Lucida Grande", Tahoma, Verdana, sans-serif;
}

.successId {
  position: relative;
  margin: 30px auto;
  padding: 20px 20px 20px;
  width: 550px;
  background: white;
  border-radius: 3px;
  -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
}

.successId:before {
  content: '';
  position: absolute;
  top: -8px;
  right: -8px;
  bottom: -8px;
  left: -8px;
  z-index: -1;
  background: rgba(0, 0, 0, 0.08);
  border-radius: 4px;
}

.successId h1 {
  margin: -20px -20px 21px;
  line-height: 40px;
  font-size: 15px;
  font-weight: bold;
  color: #555;
  text-align: center;
  text-shadow: 0 1px white;
  background: #f3f3f3;
  border-bottom: 1px solid #cfcfcf;
  border-radius: 3px 3px 0 0;
  background-image: -webkit-linear-gradient(top, whiteffd, #eef2f5);
  background-image: -moz-linear-gradient(top, whiteffd, #eef2f5);
  background-image: -o-linear-gradient(top, whiteffd, #eef2f5);
  background-image: linear-gradient(to bottom, whiteffd, #eef2f5);
  -webkit-box-shadow: 0 1px whitesmoke;
  box-shadow: 0 1px whitesmoke;
}

.successId p {
  margin: 20px 0 0;
}

.successId p:first-child {
  margin-top: 0;
}

.successId p.submit {/* 로그인버튼 위치 */
  text-align: right;
}


:-moz-placeholder {
  color: #c9c9c9 !important;
  font-size: 13px;
}

::-webkit-input-placeholder {
  color: #ccc;
  font-size: 13px;
}

input {
  font-family: 'Lucida Grande', Tahoma, Verdana, sans-serif;
  font-size: 14px;
}

input[type=text], input[type=password] {
  margin: 5px;
  padding: 0 10px;
  width: 200px;
  height: 34px;
  color: #404040;
  background: white;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 2px;
  outline: 5px solid #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
}

input[type=text]:focus, input[type=password]:focus {
  border-color: #7dc9e2;
  outline-color: #dceefc;
  outline-offset: 0;
}


.lt-ie9 input[type=text], .lt-ie9 input[type=password] {
  line-height: 34px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#LoginBtn").click(function(){
		location.href="${pageContext.request.contextPath}/main/login";
	}); //loginBtn_click
	
	$("#findPwdBtn").click(function(){
		$(location).attr("href","${pageContext.request.contextPath}/main/userForgetIdPwd");
	}); //findPwdBtn_click
	
	
});//ready
</script>
</head>
<body>

	
	<div class="container">
		<div style="text-align: center; margin: 35px 0px" >
			<hr width="400px">
		</div>
	</div>
<!-- 아이디 찾기 -->
<section class="successId_Select" style="margin: 50px 0px">
	<div class="container">
		<div class="successId">
 			<h1>Find ID</h1>
 				<h5>회원님의 정보와 일치하는 아이디입니다.</h5>
 				<br>
				<ul>
					<li><h4><b>${userId}</b></h4></li>				
				</ul>
				<hr>
				<p class="submit">
				<input type="button" class="btn btn-outline-primary" id="LoginBtn" name="LoginBtn" value="로그인" 
				style="padding: 5px 5px">
				<input type="button" class="btn btn-outline-primary" id="findPwdBtn" name="findPwdBtn" value="비밀번호찾기" 
				style="padding: 5px 5px">
				</p>
		</div><!-- successId -->
	</div><!-- container -->
</section><!-- successId_Select -->
	
</body>
</html>