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
  <input type="text" name="regNo" value="${registerGoods.regNo}">
  <input type="submit" value="추가">


             ${registerGoods.price}
             ${registerGoods.sellcount}
             ${registerGoods.ad}
             ${registerGoods.regDate}
             ${registerGoods.mainCategories}
             ${registerGoods.subCategories}
             ${registerGoods.reviewList}
             <p>
             

      		
            
</c:forEach>

<form>



</form>


</body>
</html>