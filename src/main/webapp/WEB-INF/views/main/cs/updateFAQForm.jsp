<%@ page info="FAQ 수정하기" contentType="text/html;charset=UTF-8" %>
<HTML>
<HEAD>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<SCRIPT>
$(function(){
	   $("input[value=수정하기]").click(function(){
		   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		   $("#updateFAQ").attr("action", "${pageContext.request.contextPath}/admin/update");
		   $("#updateFAQ").submit();
	   })
})
</SCRIPT>

</HEAD>

<BODY>


<form name="updateFAQ" method="post" id="updateFAQ">
    <input type="hidden" name="faqNo" value="${faq.faqNo}">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> FAQ 수정하기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">질 문</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="answer" size="30" value="${faq.question}"></span></b></td>
    </tr>
    
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">답 변</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="question" cols="50" rows="10">${faq.answer}</textarea></span></b></td>
    </tr>
   
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
		<input type="button" value="수정하기"> </span></b></td>
    </tr>
</table>
</form>

<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/admin/cs/list">리스트로 돌아가기</a>&gt;</span></div>
</BODY>


</HTML>