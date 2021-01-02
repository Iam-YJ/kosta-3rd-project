<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a{
	color: black;
}

</style>
<script type="text/javascript">

function clientChk(){
	if (${sessionScope.userList.authority != 'ROLE_USER'}) {
		alert("회원전용 서비스 입니다.")
		return false;
	}
	return true;
}

</script>
</head>
<body>
<div class="csMainSection">
	<div class="container-fluid">	
		<div class="row titleSection">
			<div class="col-xl">
				<h4>고객센터를 	통해 궁금증을 해결하세요.</h4>
			</div>
		</div><!-- titleSection -->
		<div class="row" style="margin-top: 25px;">
			<div class="col-xl border rounded" style="margin: auto; text-align: center; padding: 80px 0px;">
				<h4><a href="${pageContext.request.contextPath}/main/csForm?state=1">FAQ</a></h4>
			</div>
			<div class="col-xl border rounded" style="margin-left: 30px; text-align: center; padding: 80px 0px;">
				<h4><a href="${pageContext.request.contextPath}/main/csForm?state=2">공지사항</a></h4>
			</div>
		</div>
		
		<div class="row" style="margin-top: 25px;">
			<div class="col-xl border rounded" style="margin: auto; text-align: center; padding: 80px 0px;">
				<h4><a href="${pageContext.request.contextPath}/user/myPage?state=3" onclick="return clientChk();">찜목록</a></h4>
			</div>
			<div class="col-xl border rounded" style="margin: 30px; text-align: center; padding: 80px 0px;">
				<h4><a href="${pageContext.request.contextPath}/user/myPage?state=2" onclick="return clientChk();">장바구니</a></h4>
			</div>
			<div class="col-xl border rounded" style="margin: auto; text-align: center; padding: 80px 0px;">
				<h4><a href="${pageContext.request.contextPath}/user/myPage" onclick="return clientChk();">주문/배송조회</a></h4>
			</div>
		</div>
		
		<div class="row" style="">
			<div class="col-xl border rounded" style="margin: auto; text-align: center; padding: 80px 0px;">
				<h4><a href="${pageContext.request.contextPath}/user/myPage?state=8" onclick="return clientChk();">나의 상품문의</a></h4>
			</div>
			<div class="col-xl border rounded" style="margin: 30px; text-align: center; padding: 80px 0px;">
				<h4><a href="${pageContext.request.contextPath}/user/myPage?state=4" onclick="return clientChk();">나의 구매후기</a></h4>
			</div>
			<div class="col-xl border rounded" style="margin: auto; text-align: center; padding: 80px 0px;">
				<h4><a href="${pageContext.request.contextPath}/user/myPage?state=7" onclick="return clientChk();">나의 포인트 내역</a></h4>
			</div>
		</div>
	</div><!-- container-fluid -->
</div><!-- csMainSection -->
</body>
</html>