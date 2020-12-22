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
	$("#mainCategory").click(function(){
		
		
	})
	
	
})
</script>
</head>
<body>
<table>

<c:forEach items="${list}" var="list">
<tr>
<td>
<input type="button" name="${list.mainCategoryNo}" id="mainCategory" value = "${list.mainCategoryName}" readonly="readonly">
</td>
<td><input type="button" value= "수정" id="${list.mainCategoryNo}"></td>
</tr>
</c:forEach>
</table>
<form action="${pageContext.request.contextPath}/admin/myPage/insertMainCategory">
<input type="text" name="mainCategoryName">
<input type="submit" value="등록">
</form>

<table>
</table>
</body>
</html>