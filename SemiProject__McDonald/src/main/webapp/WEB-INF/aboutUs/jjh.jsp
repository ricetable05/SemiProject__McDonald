<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/mainPage.css">    
   
<style type="text/css">
	
	div#container{
		font-family:SpeedeeK;
		margin: 20px auto; /* 상 하는 20px 우 좌는 남은 20%에서 좌우로 균등하게 주겠다. 즉, 화면의 가운데로 위치하겠다는 말이다.*/
	
	}
	
	div#side{
		border-radius: 50px / 50px;
		border: 1.7px solid #ffbc0d;
		width: 29%;
	}	
	
	div#contents{
		border-radius: 50px / 50px;
		border: 1.7px solid #ffbc0d;
		position: relative;
		width: 69.22%;
		left: 30%;
		bottom: 450px; 
		height: 460px;
	}	
	
</style>   
   
    
<body>
	<div id="container">
		<div id="side">
		  <h2 style="text-align: center; font-weight:600; margin: 10px 0 20px 0;">내가 구현한 기능</h2>
		  <ol>
		  	<li style="margin-bottom: 12px;">회원가입</li>
		  	<li style="margin-bottom: 12px;">로그인</li>
		  	<li style="margin-bottom: 12px;">나의 정보 수정</li>
		  	<li style="margin-bottom: 12px;">회원탈퇴</li>
		  	<li style="margin-bottom: 12px;">아이디찾기</li>
		  	<li style="margin-bottom: 12px;">비밀번호찾기</li>
		  	<li style="margin-bottom: 12px;">1년 동안 로그인하지 않을 시 <br> 계정 잠금/해제</li>
		  	<li style="margin-bottom: 12px;">3개월 동안 비밀번호 변경하지 않을 시 <br> 비밀번호 변경 페이지로 이동</li>
		  	<li style="margin-bottom: 12px;">관리자 페이지 회원목록</li>
		  </ol>
		</div>
		
		<div id="contents" class="customDisplay">
		  <h2 style="text-align: center; font-weight:600; margin: 10px 0 50px 0;">소감문</h2>
		  <P>프로젝트 작업을 하면서 좋았던 점은 토의하면서 서로 다른 이견들을 조율하여 타협점을 찾는 점이 좋았습니다. 왜냐하면 벤치마킹 사이트를 정할 때
			 각자 자신이 하고 싶은 운동화, 안경, 옷 등 여러 가지 예비 벤치마킹사이트가 나왔으나 수업 때 배운 내용에 초점을 두어 토의를 하니 맥도날드 사이트가 적절하다고 판단을 하게 되었습니다.
			 또한, 아르바이트하였던 맥도날드에 조장이 되어 사이트를 만들게 되니 더욱더 열심히 하였습니다. </p>
		  
		  <p>힘들었던 점은 깃을 프로젝트에 연동하여 .ignore 처리를 할 때 무조건 #.project와 .classpath를 무조건 .ignore 처리 해야 하는 것으로 착각하여 깃에서 이클립스로 프로젝트 import가 되지 않아 4시간 동안 고민에 빠졌습니다.
			 하지만 팀원과 같이 의사소통하면서 문제가 무엇인지 발견하고 해결할 수 있었습니다. </p>	
			
		  <P>프로젝트에서는 약 1달 동안 수업 때 배운 MVC(Model, View, Controller) 패턴을 적용 및 활용하였습니다.
		     집에서 복습할 때는 분명히 이해가 됐다고 생각했던 부분이 실제로 적용을 해보니 `내가 부분적으로 이해를 잘못하였구나` 깨달았고,
		  	 내 마음대로 되지 않아 속상했지만, 시간이 지나갈수록 점점 실력이 향상하는 것을 느끼니 더욱더 열심히 하였습니다.</P>	
		</div>
	</div>
</body>    