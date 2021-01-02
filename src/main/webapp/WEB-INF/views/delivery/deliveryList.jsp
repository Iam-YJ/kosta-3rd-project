<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 서비스</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/rpmall.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

function delConfirm(){
	if (confirm("해당 상품을 배송 완료하였습니까?")) {
		return true;
	}
	return false;
}


</script>
</head>
<body>
<div class="delListSection">
	<div class="container">
		<div class="titleSection row">
			<div class="col-xl" style="text-align: center; margin: 20px;"> 
				<h3>배송목록</h3>
			</div>
		</div><!-- titleSection row -->
		<div class="subtitleSection row" style="margin-bottom: 10px;">
			<div class="col-xl-1" style="text-align: center;"> 
				번호
			</div>
			<div class="col-xl-1" style="text-align: center;"> 
				이름	
			</div>
			<div class="col-xl" style="text-align: center;"> 
				주소	
			</div>
			<div class="col-xl-2" style="text-align: center;"> 
				연락처	
			</div>
			<div class="col-xl-2" style="text-align: center;"> 
				상태	
			</div>
		</div><!-- subtitleSection row -->
		<c:choose>
			<c:when test="${empty orderList}">
				<div class="delInfoSection row" style="margin-top:5px;">
					<div class="col-xl" style="text-align: center;"> 
						현재 배송가능한 상품이 없습니다.
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${orderList}" var="orderList" varStatus="index">
					<div class="delInfoSection row" style="margin-top:5px;">
						<div class="col-xl-1" style="text-align: center;"> 
							${index.count}
						</div>
						<div class="col-xl-1" style="text-align: center;"> 
							${orderList.userList.name}
						</div>
						<div class="col-xl" style="text-align: center;"> 
							${orderList.addr}
						</div>
						<div class="col-xl-2" style="text-align: center;"> 
							${orderList.userList.phone}
						</div>
						<div class="col-xl-2" style="text-align: center;"> 
							<a href="${pageContext.request.contextPath}/delivery/${orderList.orderNo}"
							onclick="return delConfirm();">배송완료</a>
						</div>
					</div><!-- delInfoSection row -->
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</body>
</html>