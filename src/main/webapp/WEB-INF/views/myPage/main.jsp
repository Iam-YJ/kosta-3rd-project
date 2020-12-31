<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="userCartSection">
	<div class="container-fluid">
		<div class=titleSection>
			<div class="row">
				<div class="col-xl" style="text-align: left;">
					포인트 / 등급 조회
				</div>
			</div>
		</div>
	
<table>
  <tr>
    <th>등급</th>
    <th>구매 최소 금액</th>
    <th>구매 최대 금액</th>
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
			<fmt:formatNumber value="${user.lowPrice}"  var="lowPrice" />
				${lowPrice}원<p>
			</td>
			<td>	
			<fmt:formatNumber value="${user.highPrice}"  var="highPrice" />
				${highPrice}원<p>
			</td>
			<td>
				${user.pointRate}<p>
			</td>
			</tr>
		</c:forEach>

		</tr>
	</table>


</div>

	

</body>
</html>