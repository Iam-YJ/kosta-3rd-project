<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<style>
/* FAQ */
.faq{border-bottom:0px solid #ddd;margin:1em 0;}
.faq .faqHeader{position:relative;zoom:1}
.faq .faqHeader .showAll{position:absolute;bottom:0;right:0;border:0;padding:0;overflow:visible;background:none;cursor:pointer}
.faq .faqBody{margin:0;padding:0}
.faq .faqBody .article{list-style:none}
.faq .q{margin:}
.faq .q a{display:block;text-align:left; 
    background:url("faq1_icon_q.png") no-repeat 0 0;
    padding:0 0 0 35px;
    font-size:18px;
    color:#5e5e5e;
    font-weight:bold;
    line-height: 27px;
    cursor:pointer;
    margin: 10px 0; !important}
.faq .q a:hover, .faq .q a:active, .faq .q a:focus{}
.faq .a{background:#f8f8f8 url("faq1_icon_a.png") no-repeat 40px 10px;padding: 10px 75px 10px 75px;
    font-size: 16px;
    color: #444444;
    line-height: 22px;http://localhost:8000/admin/list#a1
    border-top: 1px solid #bdbdbd;
    margin:5px 0 0 0;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>


<script>
$(function(){
    // Frequently Asked Question
    var article = $('.faq>.faqBody>.article');
    article.addClass('hide');
    article.find('.a').hide();
    article.eq(0).removeClass('hide');
    article.eq(0).find('.a').show();
    $('.faq>.faqBody>.article>.q>a').click(function(){
        var myArticle = $(this).parents('.article:first');
        if(myArticle.hasClass('hide')){
            article.addClass('hide').removeClass('show');
            article.find('.a').slideUp(100);
            myArticle.removeClass('hide').addClass('show');
            myArticle.find('.a').slideDown(100);
        } else {
            myArticle.removeClass('show').addClass('hide');
            myArticle.find('.a').slideUp(100);
        }
        return false;
    });
    $('.faq>.faqHeader>.showAll').click(function(){
        var hidden = $('.faq>.faqBody>.article.hide').length;
        if(hidden > 0){
            article.removeClass('hide').addClass('show');
            article.find('.a').slideDown(100);
        } else {
            article.removeClass('show').addClass('hide');
            article.find('.a').slideUp(100);
        }
    });
	
    $("input[value=등록하기]").click(function(){
        
		   $("#writeFAQ").attr("action", "${pageContext.request.contextPath}/admin/writeForm");
		   $("#writeFAQ").submit();
	   
})
  
    
});
</script>

</head>


<body>
	


<c:forEach items="${list}" var="list">

<div class="faq">
    <div class="faqHeader">
        <!--button type="button" class="showAll">답변 모두 여닫기</button-->
        
    </div>
    <ul class="faqBody">
        <li class="article" id="a1">
        
            <p class="q"><a href="#a1">${list.question}</a></p>           
              <p class="a"><a href="${pageContext.request.contextPath}/admin/read/${list.faqNo}">${list.answer}</a></p> 
    
        </li>
    </ul>
</div>
	
</c:forEach>


<hr>
<div align=right>
<span style="font-size:12pt;">&lt;<a href="${pageContext.request.contextPath}/admin/writeFAQ">FAQ 등록하기</a>&gt;</span></div>


</body>
</html>