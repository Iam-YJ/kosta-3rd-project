<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>


<script type="text/javascript">
	$(function() {
		$("#keyword").keyup(
			function() {

				var k = $(this).val();
				$("#userTable > tbody > tr").hide();
				var findId = $("#userTable > tbody > tr > td:nth-child(5n+3):contains('"+ k + "')");
				var findName = $("#userTable > tbody > tr > td:nth-child(5n+2):contains('"+ k + "')");

			$(findId).parent().show();
			$(findName).parent().show();

		})
	})
</script>

</head>

<body>
	<h1>admin/myPage/userCheck.jsp</h1>
	<div id="container">
		<div id="input-form">
			검색 : <input type="text" id="keyword">
		</div>

		<table class="userTable" id="userTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>UserNo</th>
					<th>UserId</th>
					<th>UserName</th>
					<th>UserGrade</th>
				</tr>
			</thead>
			<c:forEach items="${userList}" var="userList">
				<tbody>
					<tr>
						<td>${userList.userNo}</td>
						<td><a href="">${userList.userId}</a></td>
						<td>${userList.name}</td>
						<td>${userList.usergrade.gradeNo}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>

</body>
</html>