<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th,td {border: red solid 1px;}
</style>
</head>
<body>
<h1> user/myPage/donationForm</h1>
<form method="post" action="${pageContext.request.contextPath}/user/myPage/donation">기부천사 :  <input type="text" name="dona"><button type="submit">기부하기</button></form><br>
내가 한 누적 기부포인트 :  ${donaPoint}<p>

<table><tr><th colspan=3>전체 기부 내역</th></tr><tr><th>등수</th><th>이름</th><th>기부포인트</th></tr>
<c:forEach items="${donaList}"  var="list" varStatus="state">
<tr><td>${state.count}</td><td>${list.userList.name}</td><td>${list.donaPoint}</td></tr>
</c:forEach>
</table>

</body>
</html>