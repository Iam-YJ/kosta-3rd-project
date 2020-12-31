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
	$("#registerSubmit_btn").click(function(){			
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
	
		$("#regForm").submit();	
	});//submit
	
	
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


	<div class="container">
		<div class="row">
			<div class="col-xl-2"></div>
			<div class="col-xl">
				<h3>개인정보 수정</h3>
						<form action="${pageContext.request.contextPath}/user/myPage/updateUserList" id="regForm" method="post">
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
							
								<input type="hidden" class="form-control" id="sample4_postcode" placeholder="우편번호">
							
								<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
								<input type="text" id="sample4_roadAddress" value = "${userList.addr}" name="addr" placeholder="도로명주소" class="form-control" style="color: black;"><br>
									<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<span id="guide" style="color:#999"></span>
							</div>
							<div class="form-group">
								<label for="phone">전화번호 : </label>
								<input type="text" class="form-control" id="phone" name = "phone" value="${userList.phone}">
							</div>
							<div class="form-group">
								<label for="email">E-mail : </label>
								<input type="text" class="form-control" id="email" name = "email" value="${userList.email}">
							</div>
							<div class="form-group">
								<br>
								<input type="button" id="registerSubmit_btn" class="btn btn-success col-xl" value="수정하기">
							</div>
							
						</form>
					</div>
				</div><!-- register -->
			</div><!-- col -->
		

</body>
</html>