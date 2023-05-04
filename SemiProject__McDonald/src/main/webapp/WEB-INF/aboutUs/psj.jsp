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
   
   @font-face {
  font-family:SpeedeeK;
  font-weight:400;
  font-style:normal;
  src:  url(../css/font/Speedee_K_L.woff) format('woff')}
	@font-face {
	  font-family:SpeedeeK;
	  font-weight:500;
	  font-style:normal;
	 
	  src: url(../css/font/Speedee_K_R.woff) format('woff')}
	@font-face {
	  font-family:SpeedeeK;
	  font-weight:600;
	  font-style:normal;
	  src: url(../css/font/Speedee_K_B.woff) format('woff')} 
	  
	  td{
	  	font-family:SpeedeeK;
	  	font-weight:600;
	  	font-style:normal;
	  }
	  
	   table {
      border: solid 1px grey;
      margin: 0 auto;
   }
   
   table td {
      border: solid 1px grey;   
   }
   
   table td:first-child {
      background-color: #eee;
      font-size: 15pt;
      font-weight: bold;
      text-align: center;
   }
  

table > tbody > tr > td:nth-child(2) > pre {
	font-size: 13pt;
	font-family:SpeedeeK;
	  	font-weight:500;
	  	font-style:normal;

}
	  
   
</style>   
   
    
<body>
 <table>
				<tr>
				   <td>프로젝트에서 맡은 역할</td>
				   <td>
<pre>

- 메인 메뉴 페이지
- 버거, 맥모닝, 사이드등 
- 메인 프로모션 페이지
- 프로모션 상세페이지
- 관리자 (전체주문내역)
- 관리자 (상세주문내역)
- 관리자 (배송완료처리에대한아이디어)
- 프로젝트내에서 사용할 이미지 추합 및 파일명수정
- 프로잭트내에서 사용할 폰트

</pre>
				   </td>
				</tr>
				<tr>
				   <td>프로젝트 진행</td>
				   <td>
<pre>
  본 프로젝트는 "Spring" 을 사용하기 전까지의 사전 지식을 학습한 상황에서 이루어졌습니다.
  저희 팀은 첫 번째로 벤치마킹할 사이트를 탐색했습니다. 다양한 안건이 제시되고 팀원들과 원만한 
  협의의 결과로 주제는 "맥도날드"로 결정되었습니다.

  다음 단계는 프로젝트의 페이지 구성을 "카카오 오븐"을 이용하여 대략적으로 구상하고
  프로젝트에서 사용되는 데이터베이스를 "Exerd"라는 툴을 사용하여 모델링 하였습니다.

  이후에는 깃허브 Repository 를 생성하여 Conflict 의 가능성이 있는 파일들을 ignore 하고
  서블릿 환경을 구축한 뒤 각자 맡은 페이지를 구현하였습니다. 테스트를 위한 DB 테이블 생성 및 
  제약조건 추가, Data insert 등의 업무는 합리적인 방법을 통해 분업하였습니다.
  
  마무리 단계에서는 전반적인 css 수정과 실제로 클라이언트의 입장에서 테스트해 보는 시간과
  각자 추가하고자 하는 기능을 구현함으로 프로젝트를 마무리했습니다.      
</pre>
				   </td>
				</tr>
				<tr>
				   <td>페이지별 <br> 사용한 기능</td>
				   <td>
<pre>
    메인 메뉴 페이지 - ajax를 이용해 우리가DB에 등록시켰던 카테고리별로 DB에서 가지고와 메뉴 하나하나당 card로 만듬
    프로모션 페이지 - 프로모션 상세페이지 중 동영상이 필요한 페이지에 연결
    주문내역 페이지 - DB에 있는 주문테이블을 불러와서 주문메인페이지를 구성 뼈대는 회원목록 테이블과 같다. 
    관리자로 로그인했을때 추가되는 기능을 로그인 세션을 통해 조절하였음.
</pre>
				   </td>
				</tr>
				<tr>
				   <td>페이지별<br>아쉬운점</td>
				   <td>
<pre>
    메인 메뉴 페이지 - 현재는 카테고리별 JSP, Action.java를 각각 만들었으나 프로젝트를 진행해가면서 
		하나의 JSP파일로 통합할 수 있지 않았을까 라는 생각이듬.
    프로모션 페이지  - 처음에 맡았던 부분이 아니라 전체적으로 아쉬움이 남는 페이지 메인 메뉴 페이지에서 생각했던 걸 해볼까?라는 생각은 했지만,
           	프로모션에서 쓰는 이미지, 정보 등을 DB에 저장을 안 해놔서 따로따로 작업을 한 점이 아쉬웠음.
    주문내용 페이지 - DB에서 JOIN 구문을 했을 때 내가 원하는 대로 출력이 돼서 그대로 DAO에 SQL 문을 썼지만 계속 일식 오류가 나옴,
			그래서 VO를 여러 번 수정하고 SQL 문도 바꾸고 GPT에도 물어봤지만 해결되지 않아 3일을 날려버림
</pre>
				   </td>
				</tr>
				<tr>
				   <td>팀프로젝트 느낀점</td>
				   <td>
<pre>
    이번 세미프로젝트팀 맥도날드를 지난 한 달간 활동하며 많은 것을 보고 느꼈습니다.
    팀 프로젝트를 가장 중요한 게 실력이라고 생각했었습니다.
    하지만 이번  프로젝트를 하면서 생각이 바뀌었고 중요한 건 바로 팀원과의 호흡, 그리고 열정입니다.
    이번 프로젝트팀을 하면서 저는 실력이 부족한 측에 속해있었습니다.  그렇지만 저는 열정은 넘쳤고,
    서양학 선생님께 배운 것을 활용하고 싶어 기억을 되짚어갔지만 가끔 기억이 제대로 나지 않아 활용을 못 했습니다.
    하지만 이때 팀원 전영민과 팀원 이단에게 물어보면 두 분은 본인 꺼 하기도 바쁠 텐데 적극적으로 제가 쓴 코드를 보며
    제대로 활용하는 법을 알려주고 원하는 기능이 있으나 감을 못 잡을 때 질문을 하면 힌트를 주며 저 스스로 방향을 찾도록 도와주었습니다.
    이처럼 한 명 한 명 열정이 없었고 본인 꺼 하기 바빠 팀원들과 소통을 하지 않았다면 이번 프로젝트는 중간마다 잡음이 생기며
    프로젝트를 마무리를 제 시간에 못했을 것입니다.
</pre>
				   </td>
				</tr>
				</table>
</body>    


<p style="font-size: 13pt;">
</p>



  

