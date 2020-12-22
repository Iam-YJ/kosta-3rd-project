<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$('input[name=mainCate]').click(function(){
		 $.ajax({
			  url : "${pageContext.request.contextPath}/admin/subcategories" ,//서버요청주소
			  type :"post" ,//요청방식(get | post | put | delete | patch)
			  dataType : "json" ,//서버가보내온 데이터타입( text | html | xml | json)
			  data : {
				  mainCateNo :$(this).attr('id'),
				  }, //서버에게 보낼 parameter정보
			  success: function(result){
				  str="";
				  $.each(result,function(index,item){
						str+=" <input type='radio' id="+item.subCategoryNo+" name=subCate value ="+item.subCategoryNo+">"+
						"<label for="+item.subCategoryNo+">"+item.subCategoryName+"</label>"+
						"<a href='${pageContext.request.contextPath}/admin/myPage/updateSubCategory/"+$(this).attr('id')+"/"+item.subCategoryNo+"'>수정하기</a><br>"
					});
				  $("#subCategory").html(str); 
				 
			  },
			  error : function(err){
				  console.log(err+ " 예외발생....");
			  }
		  });//ajax
		
	})
	
	$('input=[value=수정]').click(function(){
		location.href="${pageContext.request.contextPath}/admin/myPage/updateMainController";
		
	})
	
})
</script>
</head>
<body>
<table>

<c:forEach items="${list}" var="list">
<tr>
<td>
<input type="button" name="mainCate" id="${list.mainCategoryNo}" value = "${list.mainCategoryName}">
</td>
<td><input type="button" name = "mainCategoryNo" value= "수정" id="${list.mainCategoryNo}"></td>
</tr>
</c:forEach>
</table>
<form action="${pageContext.request.contextPath}/admin/myPage/insertMainCategory">
<input type="text" name="mainCategoryName">
<input type="submit" value="등록">
</form>
<table>
<form>
<div id = "subCategory"></div>

</form>
</table>
</body>
</html>