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
	function deleteConfirm(){
		if(confirm("삭제하시겠습니까?")){
			return true;	
		}
		return false;
	}
</script>
</head>
<body>
<div class="userGoodsQSection">
	<div class="container-fluid">
		<div class=titleSection>
			<div class="row">
				<div class="col-xl" style="text-align: left;">
					내가 작성한 상품문의 내역
				</div>
			</div>
		</div>
		<c:choose>
			<c:when test="${empty goodsQuestionList}">
				<div class="row">
					<div class="col-xl">
						지금까지 작성한 상품문의가 없습니다.
					</div>
				</div>
			</c:when>
			<c:otherwise>
			
				<c:forEach items="${goodsQuestionList}" var="goodsQuestion">
					<div class="row border rounded" style="margin-top: 20px;">
						<div class="col-xl-2" style="margin: auto; text-align: center; margin-top: 10px; margin-bottom: 10px;">
							<a href="${pageContext.request.contextPath}/main/goodsDetail/${goodsQuestion.registerGoods.regNo}">
								<img  class = "img-fluid" id="thumbnail"src="${pageContext.request.contextPath}/images/thumbnail/${goodsQuestion.registerGoods.thumbnailImg}">
							</a>
						</div>
						<div class="col-xl" style="margin: auto;">
							<div class="row">
								<div class="col-xl-1"></div>
								<div class="col-xl" style="text-align: left;">
									${goodsQuestion.registerGoods.title}
								</div>
								<div class="col-xl-3" style="text-align: right;">
									<fmt:parseDate value="${goodsQuestion.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
									<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
									${formatDate}
								</div>
							</div>
							<div class="row">
								<div class="col-xl-1"></div>
								<div class="col-xl" style="text-align: left;">
									<div class="row">
										<div class="col-xl">
											<hr>
										</div>
									</div>
									<div class="row">
										<div class="col-xl">
											${goodsQuestion.content}
										</div>
										<div class="col-xl-3" style="text-align: right; color: gray; font-size: 12px;">
											<a href="#" class="btn btn-outline-light" style="color: gray; font-size: 12px;" 
											data-toggle="collapse" data-target="#question${goodsQuestion.qgoodsNo}">수정</a>|
											<a href="${pageContext.request.contextPath}/user/delete/goodsQuestion/${goodsQuestion.registerGoods.regNo}/${goodsQuestion.qgoodsNo}?state=my" 
											class="btn btn-outline-light" style="color: gray; font-size: 12px;" onclick="return deleteConfirm();">삭제</a>
										</div>
									</div>
									<div id="question${goodsQuestion.qgoodsNo}" class="collapse">
										<form method="post" action="${pageContext.request.contextPath}/user/update/goodsQuestion/${goodsQuestion.registerGoods.regNo}/${goodsQuestion.qgoodsNo}?state=my">
											<div class="row" style="margin-top: 5px; margin-bottom: 15px;">
												<div class="col-xl">
													<textarea rows="2" name="content" class="form-control">${goodsQuestion.content}</textarea>
												</div>
												<div class="col-xl-2" style="margin: auto; text-align: center;">
													<input type="submit" class="btn btn-outline-success" value="수정">
												</div>
											</div>
										</form>
									</div>
									<div class="row" style="margin-top: 10px;">
										<div class="col-xl" style="margin-left: 10px;">
											<c:choose>
												<c:when test="${empty goodsQuestion.goodsAnswer}">
													&#10149; 답변이 등록되지 않았습니다.
												</c:when>
												<c:otherwise>
													&#10149; ${goodsQuestion.goodsAnswer.content}
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-1"></div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</div><!-- container-fluid -->
</div><!-- userReviewSection -->

</body>
</html>