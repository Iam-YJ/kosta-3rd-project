<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script>
$(document).ready(function(){
	
	
});//ready

function logout(){
	alert("로그아웃 되었습니다.");
}

</script>
</head>
<body>

<div class="headerTop">
	<div class="container_fluid">
		<div class="row">
			<div class="col-xl-1">
			</div>
			<div class="col-xl-5">
				<div style="text-align: left">
					<a href="${pageContext.request.contextPath}/user/myPage">마이페이지</a>
					<a href="${pageContext.request.contextPath}/main/cs/">고객센터</a>
				</div>
			</div>
			<div class="col-xl-5">
				<div style="text-align: right">
					<c:choose>
						<c:when test="${sessionScope.userList == null}">
							<a href="${pageContext.request.contextPath}/main/">로그인</a>
							<a href="${pageContext.request.contextPath}/main/registerBefore">회원가입</a>	
						</c:when>
						<c:otherwise>
							${sessionScope.userList.name}님 환영합니다.
							<a href="${pageContext.request.contextPath}/user/logout" onclick="logout()">로그아웃</a>
						</c:otherwise>
					</c:choose>
					
					<a href="${pageContext.request.contextPath}/user/myPage">주문/배송조회</a>
					<a href="#">찜목록</a>
					<a href="#">장바구니</a>
				</div>
			</div>
			<div class="col-xl-1">
			</div>
		</div><!-- row -->
	</div><!-- container_fluid -->
</div><!-- headerTop_section -->

<div class="headerMiddle">
	<div class="container_fluid">
		<div class="row">
			<div class="col-xl">
				<div style="text-align: center;">
					<a href="${pageContext.request.contextPath}/">
						<img alt="" src="${pageContext.request.contextPath}/images/logo/rpmallLogo.png"
						width="600px" height="180px">
					</a>		
				</div>
			</div>
		</div>
	</div><!-- container_fluid -->
</div><!-- headerMiddle -->

<div class="headerBottom">
	<div class="container_fluid">
		<div class="row">
			<div class="col-xl-2">
			</div>
			
			<div class="col-xl">
				<div class="dropdown">
					<a href="${pageContext.request.contextPath}/main/goodsList/0/0/0" class="btn btn-success">전체상품조회</a>
			    	<div class="dropdown-content">
						<a class="dropdown-item btn btn-success" href="${pageContext.request.contextPath}/main/goodsList/1/0/0">과일</a>
						<a class="dropdown-item btn btn-success" href="${pageContext.request.contextPath}/main/goodsList/2/0/0">채소</a>
						<a class="dropdown-item btn btn-success" href="${pageContext.request.contextPath}/main/goodsList/3/0/0">주곡/잡곡</a>
						<a class="dropdown-item btn btn-success" href="${pageContext.request.contextPath}/main/goodsList/4/0/0">견과류</a>
					</div>
			  	</div><!-- dropdown -->
			</div><!-- col -->
			<div class="col-xl">
				<a href="#" class="btn btn-success">베스트 상품조회</a>
			</div>
			<div class="col-xl">
				<a href="#" class="btn btn-success">~~ 상품조회</a>
			</div>
			<div class="col-xl">
				<a href="#" class="btn btn-success">~~ 상품조회</a>
			</div>
				<div class="col-xl">
				<a href="#" class="btn btn-success">~~ 상품조회</a>
			</div>
			<div class="col-xl">
				<a href="${pageContext.request.contextPath}/admin/myPage/insertGoodsForm" class="btn btn-success">상품등록</a>
			</div>
			
			<div class="col-xl-2">
			</div>
		</div><!-- row -->
	</div><!-- container_fluid -->
</div><!-- headerBottom -->

</body>
</html>