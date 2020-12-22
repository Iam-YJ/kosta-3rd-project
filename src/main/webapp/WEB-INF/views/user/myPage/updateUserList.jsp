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
<h1>개인정보 수정</h1>
<form action="${pageContext.request.contextPath}/user/myPage/updateUserList" id="regForm" method="post">
비밀번호 : <input type="password" name = "passWord"><Br>
비밀번호확인 : <input type="password" name = "passWordCheck"><span id="pwdCheckSpan"></span><br>
주소 : <input type="text" name = "addr" value="${userList.addr}"><Br>
전화번호 : <input type="text" name = "phone" value="${userList.phone}"><br>
E-Mail : <input type="text" name = "email" value="${userList.email}"><br>
<input type="submit" value="수정하기">
</form>



</body>
</html>