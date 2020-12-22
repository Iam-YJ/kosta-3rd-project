<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function wishbtn(regNo){
		if(confirm("찜 목록에 추가 하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/user/insertwish?regNo="+regNo;
			return true;
		}else{
			return false;
		}
	}//wishbtn
	
	function cartbtn(regNo,quantitiy){
		var qua=document.getElementById("quantity").value
		//console.log(document.getElementById("quantity").value)
		 if(confirm("장바구니에 추가 하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/user/insertcart?regNo="+regNo+"&qua="+qua;
			return true;
		}else{
			return false;
		} 
	}//cartbtn


$(document).ready(function(){
	$(document).on("change","#quantity",function(){
		var totalPrice = ${registerGoods.price} * $(this).val();
		//console.log(totalPrice)
		$("#totalPrice").empty();
		$("#totalPrice").append(AddComma(totalPrice));
	})//change_quantityInput
	

	
	
	//3자리마다 Comma넣어주는 함수
	function AddComma(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}//AddComma
	
});//ready
</script>
</head>
<body>
<div class="goodsDetail">
	<div class="container">
		<div class="goodsDetailCategory">
			홈 > ${registerGoods.mainCategories.mainCategoryName} > ${registerGoods.subCategories.subCategoryName}
		</div>
		
		<!-- ------------------------------------------------------------------ -->
		
		<div class="goodsDetailTop">
			<div class="row">
				<div class="col-xl-1"></div>
				<div class="thumbNailSection col-xl-4">
					<!-- GoodSDetial 이미지 들어가는 부분 -->
					<img alt="" class="img-fluid center-block"
					src="${pageContext.request.contextPath}/images/thumbnail/${registerGoods.thumbnailImg}" >
				</div>
				<div class="col-xl-1"></div>
				<div class="expainSetion col-xl">
					<!-- GoodSDetial 간단 들어가는 부분 -->
					<h3>${registerGoods.title}</h3>
					<hr>
					<div class="row">
						<div class="columeName col-xl-5">
							일반가<br><br>
							상품명<br><br>
							보관방법<br><br>
							원산지<br><br>
							용량/수량/크기<br><br>
							최대구매가능수량<br><br>
							구매수량<br><br>
						</div>
						<div class="columeValue col-xl">
						<fmt:formatNumber value="${registerGoods.price}" var="CommaPrice"/>
							${CommaPrice} 원<br><br>
							${registerGoods.name}<br><br>
							${registerGoods.method}<br><br>
							${registerGoods.area}<br><br>
							${registerGoods.options}<br><br>
							<fmt:formatNumber value="${registerGoods.stock}" var="CommaStock"/>
							${CommaStock} 개<br><br>
							<input type="number" min="1" step="1" max="${registerGoods.stock}" value="1" id="quantity" class="quantity-field" width="100px"> 개
						</div>
					</div>
				</div>
			</div><!-- row -->
			<div class="row">
				<div class="col-xl">
					<hr>
					<div class="totalPrice">
						총 상품금액 : <span id="totalPrice" style="color: green; font-size: 30px">
							${CommaPrice}
						</span>원
					</div>
					
					<div class="userBtnSection">
						<a href="#" class="btn btn-outline-success" onclick="wishbtn(${registerGoods.regNo});">찜</a>
						<a href="#"  class="btn btn-outline-success" onclick="cartbtn(${registerGoods.regNo});">장바구니</a>
						<a href="" class="btn btn-success">바로구매</a>
					</div>
				</div>
			</div><!-- row -->
		</div><!-- goodsDetailTop -->
		
<!-- ------------------------------------------------------------------ -->

		<div class="goodsDetailBottom">
			
			<ul class="nav nav-tabs row border">
				<li class="nav-item col-xl">
				  <a class="nav-link active btn btn-outline-success" data-toggle="tab" href="#home">상품 설명</a>
				</li>
				<li class="nav-item col-xl">
				  <a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu1">상품 상세정보</a>
				</li>
				<li class="nav-item col-xl">
				  <a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu2">상품 문의</a>
				</li>
				<li class="nav-item col-xl">
				  <a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu3">상품 후기</a>
				</li>
			</ul>
			
			<!-- Tab panes -->
			<div class="tab-content">
				<div id="home" class="tab-pane active"><br>
					<div class="goodsInfo">
						${registerGoods.detail}
					</div>
				</div>
				<div id="menu1" class="tab-pane fade"><br>
					<div class="goodsDetailInfo">
						<h3>상품 상세정보</h3>
						
						<div class="row">
							<div class="left1 col-xl-4"> 
								상품명
							</div>
							<div class="right1 col-xl"> 
								&nbsp;&nbsp;${registerGoods.name}
							</div>
						</div>
						
						<div class="row">
							<div class="left2 col-xl-4"> 
								용량/수량/크기
							</div>
							<div class="right2 col-xl"> 
								&nbsp;&nbsp;${registerGoods.options}
							</div>
						</div>
						
						<div class="row">
							<div class="left2 col-xl-4"> 
								원산지 및 생산지
							</div>
							<div class="right2 col-xl"> 
								&nbsp;&nbsp;${registerGoods.area}
							</div>
						</div>
						
						<div class="row">
							<div class="left2 col-xl-4"> 
								보관방법
							</div>
							<div class="right2 col-xl"> 
								&nbsp;&nbsp;${registerGoods.method}
							</div>
						</div>
						
						<div class="row">
							<div class="left2 col-xl-4"> 
								환불기간
							</div>
							<div class="right2 col-xl"> 
								&nbsp;&nbsp;구매일로부터 3일이내
							</div>
						</div>
						
						<div class="row">
							<div class="left2 col-xl-4"> 
								생산연월일
							</div>
							<div class="right2 col-xl"> 
								&nbsp;&nbsp;제품 별도 표시 참조
							</div>
						</div>		
						
						<div class="row">
							<div class="left2 col-xl-4"> 
								유통기한
							</div>
							<div class="right2 col-xl"> 
								&nbsp;&nbsp;제품 별도 표시 참조
							</div>
						</div>
						
						<div class="row">
							<div class="left2 col-xl-4"> 
								품질유지기한
							</div>
							<div class="right2 col-xl"> 
								&nbsp;&nbsp;제품 별도 표시 참조
							</div>
						</div>									
						
					</div>
				</div>
				<div id="menu2" class="tab-pane fade"><br>
					<h3 style="color: red">상품문의 연결예정</h3>
				</div>
				<div id="menu3" class="tab-pane fade"><br>
					<h3 style="color: red">상품후기 연결예정</h3>
				</div>
			</div>
			
			
			
			
		
		</div><!-- goodsDetailBottom -->
	</div><!-- container -->
</div><!-- goodsDetail -->

<!-- ---------------------------상품없을 떄.... --------------------------------------- -->


</body>
</html>