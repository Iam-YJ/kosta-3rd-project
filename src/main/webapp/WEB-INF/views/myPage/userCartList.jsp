<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteCartList(regNo){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/user/deleteCartList?regNo="+regNo;
			}else{
				return false;
			}
	}
	
	function buyCartGoods(){
		if(confirm("모든 상품을 구매하시겠습니까?")){
			location.href=
				"${pageContext.request.contextPath}/user/buyCartGoods";
			return true;
		}else{
			return false;
		} 
	}
	
	
	//3자리마다 Comma넣어주는 함수
	function AddComma(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}//AddComma
	
	$(function(){
		$(document).on("change","#quantity",function(){
			//alert("regInfo : " +$(this).parent().find("#regInfo").val())
			 var $spanEle = $(this).parent().parent().parent().next().find("span");
			//alert("spanEle : " + $spanEle.html())
			 $.ajax({
			  url : "${pageContext.request.contextPath}/user/cartInfoChange" ,//서버요청주소
			  type :"post" ,//요청방식(get | post | put | delete | patch)
			  dataType : "text" ,//서버가보내온 데이터타입( text | html | xml | json)
			  data : {
				  unitQuantitiy :$(this).val(),
				  unitPrice: $(this).attr("name"),
				  regNo:$(this).parent().find("#regInfo").val()
				  }, //서버에게 보낼 parameter정보
			  success: function(result){
				  var re =AddComma(result);
				  $spanEle.html(re);
			  },
			  error : function(err){
				  console.log(err+ " 예외발생....");
			  }
		  });//ajax
		});
		
	});//ready
</script>
</head>
<body>
<div class="userCartSection">
	<div class="container-fluid">
		<div class=titleSection>
			<div class="row">
				<div class="col-xl" style="text-align: left;">
					나의 장바구니 목록
				</div>
				<c:if test="${!empty cartList}">
					<div class="col-xl" style="text-align: right;">
						<input type="button"  class="btn btn-outline-success" onclick="buyCartGoods();"  value="전체 구매">
					</div>
				</c:if>
			</div>
		</div><!-- userOrderListTitle -->
		<div class="CartListInfo">
			<c:if test="${empty cartList}">
				장바구니 목록이 없습니다.			
			</c:if>
			<c:forEach items="${cartList}" var="list">
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
									금액 : ${unitPrice} 원 / <input type="number" min="1" step="1" max="${list.registerGoods.stock}" value="${list.quantity}" name="${list.registerGoods.price}" id="quantity" class="quantity-field" width="100px"> 개
								
								</div>
							</div>
						</div>
						<div class="col-xl-2" style="margin: auto;">
							<div class="row">
								<div class="col-xl" style="padding: 5px;">
									총 가격
								</div>
							</div>
							<div class="row">
								<div class="col-xl" style="padding: 5px;"> 
									<fmt:formatNumber value="${list.quantity * list.registerGoods.price}" var="Price" />
									<span id="price">${Price}</span>원
								</div>
							</div>
							
							
						</div>
						<div class="col-xl-2" style="margin: auto;">
						 	<input type="button" class="btn btn-success col-xl" onclick="" value="바로구매" style="margin: 5px;">
			 				<input type="button"  class="btn btn-outline-success col-xl" onclick="deleteCartList(${list.registerGoods.regNo});"  value="삭제" style="margin: 5px;"> 
						</div>
						<div class="col-xl-1"></div>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</div><!-- container-fluid -->
</div><!-- userCartSection -->


</body>
</html>