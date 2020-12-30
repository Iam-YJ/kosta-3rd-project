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
	
	<table class="adminGoodsTable" id="adminGoodsTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>regNo</th>
					<th>AD</th>
					<th>price</th>
					<th>regDate</th>
					<th>sellcount</th>
					<th>title</th>
					<th>mainCategoryNo</th>
					<th>subCategoryNo</th>
				</tr>
			</thead>
			<c:forEach items="${listRegisterGoods}" var="listRegisterGoods">
				<tbody>
					<tr>
						<td>${listRegisterGoods.regNo}</td>
						<td>${listRegisterGoods.ad}</td>
						<td>${listRegisterGoods.price}</td>
						<td>${listRegisterGoods.regDate}</td>
						<td>${listRegisterGoods.sellcount}</td>
						<td>${listRegisterGoods.title}</td>
						<td>${listRegisterGoods.mainCategories.mainCategoryNo}</td>
						<td>${listRegisterGoods.subCategories.subCategoryNo}</td>
						
					</tr>
				</tbody>
			</c:forEach>	
		</table>


</body>
</html>