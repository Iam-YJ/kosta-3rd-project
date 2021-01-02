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
	function delWishList(){
		if(confirm("정말로 삭제하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
	
	function cartbtn(){
		if(confirm("장바구니에 추가 하시겠습니까?")){
			return true;
		}
		return false;
	}
	
	function confirmDelete(){
		if(confirm("모든 항목을 삭제하시겠습니까?")){
			return true;
		}else{
			return false;
		}		
	}
	
	
</script>
</head>
<body>

<div class="userWishListSection">
	<div class="container-fluid">
		<div class=titleSection>
			<div class="row">
				<div class="col-xl" style="text-align: left;">
					나의 찜 목록
				</div>
				<c:if test="${!empty wishList}">
					<div class="col-xl" style="text-align: right;">
						<a href="${pageContext.request.contextPath}/user/delWishList/0?state=all" class="btn btn-outline-success" 
						onclick="return confirmDelete();">전체삭제</a>
					</div>
				</c:if>
			</div>
		</div><!-- userOrderListTitle -->
		<div class="CartListInfo">
			<c:if test="${empty wishList}">
				장바구니 목록이 없습니다.			
			</c:if>
			<c:forEach items="${wishList}" var="list">
				<div class="Cart border rounded" style="margin-bottom: 20px; padding-bottom: 10px">
					<div class="row">
						<div class="col-xl-2" style="margin: 10px;">
							<a href="${pageContext.request.contextPath}/main/goodsDetail/${list.registerGoods.regNo}">
								<img id="thumbnail"src="${pageContext.request.contextPath}/images/thumbnail/${list.registerGoods.thumbnailImg}"
								class="img-fluid">
							</a>
						</div>
						<div class="col-xl" style="margin: auto;">
							<div class="row">
								<div class="col-xl" style="font-size: 20px; padding: 5px;">
									<b>${list.registerGoods.title}</b>
								</div>
							</div>
							<div class="row">
								<div class="col-xl" style="font-size: 18px; padding: 5px;">
									<input type="hidden" value="${list.registerGoods.price}" id="priceInfo">
									<input type="hidden" value="${list.registerGoods.regNo}" id="regInfo">
									<fmt:formatNumber value="${list.registerGoods.price}"  var="unitPrice" />
									금액 : ${unitPrice} 원 
								</div>
							</div>
						</div>
						<div class="col-xl-3" style="margin: auto;">
							<div class="row" style="margin: 10px;">
								<a href="${pageContext.request.contextPath}/user/insertcart/${list.registerGoods.regNo}?state=my"  
								class="btn btn-success col-xl" onclick="return cartbtn();">장바구니 담기</a>
							</div>
						 	<div class="row" style="margin: 10px;">
						 		<a href="${pageContext.request.contextPath}/user/delWishList/${list.wishNo}"
						 		class="btn btn-outline-success col-xl" onclick="return delWishList();">삭제</a>
							</div>
 							 
						</div>
						<div class="col-xl-1"></div>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</div><!-- container-fluid -->
</div><!-- userWishListSection -->

</body>
</html>