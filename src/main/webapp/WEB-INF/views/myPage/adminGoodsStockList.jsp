<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).on("click","#btn",function(){
			var addSt = $(this).prev().val();
			var addReNo = $(this).prev().prev().val();
			
			//alert(addSt+" , "+ addReNo);
			$("#regNo").val(addReNo);
			$("#stock").val(addSt);
			
			$("#addStockForm").submit();
		})
	});
	
	
</script>

</head>
<body>
	<h1>ADMIN의 마이페이지</h1>
	<h3>상품의 재고량 조회하는 페이지 입니다.</h3>

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
  추가할 수량은? :
  <input type="hidden" name="addRegNo" value="${registerGoods.regNo}"/>
  <input type="text" name="addStock" id="addStock">
  <input type="button" value="추가" id="btn">
             ${registerGoods.price}
             ${registerGoods.sellcount}
             ${registerGoods.ad}
             ${registerGoods.regDate}
             ${registerGoods.mainCategories}
             ${registerGoods.subCategories}
             ${registerGoods.reviewList}
             <p>
</c:forEach>



<form action="${pageContext.request.contextPath}/admin/myPage/updateGoods" method="post" id="addStockForm">
   <input type="hidden" name="regNo"  id="regNo">
   <input type="hidden" name="stock"  id="stock">
</form>




</body>
</html>