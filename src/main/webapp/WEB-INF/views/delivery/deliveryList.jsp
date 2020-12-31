<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

$(function(){
	
	   $("#requestForm").click(function(){
		   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		   alert(1);
		  //$("#requestForm").attr("action", "${pageContext.request.contextPath}/delivery/listDelivery/{orderNo}");
		  //$("#requestForm").submit();
	   })
			
})//ready



</script>

</head>
<body>


<table class="deliveryTable" id="deliveryTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>orderNo</th>
					<th>userList</th>
					<th>addr</th>
					<th>totalPrice</th>
					<th>delState</th>
					<th>상태</th>
				</tr>
			</thead>
			<c:forEach items="${orderList}" var="orderList">
				<tbody>
					<tr>
						<td>${orderList.orderNo}</td>
						<td>${orderList.userList.userNo}</td>
						<td>${orderList.addr}</td>
						<td>${orderList.totalPrice}</td>
						<td>${orderList.delState}</td>
						<td>
						<form action="${pageContext.request.contextPath}/delivery/${orderList.orderNo}">
							<input type="submit" value="배송완료" >
						</form>
						</td>
					</tr>
				</tbody>
			</c:forEach>
			
			
				
			
		</table>
		
		
</body>
</html>