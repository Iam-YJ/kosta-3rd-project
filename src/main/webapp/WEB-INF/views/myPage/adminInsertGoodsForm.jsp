<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
font-family: summernote;
src : url('${pageContext.request.contextPath}/css/fonts/summernote.eot');
src : url('${pageContext.request.contextPath}/css/fonts/summernote.ttf');
src : url('${pageContext.request.contextPath}/css/fonts/summernote.woff');
src : url('${pageContext.request.contextPath}/css/fonts/summernote.woff2');
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/summernote-lite.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/summernote-lite.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/summernote-ko-KR.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('#summernote').summernote({
			// 에디터 높이
			  height: 300,
			  // 에디터 한글 설정
			  lang: "ko-KR",
			  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
			  focus : false,
			  toolbar: [
				    // 글꼴 설정
				    ['fontname', ['fontname']],
				    // 글자 크기 설정
				    ['fontsize', ['fontsize']],
				    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    // 글자색
				    ['color', ['forecolor','color']],
				    // 표만들기
				    ['table', ['table']],
				    // 글머리 기호, 번호매기기, 문단정렬
				    ['para', ['ul', 'ol', 'paragraph']],
				    // 줄간격
				    ['height', ['height']],
				    // 그림첨부, 링크만들기, 동영상첨부
				    ['insert',['picture','link','video']],
				    // 코드보기, 확대해서보기, 도움말
				    ['view', ['codeview','fullscreen', 'help']]
				  ],
				  // 추가한 글꼴
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
				 // 추가한 폰트사이즈
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
		
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
				   var str="<option value=0>---서브카테고리---</option>";
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
		
		$("#insertGoodsBtn").click(function(){

			if($("#mainCategory").val()==0){
				alert("상품종류를 선택해주세요.")
				$("#mainCategory").focus();
				return false;
			}
			
			if($("#subCategory").val()==0){
				alert("상품카테고리를 선택해주세요.")
				$("#subCategory").focus();
				return false;
			}
			
			if($("#title").val() == null || $("#title").val() == ""){
				alert("글제목을 입력해주세요.")
				$("#title").focus();
				return false;
			}
			
			if($("#name").val() == null || $("#name").val() == ""){
				alert("상품명을 입력해주세요.")
				$("#name").focus();
				return false;
			}
			
			if($("#options").val() == null || $("#name").val() == ""){
				alert("용량/수량/크기를 입력해주세요.")
				$("#options").focus();
				return false;
			}
			
			if($("#method").val() == null || $("#name").val() == ""){
				alert("보관방법을 입력해주세요.")
				$("#method").focus();
				return false;
			}
			
			if($("#area").val() == null || $("#name").val() == ""){
				alert("원산지를 입력해주세요.")
				$("#area").focus();
				return false;
			}
			
			if($("#stock").val() == null || $("#stock").val() == "" || $("#stock").val() == 0){
				alert("재고를 입력해주세요.")
				$("#stock").focus();
				return false;
			}
			

			if($("#price").val() == null || $("#price").val() == "" || $("#price").val() == 0){
				alert("가격을 입력해주세요.")
				$("#price").focus();
				return false;
			}
			
			
		
			
			
			$("#insertGoodsForm").submit();
			
		});//insertGoodsBtn_click
		
		
	});//ready

</script>
</head>
<body>

<div class="insertOrdersForm">
	<div class="container-fluid">
		<div class="titleSection">
			<div class="row">
				<div class="col-xl">
					신규상품등록
				</div>
			</div>
		</div><!-- titleSection -->
		<div class="contentSection border" style="padding : 10px;">
			<form action="${pageContext.request.contextPath}/admin/myPage/insertGoods" id="insertGoodsForm" method="post" enctype="multipart/form-data" >			
				<div class="row">
					<div class="col-xl-2" style="margin: auto; text-align: center;">
						상품종류
					</div>
					<div class="col-xl" style="margin: auto; text-align: center;">
						<select id="mainCategory" name="mainCateNo" class="form-control">
							<option value=0>---메인카테고리---</option>
							<c:forEach items="${requestScope.list}" var="list" >
								<option value="${list.mainCategoryNo}">${list.mainCategoryName}</option>
							</c:forEach> 
						</select>
					</div>
					<div class="col-xl-2" style="margin: auto; text-align: center;">
						상품카테고리
					</div>
					<div class="col-xl" style="margin: auto; text-align: center;"> 
						<select id="subCategory"  name="subCateNo" class="form-control">
							<option value=0>---서브카테고리---</option>
						</select>
					</div>
				</div>
				
				<div class="row" style="margin-top: 10px;">
					<div class="col-xl-2" style="margin: auto; text-align: center;">
						글제목
					</div>
					<div class="col-xl">
						<input type="text" id="title" name="title" class="form-control"/>
					</div>
				</div>
				
				<div class="row" style="margin-top: 10px;">
					<div class="col-xl-2" style="margin: auto; text-align: center;">
						상품명
					</div>
					<div class="col-xl">
						<input type="text" id="name" name="name" class="form-control" placeholder="사과/귤/감/버섯 etc..."/>
					</div>
				</div>
				
				<div class="row" style="margin-top: 10px;">
					<div class="col-xl-2" style="margin: auto; text-align: center; font-size: 15px;">
						용량/수량/크기
					</div>
					<div class="col-xl">
						<input type="text" id="options" name="options" class="form-control" placeholder="3~4개입/1Box/~kg etc.."/>
					</div>
				</div>
				
				<div class="row" style="margin-top: 10px;">
					<div class="col-xl-2" style="margin: auto; text-align: center;">
						보관방법
					</div>
					<div class="col-xl">
						<input type="text" id="method" name="method" class="form-control" placeholder="상온보관/냉장보관/냉동보관 etc."/>
					</div>
				</div>
				
					<div class="row" style="margin-top: 10px;">
					<div class="col-xl-2" style="margin: auto; text-align: center;">
						원산지
					</div>
					<div class="col-xl">
						<input type="text" id="area" name="area" class="form-control" placeholder="지역"/>
					</div>
				</div>
				
				<div class="row" style="margin-top: 10px;">
					<div class="col-xl-2" style="margin: auto; text-align: center;">
						재고량
					</div>
					<div class="col-xl" style="margin: auto; text-align: center;">
						<input type="number" id="stock" name="stock" class="form-control" min="0"/>
					</div>
					<div class="col-xl-2" style="margin: auto; text-align: center;">
						가격
					</div>
					<div class="col-xl" style="margin: auto; text-align: center;"> 
						<input type="number" id="price" name="price" class="form-control" min="0"/>
					</div>
				</div>
				
				<div class="row" style="margin-top: 10px;">
					<div class="col-xl-2" style="margin: auto; text-align: center;">
						배너광고
					</div>
					<div class="col-xl" >
						<div class="form-check-inline">
							<input type="radio" class="form-check-input" name="ad" value="0" checked="checked">사용안함
						</div>
						<div class="form-check-inline">
						    <input type="radio" class="form-check-input" name="ad" value="1">광고사용
						</div>
					</div>
				</div>
				
				<div class="row" style="margin-top: 15px;">
					<div class="col-xl" style="margin: auto; text-align: center; font-size: 20px;">
						파일첨부
					</div>
				</div>
				
				<div class="row" style="margin-top: 10px;">
					<div class="col-xl-2" style="margin: auto; text-align: center;">
						썸네일 이미지
					</div>
					<div class="col-xl" style="margin: auto;">
						<input type="file" name="tfile" class="form-control">
					</div>
				</div>
				
				<div class="row" style="margin-top: 10px;">
					<div class="col-xl-2" style="margin: auto; text-align: center;">
						배너 이미지
					</div>
					<div class="col-xl" style="margin: auto;">
						<input type="file" name="adfile" class="form-control">
					</div>
				</div>
				
				<div class="row" style="margin-top: 15px;">
					<div class="col-xl" style="margin: auto; text-align: center; font-size: 20px;">
						상품설명
					</div>
				</div>
				
				<div class="row" style="margin-top: 10px;">
					<div class="col-xl" style="margin: auto; text-align: left;">
						<textarea class="form-control" name="detail" rows="10" cols="" id="summernote"></textarea>
					</div>
				</div>
				<input type="hidden" name="sellcount" value=0>
				
				<div class="row" style="margin-top: 10px;">
					<div class="col-xl" style="margin: auto; text-align: center;">
						<button type="button" class="btn btn-success" id="insertGoodsBtn">등록하기</button>
						<button type="reset" class="btn btn-outline-success">취소하기</button>
					</div>
				</div>
			</form>
		</div><!-- contentSection -->
	</div><!-- container-fluid -->
</div><!-- insertOrdersForm -->


</body>
</html>