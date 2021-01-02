<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>

<style>
#userTable {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#userTable th, #userTable td {
	text-align: left;
	padding: 12px;
	
}

#userTable tr {
	border-bottom: 1px solid #ddd;
}

#userTable tr.header, #userTable tr:hover {
	background-color: #f1f1f1;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#keyword").keyup(
						function() {

							var k = $(this).val();
							$("#table > tbody > tr").hide();
							var findId = $("#table > tbody > tr > td:nth-child(5n+3):contains('"+ k + "')");
							var findName = $("#table > tbody > tr > td:nth-child(5n+2):contains('"+ k + "')");

							$(findId).parent().show();
							$(findName).parent().show();

						})//keyup 
		
		
	})
</script>

</head>

<body>
<div class="insertOrdersForm">
	<div class="container-fluid">
		<div class="titleSection">
			<div class="row">
				<div class="col-xl">
					회원조회
				</div>
			</div>
		</div><!-- titleSection -->
	<div id="container" class="container">
		
		<div class="row">
			<div class="col-lg">
				<div class="card rounded-0 border-0 shadow">
					<div class="card-body p-5">
						
						<div id="input-form">
							검색 : <input type="text" id="keyword" style="margin-bottom:5px">
						</div>
						
						<!--  Bootstrap table-->
						<div class="table-responsive">
							<table class="table" id="table" style="text-align: center">
								<thead>
									<tr>
										<th scope="col">회원 번호</th>
										<th scope="col">회원 아이디</th>
										<th scope="col">회원 이름</th>
										<th scope="col">회원 등급</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sortGrade" items="${sortGrade}">
										<tr>
											<td>${sortGrade.userNo}
												<p>
											</td>
											<td><a href="${pageContext.request.contextPath}/admin/myPage/userRead/${sortGrade.userId}">${sortGrade.userId}</a>
												<p>
											</td>
											<td>${sortGrade.name}
												<p>
											</td>
											<td>${sortGrade.usergrade.gradeNo}
												<p>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	</div>
	</div>

</body>
</html>