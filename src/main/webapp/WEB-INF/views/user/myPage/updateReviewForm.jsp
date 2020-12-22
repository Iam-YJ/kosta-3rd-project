<%@ page info="FAQ 수정하기" contentType="text/html;charset=UTF-8" %>
<HTML>
<HEAD>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<SCRIPT>
$(function(){
	   $("input[value=수정하기]").click(function(){
		   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		   $("#updateFAQ").attr("action", "${pageContext.request.contextPath}/user/myPage/updateReview");
		   $("#updateFAQ").submit();
	   })
})
</SCRIPT>

</HEAD>

<BODY>


<form name="updateFAQ" method="post" id="updateFAQ">
    <input type="hidden" name="reviewNo" value="${registerGoods.regNo}">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 후기 수정 </b></font></p>
        </td>
    </tr>
    
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">후기 내용</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="content" cols="50" rows="10"></textarea></span></b></td>
    </tr>
   
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
		<input type="button" value="수정하기"> </span></b></td>
    </tr>
</table>
</form>

<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/user/myPage/myReview">리스트로 돌아가기</a>&gt;</span></div>
</BODY>


</HTML>