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
        <!--button type="button" class="showAll">답변 모두 여닫기</button-->
    </div>
    <ul class="noticeBody">
        <li class="article" id="a1">
        
            <p class="q"><a href="#a1">${list.title}</a></p>           
              <p class="a">${list.content}</p>
        </li>
    </ul>
</div>
</c:forEach>
<div align=right>
	<span style="font-size: 9pt;">&lt;<a
		href="${pageContext.request.contextPath}/admin/write">공지사항 쓰기</a>&gt;
	</span>
</div>
</body>
</html>