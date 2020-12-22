<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


<h1>main/cs/notice.jsp</h1>
<c:forEach items="${list}" var="list">
<div class="notice">
    <div class="noticeHeader">
    </div>
    <ul class="noticeBody">
        <li class="article" id="a1">
        
            <p class="q"><a href="${pageContext.request.contextPath}/admin/readNotice/${list.noticeNo}"> ${list.title}</a></p>           
              <p class="a">${list.content}</p>
        </li>
    </ul>
</div>
</c:forEach>
<div align=right>
	<span style="font-size: 9pt;">&lt;<a
		href="${pageContext.request.contextPath}/admin/writeNotice">공지사항 쓰기</a>&gt;
	</span>
</div>
</body>
</html>