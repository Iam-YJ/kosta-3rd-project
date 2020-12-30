<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript"></script>
<body>
<div class="indexBannerSection">
	<div class="container_fluid">
		<div id="demo" class="carousel slide" data-ride="carousel">
		<c:choose>
			<c:when test="${empty registerGoodsADList}">
				
			  <ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			  </ul>
			
			  <div class="carousel-inner" style="text-align: center;">
			    <div class="carousel-item active">
					<img src="${pageContext.request.contextPath}/images/banner/banner.png" alt=""
					style="max-height: 250px;  width: 1920px;">
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
									style="max-height: 250px;  width: 1920px;">
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="carousel-item">
						    	<a href="${pageContext.request.contextPath}/main/goodsDetail/${registerGoodsADList.regNo}">	
									<img src="${pageContext.request.contextPath}/images/banner/${registerGoodsADList.adImg}" alt=""
									style="max-height: 250px;  width: 1920px;">
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

</div>
<div class="indexNewItemSection">

</div>
<div class="indexSellItemSection">

</div>

<h1>index.jsp</h1>
${userList}

</body>
</html>