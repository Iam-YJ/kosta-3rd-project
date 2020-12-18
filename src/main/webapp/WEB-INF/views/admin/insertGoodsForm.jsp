<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$(document).on("change","#mainCategory",function(){
			//alert($(this).val())
			
		})
	});//ready

</script>
</head>
<body>
<h1>판매상품등록 폼</h1>
<form action="${pageContext.request.contextPath}/admin/myPage/insertGoods">
메인카테고리 :
<select id="mainCategory">
<option value=0>메인카테고리</option>
<c:forEach items="${requestScope.list}" var="list" >
<option value="${list.mainCategoryNo}">${list.mainCategoryName}</option>
</c:forEach> 
</select><br>
서브카테고리 :
<select id="subCategory">
<option value=0>서브카테고리</option>
<c:forEach items="${requestScope.list}" var="list" >
	<c:forEach items="${list.subCategoryList}" var="sub" >
		<option value="${list.mainCategoryNo}">${sub.subCategoryName}</option>
	</c:forEach>
</c:forEach>
 </select>
 <br>
광고사용 여부 : <input type="radio" name="ad" value="0" checked="checked"/>배너사용 &nbsp;
<input type="radio" name="ad" value="1" />배너사용안함<br>
글제목 :<input type="text" name="title"/><br>
상품명 :<input type="text" name="name"/><br>
용량/수량/크기 :<input type="text" name="option"/><br>
원산지 :<input type="text" name="area"/><br>
보관방법 :<input type="text" name="method"/><br>
재고량 :<input type="text" name="stock"/><br>
가격 :<input type="text" name="price"/><br>
상품설명 :<textarea name="detail" ></textarea><br>
<input type="hidden" name="sellcount" value=0>

<button type="submit">등록하기</button><button type="reset">취소하기</button><p>
</form>


업다운로드 설정 -> 배너,썸네일사진등록기능 추가


</body>
</html>