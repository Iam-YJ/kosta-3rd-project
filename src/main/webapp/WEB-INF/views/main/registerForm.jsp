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
	
	$("#registerSubmit_btn").click(function(){
		if( $("#name").val() == ""){
			alert("이름을 입력해주세요");
			$("#name").focus();
			return false;
		}
		
		if( $("#id").val() == ""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		}
		
		if( $("#pwd").val() == ""){
			alert("비밀번호를 입력해주세요");
			$("#pwd").focus();
			return false;
		}
		
		if( $("#pwdChk").val() == ""){
			alert("비밀번호 확인을 입력해주세요");
			$("#pwdChk").focus();
			return false;
		}
		
		if( $("#addr").val() == ""){
			alert("주소를 입력해주세요");
			$("#addr").focus();
			return false;
		}
		
		if( $("#phone").val() == ""){
			alert("전화번호를 입력해주세요");
			$("#phone").focus();
			return false;
		}
		
		if( $("#email").val() == ""){
			alert("E-mail을 입력해주세요");
			$("#email").focus();
			return false;
		}
		
		if( $("#pwd").val() != $("#pwdChk").val()){
			alert("비밀번호가 일치하지 않습니다. 확인해주세요");
			return false;
		}
		
		if($("#idCheckView").text() == "아이디사용불가"){
			alert("사용 불가능한 아이디입니다.");
			$("#id").focus();
			return false;
		}
		
		$("#regForm").submit();
		
		
	})//registerSubmit_btn_click
	
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
				
				$("#idCheckView").html(result);
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

<div class="registerForm_section">
	<div class="container">
		<div class="row">
			<div class="col-xl-2"></div>
			<div class="col-xl">
				<h3>회원가입</h3>
				<div class="register border">
					<div class="register_top">
						R.P.MALL 회원가입
					</div>
					<div class="register_bottom">
						<form action="${pageContext.request.contextPath}/main/register" id="regForm" method="post">
							<div class="form-group">
								<label for="name">이름 : </label>
								<input type="text" class="form-control" id="name" name = "name">
							</div>
							<div class="form-group">
								<label for="id">아이디 : </label>
								<input type="text" class="form-control" id="id" name = "userId"><span id="idCheckView"></span>
							</div>
							<div class="form-group">
								<label for="pwd">비밀번호 : </label>
								<input type="password" class="form-control" id="pwd" name = "passWord" style="color: black;">
							</div>
							<div class="form-group">
								<label for="pwdChk">비밀번호확인 : </label>
								<input type="password" class="form-control" id="pwdChk" name = "passWordCheck" style="color: black;" ><span id="pwdCheckSpan"></span>
							</div>
							<div class="form-group">
								<label for="addr">주소 : </label>
								<input type="text" class="form-control" id="addr" name = "addr">
							</div>
							<div class="form-group">
								<label for="phone">전화번호 : </label>
								<input type="text" class="form-control" id="phone" name = "phone">
							</div>
							<div class="form-group">
								<label for="email">E-mail : </label>
								<input type="text" class="form-control" id="email" name = "email">
							</div>
							<div class="form-group">
								<br>
								<input type="button" id="registerSubmit_btn" class="btn btn-success col-xl" value="회원가입">
							</div>
							
						</form>
					</div>
				</div><!-- register -->
			</div><!-- col -->
			<div class="col-xl-2"></div>
		</div><!-- row -->
	</div><!-- container -->
</div><!-- registerForm_section -->
</body>
</html>