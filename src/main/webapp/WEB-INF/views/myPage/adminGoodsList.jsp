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

	<div class="OrderListInfo">
		<c:if test="${empty listRegisterGoods}">
					등록된 상품이 없습니다.
				</c:if>

		<!--  -->
		<c:if test="${not empty listRegisterGoods}">
			<c:forEach items="${listRegisterGoods}" var="listRegisterGoods">
				<div class="Orders border rounded"
					style="margin-bottom: 20px; padding-bottom: 10px">
					<div class="row" style="padding: 10px">
						<div class="col-xl" style="margin-left: 30px;">
							<b>상품고유번호 : ${listRegisterGoods.regNo}</b>
						</div>
						
						<div class="col-xl" style="text-align: right; margin-right: 40px;"></div>
					</div>
					<div class="row" style="padding: 10px">
						<div class="col-xl" style="text-align: left; margin-left: 20px;">
							카테고리 : ${listRegisterGoods.mainCategories.mainCategoryName} &nbsp - &nbsp ${listRegisterGoods.subCategories.subCategoryName}
							<br><br>
							<a href = "${pageContext.request.contextPath}/main/goodsDetail/${listRegisterGoods.regNo}"> 상품명 : ${listRegisterGoods.title}</a>
							
						</div>
					<br>
					</div>
					<!-- btn  -->
				</div>
				<!-- orders -->
			</c:forEach>
		</c:if>
	</div>



</body>
</html>