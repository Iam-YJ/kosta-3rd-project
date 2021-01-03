<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table th {
  width: 155px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #28a745 ;
}
table td {
  width: 155px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #fff;
}
</style>
</head>
<body>


<h1>농가와 지역사회 발전에 기여하겠습니다!!</h1>
<div class="userDonationSection">
	<div class="container">
		<div class=titleSection>
			<div class="row">
			<div class="col-xl" style="text-align: left;">
					나의 보유 포인트 : ${dbUserList.points} point
				</div>
				<div class="col-xl" style="text-align: left;">
					나의 기부포인트 : ${donaPoint} point
				</div>
			</div>
		</div><!-- titleSection -->
		<div>
			<form method="post" action="${pageContext.request.contextPath}/user/myPage/donation">기부 포인트 :  
				<input type="number"  min="0" name="dona" size="7px"><button type="submit" >기부하기</button><br>
			</form><br>			
		</div>
		<div class="donationList">
			<c:if test="${empty donaList}">
				기부 목록이 없습니다.			
			</c:if>
		</div>
	</div><!-- container-fluid -->
</div><!-- userWishListSection -->
			
			
<div class="container ">
    <div class="row">
        <div class="col-lg">
            <div class="card rounded-0 border-0 shadow">
                <div class="card-body p-5">
                    <!--  Bootstrap table-->
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">등수</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">기부 포인트</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${donaList}"  var="list" varStatus="state">
									<tr><td>${state.count}</td><td>${list.userList.name}</td><td>${list.donaPoint}</td></tr>
								</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
			
</body>
</html>