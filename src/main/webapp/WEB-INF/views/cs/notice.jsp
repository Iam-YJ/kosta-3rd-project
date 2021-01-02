<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
a{
	color: black;
}
</style>
<script type="text/javascript">
function deleteChk(){
	if (confirm("삭제하시겠습니까?")){
		return true;
	}
	return false;
}

</script>
</head>
<body>
<div class="csFAQSection">
	<div class="container-fluid">
		<div class="row titleSection">
			<div class="col-xl-6" style="text-align: left;">
				<h4>공지사항</h4>
			</div>
			<c:if test="${sessionScope.userList.authority eq 'ROLE_ADMIN'}">
				<div class="col-xl-6" style="text-align: right; margin: auto;">
					<a href="${pageContext.request.contextPath}/main/csForm?state=4" class="btn btn-success">공지사항등록</a>
				</div>
			</c:if>
		</div><!-- titleSection -->
		<c:choose>
			<c:when test="${empty noticeList}">
				등록된 게시글이 없습니다.
			</c:when>
			<c:otherwise>
				<div class="row border rounded" style="margin-top: 15px;">
					<div class="col-xl">
						<div class="row" style="margin-top: 10px">
							<div class="col-xl-2" style="margin: auto; text-align: center; margin-left: 12px;">
								<b>번호</b>
							</div>
							<div class="col-xl" style="margin: auto; text-align: center;">
								<b>제목</b>
							</div>
							<div class="col-xl-3" style="margin: auto; text-align: center; margin-right: 12px;">
								<b>등록일</b>
							</div>
						</div>
						
						<c:forEach items="${noticeList}" var="list" varStatus="index">
							<div class="row" style="margin: 10px 0px;">
								<div class="col-xl-2" style="margin: auto; text-align: center;">
									${index.count}
								</div>
								<div class="col-xl" style="margin: auto; text-align: center;">
									<a href="#" data-toggle="collapse" data-target="#notice${list.noticeNo}">
										${list.title}
									</a>
								</div>
								<div class="col-xl-3" style="margin: auto; text-align: center;">
									<fmt:parseDate value="${list.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" />
									<fmt:formatDate value="${parseDateTime}" pattern="yyyy. MM. dd" var="formatDate"/>
									${formatDate}
								</div>
							</div>
							<div id="notice${list.noticeNo}" class="row collapse">
								<div class="col-xl-1"></div>
								<div class="col-xl border rounded" style="padding: 10px;">
									<div class="row">
										<div class="col-xl">
											${list.content}
										</div>
									</div>
									<c:if test="${sessionScope.userList.authority eq 'ROLE_ADMIN'}">
										<div class="row">
											<div class="col-xl" style="text-align: right">
												<a href="${pageContext.request.contextPath}/admin/deleteNotice/${list.noticeNo}" style="color: gray; font-size: 12px; margin-right: 12px;" onclick="return deleteChk();">
													삭제
												</a>
											</div>
										</div>
									</c:if>
								</div>
							</div>
						
						</c:forEach>						
						
						
					</div>
					<div class="col-xl-1"></div>
				</div>	
			</c:otherwise>
		</c:choose>
					
					
					<%-- 
						<c:forEach items="${faqList}" var="list">
							
							<div class="row csFAQ_Question" style="margin-top: 15px;">
								<div class="col-xl-1" style="margin: auto; text-align: center;">
									<h5><b>Q</b></h5>
								</div>
								<div class="col-xl" style="margin: auto; text-align: left;">
									<a href="#" data-toggle="collapse" data-target="#demo${list.faqNo}">${list.question}</a>
								</div>
							</div>
							<div class="row csFAQ_Answer collapse" id="demo${list.faqNo}">
								<div class="col-xl">
									<div class="row">
										<div class="col-xl">
											<hr>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-1"></div>
										<div class="col-xl-1" style="margin: auto; text-align: center;">
											<h5><b>A</b></h5>
										</div>
										<div class="col-xl" style="padding: 5px;">
											${list.answer}
										</div>
									</div>
									<c:if test="${sessionScope.userList.authority eq 'ROLE_ADMIN'}">
										<div class="row">
											<div class="col-xl" style="text-align: right; color: gray; font-family: 10px;">
												<a href="#" style="text-align: right; color: gray; font-family: 10px;"
												data-toggle="collapse" data-target="#updateFAQ${list.faqNo}">수정</a> |
												<a href="${pageContext.request.contextPath}/admin/deleteFAQ/${list.faqNo}" 
												style="text-align: right; color: gray; font-family: 10px;" onclick="return deleteChk();">삭제</a> 
											</div>
										</div>
										<div id="updateFAQ${list.faqNo}" class="collapse">
											<div class="col-xl">                               
												<form id="updateFAQForm" method="post" action="${pageContext.request.contextPath}/admin/updateFAQ/${list.faqNo}">
													<div class="FQ row">
														<div class="col-xl-2" style="margin: auto; text-align: center; padding: 10px 0px;">
															질문
														</div>
														<div class="col-xl" style="margin: auto; text-align: center; padding: 10px 0px;"> 
															<input class="form-control" name="question" id="question" value="${list.question}">
														</div>
														<div class="col-xl-1"></div>
													</div>
												
													<div class="FQ row">
														<div class="col-xl-2" style="margin: auto; text-align: center;">
															답변
														</div>
														<div class="col-xl" style="margin: auto; text-align: center; padding: 10px 0px;"> 
															<textarea rows="5" class="form-control" name="answer" id="answer">${list.answer}</textarea>
														</div>
														<div class="col-xl-1"></div>
													</div>
													
													<div class="FQ row" style="padding: 5px;">
														<div class="col-xl" style="margin: auto; text-align: right;">
															<input class="btn btn-success" id="updateFAQBtn" type="submit" value="수정하기"> 
														</div>
														<div class="col-xl-1"></div>
													</div>
												</form>	
											</div>
										</div>
									</c:if>
								</div>								
							</div>
						</c:forEach>
						 --%>
						
						
				<!-- 	</div>
					<div class="col-xl-1"></div>
				</div>
			 -->
			 
			 
	</div><!-- container-fluid -->
</div><!-- csFAQSection -->

	
<%-- 
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
 --%>
</body>
</html>