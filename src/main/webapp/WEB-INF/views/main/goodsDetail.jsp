<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* FAQ */
.faq {
	border-bottom: 0px solid #ddd;
	margin: 1em 0;
}

.faq .faqHeader {
	position: relative;
	zoom: 1
}

.faq .faqHeader .showAll {
	position: absolute;
	bottom: 0;
	right: 0;
	border: 0;
	padding: 0;
	overflow: visible;
	background: none;
	cursor: pointer
}

.faq .faqBody {
	margin: 0;
	padding: 0
}

.faq .faqBody .article {
	list-style: none
}

.faq .q {
	margin:
}

.faq .q a {
	display: block;
	text-align: left;
	background: url("faq1_icon_q.png") no-repeat 0 0;
	padding: 0 0 0 35px;
	font-size: 18px;
	color: #5e5e5e;
	font-weight: bold;
	line-height: 27px;
	cursor: pointer;
	margin: 10px 0;
	!
	important
}

.faq .q a:hover, .faq .q a:active, .faq .q a:focus {
	
}

.faq .a {
	background: #f8f8f8 url("faq1_icon_a.png") no-repeat 40px 10px;
	padding: 10px 75px 10px 75px;
	font-size: 16px;
	color: #444444;
	line-height: 22px;
	http: //localhost:8000/admin/list #a1 border-top: 1px solid #bdbdbd;
	margin: 5px 0 0 0;
}
</style>
<script type="text/javascript">
	function wishbtn(regNo){
		if(confirm("찜 목록에 추가 하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/user/insertwish?regNo="+regNo;
			return true;
		}else{
			return false;
		}
	}//wishbtn
	
	function cartbtn(regNo){
		var qua=document.getElementById("quantity").value
		//console.log(document.getElementById("quantity").value)
		 if(confirm("장바구니에 추가 하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/user/insertcart?regNo="+regNo+"&qua="+qua;
			return true;
		}else{
			return false;
		} 
	}//cartbtn
	
	function instantBuybtn(regNo){
		var qua=document.getElementById("quantity").value
		//console.log(document.getElementById("quantity").value)
		 if(confirm("상품을 구매하시겠습니까?")){
			location.href=
				"${pageContext.request.contextPath}/user/instantBuy/${goodsQuestionMap.registerGoods.regNo}?quantity="+qua;
			return true;
		}else{
			return false;
		} 
	}//cartbtn


$(document).ready(function(){
	$(document).on("change","#quantity",function(){
		var totalPrice = ${goodsQuestionMap.registerGoods.price} * $(this).val();
		//console.log(totalPrice)
		$("#totalPrice").empty();
		$("#totalPrice").append(AddComma(totalPrice));
	});
	//change_quantityInput
	

	//3자리마다 Comma넣어주는 함수
	function AddComma(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}//AddComma
	
});//ready
</script>

<script>
$(function(){
    // Frequently Asked Question
    var article = $('.faq>.faqBody>.article');
    article.addClass('hide');
    article.find('.a').hide();
    article.eq(0).removeClass('hide');
    article.eq(0).find('.a').show();
    $('.faq>.faqBody>.article>.q>a').click(function(){
        var myArticle = $(this).parents('.article:first');
        if(myArticle.hasClass('hide')){
            article.addClass('hide').removeClass('show');
            article.find('.a').slideUp(100);
            myArticle.removeClass('hide').addClass('show');
            myArticle.find('.a').slideDown(100);
        } else {
            myArticle.removeClass('show').addClass('hide');
            myArticle.find('.a').slideUp(100);
        }
        return false;
    });
    $('.faq>.faqHeader>.showAll').click(function(){
        var hidden = $('.faq>.faqBody>.article.hide').length;
        if(hidden > 0){
            article.removeClass('hide').addClass('show');
            article.find('.a').slideDown(100);
        } else {
            article.removeClass('show').addClass('hide');
            article.find('.a').slideUp(100);
        }
    });
	
  
    
});
</script>


</head>
<body>
	<div class="goodsDetail">
		<div class="container">
			<div class="goodsDetailCategory">홈 >
				${goodsQuestionMap.registerGoods.mainCategories.mainCategoryName} >
				${goodsQuestionMap.registerGoods.subCategories.subCategoryName}</div>

			<!-- ------------------------------------------------------------------ -->

			<div class="goodsDetailTop">
				<div class="row">
					<div class="col-xl-1"></div>
					<div class="thumbNailSection col-xl-4">
						<!-- GoodSDetial 이미지 들어가는 부분 -->
						<img alt="" class="img-fluid center-block"
							src="${pageContext.request.contextPath}/images/thumbnail/${goodsQuestionMap.registerGoods.thumbnailImg}">
					</div>
					<div class="col-xl-1"></div>
					<div class="expainSetion col-xl">
						<!-- GoodSDetial 간단 들어가는 부분 -->
						<h3>${goodsQuestionMap.registerGoods.title}</h3>

						<hr>
						<div class="row">
							<div class="columeName col-xl-5">
								일반가<br> <br> 상품명<br> <br> 보관방법<br> <br>
								원산지<br> <br> 용량/수량/크기<br> <br> 최대구매가능수량<br>
								<br> 구매수량<br> <br>
							</div>
							<div class="columeValue col-xl">
								<fmt:formatNumber
									value="${goodsQuestionMap.registerGoods.price}"
									var="CommaPrice" />
								${CommaPrice} 원<br> <br>
								${goodsQuestionMap.registerGoods.name}<br> <br>
								${goodsQuestionMap.registerGoods.method}<br> <br>
								${goodsQuestionMap.registerGoods.area}<br> <br>
								${goodsQuestionMap.registerGoods.options}<br> <br>
								<fmt:formatNumber
									value="${goodsQuestionMap.registerGoods.stock}"
									var="CommaStock" />
								${CommaStock} 개<br> <br> <input type="number" min="1"
									step="1" max="${registerGoods.registerGoods.stock}" value="1"
									id="quantity" class="quantity-field" width="100px"> 개
							</div>
						</div>
					</div>
				</div>
				<!-- row -->
				<div class="row">
					<div class="col-xl">
						<hr>
						<div class="totalPrice">
							총 상품금액 : <span id="totalPrice"
								style="color: green; font-size: 30px"> ${CommaPrice} </span>원
						</div>

						<div class="userBtnSection">
							<a href="#" class="btn btn-outline-success"
								onclick="wishbtn(${goodsQuestionMap.registerGoods.regNo});">찜</a>
							<a href="#" class="btn btn-outline-success"
								onclick="cartbtn(${goodsQuestionMap.registerGoods.regNo});">장바구니</a>
							<a href="#" class="btn btn-success"
								onclick="instantBuybtn(${goodsQuestionMap.registerGoods.regNo})">바로구매</a>
						</div>
					</div>
				</div>
				<!-- row -->
			</div>
			<!-- goodsDetailTop -->

			<!-- ------------------------------------------------------------------ -->

			<div class="goodsDetailBottom">

				<ul class="nav nav-tabs row border">
					<li class="nav-item col-xl"><a
						class="nav-link active btn btn-outline-success" data-toggle="tab"
						href="#home">상품 설명</a></li>
					<li class="nav-item col-xl"><a
						class="nav-link btn btn-outline-success" data-toggle="tab"
						href="#menu1">상품 상세정보</a></li>
					<li class="nav-item col-xl"><a
						class="nav-link btn btn-outline-success" data-toggle="tab"
						href="#menu2">상품 문의</a></li>
					<li class="nav-item col-xl"><a
						class="nav-link btn btn-outline-success" data-toggle="tab"
						href="#menu3">상품 후기</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div id="home" class="tab-pane active">
						<br>
						<div class="goodsInfo">
							${goodsQuestionMap.registerGoods.detail}</div>
					</div>
					<div id="menu1" class="tab-pane fade">
						<br>
						<div class="goodsDetailInfo">
							<h3>상품 상세정보</h3>

							<div class="row">
								<div class="left1 col-xl-4">상품명</div>
								<div class="right1 col-xl">
									&nbsp;&nbsp;${goodsQuestionMap.registerGoods.name}</div>
							</div>

							<div class="row">
								<div class="left2 col-xl-4">용량/수량/크기</div>
								<div class="right2 col-xl">
									&nbsp;&nbsp;${goodsQuestionMap.registerGoods.options}</div>
							</div>

							<div class="row">
								<div class="left2 col-xl-4">원산지 및 생산지</div>
								<div class="right2 col-xl">
									&nbsp;&nbsp;${goodsQuestionMap.registerGoods.area}</div>
							</div>

							<div class="row">
								<div class="left2 col-xl-4">보관방법</div>
								<div class="right2 col-xl">
									&nbsp;&nbsp;${goodsQuestionMap.registerGoods.method}</div>
							</div>

							<div class="row">
								<div class="left2 col-xl-4">환불기간</div>
								<div class="right2 col-xl">&nbsp;&nbsp;구매일로부터 3일이내</div>
							</div>

							<div class="row">
								<div class="left2 col-xl-4">생산연월일</div>
								<div class="right2 col-xl">&nbsp;&nbsp;제품 별도 표시 참조</div>
							</div>

							<div class="row">
								<div class="left2 col-xl-4">유통기한</div>
								<div class="right2 col-xl">&nbsp;&nbsp;제품 별도 표시 참조</div>
							</div>

							<div class="row">
								<div class="left2 col-xl-4">품질유지기한</div>
								<div class="right2 col-xl">&nbsp;&nbsp;제품 별도 표시 참조</div>
							</div>

						</div>
					</div>


					<!-- 상품문의 -->
					<div id="menu2" class="tab-pane fade">
						<br>
						<c:choose>
							<c:when test="${empty goodsQuestionMap.goodsQuestionList}">
				  상품문의가 없습니다.
				  
				 <form
									action="${pageContext.request.contextPath}/main/goodsDetail/${goodsQuestionMap.registerGoods.regNo}/goodsQuestion/insert">
									${userList} <input type="button" data-toggle="collapse"
										data-target="#demo" value="등록">
									<div id="demo" class="collapse" style="float: left;">
										<input type="text" name="content"> <input
											type="submit" value="전송">

									</div>
								</form>

							</c:when>
							<c:otherwise>
								<c:forEach items="${goodsQuestionMap.goodsQuestionList}"
									var="list">
									<div class="faq">
										<div class="faqHeader">
											<!--button type="button" class="showAll">답변 모두 여닫기</button-->
										</div>
										<ul class="faqBody">
											<li class="article" id="a1">
												<p class="q">
													<a href="#a1">${list.content}&nbsp&nbsp&nbsp--&nbsp&nbsp&nbsp작성자
														: ${list.userList.userId}</a>
												</p> <input type="button" id="button12"
												onclick="location.href = '${pageContext.request.contextPath}/main/goodsDetail/${list.qgoodsNo}/goodsQuestion/delete' "
												value="삭제" />
												<form
													action="${pageContext.request.contextPath}/main/goodsDetail/${list.qgoodsNo}/goodsQuestion/update">

													<input type="button" data-toggle="collapse"
														data-target="#demo" value="수정">
													<div id="demo" class="collapse" style="float: left;">
														<input type="text" name="content"> <input
															type="submit" value="전송">
													</div>
												</form> <c:choose>
													<c:when test="${empty list.goodsAnswer.content}">
									등록된 답변이 없습니다. 
								
								<form
															action="${pageContext.request.contextPath}/main/goodsDetail/${list.qgoodsNo}/goodsAnswer/insert">

															<input type="button" data-toggle="collapse"
																data-target="#demo" value="등록">
															<div id="demo" class="collapse" style="float: left;">
																<input type="text" name="content"> <input
																	type="submit" value="전송">
															</div>
														</form>
														</p>
													</c:when>

													<c:otherwise>
														<p class="a">${list.goodsAnswer.content}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
															<input type="button" id="button12"
																onclick="location.href = '${pageContext.request.contextPath}/main/goodsDetail/${list.qgoodsNo}/goodsAnswer/delete' "
																value="삭제" />
														<form
															action="${pageContext.request.contextPath}/main/goodsDetail/${list.qgoodsNo}/goodsAnswer/update">

															<input type="button" data-toggle="collapse"
																data-target="#demo" value="수정">
															<div id="demo" class="collapse" style="float: left;">
																<input type="text" name="content"> <input
																	type="submit" value="전송">
															</div>
														</form>
														</p>
													</c:otherwise>
												</c:choose>


											</li>
										</ul>
									</div>

								</c:forEach>
							</c:otherwise>
						</c:choose>
						
							<!-- 상품문의 새로하기 -->
					<div class="adminRefundListSetcion">
						<div class="container-fluid">
							<div class="refundListTitle">
								<div class="row">
									<div class="col-xl">상품문의 내역</div>
								</div>
							</div>
							<!-- OrderCancelListTitle -->
							<div class="OrderListInfo">
								<c:if test="${empty GoodsQuestionList}">
									상품문의 내역이 없습니다.
								</c:if>

								<c:forEach items="${goodsQuestionMap.goodsQuestionList}" var="q">

									<div class="Orders border rounded"
										style="margin-bottom: 20px; padding-bottom: 10px">
										<div class="row" style="padding: 10px">
											<div class="col-xl" style="margin-left: 40px;">
												<b>문의 ID : ${q.userList.userId}</b>
											</div>
											<div class="col-xl"
												style="text-align: right; margin-left: 20px;">등록일
												${q.regDate}</div>

										</div>
										<div class="row" style="padding: 10px">
											<div class="col-xl"
												style="text-align: left; margin-left: 20px;">문의 내용 :
												${q.content}</div>
										</div>
										<div class="row" style="padding: 20px">
											${q.goodsAnswer.content}

											<c:if test="${empty q.goodsAnswer.content}">
												<div class="col-xl" style="text-align: right;">
													<%-- <a href="${pageContext.request.contextPath}/admin/myPage/orderRefundList/accessRefund/${refund.refundNo}" class="btn btn-success">환불승인</a> --%>
													<input type="button" class="btn btn-outline-success"
														value="답변하기" data-toggle="collapse"
														data-target="#rejectRefund${refund.qgoodsNo}">
												</div>

												<div class="col-xl-1"></div>
										</div>
										<!-- btn  -->
										<form
											action="${pageContext.request.contextPath}/admin/myPage/goodsQuestionListAnswer/${q.qgoodsNo}"
											method="post">
											<div class="row collapse" id="rejectRefund${q.qgoodsNo}">
												<div class="col-xl-1"></div>
												<div class="col-xl-2"
													style="text-align: center; margin: auto;">답변내용 :</div>
												<input type="text" class="col-xl" id="refundReply"
													name="refundReply" style="margin: 0px 10px;"> <input
													type="submit" class="col-xl-1 btn btn-success"
													id="rejectSubmitBtn" value="제출" style="margin: 0px 10px;">
												<div class="col-xl-2"></div>
											</div>
											<!-- btn  -->
										</form>

										</c:if>

										<c:if test="${not empty q.goodsAnswer.content}">
											<div class="col-xl" style="text-align: right;">
												<%-- <a href="${pageContext.request.contextPath}/admin/myPage/orderRefundList/accessRefund/${refund.refundNo}" class="btn btn-success">환불승인</a> --%>
												<input type="button" class="btn btn-outline-success"
													value="수정하기" data-toggle="collapse"
													data-target="#rejectRefund${q.qgoodsNo}">
											</div>

											<div class="col-xl-1"></div>
									</div>
									<!-- btn  -->
									<form
										action="${pageContext.request.contextPath}/admin/myPage/goodsQuestionUpdateAnswer/${q.goodsAnswer.agoodsNo}"
										method="post">
										<div class="row collapse" id="rejectRefund${q.qgoodsNo}">
											<div class="col-xl-1"></div>
											<div class="col-xl-2"
												style="text-align: center; margin: auto;">수정내용 :</div>
											<input type="text" class="col-xl" id="refundReply"
												name="refundReply" style="margin: 0px 10px;"> <input
												type="submit" class="col-xl-1 btn btn-success"
												id="rejectSubmitBtn" value="제출" style="margin: 0px 10px;">
											<div class="col-xl-2"></div>
										</div>
										<!-- btn  -->
									</form>

									</c:if>
							</div>
							<!-- orders -->


							</c:forEach>
						</div>
					</div>
						
						
						
					</div>
					
					
					
					
					<!-- 상품문의 끝 -->


					<!-- 상품후기 -->
					<div id="menu3" class="tab-pane fade">
						<br>
						<h3 style="color: red">상품후기 연결예정</h3>
					<%-- 	<c:choose>
							<c:when test="${empty goodsQuestionMap.review}">
				  		상품후기가 없습니다.
				  	</c:when>
				 	<c:otherwise>
						<c:forEach items="${goodsQuestionMap.review}" var="review">
						<div class="Orders border rounded" style="margin-bottom: 20px; padding-bottom: 10px">
								<div class="row" style="padding: 10px">
										<div class="col-xl" style="margin-left: 40px;">
					 						<b>작성자 : ${review.userList.userId}</b>
					 					</div>
					 				<div class="col-xl" style="text-align: right; margin-left: 20px;">
					 					<fmt:parseDate value="${review.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
					 					<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
					 					등록일 ${formatDate}
					 				</div>
								</div>
								<div class="row" style="padding: 10px">
										<div class="col-xl" style="text-align: left; margin-left: 20px;">
										리뷰내용 : ${review.content}
										</div>
								</div>
										
						</div>
						
						</c:forEach>
					</c:otherwise>
					</c:choose> --%>
					<!-- 상품후기 끝 -->
				</div>
			</div>
			<!-- goodsDetailBottom -->
		</div>
		<!-- container -->
	</div>
	<!-- goodsDetail -->

	<!-- ---------------------------상품없을 떄.... --------------------------------------- -->
</body>
</html>