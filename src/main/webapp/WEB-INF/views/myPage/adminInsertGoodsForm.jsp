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
			if($(this).val()==0){
				$("#subCategory").html("<option value=0>---서브카테고리---</option>"); 
			}
			//alert($(this).val())
			 $.ajax({
			  url : "${pageContext.request.contextPath}/admin/subcategories" ,//서버요청주소
			  type :"post" ,//요청방식(get | post | put | delete | patch)
			  dataType : "json" ,//서버가보내온 데이터타입( text | html | xml | json)
			  data : {
				  mainCateNo :$(this).val(),
				  }, //서버에게 보낼 parameter정보
			  success: function(result){
				   var str="<option value=0>---카테고리선택---</option>";
				  $.each(result,function(index,item){
						str+='<option value='+item.subCategoryNo+'>'+item.subCategoryName+'</option>';
					});
				  $("#subCategory").html(str); 
				  
			  },
			  error : function(err){
				  console.log(err+ " 예외발생....");
			  }
		  });//ajax
			
		})
	});//ready

</script>
</head>
<body>
<h1>판매상품등록 폼</h1>
<form action="${pageContext.request.contextPath}/admin/myPage/insertGoods" method="post" enctype="multipart/form-data" >
메인카테고리 :
<select id="mainCategory" name="mainCateNo">
<option value=0>---메인카테고리---</option>
<c:forEach items="${requestScope.list}" var="list" >
<option value="${list.mainCategoryNo}">${list.mainCategoryName}</option>
</c:forEach> 
</select><br>
서브카테고리 :
<select id="subCategory"  name="subCateNo">
<option value=0>---서브카테고리---</option>
 </select>
 <br>
광고사용 여부 : <input type="radio" name="ad" value="0" checked="checked"/>배너사용안함 &nbsp;
<input type="radio" name="ad" value="1" />배너사용<br>
썸네일 이미지 : <input type="file"  name="tfile"><br>
배너 이미지 : <input type="file"  name="adfile" ><br>
글제목 :<input type="text" name="title"/><br>
상품명 :<input type="text" name="name"/><br>
용량/수량/크기 :<input type="text" name="options"/><br>
원산지 :<input type="text" name="area"/><br>
보관방법 :<input type="text" name="method"/><br>
재고량 :<input type="text" name="stock"/><br>
가격 :<input type="text" name="price"/><br>
상품설명 :<textarea name="detail" ></textarea><br>
<input type="hidden" name="sellcount" value=0>

<button type="submit">등록하기</button><button type="reset">취소하기</button><p>
</form>




</body>
</html>