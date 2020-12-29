<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#thumbnail{width : 150px; height:150px;}
table{width:800px;}
</style>
<script type="text/javascript">
	function deleteWishList(regNo){
		if(confirm("정말로 삭제하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/user/deleteWishList?regNo="+regNo;
		}else{
			return false;
		}
	}
	
	function insertCart(regNo){
		if(confirm("장바구니에 추가 하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/user/insertcart?regNo="+regNo+"&qua=0";
		}else{
			return false;
		}
	}
	
</script>
</head>
<body>
<div class="container">
<h1>user/wish.jsp</h1>
나의 찜 목록
	<c:forEach items="${list}" var="list">
		<div class="row border border-left-0 border-right-0">
			<div class="col-xl-2">
				<a href="${pageContext.request.contextPath}/main/goodsDetail/${list.registerGoods.regNo}">
					<img id="thumbnail"src="${pageContext.request.contextPath}/images/thumbnail/${list.registerGoods.thumbnailImg}">
				</a>
			</div>
			<div class="col-xl-7">
				<div class="row col-xl" style="font-size: 30px; padding: 15px;">
					${list.registerGoods.name}
				</div>
				<div class="row col-xl" style="font-size: 20px; padding: 15px;">
					<fmt:formatNumber value="${list.registerGoods.price}" var="Price"/>
						${Price} 원
				</div>
			</div>
			<div class="col-xl-2">
				<div class="row col-xl" style="padding: 15px;"></div>
			 	<input type="button"  class="btn btn-success row col-xl" onclick="insertCart(${list.registerGoods.regNo});" value="장바구니 담기">
			 	<div class="row col-xl" style="padding: 5px;"></div>
 				<input type="button"  class="btn btn-outline-success row col-xl" onclick="deleteWishList(${list.registerGoods.regNo});"  value="삭제"> 
			</div>
		</div>
		<div class="row border border-left-0 border-right-0">
			<div class="row col-xl" style="padding: 5px;">
 				<input type="button"  class="btn btn-outline-success row col-xl" onclick="deleteWishList(${list.registerGoods.regNo});"  value="찜목록 전체삭제"> 
 			</div>
		</div>
	</c:forEach>
</div>
</body>
</html>