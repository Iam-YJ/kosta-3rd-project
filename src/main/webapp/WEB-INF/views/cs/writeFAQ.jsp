<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#writeFAQBtn").click(function(){
		
		if( $("#question").val() == null || $("#question").val() == "" ){
			alert("질문을 입력해주세요");
			$("#question").focus();
			return false;
		}
		
		if( $("#answer").val() == null || $("#answer").val() == "" ){
			alert("답변을 입력해주세요");
			$("#answer").focus();
			return false;
		}
		
		$("#writeFAQForm").submit();
		
		
	});//writeFAQBtn_click
	
});//jqeury_ready

</script>
</head>
<body>

<div class="csFAQInsertSection">
	<div class="container-fluid">
		<div class="titleSection row">
			<div class="col-xl" style="text-align: left; margin: auto;">
				<h4>FAQ 등록</h4>
			</div>
		</div><!-- titleSection -->
		
		<div class="subTitleSection row border" style="padding: 10px; background-color: #F0F6E8;">
			<div class="col-xl" style="margin: auto; text-align: center;">
				FAQ 등록
			</div>
		</div>
		<form id="writeFAQForm" method="post" action="${pageContext.request.contextPath}/admin/insertFAQ">
			<div class="FQ row border border-top-0">
				<div class="col-xl-2" style="margin: auto; text-align: center; padding: 10px 0px;">
					질문
				</div>
				<div class="col-xl" style="margin: auto; text-align: center; padding: 10px 0px;"> 
					<input class="form-control" name="question" id="question">
				</div>
				<div class="col-xl-1"></div>
			</div>
		
			<div class="FQ row border border-top-0">
				<div class="col-xl-2" style="margin: auto; text-align: center;">
					답변
				</div>
				<div class="col-xl" style="margin: auto; text-align: center; padding: 10px 0px;"> 
					<textarea rows="10" class="form-control" name="answer" id="answer"></textarea>
				</div>
				<div class="col-xl-1"></div>
			</div>
			
			<div class="FQ row border border-top-0" style="padding: 5px;">
				<div class="col-xl-6" style="margin: auto; text-align: right;">
					<input class="btn btn-success" id="writeFAQBtn" type="button" value="등록하기"> 
				</div>
				<div class="col-xl-6" style="margin: auto; text-align: left;"> 
					<input class="btn btn-outline-success" type="reset" value="다시쓰기">
				</div>
			</div>
		</form>	
	</div><!-- container-fluid -->
</div><!-- csFAQInsertSection -->

</body>
</html>