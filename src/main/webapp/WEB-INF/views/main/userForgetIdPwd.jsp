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

.forget_id, .forget_pwd {
  position: relative;
  margin: 30px auto;
  padding: 20px 20px 20px;
  width: 400px;
  background: white;
  border-radius: 3px;
  -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
}

.forget_id:before, .forget_pwd:before {
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

.forget_id h1, .forget_pwd h1 {
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

.forget_id p, .forget_pwd p {
  margin: 20px 0 0;
}

.forget_id input[type=text], .forget_id input[type=password], .forget_pwd input[type=text], .forget_pwd input[type=password] {
  width: 350px;
}

.forget_id p.submit, .forget_pwd p.submit {/* 로그인버튼 위치 */
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


<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(document).on("click","#selectIdBtn",function(){
		
		if($("#name").val() == ""){
			alert("이름을 입력 해주세요.")
			$("#name").focus();
			return false;
		}
		
		if($("#email").val() == ""){
			alert("이메일을 입력 해주세요.")
			$("#email").focus();
			return false;
		}
		
		if($("#phone").val() == ""){
			alert("연락처를 입력 해주세요.")
			$("#phone").focus();
			return false;
		}
		
		$("#selectIdForm").submit();
		
	});//selectIdBtn_click
	
	
	$(document).on("click","#selectPwdBtn",function(){
		
		if($("#userId").val() == ""){
			alert("아이디를 입력 해주세요.")
			$("#userId").focus();
			return false;
		}
		
		if($("#userName").val() == ""){
			alert("이름을 입력 해주세요.")
			$("#userName").focus();
			return false;
		}
		
		if($("#userEmail").val() == ""){
			alert("이메일을 입력 해주세요.")
			$("#userEmail").focus();
			return false;
		}
		
		if($("#userPhone").val() == ""){
			alert("연락처를 입력 해주세요.")
			$("#userPhone").focus();
			return false;
		}
		
		$("#selectPwdForm").submit();
		
	});//selectIdBtn_click
	
});//ready
</script>
</head>
<body>

<div class="container" style="margin-top: 30px">
	<div style="text-align: center" >
		<hr width="400px">
	</div>
</div>

<section class="forget_section" style="margin: 50px 0px">
	<div class="container">
		<div class="row justify-content-center" >	
			<div class="col-xl-6">
				<!-- 아이디 찾기 -->
				<section class="forgetId_section">
				
					<div class="forget_id">
 						<h1>Find ID</h1>
						<form method="post" id="selectIdForm" action="${pageContext.request.contextPath}/main/findUserId">
							<div class="form-group">
  								<label for="name">Name:</label><br>
  								<input type="text" id="name" name="name" placeholder="Name"/>
  							</div>
  					
  							<div class="form-group">
  								<label for="email">E-Mail:</label><br>
  								<input type="text" id="email" name="email" placeholder="E-mail">
  							</div>
				
							<div class="form-group">
  								<label for="phone">Phone:</label><br>
	  							<input type="text" id="phone" name="phone" placeholder="Phone Number">
	  						</div>
						
							<hr>
							<p class="submit">
								<input type="button" class="btn btn-outline-primary"  id="selectIdBtn" value="Find ID" style="padding: 5px 50px">
							</p>
						</form><!-- selectIdForm  -->
					</div><!-- forget_id -->
				</section><!-- forgetId_section -->
			</div><!-- col6 -->
			<div class="col-xl-6">
				<!-- 비밀번호 찾기 -->
				<section class="forgetPwd_section">
				
					<div class="forget_pwd">
 						<h1>Find PWD</h1>
						<form method="post" id="selectPwdForm" action="${pageContext.request.contextPath}/main/findUserPwd">
							<div class="form-group">
  								<label for="userId">ID:</label><br>
  								<input type="text" id="userId" name="userId" placeholder="ID"/>
  							</div>
  							
							<div class="form-group">
  								<label for="userName">Name:</label><br>
  								<input type="text" id="userName" name="name" placeholder="Name"/>
  							</div>
  			
  							<div class="form-group">
 									<label for="userEmail">E-Mail:</label><br>
 									<input type="text" id="userEmail" name="email" placeholder="E-mail">  
 							</div>
			
							<div class="form-group">
		  						<label for="userPhone">Phone:</label><br>
		  						<input type="text" id="userPhone" name="phone" placeholder="Phone Number">		
		  					</div>
							
							<hr>
							<p class="submit">
								<input type="button" class="btn btn-outline-primary"  id="selectPwdBtn" value="Find PWD" style="padding: 5px 50px">
							</p>
						</form><!-- selectIdForm  -->
						</div><!-- forget_pwd -->
					</section><!-- forgetPwd_section -->
				</div><!-- col6 -->
			</div><!-- row -->
		</div><!-- container -->
	</section><!-- forget_section -->
</body>
</html>