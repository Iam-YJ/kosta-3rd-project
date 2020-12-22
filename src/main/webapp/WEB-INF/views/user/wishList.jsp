<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img{width : 150px; height:150px;}
</style>
</head>
<body>
<h1>user/wish.jsp</h1>
<div class="row">
		<c:forEach items="${map}" var="map">
			<div class="col-xl"><div class="col-xl"><div class="col-xl"><div class="col-xl"><div class="col-xl">
			<fieldset>
			${map.value.name}<br>
			${map.value.price}<br>
			<a href="${pageContext.request.contextPath}/main/goodsDetail/${map.value.regNo}">
			<img src="${pageContext.request.contextPath}/images/thumbnail/${map.value.thumbnailImg}">
			</a>
			</fieldset>
			</div></div></div></div></div>
		</c:forEach>
</div>

</body>
</html>