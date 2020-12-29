<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
</head>
<body>

		<table class="userDetailTable" id="userDetailTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>UserNo</th>
					<th>UserId</th>
					<th>UserName</th>
					<th>UserGrade</th>
					<th>UserAddr</th>
					<th>UserPhone</th>
					<th>UserEmail</th>
					<th>UserPoints</th>
				</tr>
			</thead>
			
				<tbody>
					<tr>
						<td>${userList.userNo}</td>
						<td>${userList.userId}</td>
						<td>${userList.name}</td>
						<td>${userList.usergrade.gradeNo}</td>
						<td>${userList.addr}</td>
						<td>${userList.phone}</td>
						<td>${userList.email}</td>
						<td>${userList.points}</td>
					</tr>
				</tbody>

		</table>

</body>
</html>