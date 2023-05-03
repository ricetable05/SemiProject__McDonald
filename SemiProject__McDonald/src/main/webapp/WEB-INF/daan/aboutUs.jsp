<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Team</title>
<style type="text/css">
	ul.nav.nav-tabs {
		display: flex;
	    justify-content: space-evenly;
}
</style>
</head>
<jsp:include page="../header_footer/header.jsp"/>

<script type="text/javascript">
	
	$(document).ready(function(){

		let choose_who = $('a.nav-link.us');
		choose_who = Array.from(choose_who);
		
		choose_who.forEach(function(elt, i) {
			
			elt.addEventListener('click', function(e) {
				
				const id = $(e.target).attr('href');
				
				$(elt).removeClass('active');
				$(e.target).addClass('active');

				$('div.tab-pane').removeClass('active');
				$('div.tab-pane').addClass('fade');
				$('div'+id).removeClass('fade');
				$('div'+id).addClass('active');

				$('a.nav-link.us').removeClass('active');
				$('div'+id+'> a.nav-link.us').addClass('active');
			});
		})
	})
</script>
<div style="position: relative;top: 140px;margin-top: 1vh;">
	<h1 style="margin-top: 4vh;">About Us</h1>
	
<ul class="nav nav-tabs mt-5">
    <li class="nav-item-about us">
        <a class="nav-link us" data-toggle="tab" href="#PSJ">박상준</a>
    </li>
    <li class="nav-item-about us">
        <a class="nav-link us" data-toggle="tab" href="#LD">이단</a>
    </li>
    <li class="nav-item-about us">
        <a class="nav-link us" data-toggle="tab" href="#WJY">원준영</a>
    </li>
    <li class="nav-item-about us">
        <a class="nav-link us" data-toggle="tab" href="#JJH">장주형</a>
    </li>
    <li class="nav-item-about us">
        <a class="nav-link us" data-toggle="tab" href="#JYM">전영민</a>
    </li>
</ul>

<%-- 	

		#### README ####

		/WEB-INF/aboutUs 경로 내에 각 팀원분들 jsp 파일 생성했습니다.
		
		소개할 내용에 대해 각자 자유롭게 작성하시면 됩니다.

 --%>

<div class="tab-content py-3">
    <div class="tab-pane container" id="PSJ">
        <jsp:include page="../aboutUs/psj.jsp"/>
    </div>
    <div class="tab-pane container" id="LD">
        <jsp:include page="../aboutUs/ld.jsp"/>
    </div>
    <div class="tab-pane container" id="WJY">
        <jsp:include page="../aboutUs/wjy.jsp"/>
    </div>
    <div class="tab-pane container" id="JJH">
        <jsp:include page="../aboutUs/jjh.jsp"/>
    </div>
    <div class="tab-pane container" id="JYM">
        <jsp:include page="../aboutUs/jym.jsp"/>
    </div>
</div>
</div>
</html>