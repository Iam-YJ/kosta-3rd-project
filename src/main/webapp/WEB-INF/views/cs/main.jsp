<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 내용이 들어갈 구간입니다 -->
	고객센터를 통해 궁금증을 해결하세요.
	<p>1:1 상담을 통하시면 빠른 상담이 가능합니다
	<div class="parent1"
		style="border: 1px solid black; float: left; width: 100%; box-sizing: border-box">
		&nbsp&nbsp1:1 친절상담
		<p>
			&nbsp&nbsp궁금한 사항은 언제든 문의하세요.<br>
		<div class="first"
			style="border: 1px solid black; float: left; width: 15%; box-sizing: border-box; margin-left: 3%; margin-bottom: 3%; text-align: center">상담하기</div>
		<div class="second"
			style="border: 1px solid black; float: left; width: 15%; box-sizing: border-box; margin-left: 3%; margin-bottom: 3%; text-align: center">상담내역보기</div>
		<p>
	</div>

	<div class="parent3">
		<div class="first3"
			style="border: 1px solid black; float: left; width: 30%; padding-top: 15%; padding-bottom: 15%; margin-top: 5%; margin-bottom: 5%; box-sizing: border-box; text-align: center; font-size: 30px">
			<a href="${pageContext.request.contextPath}">FAQ</a>
		</div>
		<div class="second3"
			style="border: 1px solid black; float: left; margin-left: 5%; padding-top: 15%; padding-bottom: 15%; margin-top: 5%; margin-bottom: 5%; width: 30%; box-sizing: border-box; text-align: center; font-size: 30px">
			<a href=${pageContext.request.contextPath}>공지사항</a>
		</div>
		<div class="third3"
			style="border: 1px solid black; float: left; margin-left: 5%; padding-top: 15%; padding-bottom: 15%; margin-top: 5%; margin-bottom: 5%; margin-top: 5%; margin-bottom: 5%; width: 30%; box-sizing: border-box; text-align: center; font-size: 30px">
			<a href="${pageContext.request.contextPath}/user/myPage/userGoodsQuestionList">상품문의</a>
		</div>
	</div>
	<br>
	<div class="parent4">
		<div class="first4"
			style="border: 1px solid black; float: left; width: 30%; padding-top: 15%; padding-bottom: 15%; margin-bottom: 5%; box-sizing: border-box; text-align: center; font-size: 30px">
			<a href="${pageContext.request.contextPath}/user/myPage/userWishList">찜목록</a>
		</div>
		<div class="second4"
			style="border: 1px solid black; float: left; margin-left: 5%; padding-top: 15%; padding-bottom: 15%; margin-bottom: 5%; width: 30%; box-sizing: border-box; text-align: center; font-size: 30px">
			<a href="${pageContext.request.contextPath}/user/myPage/userCartList">장바구니</a>
		</div>
		<div class="third4"
			style="border: 1px solid black; float: left; margin-left: 5%; padding-top: 15%; padding-bottom: 15%; margin-bottom: 5%; width: 30%; box-sizing: border-box; text-align: center; font-size: 30px;">
			<a href="${pageContext.request.contextPath}/user/myPage/userOrderList">주문/배송조회</a>
		</div>
	</div>
	<br>
	<div class="parent5">
		<div class="first5"
			style="border: 1px solid black; float: left; width: 30%; padding-top: 15%; padding-bottom: 15%; box-sizing: border-box; text-align: center; font-size: 30px">
			<a href="${pageContext.request.contextPath}/user/myPage/userPointGradeList">포인트 내역</a>
		</div>
		<div class="second5"
			style="border: 1px solid black; float: left; margin-left: 5%; padding-top: 15%; padding-bottom: 15%; width: 30%; box-sizing: border-box; text-align: center; font-size: 30px">
			<a href="${pageContext.request.contextPath}/user/myPage/userGoodsReviewList">구매후기</a>
		</div>
	</div>


</body>
</html>