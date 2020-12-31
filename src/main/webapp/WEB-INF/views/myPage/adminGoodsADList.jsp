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
	<h1>ADMIN의 마이페이지</h1>
	<h3>광고상품 목록을 조회하는 페이지 입니다.</h3>
	<c:forEach items="${list}" var="registerGoods">

			
             ${registerGoods.regNo}
             ${registerGoods.title}
             ${registerGoods.detail}
             ${registerGoods.thumbnailImg}
             ${registerGoods.adImg}
             ${registerGoods.name}
             ${registerGoods.options}
             ${registerGoods.area}
             ${registerGoods.method}
             ${registerGoods.stock}
             ${registerGoods.price}
             ${registerGoods.sellcount}
             ${registerGoods.ad}
             ${registerGoods.regDate}
             ${registerGoods.mainCategories.mainCategoryNo}
             ${registerGoods.subCategories.subCategoryName}
             ${registerGoods.reviewList}
             <input type="button" value="삭제" id="b" onclick="location.href='${pageContext.request.contextPath}/admin/myPage/goodsADListDelete/${registerGoods.regNo}'" />
		<p>
	</c:forEach>



</body>
</html>