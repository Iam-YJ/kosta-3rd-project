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
<h1>main/registerFormKakao.jsp</h1>
<form action="${pageContext.request.contextPath}/main/registerKakao" id="regForm" method="post">
이름 : <input type="text" name = "name"><br>
아이디 : <input type="text" name = "userId"><span id="idCheckView"></span><br>
비밀번호 : <input type="password" name = "passWord"><Br>
비밀번호확인 : <input type="password" name = "passWordCheck"><span id="pwdCheckSpan"></span><br>
주소 : <input type="text" name = "addr"><Br>
전화번호 : <input type="text" name = "phone"><br>
E-Mail : <input type="text" name = "email" value="${userEmail}"><br>
 
<input type="submit" value="Register Member">
</form>



</body>
</html>