<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Team</title>
</head>
<jsp:include page="../header_footer/header.jsp"/>
<style type="text/css">

	div#div_flex1,
    div#div_flex2,
    div#div_flex3 {
    	display: none;
    }

	h1 {
		margin-top: 4vh;
		text-align: center;
	}

	ul.nav.nav-tabs {
		display: flex;
	    justify-content: space-evenly;
	    
}
	a.us {
		font-size: 1.5rem;
	    text-align: center;
	    padding: 25px 0;
	    
	}
	a.us.active {
		border: solid 3px;
		
	}
	div.tab-content {
		padding-bottom: 20px;
	}
</style>
<script type="text/javascript">
	
	$(document).ready(function(){

		$('h1').click(() => {
			$('nav').show();
			$('div.content').css('top','140px');
		});
		
		let choose_who = $('a.nav-link.us');
		choose_who = Array.from(choose_who);
		
		choose_who.forEach(function(elt, i) {
			
			elt.addEventListener('click', function(e) {
				
				$('nav').hide();
				$('div.content').css('top','35px');
				
				const id = $(e.target).attr('href');
				
				
				
				$(elt).removeClass('active');
				$(e.target).addClass('active');

				$('div.tab-pane').removeClass('active');
				$('div.tab-pane').addClass('fade');
				$('div'+id).removeClass('fade');
				$('div'+id).addClass('active');

				$('a.nav-link.us').removeClass('active');
				$('div'+id+'> a.nav-link.us').addClass('active');
				$('div'+id+'> a.nav-link.us').css('border-bottom','solid 4px white');
				
			});
		})
	})
</script>
<div class="content" style="position: relative;top: 140px;margin-top: 1vh;">
	<h1>프로젝트 회고</h1>
	
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	
	
<%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%>	
	
	
	
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