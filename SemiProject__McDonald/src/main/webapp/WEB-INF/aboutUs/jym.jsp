<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	table {
		border: solid 1px grey;
		margin: 0 auto;
	}
	
	table td {
		border: solid 1px grey;	
	}
	
	table td:first-child {
		background-color: #eee;
		font-size: 13pt;
		font-weight: bold;
		text-align: center;
	}
	
	span.little_subject {
		font-weight: bold;
		font-size: 12pt;		
	}
	
	span.under_line {
		text-decoration: underline;
	}

</style>
</head>
<body>
<table>
<tr>
	<td>프로젝트를 시작하기 전<br> 마음가짐</td>
	<td>
<pre>

  <span class="little_subject">미완성 걸작보단 완성된 수작 </span>
  
  저는 프로젝트 아웃풋에서 가장 중요한 것은 정해진 기간 내 완성도라
  생각하였기 때문에 적절한 규모의 사이트를 구현하는 것이 관건이라 생각했습니다.
  
  
  
  <span class="little_subject">성품도 개발의 역량 </span>
  
  또한 개개인의 개발 역량도 중요하지만 개발은 혼자하는 것이 아닌 "협업"이기에
  팀원들 개인의 생각과 상황이 나와는 다름을 인정하고 호의적인 관계를 유지하자 다짐했습니다.   

</pre>
	</td>
</tr>

<tr>
	<td>기억에 남는 순간과<br> 위기의 순간</td>
	<td>
<pre>

  <span class="little_subject">누구도 나서지 않는 일</span>
    
  이전까지는 개발은 코드만 잘 작성하면 그만이라 생각했습니다. 
  하지만 이미지나 폰트, 아이콘과 같이 코드와는 별개로 고려해야 할 요소가 있었고,
  약 100여 개에 달하는 이미지를 수집하는 것은 여간 번거로운 작업이 아닐 수 없었습니다.
  
  하지만 팀원인 "상준"님께서 본인이 자처하여 이미지 파일명까지 잘 정리하여 작업해 주신 덕분에  
  다른 팀원들이 코드에만 전념할 수 있었습니다. 
  
  자료수집은 프로젝트에서 맡은 역할로써 기재하기 애매한 부분이 있기 때문에 다들 꺼려 하는 작업임에도 불구하고,  
  자진하여 감당해 주신 모습을 보면서 팀워크가 왜 중요한지 다시 한번 상기하는 계기가 되었습니다.           



  <span class="little_subject">MultipartRequest 라는 변수</span>
  
  제품을 등록하는 페이지에서 이미지 파일을 등록처리 하기 위해 사용되는 MultipartRequest 클래스는
  MultipartRequest 의 객체를 생성할 때 이미지가 들어갈 실질적인 폴더의 경로를 명시 해야합니다. 
  여기서 문제는 프로젝트의 제품이미지는 아래와 같이 제품의 카테고리번호 별로 다른 폴더를 사용한다는 점 이었습니다.
  
  -  버거 이미지 → 카테고리 번호 &lt;1&gt;     → /images/burger/빅맥.jpg
  -  사이드메뉴 이미지 → 카테고리 번호 &lt;2&gt; → /images/side_menu/해쉬브라운.jpg  					
  					...
  -  음료 이미지 → 카테고리 번호 &lt;5&gt;     → /images/drink/빅맥.jpg
  
  MultipartRequest <strong>객체를 생성해야</strong> <span class="under_line">카테고리 번호</span>를 구할 수 있는 상황에서 <strong>객체를 생성하기 전</strong>에 <span class="under_line">카테고리 번호별</span>로  
  경로명을 구분 짓는 것은 구조적으로 불가능했습니다. 
  
  프로젝트 마감 기한이 얼마 남지 않은 상황에서 이미지 파일의 폴더 구성방식을 바꾼다는 것은 이미지의 경로와 관련된
  모든 코드를 전면 수정하고, DB에 insert 된 이미지 파일명 또한 일일이 update 해야하기 때문에 쉽지 않은 결정이었지만
  팀원들과 결단하여 수정할 부분을 분담하여 불화없이 원만하게 극복했습니다.
  
</pre>
	</td>
</tr>
<tr>
	<td>느낀점과 미래에 대한 각오</td>
	<td>
<pre>

  <span class="little_subject">일어나지 않은 일 생각치 말고</span>
  
  프로젝트를 하면서 느낀 점은 멘탈 관리가 중요하다는 것입니다. 코드를 작성하면서 "이 코드가 과연 제대로 작동할까?"
  "에러가 나면 어쩌지" 와 같이 아직 발생하지도 않은 상황에 지레 겁을 먹고 위축되어 기존에 알고 있던 것도 활용하지 
  못하는 경험을 하였습니다.
  
  이 경험들을 통해 깨달은 것은 처음부터 에러 없는 완전한 코드를 작성하려 하기보다 내가 알고 있는 모든 것을 활용하되, 
  그에 따른 오류를 해결하고자 하는 마음가짐이 더 합리적이라는 것입니다.



  <span class="little_subject">시작이 반이다</span>
  
  "시작이 반이다."라는 말은 무슨 일이든 마음먹고 처음 시작하는 것이 어렵지 끝마치기는 그리 어렵지 않다는 뜻입니다.
  프로젝트를 하면서 "추가하고 싶은 기능이 있는데 이게 가능할까?"라는 소극적인 생각에 좀 더 많은 시도를 해보지 못해 
  아쉬웠습니다. 다음 프로젝트는 시도하고 싶은 기능이 있다면 "가능할까?"라는 의문보다는 일단 코드로 옮겨서 성공한다면 추가하고
  실패한다면 탈락시키는 방법으로 프로그래밍 하고자 합니다.    
  
      




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

  다음 단계에서는 프로젝트의 페이지 구성을 "카카오 오븐"을 이용하여 대략적으로 구상하고
  프로젝트에서 사용되는 데이터베이스를 "Exerd"라는 툴을 사용하여 모델링 하였습니다.

  이후에는 깃허브 Repository 를 생성하여 Conflict 의 가능성이 있는 파일들을 git.ignore 파일에 추가하고  
  서블릿 환경을 구축한 뒤 각자 맡은 페이지를 구현하였습니다. 테스트를 위한 DB 테이블 생성 및 
  제약조건 추가, Data insert 등의 업무는 합리적인 방법을 통해 분업하였습니다.
  
  마무리 단계에서는 전반적인 css 수정과 실제로 클라이언트의 입장에서 테스트해 보는 시간과
  각자 추가하고자 하는 기능을 구현함으로 프로젝트를 마무리했습니다.      
  
</pre>
	</td>
</tr>
<tr>
	<td>프로젝트에서 맡은 역할</td>
	<td>
<pre>

  - 주문 메인 페이지
  - 관리자 (제품 목록)
  - 관리자 (제품 상세목록)
  - 관리자 (제품 등록)
  - 관리자 (제품 수정 및 삭제)
  - header, footer

</pre>
	</td>
</tr>
</table>

</body>
</html>