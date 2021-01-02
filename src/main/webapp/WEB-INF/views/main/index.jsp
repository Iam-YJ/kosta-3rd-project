<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.owl-carousel').owlCarousel({
	    loop:true,
	    margin:10,
	    nav:true,
	    responsive:{
	        0:{
	            items:1
	        },
	        1000:{
	            items:4
	        }
	    }
	})
});
</script>
<body>
<div class="indexBannerSection">
	<div class="container_fluid">
		${pageContext.request.contextPath}
		<div id="demo" class="carousel slide" data-ride="carousel">
		<c:choose>
			<c:when test="${empty registerGoodsADList}">
				
			  <ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			  </ul>
			
			  <div class="carousel-inner" style="text-align: center;">
			    <div class="carousel-item active">
					<img src="${pageContext.request.contextPath}/images/banner/banner.png" alt=""
					style="height: 250px;  width: 1920px;">
			    </div>
			  </div>
			
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
				
			</c:when>		
			<c:otherwise>
			
			 <!-- Indicators -->
			  <ul class="carousel-indicators">
			  <c:forEach items="${registerGoodsADList}" var="registerGoodsADList" varStatus="registerGoodsADListIndex">
			  	<c:choose>
					<c:when test="${registerGoodsADListIndex.count == 1}">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
					</c:when>
					<c:otherwise>
						<li data-target="#demo" data-slide-to="${registerGoodsADListIndex.count == 1}" class="active"></li>
					</c:otherwise>			  	
			  	</c:choose>
			  </c:forEach>
			  </ul>
			  
			  <!-- The slideshow -->
			   <div class="carousel-inner" style="text-align: center;">
				   <c:forEach items="${registerGoodsADList}" var="registerGoodsADList" varStatus="registerGoodsADListIndex">
				  	<c:choose>
						<c:when test="${registerGoodsADListIndex.count == 1}">
							<div class="carousel-item active">
								<a href="${pageContext.request.contextPath}/main/goodsDetail/${registerGoodsADList.regNo}">	
									<img src="${pageContext.request.contextPath}/images/banner/${registerGoodsADList.adImg}" alt=""
									style="height: 250px;  width: 1920px;">
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="carousel-item">
						    	<a href="${pageContext.request.contextPath}/main/goodsDetail/${registerGoodsADList.regNo}">	
									<img src="${pageContext.request.contextPath}/images/banner/${registerGoodsADList.adImg}" alt=""
									style="height: 250px;  width: 1920px;">
								</a>
							</div>		
						</c:otherwise>			  	
				  	</c:choose>
				  </c:forEach>
			   </div>
			  
			  <!-- Left and right controls -->
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>

			</c:otherwise>
		</c:choose>
		</div>
	</div><!-- container_fluid -->
</div><!-- indexBannerSection -->

<div class="indexBestItemSection">
	<div class="container">
	
		<div class="mainTitleSection row">
			<div class="col-xl" style="text-align: center;">
				Best!
			</div>
		</div>
		<div class="subTitleSection row">
			<div class="col-xl-4">
				<hr>
			</div>
			<div class="col-xl" style="text-align: center;">
				우리 R.P.Mall에서 가장 많이 팔린 상품!
			</div>
			<div class="col-xl-4">
				<hr>
			</div>
		</div>
		<div class="ItemInfoSection">
			
			<ul class="nav nav-tabs row border">
				<li class="nav-item col-xl">
				  <a class="nav-link active btn btn-outline-success" data-toggle="tab" href="#menu1">과일</a>
				</li>
				<li class="nav-item col-xl">
				  <a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu2">채소</a>
				</li>
				<li class="nav-item col-xl">
				  <a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu3">주곡/잡곡</a>
				</li>
				<li class="nav-item col-xl">
				  <a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu4">견과류</a>
				</li>
			</ul>
			
			<div class="tab-content">
				<div id="menu1" class="tab-pane active"><br>
					<div class="row">
						<c:choose>
							<c:when test="${empty bestFruit}">
								<c:forEach begin="1" end="4" step="1">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<img alt="" class="img-fluid"
												src="${pageContext.request.contextPath}/images/thumbnail/sample_thumbnail.png" >
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>게시글-제목</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												99,999 원
											</div>
										</div>
									</div>									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${bestFruit}" var="bestFruit">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<a href="${pageContext.request.contextPath}/main/goodsDetail/${bestFruit.regNo}">
													<img alt="" class="img-fluid"
													src="${pageContext.request.contextPath}/images/thumbnail/${bestFruit.thumbnailImg}" >
												</a>
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>${bestFruit.title}</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												<fmt:formatNumber value="${bestFruit.price}"/> 원
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div id="menu2" class="tab-pane fade"><br>
					<div class="row">
						<c:choose>
							<c:when test="${empty bestVegetable}">
								<c:forEach begin="1" end="4" step="1">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<img alt="" class="img-fluid"
												src="${pageContext.request.contextPath}/images/thumbnail/sample_thumbnail.png" >
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>게시글-제목</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												99,999 원
											</div>
										</div>
									</div>									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${bestVegetable}" var="bestVegetable">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<a href="${pageContext.request.contextPath}/main/goodsDetail/${bestVegetable.regNo}">
													<img alt="" class="img-fluid"
													src="${pageContext.request.contextPath}/images/thumbnail/${bestVegetable.thumbnailImg}" >
												</a>
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>${bestVegetable.title}</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												<fmt:formatNumber value="${bestVegetable.price}"/> 원
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div id="menu3" class="tab-pane fade"><br>
					<div class="row">
						<c:choose>
							<c:when test="${empty bestGrain}">
								<c:forEach begin="1" end="4" step="1">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<img alt="" class="img-fluid"
												src="${pageContext.request.contextPath}/images/thumbnail/sample_thumbnail.png" >
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>게시글-제목</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												99,999 원
											</div>
										</div>
									</div>									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${bestGrain}" var="bestGrain">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<a href="${pageContext.request.contextPath}/main/goodsDetail/${bestGrain.regNo}">
													<img alt="" class="img-fluid"
													src="${pageContext.request.contextPath}/images/thumbnail/${bestGrain.thumbnailImg}" >
												</a>
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>${bestGrain.title}</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												<fmt:formatNumber value="${bestGrain.price}"/> 원
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div id="menu4" class="tab-pane fade"><br>
					<div class="row">
						<c:choose>
							<c:when test="${empty bestNut}">
								<c:forEach begin="1" end="4" step="1">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<img alt="" class="img-fluid"
												src="${pageContext.request.contextPath}/images/thumbnail/sample_thumbnail.png" >
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>게시글-제목</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												99,999 원
											</div>
										</div>
									</div>									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${bestNut}" var="bestNut">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<a href="${pageContext.request.contextPath}/main/goodsDetail/${bestNut.regNo}">
													<img alt="" class="img-fluid"
													src="${pageContext.request.contextPath}/images/thumbnail/${bestNut.thumbnailImg}" >
												</a>
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>${bestNut.title}</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												<fmt:formatNumber value="${bestNut.price}"/> 원
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		
	</div><!-- container -->
</div><!-- indexBestItemSection -->


<div class="indexNewItemSection">
	<div class="container">
	
		<div class="mainTitleSection row">
			<div class="col-xl" style="text-align: center;">
				품!절!임!박!
			</div>
		</div>
		<div class="subTitleSection row">
			<div class="col-xl-4">
				<hr>
			</div>
			<div class="col-xl" style="text-align: center;">
				지금 아니면 기회가 없어요!
			</div>
			<div class="col-xl-4">
				<hr>
			</div>
		</div>
		<div class="ItemInfoSection">
			
			<ul class="nav nav-tabs row border">
				<li class="nav-item col-xl">
				  <a class="nav-link active btn btn-outline-success" data-toggle="tab" href="#menu5">과일</a>
				</li>
				<li class="nav-item col-xl">
				  <a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu6">채소</a>
				</li>
				<li class="nav-item col-xl">
				  <a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu7">주곡/잡곡</a>
				</li>
				<li class="nav-item col-xl">
				  <a class="nav-link btn btn-outline-success" data-toggle="tab" href="#menu8">견과류</a>
				</li>
			</ul>
			
			<div class="tab-content">
				<div id="menu5" class="tab-pane active"><br>
					<div class="row">
						<c:choose>
							<c:when test="${empty soldFruit}">
								<c:forEach begin="1" end="4" step="1">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<img alt="" class="img-fluid"
												src="${pageContext.request.contextPath}/images/thumbnail/sample_thumbnail.png" >
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>게시글-제목</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												99,999 원
											</div>
										</div>
									</div>									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${soldFruit}" var="soldFruit">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<a href="${pageContext.request.contextPath}/main/goodsDetail/${soldFruit.regNo}">
													<img alt="" class="img-fluid"
													src="${pageContext.request.contextPath}/images/thumbnail/${soldFruit.thumbnailImg}" >
												</a>
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>${soldFruit.title}</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												<fmt:formatNumber value="${soldFruit.price}"/> 원
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div id="menu6" class="tab-pane fade"><br>
					<div class="row">
						<c:choose>
							<c:when test="${empty soldVegetable}">
								<c:forEach begin="1" end="4" step="1">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<img alt="" class="img-fluid"
												src="${pageContext.request.contextPath}/images/thumbnail/sample_thumbnail.png" >
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>게시글-제목</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												99,999 원
											</div>
										</div>
									</div>									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${soldVegetable}" var="soldVegetable">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<a href="${pageContext.request.contextPath}/main/goodsDetail/${soldVegetable.regNo}">
													<img alt="" class="img-fluid"
													src="${pageContext.request.contextPath}/images/thumbnail/${soldVegetable.thumbnailImg}" >
												</a>
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>${soldVegetable.title}</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												<fmt:formatNumber value="${soldVegetable.price}"/> 원
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div id="menu7" class="tab-pane fade"><br>
					<div class="row">
						<c:choose>
							<c:when test="${empty soldGrain}">
								<c:forEach begin="1" end="4" step="1">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<img alt="" class="img-fluid"
												src="${pageContext.request.contextPath}/images/thumbnail/sample_thumbnail.png" >
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>게시글-제목</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												99,999 원
											</div>
										</div>
									</div>									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${soldGrain}" var="soldGrain">
									<div class="col-xl border" style="margin: 15px;">
										<div class="row">
											<div class="col-xl" style="text-align: center; margin: 5px;">
												<a href="${pageContext.request.contextPath}/main/goodsDetail/${soldGrain.regNo}">
													<img alt="" class="img-fluid"
													src="${pageContext.request.contextPath}/images/thumbnail/${soldGrain.thumbnailImg}" >
												</a>
											</div>
										</div>
										<div class="row border border-left-0 border-bottom-0 border-right-0">
											<div class="col-xl" style="text-align: center; margin-top: 10px;">
												<h6><b>${soldGrain.title}</b></h6>
											</div>
										</div>
										<div class="row">
											<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
												<fmt:formatNumber value="${soldGrain.price}"/> 원
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div id="menu8" class="tab-pane fade"><br>
				
				<div class="row">
					<c:choose>
						<c:when test="${empty soldNut}">
							<c:forEach begin="1" end="4" step="1">
								<div class="col-xl border" style="margin: 15px;">
									<div class="row">
										<div class="col-xl" style="text-align: center; margin: 5px;">
											<img alt="" class="img-fluid"
											src="${pageContext.request.contextPath}/images/thumbnail/sample_thumbnail.png" >
										</div>
									</div>
									<div class="row border border-left-0 border-bottom-0 border-right-0">
										<div class="col-xl" style="text-align: center; margin-top: 10px;">
											<h6><b>게시글-제목</b></h6>
										</div>
									</div>
									<div class="row">
										<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
											99,999 원
										</div>
									</div>
								</div>									
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach items="${soldNut}" var="soldNut">
								<div class="col-xl border" style="margin: 15px;">
									<div class="row">
										<div class="col-xl" style="text-align: center; margin: 5px;">
											<a href="${pageContext.request.contextPath}/main/goodsDetail/${soldNut.regNo}">
												<img alt="" class="img-fluid"
												src="${pageContext.request.contextPath}/images/thumbnail/${soldNut.thumbnailImg}" >
											</a>
										</div>
									</div>
									<div class="row border border-left-0 border-bottom-0 border-right-0">
										<div class="col-xl" style="text-align: center; margin-top: 10px;">
											<h6><b>${soldNut.title}</b></h6>
										</div>
									</div>
									<div class="row">
										<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
											<fmt:formatNumber value="${soldNut.price}"/> 원
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	
	</div><!-- container -->
</div><!-- indexNewItemSection -->


<div class="indexSellItemSection">
	<div class="container">
			
		<div class="mainTitleSection row">
			<div class="col-xl" style="text-align: center;">
				최근 리뷰
			</div>
		</div>
		<div class="subTitleSection row">
			<div class="col-xl-4">
				<hr>
			</div>
			<div class="col-xl" style="text-align: center;">
				고객님이 최근에 후기를 남겨주었어요~
			</div>
			<div class="col-xl-4">
				<hr>
			</div>
		</div>
		<div class="ItemInfoSection">
			
			<div class="row">
				<c:choose>
					<c:when test="${empty reviewList}">
						<c:forEach begin="1" end="4" step="1">
							<div class="col-xl border" style="margin: 15px;" >
								<div class="row">
									<div class="col-xl" style="text-align: center; margin: 5px;">
										<img alt="" class="img-fluid"
										src="${pageContext.request.contextPath}/images/thumbnail/sample_thumbnail.png" >
									</div>
								</div>
								<div class="row border border-left-0 border-bottom-0 border-right-0">
									<div class="col-xl" style="text-align: center; margin-top: 10px;">
										<h6><b>게시글-제목</b></h6>
									</div>
								</div>
								<div class="row">
									<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
										99,999 원
									</div>
								</div>
							</div>									
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="owl-carousel owl-theme">
							<c:forEach items="${reviewList}" var="review" varStatus="reviewIndex">
								<c:choose>
									<c:when test="${reviewIndex.count<17}">
									
										<div class="item">
											<div class="col-xl border" style="margin: 15px;">
												<div class="row">
													<div class="col-xl" style="text-align: center; margin: 5px;">
														<a href="${pageContext.request.contextPath}/main/goodsDetail/${review.registerGoods.regNo}">
															<img alt="" class="img-fluid"
															src="${pageContext.request.contextPath}/images/thumbnail/${review.registerGoods.thumbnailImg}" >
														</a>
													</div>
												</div>
												<div class="row border border-left-0 border-bottom-0 border-right-0">
													<div class="col-xl" style="text-align: center; margin-top: 10px;">
														<h6><b>${review.registerGoods.title}</b></h6>
													</div>
												</div>
												<div class="row">
													<div class="col-xl" style="text-align: center; margin-bottom: 5px;">
														${review.content}
													</div>
												</div>
											</div>
										</div>
									
									</c:when>
									<c:otherwise>
										<!-- 빈공간 -->
									</c:otherwise>
								</c:choose>
								
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
		
			</div>
		</div>

	</div><!-- container -->
</div><!-- indexSellItemSection -->

</body>
</html>