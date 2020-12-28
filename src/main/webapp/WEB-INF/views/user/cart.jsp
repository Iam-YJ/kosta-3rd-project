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
</style>
<script type="text/javascript">
	function deleteCartList(regNo){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/user/deleteCartList?regNo="+regNo;
			}
	}
	
	//3자리마다 Comma넣어주는 함수
	function AddComma(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}//AddComma
	
	$(function(){
		$(document).on("change","#quantity",function(){
			 var $spanEle = $(this).parent().parent().next().find("span");
			//alert("spanEle : " + $spanEle.html())
			 $.ajax({
			  url : "${pageContext.request.contextPath}/user/cartInfoChange" ,//서버요청주소
			  type :"post" ,//요청방식(get | post | put | delete | patch)
			  dataType : "text" ,//서버가보내온 데이터타입( text | html | xml | json)
			  data : {
				  unitQuantitiy :$(this).val(),
				  unitPrice: $(this).attr("name")
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
<div class="container">
나의 장바구니 목록
	<c:forEach items="${list}" var="list">
		<div class="row border border-left-0 border-right-0">
			<div class="col-xl-2">
				<a href="${pageContext.request.contextPath}/main/goodsDetail/${list.registerGoods.regNo}">
					<img id="thumbnail"src="${pageContext.request.contextPath}/images/thumbnail/${list.registerGoods.thumbnailImg}">
				</a>
			</div>
			<div class="col-xl-5" id="a">
				<div class="row col-xl" style="font-size: 30px; padding: 10px;">
					${list.registerGoods.name}
				</div>
				<div class="row col-xl" style="font-size: 20px; padding: 10px;">
					<input type="hidden" value="${list.registerGoods.price}" id="priceInfo">
					<fmt:formatNumber value="${list.registerGoods.price}"  var="unitPrice" />
					내역 : ${unitPrice} 원 / <input type="number" min="1" step="1" max="${list.registerGoods.stock}" value="${list.quantity}" name="${list.registerGoods.price}" id="quantity" class="quantity-field" width="100px"> 개
				</div>
			</div>
			<div class="col-xl-3" >
				<div class="row col-xl" style="font-size: 20px; padding: 50px;">
					<fmt:formatNumber value="${list.quantity*list.registerGoods.price}"  var="Price" />
						총 가격 : <span id="price" > ${Price} </span>원
				</div>
			</div>
			<div class="col-xl-2">
				<div class="row col-xl" style="padding: 15px;"></div>
			 	<input type="button"  class="btn btn-success row col-xl" onclick="" value="바로구매">
			 	<div class="row col-xl" style="padding: 5px;"></div>
 				<input type="button"  class="btn btn-outline-success row col-xl" onclick="deleteCartList(${list.registerGoods.regNo});"  value="장바구니 삭제"> 
			</div>
		</div>
	</c:forEach>
</div>

</body>
</html>