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
			location.href="${pageCotext.request.contextPath}/user/myPage/updateUserListForm"
		}else{
			alert("비밀번호를 확인해주세요")
		}
	})
})

</script>
</head>
<body>
<h3>개인정보 수정을 위하여 비밀번호를 입력하여주세요</h3>

비밀번호 : <input type="password" name = "passWord"><br>
<input type="button" name="passWordCheck" value="확인">
</body>
</html>