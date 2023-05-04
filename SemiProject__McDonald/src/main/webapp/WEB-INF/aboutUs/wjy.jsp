  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/mainPage.css">    
   
<style type="text/css">
   
   div#container{
      font-family:SpeedeeK;
      margin: 20px auto; /* 상 하는 20px 우 좌는 남은 20%에서 좌우로 균등하게 주겠다. 즉, 화면의 가운데로 위치하겠다는 말이다.*/
      height: 700px;
   
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
      bottom: 700px;
   }   
   
   div.customDisplay{
      height: 700px;
   }
   
   div#contents p {
   
   	line-height: 40px;
   
   }
   
</style>   
   
    
<body>
   <div id="container">
      <div id="side" class="customDisplay">
        <h2 style="text-align: center; font-weight:600; margin: 20px 0 20px 0;">내가 구현한 기능</h2>
        <ol>
           <li style="margin-bottom: 12px; ">제품 정보 테이블 생성</li>
           <li style="margin-bottom: 12px; ">메뉴 상세 페이지 </li>
           <li style="margin-bottom: 12px; ">맥도날드 품질 이야기</li>

           
        </ol>
      </div>
      
      <div id="contents" class="customDisplay">
        <h2 style="text-align: center; font-weight:600; margin-top: 20px;">소감문</h2>
        <P> 안녕하세요 이번 세미프로젝트_맥도날드 제품상세 를 맡은 원준영입니다. <br>
				보시는 바와 같이 저희 팀 맥도날드는 맥도날드 홈페이지를 참고하여 세미프로젝트를 진행하였습니다.<br>
				프로젝트를 진행하는 과정에서 가장 기억나는 점은 하나의 완성물을 만들기 위해 정말 많은 노력이 들어간다는 것입니다.<br> 
				우리가 맡았던 프로젝트의 제 파트를 완성하였었지만 해당 작업물에서 여러 문제점을 발견하여 여러 번의 오류를 수정하고 완성도를 높이기 위해 <br>
				여러가지 수정을 하였는데, 떄문에 프로젝트를 진행했을 당시에는 정말 쉽지 않았었습니다.<br>				
				특히 제 파트에서 진행을 해야 했었던 이전 이후 페이지로 넘어가는 버튼을 수정하면서 lag lead를 사용한 DAO에서  AJAX로 관련 키값을 가져오는 과정을 거치게 되었는데,<br>
				정말 어려웟었던 부분이었지만, 제품 등록과 삭제를 하여도 문제없이 작동할 수 있게끔 조원의 도움과 함께 완성할 수 있어서 정말 뿌듯하였으며 제 실력도 올라갔다는 생각이 들었습니다.<br>
				이번 프로젝트는 제가 몰랐던 부분에 대해서 제대로 숙지를 할 수 있게 되었었으며 또한 다같이 프로젝트 작업을 진행하면서 저 혼자 공부를 하거나 작업을 하던 때와는 다르게 같이 작업을 한다는 것이 무엇인지를 다시 한번 느끼게 되었습니다. <br>
				기존에 편하게 보던 여러 웹 화면들이 정말 많은 노력을 기울여 만들어진 것이라는 생각을 하면서, 웹프로그래밍에 대해 더욱 흥미를 가질 수 있던 시간이었습니다.</P>
      </div>
   </div>
</body>    
    