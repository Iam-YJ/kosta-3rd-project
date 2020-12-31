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
		$("#csContentSection").load("${pageContext.request.contextPath}/main/cs/main");

		$('#keyword').click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/main/csForm', 
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
	$("#csContentSection").load(
			"${pageContext.request.contextPath}/main/cs/FAQ");
}
function csNotice() {
	$("#csContentSection").empty();
	$("#csContentSection").load("${pageContext.request.contextPath}/main/cs/notice");
}

<!-- </script>

<script> -->

    function sample4_execDaumPostcode() {

        new daum.Postcode({

            oncomplete: function(data) {

                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

 

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.

                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수

                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

 

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)

                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){

                    extraRoadAddr += data.bname;

                }

                // 건물명이 있고, 공동주택일 경우 추가한다.

                if(data.buildingName !== '' && data.apartment === 'Y'){

                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);

                }

                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.

                if(extraRoadAddr !== ''){

                    extraRoadAddr = ' (' + extraRoadAddr + ')';

                }

                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.

                if(fullRoadAddr !== ''){

                    fullRoadAddr += extraRoadAddr;

                }

 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.

                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용

                document.getElementById('sample4_roadAddress').value = fullRoadAddr;

                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

 

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.

                if(data.autoRoadAddress) {

                    //예상되는 도로명 주소에 조합형 주소를 추가한다.

                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;

                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

 

                } else if(data.autoJibunAddress) {

                    var expJibunAddr = data.autoJibunAddress;

                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

 

                } else {

                    document.getElementById('guide').innerHTML = '';

                }

            }

        }).open();

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