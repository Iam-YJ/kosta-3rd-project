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
$(document).ready(function(){
	
	$(document).on("change","#quantity",function(){
		var totalPrice = ${goodsQuestionMap.registerGoods.price} * $(this).val();
		//console.log(totalPrice)
		$("#totalPrice").empty();
		$("#totalPrice").append(AddComma(totalPrice));
	})
	//change_quantityInput
	
	$(document).on("click","#insertGoodsQBtn",function(){
		if(!clientChk()){
			return false;
		}
		
		if($("#insertQtextArea").val() == null || $("#insertQtextArea").val() == ""){
			alert("질문을 입력해주세요.");
			$("#insertQtextArea").focus();
			return false;
		}
		
		$("#insertGoodsQForm").submit();
		
	})//insertGoodsQBtn_click
	
	//3자리마다 Comma넣어주는 함수
	function AddComma(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}//AddComma
	
	
	
});//ready

function wishbtn(regNo){
	
	if(!clientChk()){
		return false;
	}
	
	if(confirm("찜 목록에 추가 하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/user/insertwish?regNo="+regNo;
		return true;
	}else{
		return false;
	}
}//wishbtn

function cartbtn(regNo){
	if(!clientChk()){
		return false;
	}
	
	 if(confirm("장바구니에 추가 하시겠습니까?")){
		return true;
	 }
	return false;
}//cartbtn

function instantBuybtn(regNo){
	
	if(!clientChk()){
		return false;
	}
	
	var qua=document.getElementById("quantity").value
	
	if(qua > ${goodsQuestionMap.registerGoods.stock}){
		alert("최대 구매 수량을 넘길 수 없습니다.");
		return false;
	}
		
	//console.log(document.getElementById("quantity").value)
	 if(confirm("상품을 구매하시겠습니까?")){
		location.href=
			"${pageContext.request.contextPath}/user/instantBuy/${goodsQuestionMap.registerGoods.regNo}?quantity="+qua;
		return true;
	}else{
		return false;
	} 
}//instantBuybtn

function clientChk(){
	if (${sessionScope.userList.authority != 'ROLE_USER'}) {
		alert("회원전용 서비스 입니다.")
		return false;
	} 
	return true;
}

function deleteConfirm(){
	if(confirm("삭제하시겠습니까?")){
		return true;
	}
	return false;
}


</script>
</head>
<body> 
<div class="goodsDetail">
	<div class="container">
		<div class="goodsDetailCategory">
			홈 > ${goodsQuestionMap.registerGoods.mainCategories.mainCategoryName} > ${goodsQuestionMap.registerGoods.subCategories.subCategoryName}
		</div>
		
		<!-- ------------------------------------------------------------------ -->
		
		<div class="goodsDetailTop">
			<div class="row">
				<div class="col-xl-1"></div>
				<div class="thumbNailSection col-xl-4">
					<!-- GoodSDetial 이미지 들어가는 부분 -->
					<c:choose>
						<c:when test="${goodsQuestionMap.registerGoods.stock <= 0}">
							<img alt="" class="img-fluid center-block"
							src="${pageContext.request.contextPath}/images/thumbnail/soldout.png" >
						</c:when>
						<c:otherwise>
							<img alt="" class="img-fluid center-block"
							src="${pageContext.request.contextPath}/images/thumbnail/${goodsQuestionMap.registerGoods.thumbnailImg}" >
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-xl-1"></div>
				<div class="expainSetion col-xl">
					<!-- GoodSDetial 간단 들어가는 부분 -->
					<div class="row">
						<div class="col-xl"> 						
							<h3>${goodsQuestionMap.registerGoods.title}</h3>
						</div>
						<c:if test="${sessionScope.userList.authority eq 'ROLE_ADMIN'}">
							<div class="col-xl-3">
								<a href="${pageContext.request.contextPath}/admin/updateGoods/${goodsQuestionMap.registerGoods.regNo}" class="btn btn-outline-success">상품 수정</a>
							</div>
						</c:if>
					</div>
					
					<hr>
					<div class="row">
						<div class="col-xl" style="margin: auto;">
							<div class="row" style="margin-top: 20px;">
								<div class="col-xl-6" style="text-align: left; color: gray;">
									일반가
								</div>
								<div class="col-xl-6">
									<fmt:formatNumber value="${goodsQuestionMap.registerGoods.price}" var="CommaPrice"/>
									${CommaPrice} 원
								</div>
							</div>
							
							<div class="row" style="margin-top: 20px;">
								<div class="col-xl" style="text-align: left; color: gray;">
									상품명
								</div>
								<div class="col-xl">
									${goodsQuestionMap.registerGoods.name}
								</div>
							</div>
							
							<div class="row" style="margin-top: 20px;">
								<div class="col-xl" style="text-align: left; color: gray;">
									보관방법
								</div>
								<div class="col-xl" >
									${goodsQuestionMap.registerGoods.method}
								</div>
							</div>
							
							<div class="row" style="margin-top: 20px;">
								<div class="col-xl" style="text-align: left; color: gray;">
									원산지
								</div>
								<div class="col-xl">
									${goodsQuestionMap.registerGoods.area}
								</div>
							</div>
							
							<div class="row" style="margin-top: 20px;">
								<div class="col-xl" style="text-align: left; color: gray;">
									용량/수량/크기
								</div>
								<div class="col-xl">
									${goodsQuestionMap.registerGoods.options}
								</div>
							</div>
							
							<div class="row" style="margin-top: 20px;">
								<div class="col-xl" style="text-align: left; color: gray;">
									최대구매가능수량
								</div>
								<div class="col-xl">
									<fmt:formatNumber value="${goodsQuestionMap.registerGoods.stock}" var="CommaStock"/>
									 ${CommaStock} 개
								</div>
							</div>
							
							<div class="row" style="margin-top: 20px;">
								<div class="col-xl" style="text-align: left; color: gray;">
									구매수량
								</div>
								<div class="col-xl">
									<input type="number" min="1" step="1" max="${registerGoods.registerGoods.stock}" value="1" id="quantity" class="quantity-field" width="100px"> 개
								</div>
							</div>
						</div>
					</div>
				</div>
			</div><!-- row -->
			<div class="row">
				<div class="col-xl">
					<hr>
					<c:choose>
						<c:when test="${goodsQuestionMap.registerGoods.stock <= 0}">
							<div style="text-align: center; font-size: 30px;">
								일시적으로 서비스 이용이 불가능한 상품입니다.
							</div>
						</c:when>
						<c:otherwise>
							<div class="totalPrice">
								총 상품금액 : <span id="totalPrice" style="color: green; font-size: 30px">
									 ${CommaPrice}
								</span>원
							</div>
							
							<div class="userBtnSection">
								<a href="#" class="btn btn-outline-success" onclick="wishbtn(${goodsQuestionMap.registerGoods.regNo});">찜</a>
								<a href="${pageContext.request.contextPath}/user/insertcart/${goodsQuestionMap.registerGoods.regNo}"  
								class="btn btn-outline-success" onclick="return cartbtn();">장바구니</a>
								<a href="#" class="btn btn-success" onclick="instantBuybtn(${goodsQuestionMap.registerGoods.regNo})">바로구매</a>
							</div>
						</c:otherwise>
					</c:choose>
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
				  <a class="nav-link btn btn-outline-success" data-toggle="tab" 
				  href="#menu3">상품 후기</a>
				</li>
			</ul>
			
			<!-- Tab panes -->
			<div class="tab-content">
				<div id="home" class="tab-pane active">
					<div class="goodsInfo">
						${goodsQuestionMap.registerGoods.detail}
					</div>
				</div>
				
				<div id="menu1" class="tab-pane fade">
					<div class="goodsDetailInfo">
						<h3>상품 상세정보</h3>
						
						<div class="row">
							<div class="left1 col-xl-4"> 
								상품명
							</div>
							<div class="right1 col-xl"> 
								&nbsp;&nbsp;${goodsQuestionMap.registerGoods.name}
							</div>
						</div>
						
						<div class="row">
							<div class="left2 col-xl-4"> 
								용량/수량/크기
							</div>
							<div class="right2 col-xl"> 
								&nbsp;&nbsp;${goodsQuestionMap.registerGoods.options}
							</div>
						</div>
						
						<div class="row">
							<div class="left2 col-xl-4"> 
								원산지 및 생산지
							</div>
							<div class="right2 col-xl"> 
								&nbsp;&nbsp;${goodsQuestionMap.registerGoods.area}
							</div>
						</div>
						
						<div class="row">
							<div class="left2 col-xl-4"> 
								보관방법
							</div>
							<div class="right2 col-xl"> 
								&nbsp;&nbsp;${goodsQuestionMap.registerGoods.method}
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
				
				<!-- 상품문의 -->
				<div id="menu2" class="tab-pane fade">
					<div class="goodsQuestionInfo">
						<h3>상품 문의</h3>
						<c:choose>
							 <c:when test="${empty goodsQuestionMap.goodsQuestionList}">
							 	<div class="row border rounded">
							 		<div class="col-xl-1"></div>
							 		
							 		<div class="col-xl">
							 			<div class="row" style="margin-top: 10px;">
							 				<div class="col-xl" style="margin: auto; text-align: center;">
						 						<b>내용</b>
						 					</div>
						 					<div class="col-xl-2" style="margin: auto; text-align: center;">
						 						<b>작성자</b>
						 					</div>
						 					<div class="col-xl-2" style="margin: auto; text-align: center;">
						 						<b>작성일</b>
						 					</div>
							 			</div>
							 			
						 				<div class="row border rounded" style="padding: 10px 0px; margin: 10px 0px;">
						 					<div class="col-xl" style="margin: auto; text-align: left;">
						 						상품문의가 없습니다.
						 					</div>
						 					<div class="col-xl-2" style="margin: auto; text-align: center;">
						 						-
						 					</div>
						 					<div class="col-xl-2" style="margin: auto; text-align: center;">
						 						-
						 					</div>
						 				</div>
							 			
							 			<!-- 상품문의 달기 section -->
									 	<form action="${pageContext.request.contextPath}/user/insert/goodsQuestion/${goodsQuestionMap.registerGoods.regNo}"
									 		method="post" id="insertGoodsQForm">
										 	<div class="row" style="margin-bottom: 10px;">
										 		<div class="col-xl">
										 			<textarea rows="2" name="content" class="form-control" id="insertQtextArea"></textarea>
										 		</div>
										 		<div class="col-xl-2" style="margin: auto">
										 			<input type="button" id="insertGoodsQBtn" class="btn btn-outline-success" value="상품문의">
										 		</div>
										 	</div>
									 	</form>	<!-- 상품문의 달기 section -->
							 			
							 		</div>
							 		<div class="col-xl-1"></div>
							 	</div>
							 </c:when>
							 
							 <c:otherwise>
							 <!-- 상품문의가 있을 때 -->
							 	<div class="row border rounded">
							 		<div class="col-xl-1"></div>
							 		
							 		<div class="col-xl">
							 			<div class="row" style="margin-top: 10px;">
							 				<div class="col-xl" style="margin: auto; text-align: center;">
						 						<b>내용</b>
						 					</div>
						 					<div class="col-xl-2" style="margin: auto; text-align: center;">
						 						<b>작성자</b>
						 					</div>
						 					<div class="col-xl-2" style="margin: auto; text-align: center;">
						 						<b>작성일</b>
						 					</div>
							 			</div>
							 			
							 			<c:forEach items="${goodsQuestionMap.goodsQuestionList}" var="goodsQuestion">
							 			
							 			
							 				<div class="row border rounded" style="padding: 10px 0px; margin: 10px 0px;">
							 					<div class="col-xl">
							 						<div class="row" style="padding: 10px 0px;">
									 					<div class="col-xl" style="margin: auto; text-align: left;">
									 						<div class="row"><!-- 상품문의글 -->
									 							<div class="col-xl" style="margin: auto; text-align: left;">
									 								<c:if test="${sessionScope.userList.authority eq 'ROLE_ADMIN'}">
									 									<a href="#" style="color: black;" data-toggle="collapse" data-target="#ainsert${goodsQuestion.qgoodsNo}">
									 								</c:if>
									 								${goodsQuestion.content}
									 								<c:if test="${sessionScope.userList.authority eq 'ROLE_ADMIN'}">
									 									</a>
									 								</c:if>
									 							</div>
									 							<c:if test="${sessionScope.userList.authority eq 'ROLE_USER'}">
										 							<c:if test="${goodsQuestion.userList.userNo eq sessionScope.userList.userNo}">
											 							<div class="col-xl-3" style="margin: auto; text-align: right; font-size: 12px;">
										 									<button type="button" class="btn btn-outline-light" style="color: gray; font-size: 12px;" 
										 									data-toggle="collapse" data-target="#qupdate${goodsQuestion.qgoodsNo}">수정</button>
										 									| <a href="${pageContext.request.contextPath}/user/delete/goodsQuestion/${goodsQuestionMap.registerGoods.regNo}/${goodsQuestion.qgoodsNo}" 
										 									class="btn btn-outline-light" style="color: gray; font-size: 12px;" onclick="return deleteConfirm();">삭제</a>
											 							</div>
											 						</c:if>
										 						</c:if>
									 						</div>
									 					</div>
									 					<div class="col-xl-2" style="margin: auto; text-align: center;">
									 						${goodsQuestion.userList.userId}
									 					</div>
									 					<div class="col-xl-2" style="margin: auto; text-align: center;">
									 						<fmt:parseDate value="${goodsQuestion.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
															<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
															${formatDate}
									 					</div>
									 				</div><!-- question row -->
									 				
									 				<div id="qupdate${goodsQuestion.qgoodsNo}" class="collapse"><!-- 상품수정폼 -->
									 					<form action="${pageContext.request.contextPath}/user/update/goodsQuestion/${goodsQuestionMap.registerGoods.regNo}/${goodsQuestion.qgoodsNo}"
									 						method="post" id="updateGoodsQForm">
								 							<div class="row" style="margin: 5px;">
								 								<div class="col-xl">
								 									<input type="text" class="form-control" name="content" value="${goodsQuestion.content}">
								 								</div>
								 								<div class="col-xl-1" style="text-align: center; margin: auto;">
								 									<input type="submit" id="updateGoodsQBtn" class="btn btn-outline-success" value="수정">
								 								</div>
								 							</div>
								 						</form>
							 						</div>
							 						
							 						<c:choose>
									 					<c:when test="${empty goodsQuestion.goodsAnswer}">
									 						<!-- 답변이 없으면 -->
									 						<c:if test="${sessionScope.userList.authority eq 'ROLE_ADMIN'}">
									 						
									 						<!-- 상품문의 답변달기 section -->
										 						<div id="ainsert${goodsQuestion.qgoodsNo}" class="collapse">
																 	<form action="${pageContext.request.contextPath}/admin/insert/goodsAnswer/${goodsQuestionMap.registerGoods.regNo}/${goodsQuestion.qgoodsNo}"
																 		method="post" id="insertGoodsAForm">
																	 	<div class="row border border-left-0 border-rigth-0 border-bottom-0" style="padding-top: 10px;">
																	 		<div class="col-xl">
																	 			<textarea rows="2" name="content" class="form-control" id="insertAtextArea"></textarea>
																	 		</div>
																	 		<div class="col-xl-2" style="margin: auto">
																	 			<input type="submit" id="insertGoodsABtn" class="btn btn-outline-success" value="질의답변">
																	 		</div>
																	 	</div>
																 	</form>	<!-- 상품문의답변 달기 section -->
										 						</div>
									 						</c:if>
									 					</c:when>
									 					<c:otherwise><!-- 답변이 있으면 -->
										 					<div class="row border border-left-0 border-rigth-0 border-bottom-0" style="padding-top: 10px;">
												 				<div class="col-xl">	
												 					<div class="row">
												 						<div class="col-xl-1" style="margin: auto; text-align: right;">
												 							&#10149;
												 						</div>
												 						<div class="col-xl" style="margin: auto; text-align: left;">
												 							${goodsQuestion.goodsAnswer.content}
												 						</div>
												 						<c:if test="${sessionScope.userList.authority eq 'ROLE_ADMIN'}"> 
													 						<div class="col-xl-3" style="margin: auto; text-align: right; font-size: 12px;">
											 									<a type="button" class="btn btn-outline-light" style="color: gray; font-size: 12px;" 
											 									data-toggle="collapse" data-target="#aupdate${goodsQuestion.qgoodsNo}">수정</a>
											 									| <a href="${pageContext.request.contextPath}/admin/delete/goodsAnswer/${goodsQuestionMap.registerGoods.regNo}/${goodsQuestion.goodsAnswer.agoodsNo}" 
											 									class="btn btn-outline-light" style="color: gray; font-size: 12px;" onclick="return deleteConfirm();">삭제</a>
												 							</div>
											 							</c:if>
											 						</div><!-- 답변 내용 row-->
											 						<div id="aupdate${goodsQuestion.qgoodsNo}" class="collapse">
																	 	<form action="${pageContext.request.contextPath}/admin/update/goodsAnswer/${goodsQuestionMap.registerGoods.regNo}/${goodsQuestion.goodsAnswer.agoodsNo}"
																	 		method="post" id="updateGoodsAForm">
																		 	<div class="row" style="padding-top: 10px;">
																		 		<div class="col-xl-1"></div>
																		 		<div class="col-xl">
																		 			<input type="text" name="content" class="form-control" value="${goodsQuestion.goodsAnswer.content}">
																		 		</div>
																		 		<div class="col-xl-2" style="margin: auto">
																		 			<input type="submit" id="updateGoodsABtn" class="btn btn-outline-success" value="수정">
																		 		</div>
																		 	</div>
																	 	</form>	<!-- 답변 내용 수정  form -->
											 						</div><!-- 답변 내용 수정탭 -->
												 				</div>
										 					</div><!-- answer row -->
									 					</c:otherwise>
									 				</c:choose>
									 			</div>
						 					</div>
							 			</c:forEach>
							 			
							 			<!-- 상품문의 달기 section -->
									 	<form action="${pageContext.request.contextPath}/user/insert/goodsQuestion/${goodsQuestionMap.registerGoods.regNo}"
									 		method="post" id="insertGoodsQForm">
										 	<div class="row" style="margin-bottom: 10px;">
										 		<div class="col-xl">
										 			<textarea rows="2" name="content" class="form-control" id="insertQtextArea"></textarea>
										 		</div>
										 		<div class="col-xl-2" style="margin: auto">
										 			<input type="button" id="insertGoodsQBtn" class="btn btn-outline-success" value="상품문의">
										 		</div>
										 	</div>
									 	</form>	<!-- 상품문의 달기 section -->
							 			
							 		</div>
							 		<div class="col-xl-1"></div>
							 	</div>

							 </c:otherwise> 
						</c:choose>
					</div><!-- goodsQuestionInfo -->
				</div><!-- menu2 -->
				<!-- 상품후기 -->
				<div id="menu3" class="tab-pane fade">
					<div class="goodsReviewInfo">
						<h3>상품 후기</h3>
					</div><!-- goodsReviewInfo -->
					<c:choose>
						 <c:when test="${empty goodsQuestionMap.review}">
						 	<div class="row border rounded">
						 		<div class="col-xl-1"></div>
						 		
						 		<div class="col-xl">
						 			<div class="row" style="margin-top: 10px;">
						 				<div class="col-xl" style="margin: auto; text-align: center;">
					 						<b>내용</b>
					 					</div>
					 					<div class="col-xl-2" style="margin: auto; text-align: center;">
					 						<b>작성자</b>
					 					</div>
					 					<div class="col-xl-2" style="margin: auto; text-align: center;">
					 						<b>작성일</b>
					 					</div>
						 			</div>
						 			
					 				<div class="row border rounded" style="padding: 10px 0px; margin: 10px 0px;">
					 					<div class="col-xl" style="margin: auto; text-align: left;">
					 						상품후기가 없습니다.
					 					</div>
					 					<div class="col-xl-2" style="margin: auto; text-align: center;">
					 						-
					 					</div>
					 					<div class="col-xl-2" style="margin: auto; text-align: center;">
					 						-
					 					</div>
					 				</div>
						 		</div>
						 		<div class="col-xl-1"></div>
						 	</div>
						 </c:when>
						 
						 <c:otherwise>
						 <!-- 상품후기가 있을 때 -->
						 	<div class="row border rounded">
						 		<div class="col-xl-1"></div>
						 		
						 		<div class="col-xl">
						 			<div class="row" style="margin-top: 10px;">
						 				<div class="col-xl" style="margin: auto; text-align: center;">
					 						<b>내용</b>
					 					</div>
					 					<div class="col-xl-2" style="margin: auto; text-align: center;">
					 						<b>작성자</b>
					 					</div>
					 					<div class="col-xl-2" style="margin: auto; text-align: center;">
					 						<b>작성일</b>
					 					</div>
						 			</div>
						 			<c:forEach items="${goodsQuestionMap.review}" var="review">
						 				<div class="row border rounded" style="padding: 10px 0px; margin: 10px 0px;">
						 					<div class="col-xl" style="margin: auto; text-align: left;">
						 						${review.content}
						 					</div>
						 					<div class="col-xl-2" style="margin: auto; text-align: center;">
						 						${review.userList.userId}
						 					</div>
						 					<div class="col-xl-2" style="margin: auto; text-align: center;">
						 						<fmt:parseDate value="${review.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
							 					<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
							 					${formatDate}
						 					</div>
						 				</div>
					 				</c:forEach>
						 		</div>
						 		<div class="col-xl-1"></div>
						 	</div>
						 </c:otherwise> 
					</c:choose>
				</div><!-- menu3 -->
			</div>
		</div><!-- goodsDetailBottom -->
	</div><!-- container -->
</div><!-- goodsDetail -->



</body>
</html>