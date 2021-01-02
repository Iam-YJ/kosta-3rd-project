<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {

		if(${state == null}){
			$("#csContentSection").load("${pageContext.request.contextPath}/main/cs/main");
		}else{
			if(${state == 1}){
				csFAQ();
			}else if(${state == 2}) {
				csNotice();
			}else if(${state == 3}) {
				FAQWriteForm();
			}else if(${state == 4}) {
				noticeWriteForm();
			}
		}
		 
		$('#keyword').click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/main/csFormAjax', 
				type : 'POST',
				dataType : "json", 
				data : {word :$("#key").val() },
				success : function(result) {
					console.log(result)
					var str = ""; 
					$("#csContentSection").empty();
					$.each(result, function (i, list) {
						str+="<div class='col-xl-1 align-self-center' style='text-align: center;'>";
						str+="<h5><b>Q</b></h5></div>";
						str+="<div class='col-xl' style='padding: 5px;'>";
						str+="<a href='#' data-toggle='collapse'>"+list.question+"</a></div>";
						str+="<div class='col-xl-1 align-self-center' style='text-align: center;'>";
						str+="<h5><b>A</b></h5></div>";
						str+="<div class='col-xl' style='padding: 5px;'>";
						str+="<a href='#''>"+list.answer+"</a></div>"  ;
				      });
				 $("#csContentSection").html(str); 
				},
				error : function(err){
					  console.log(err+"예외발생");
				  }
			  });//ajax
		});
	
})//jqeury_ready

function csFAQ() {
	$("#csContentSection").empty();
	$("#csContentSection").load("${pageContext.request.contextPath}/main/cs/FAQ");
}
function csNotice() {
	$("#csContentSection").empty();
	$("#csContentSection").load("${pageContext.request.contextPath}/main/cs/notice");
}
function FAQWriteForm(){
	$("#csContentSection").empty();
	$("#csContentSection").load("${pageContext.request.contextPath}/admin/writeFAQ");
}
function noticeWriteForm(){
	$("#csContentSection").empty();
	$("#csContentSection").load("${pageContext.request.contextPath}/admin/writeNotice");
}

</script>
</head>
<body>

	<div class="csFrame">
		<div class="container">
			<div class="row col-xl" style="margin: 10px 0px"></div>
			<div class="row">
				<div class="col-xl-3"
					style="background-color: #d5edb4; text-align: center; padding: 50px; font-size: 30px">
					<b>고객센터</b>
				</div>
				<div class="col-xl"
					style="background-color: #f0f6e8; padding: 50px;">
					<div class="row">
						<div class="col-xl-3" style="font-size: 30px">FAQ 검색</div>
						<input type="text" class="col-xl" style="width: 60%" id="key">
						<input type="button" class="btn btn-success col-xl-2" id="keyword"
							value="검색">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-xl-3" style="background-color: #f0f6e8">
					<div class="csMenuSection">
						<div class="row col-xl" style="margin-top: 15px">
							<h4>
								<a href="#" onclick="csFAQ()">FAQ</a>
							</h4>
						</div>

						<div class="row col-xl" style="margin-top: 15px">
							<h4>
								<a href="#" onclick="csNotice()">공지사항</a>
							</h4>
						</div>

					</div>
				</div>
				<div class="col-xl">
					<div class="csContentSection" id="csContentSection">
						
					</div>
				</div>
			</div>
			<!-- row -->
		</div>
	</div>
	<!-- myPageFrame -->
</body>
</html>