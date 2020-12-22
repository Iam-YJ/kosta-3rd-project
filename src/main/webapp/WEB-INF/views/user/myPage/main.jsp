<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>user/myPage/main.jsp</h1>
<br>
<h2>${userList.userId} 의 마이페이지</h2>
	<table align="center" >
		<tr>
			<td>
					<b><span >포인트&nbsp&nbsp</span></b>
			</td>
			<td >
					<b><span>등급</span></b>
			</td>
		</tr>
		<tr>
			<td>
					${userList.points}
			</td>
			<td >
					${userList.usergrade.grade}
			</td>
		</tr>
	</table>
	
	<br><br><br>
	
	<table align="center" >
		<tr>
			<td>
					<b><span >등급&nbsp&nbsp</span></b>
			</td>
			<td >
					<b><span>최소금액&nbsp&nbsp</span></b>
			</td>
						<td >
					<b><span>최대금액&nbsp&nbsp</span></b>
			</td>
						<td >
					<b><span>포인트적립율</span></b>
			</td>
			
			
		</tr>
		<tr>
		<c:forEach var="user" items="${userGradeList}">
		<tr>
			<td>
				${user.grade}<p>
			</td>
			<td>
				${user.lowPrice} <p>
			</td>
			<td>		
				${user.highPrice}<p>
			</td>
			<td>
				${user.pointRate}<p>
			</td>
			</tr>
		</c:forEach>

		</tr>
	</table>




	

</body>
</html>