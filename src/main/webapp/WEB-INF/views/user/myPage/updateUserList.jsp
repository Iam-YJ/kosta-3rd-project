<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>

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
<script type="text/javascript">
$(document).ready(function(){
	var checkResultId="";		
	$("#registerSubmit_btn").click(function(){			
		if($("#regForm :input[name=passWord]").val().trim()==""){
			alert("패스워드를 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=addr]").val().trim()==""){
			alert("주소를 입력하세요");				
			return false;
		}
		if($("#regForm :input[name=phone]").val().trim()==""){
			alert("전화번호를 입력하세요");				
			return false;
		}	
	
		$("#regForm").submit();	
	});//submit
	
	
	//비밀번호 체크
	$("#regForm :input[name=passWordCheck]").keyup(function(){
		if($(this).val()==""){
			$("#pwdCheckSpan").html("");
		}
		if($("#regForm :input[name=passWord]").val() == $(this).val()){
				$("#pwdCheckSpan").html("비밀번호가 일치합니다.");
			}else{
				$("#pwdCheckSpan").html("비밀번호를 확인해주세요.");
			}
			
	});//user_pwdcheck_keyup
})
</script>
</head>
<body>


	<div class="container">
		<div class="row">
			<div class="col-xl-2"></div>
			<div class="col-xl">
				<h3>개인정보 수정</h3>
						<form action="${pageContext.request.contextPath}/user/myPage/updateUserList" id="regForm" method="post">
							<div class="form-group">
								<label for="pwd">비밀번호 : </label>
								<input type="password" class="form-control" id="pwd" name = "passWord" style="color: black;">
							</div>
							<div class="form-group">
								<label for="pwdChk">비밀번호확인 : </label>
								<input type="password" class="form-control" id="pwdChk" name = "passWordCheck" style="color: black;" ><span id="pwdCheckSpan"></span>
							</div>
							<div class="form-group">
								<label for="addr">주소 : </label>
									
									
								<input type="hidden" id="sample4_postcode" placeholder="우편번호" class="form-control" style="color: black;">
								<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample4_roadAddress" value = "${userList.addr}" name="addr" placeholder="도로명주소" class="form-control" style="color: black;"><br>
								<span id="guide" style="color:#999"></span>
							</div>
							<div class="form-group">
								<label for="phone">전화번호 : </label>
								<input type="text" class="form-control" id="phone" name = "phone" value="${userList.phone}">
							</div>
							<div class="form-group">
								<label for="email">E-mail : </label>
								<input type="text" class="form-control" id="email" name = "email" value="${userList.email}">
							</div>
							<div class="form-group">
								<br>
								<input type="button" id="registerSubmit_btn" class="btn btn-success col-xl" value="수정하기">
							</div>
							
						</form>
					</div>
				</div><!-- register -->
			</div><!-- col -->
		

</body>
</html>