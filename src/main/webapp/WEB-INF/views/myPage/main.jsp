<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="userCartSection">
	<div class="container-fluid">
		<div class=titleSection>
			<div class="row">
				<div class="col-xl" style="text-align: left;">
					나의 등급 조회
				</div>
			</div>
		</div>
	<div class="container">
    <div class="row">
        <div class="col-lg">
            <div class="card rounded-0 border-0 shadow">
                <div class="card-body p-5">
                    
                    <!--  Bootstrap table-->
                    <div class="table-responsive">
                        <table class="table" style="text-align: center">
                            <thead>
                                <tr>
                                    <th scope="col">현재 나의 등급</th>
                                    <th scope="col">다음 등급까지 남은 나의 등급</th>
                                </tr>
                            </thead>
                            <tbody>
                             	<tr>
                             		<td>
                             		
                             		${userList.usergrade.grade}
                             		</td>
                         
                             		<td>
                             		<fmt:formatNumber value="${aqPay}"  var="pay" />
                             		${pay}원
                             		</td>
                             	</tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<Br>
	<div class=titleSection>
			<div class="row">
				<div class="col-xl" style="text-align: left;">
					R.P MALL 등급
				</div>
			</div>
		</div>
	<div class="container">
    <div class="row">
        <div class="col-lg">
            <div class="card rounded-0 border-0 shadow">
                <div class="card-body p-5">
                    
                    <!--  Bootstrap table-->
                    <div class="table-responsive">
                        <table class="table" style="text-align: center">
                            <thead>
                                <tr>
                                    <th scope="col">등급</th>
                                    <th scope="col">구매 최소 금액</th>
                                    <th scope="col">구매 최대 금액 </th>
                                    <th scope="col">포인트 적립률</th>
                                </tr>
                            </thead>
                            <tbody>
                              <c:forEach var="user" items="${userGradeList}">
		<tr>
			<td>
				${user.grade}<p>
			</td>
			<td>
			<fmt:formatNumber value="${user.lowPrice}"  var="lowPrice" />
				${lowPrice}원<p>
			</td>
			<td>	
			<fmt:formatNumber value="${user.highPrice}"  var="highPrice" />
				${highPrice}원<p>
			</td>
			<td>
				${user.pointRate}<p>
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