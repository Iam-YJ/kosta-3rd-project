<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">


</HEAD>
<BODY>
 
<form name="writeForm" method="post" action="${pageContext.request.contextPath}/user/myPage/insertReview">
<input type="hidden" name="reviewNo" value="${registerGoods.regNo}">
<table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 후기 </b></font></p>
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
        <td width="450" height="20" colspan="2" align="center"><b>
        <span style="font-size:9pt;">
        <input type=submit value=글쓰기> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>

</form>

<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/user/myPage/myReview">리스트로 돌아가기</a>&gt;</span></div>

</BODY>
</HTML>



