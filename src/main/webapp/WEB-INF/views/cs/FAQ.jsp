<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<h4>FAQ</h4>
			</div>
			<c:if test="${sessionScope.userList.authority eq 'ROLE_ADMIN'}">
				<div class="col-xl-6" style="text-align: right; margin: auto;">
					<a href="${pageContext.request.contextPath}/main/csForm?state=3" class="btn btn-success">FAQ등록</a>
				</div>
			</c:if>
		</div><!-- titleSection -->
		<c:choose>
			<c:when test="${empty faqList}">
				등록된 게시글이 없습니다.
			</c:when>
			<c:otherwise>
				<div class="row border rounded" style="margin-top: 15px;">
					<div class="col-xl">
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
					</div>
					<div class="col-xl-1"></div>
				</div>
			</c:otherwise>
		</c:choose>
	</div><!-- container-fluid -->
</div><!-- csFAQSection -->

	

<%-- 


<div class="faq">
    <div class="faqHeader">
        <!--button type="button" class="showAll">답변 모두 여닫기</button-->
        
    </div>
    <ul class="faqBody">
        <li class="article" id="a1">
        
            <p class="q"></p>           
              <p class="a"><a href="${pageContext.request.contextPath}/admin/read/${list.faqNo}"></a></p> 
    
        </li>
    </ul>
</div>
	


<hr>
<div align=right>
<span style="font-size:12pt;">&lt;<a href="${pageContext.request.contextPath}/admin/writeFAQ">FAQ 등록하기</a>&gt;</span></div>
 --%>

</body>
</html>