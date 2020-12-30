<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//3자리마다 Comma넣어주는 함수
function AddComma(num){
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}//AddComma

$(document).ready(function(){
	

	$('#keyword').click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/main/goodsListKeyword', 
				type : 'POST',
				dataType : "json", 
				data : {keyword :$("#key").val()},
				success : function(result) {
					 str="";
					  $("#content").empty();
					  $.each(result, function (i, list) {
		              		str+=" <div class='col-xl-3' style='padding-bottom: 30px'>";
		                    str+="<div class='border'>";
		                    str+="<div class='row'><div class='col-xl'><div class='goodsListImgSection'>";
		               		str+="<a href='${pageContext.request.contextPath}/main/goodsDetail/"+list.regNo+"'>";
		               		str+="<img alt='' class='center-block' src='${pageContext.request.contextPath}/images/thumbnail/"+list.thumbnailImg+"'>";
							str+="</a></div></div></div>";
							str+="<div class='row'>";
							str+="<div class='col-xl'>	<div class='goodsListExplainSection' style='padding-bottom: 10px'>";
							str+="<hr>"+list.title+"<br>";
							str+=AddComma(list.price)+"원";
							str+="</div></div></div></div></div></div>";		
							
		                });
					  $("#content").html(str);
				},
				error : function(err){
				}
			});
	});
				
	
	$("#sel1").change(function(){
		var main = ${goodsListMap.main};
		var sub = ${goodsListMap.sub};
		console.log(main);
		console.log(sub);
		if($(this).val()==1){
			 $.ajax({
				  url : "${pageContext.request.contextPath}/main/goodsListOrder/"+main+"/"+sub+"/"+1 ,//서버요청주소
				  type :"post" ,//요청방식(get | post | put | delete | patch)
				  dataType : "json" ,//서버가보내온 데이터타입( text | html | xml | json)
				  success: function(result){
					  str="";
					  $("#content").empty();
					  $.each(result, function (i, list) {
		              		str+=" <div class='col-xl-3' style='padding-bottom: 30px'>";
		                    str+="<div class='border'>";
		                    str+="<div class='row'><div class='col-xl'><div class='goodsListImgSection'>";
		               		str+="<a href='${pageContext.request.contextPath}/main/goodsDetail/"+list.regNo+"'>";
		               		str+="<img alt='' class='center-block' src='${pageContext.request.contextPath}/images/thumbnail/"+list.thumbnailImg+"'>";
							str+="</a></div></div></div>";
							str+="<div class='row'>";
							str+="<div class='col-xl'>	<div class='goodsListExplainSection' style='padding-bottom: 10px'>";
							str+="<hr>"+list.title+"<br>";
							str+=AddComma(list.price)+"원";
							str+="</div></div></div></div></div></div>";		
							
		                });
					  $("#content").html(str);
				  },
				  error : function(err){
					  console.log(err+"예외발생");
				  }
			  });//ajax
		}else if($(this).val()==2){
			 $.ajax({
				  url : "${pageContext.request.contextPath}/main/goodsListOrder/"+main+"/"+sub+"/"+2 ,//서버요청주소
				  type :"post" ,//요청방식(get | post | put | delete | patch)
				  dataType : "json" ,//서버가보내온 데이터타입( text | html | xml | json)
				  success: function(result){
					  str="";
					  $("#content").empty();
					  $.each(result, function (i, list) {
		              		str+=" <div class='col-xl-3' style='padding-bottom: 30px'>";
		                    str+="<div class='border'>";
		                    str+="<div class='row'><div class='col-xl'><div class='goodsListImgSection'>";
		               		str+="<a href='${pageContext.request.contextPath}/main/goodsDetail/"+list.regNo+"'>";
		               		str+="<img alt='' class='center-block' src='${pageContext.request.contextPath}/images/thumbnail/"+list.thumbnailImg+"'>";
							str+="</a></div></div></div>";
							str+="<div class='row'>";
							str+="<div class='col-xl'>	<div class='goodsListExplainSection' style='padding-bottom: 10px'>";
							str+="<hr>"+list.title+"<br>";
							str+=AddComma(list.price)+"원";
							str+="</div></div></div></div></div></div>";		
							
		                });
					  $("#content").html(str);
				  },
				  error : function(err){
					  console.log(err+"예외발생");
				  }
			  });//ajax
		}else{
			 $.ajax({
				  url : "${pageContext.request.contextPath}/main/goodsListOrder/"+main+"/"+sub+"/"+3 ,//서버요청주소
				  type :"post" ,//요청방식(get | post | put | delete | patch)
				  dataType : "json" ,//서버가보내온 데이터타입( text | html | xml | json)
				  success: function(result){
					  str="";
					  $("#content").empty();
					  $.each(result, function (i, list) {
		              		str+=" <div class='col-xl-3' style='padding-bottom: 30px'>";
		                    str+="<div class='border'>";
		                    str+="<div class='row'><div class='col-xl'><div class='goodsListImgSection'>";
		               		str+="<a href='${pageContext.request.contextPath}/main/goodsDetail/"+list.regNo+"'>";
		               		str+="<img alt='' class='center-block' src='${pageContext.request.contextPath}/images/thumbnail/"+list.thumbnailImg+"'>";
							str+="</a></div></div></div>";
							str+="<div class='row'>";
							str+="<div class='col-xl'>	<div class='goodsListExplainSection' style='padding-bottom: 10px'>";
							str+="<hr>"+list.title+"<br>";
							str+=AddComma(list.price)+"원";
							str+="</div></div></div></div></div></div>";		
							
		                });
					  $("#content").html(str);
				  },
				  error : function(err){
					  console.log(err+"예외발생");
				  }
			  });//ajax
		}
		
	})
	
})

</script>
</head>
<body>

<div class="goodsList">
	<div class="container">
		<div class="row">
			<div style="margin: 5px 0px;">
				<div class="col-xl">
					<a href="${pageContext.request.contextPath}/main/goodsList/0/0/0">홈</a>
					<c:choose>
						<c:when test="${goodsListMap.main==0}">
							 > 전체상품조회
						</c:when>
						<c:otherwise>
							 > ${goodsListMap.registerGoods.mainCategories.mainCategoryName}
							 
							 <c:choose>
								<c:when test="${goodsListMap.sub==0}">
									 > 전체상품조회
								</c:when>
								<c:otherwise>
									 > ${goodsListMap.registerGoods.subCategories.subCategoryName}
								</c:otherwise>
							</c:choose>
							 
						</c:otherwise>
					</c:choose>
				
				</div><!-- col-xl -->
			</div>
		</div><!-- row -->
		
		
		<div class="row" style="background-color: #f0f6e8">
			<div class="col-xl-2"></div>
			<div class="col-xl" style="margin: 15px">
				<c:forEach items="${goodsListMap.mainCategories}" var="mainCate">
					<span style="padding-right: 20px; font-size: 20px">
						<a href="${pageContext.request.contextPath}/main/goodsList/${mainCate.mainCategoryNo}/0/0">${mainCate.mainCategoryName}</a>
					</span>
				</c:forEach>	
			</div>
		</div><!-- row -->
		
		<div class="row">
			<div class="col-xl-2" style="background-color: #f0f6e8">
				<c:choose>
					<c:when test="${goodsListMap.main==0}">
						<c:forEach items="${goodsListMap.mainCategories}" var="mainCate">
							<div style="font-size: 20px; margin:10px 5px">
								<a href="${pageContext.request.contextPath}/main/goodsList/${mainCate.mainCategoryNo}/0/0">${mainCate.mainCategoryName}</a>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div style="font-size: 20px; margin:10px 5px">
							${goodsListMap.registerGoods.mainCategories.mainCategoryName}
						</div>
						<c:forEach items="${goodsListMap.registerGoods.mainCategories.subCategoryList}" var="subCate" varStatus="subIndex">
							<div style="font-size: 14px; margin:10px 5px">
								<a href="${pageContext.request.contextPath}/main/goodsList/${goodsListMap.registerGoods.mainCategories.mainCategoryNo}/${subCate.subCategoryNo}/0">${subCate.subCategoryName}</a>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div><!-- col-2 -->
						
			<div class="col-xl-10">
				<div class="row">
					<div class="col-xl" style="margin-top: 20px">
				
						<!-- select box구간 -->
						
						<div class="row">
						
							<div class="col-xl-10"></div>
								<div class="col-xl-3" style="font-size: 20px">키워드 검색</div>
									<input type="text" class="col-xl" style="width: 60%" id="key">
									<input type="button" class="btn btn-success col-xl-1" id="keyword" value="검색">
									<div class="col-xl-2">
										<div class="form-group" style="text-align: right;">
											<select class="form-control" id="sel1" name="sellist1">
												<option value="0">정렬</option>
												<option value="1">최신순</option>
												<option value="2">인기순</option>
												<option value="3">가격순</option>
											</select>
										</div>	
									</div>
						</div><!-- row -->
						
						<!-- select box구간  끝-->
					</div>					
				</div><!-- row -->
				
				<div class="row" id="content">
					<!-- goodListSection -->
					<c:forEach items="${goodsListMap.regGoods}" var="registerGoodsList">
						<div class="col-xl-3" style="padding-bottom: 30px">
							<div class="border">
								<div class="row">
									<div class="col-xl">
										<div class="goodsListImgSection">
											<a href="${pageContext.request.contextPath}/main/goodsDetail/${registerGoodsList.regNo}">
												<img alt="" class="center-block"
												src="${pageContext.request.contextPath}/images/thumbnail/${registerGoodsList.thumbnailImg}" >
											</a>
										</div><!-- goodsListImgSection -->
									</div><!-- col -->
								</div><!-- row 상품 리스트 썸네일영역 -->
								<div class="row">
								
									<div class="col-xl">
										<div class="goodsListExplainSection" style="padding-bottom: 10px">
											<hr>
											${registerGoodsList.title}<br>
											<fmt:formatNumber value="${registerGoodsList.price}" var="CommaPrice"/>
											${CommaPrice}원
										</div><!-- goodsListExplainSection -->
									</div><!-- col -->
								</div><!-- row 상품 리스트 설명영역 -->
							</div><!-- 상품리스트 1개 영역 -->
						</div><!-- col=3 -->
					</c:forEach>	
					</div>
					<!-- End : goodListSection  -->
				</div><!-- row -->
			</div><!-- col-10 -->
		</div><!-- row -->
	</div><!-- container -->
</div><!-- goodsList -->


	
${goodsListMap.registerGoodsList.hasPrevious()}/${goodsListMap.registerGoodsList.hasNext()}
<!-- 페이징 처리 -->
<div style="text-align:center">
<c:forEach begin="0" end="${goodsListMap.registerGoodsList.totalPages-1}" var="i">
  <c:choose>
    <c:when test="${goodsListMap.registerGoodsList.number==i}">
       <a href="${pageContext.request.contextPath}/main/goodsList/${goodsListMap.main}/${goodsListMap.sub}/${goodsListMap.sort}?nowPage=${i}" style="color:red">[${i+1}]</a>
    </c:when>
    <c:otherwise>
       <a href="${pageContext.request.contextPath}/main/goodsList/${goodsListMap.main}/${goodsListMap.sub}/${goodsListMap.sort}?nowPage=${i}">[${i+1}]</a>
    </c:otherwise>
  </c:choose>
</c:forEach>
</div>

	



</body>
</html>