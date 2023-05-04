<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<br>
<h2> '팀' 에 대한 회고</h2>

<div>
	<ul>
		<li style="padding-top:20px;">
			<h3 style="margin-bottom:0;"> 병렬 처리의 효율성 </h3><br>
			<div style="font-size: larger;">
				<p>
				각 팀원이 웹페이지의 메인, 제품 소개, 관리자 및 회원 그리고 주문 등의 부분을 담당.<br>
				계획했던 레이아웃, 페이지 내 기능, DB와의 연결 등은 대부분 성공적으로 구현.<br><br>
				
				개인 프로젝트로 진행했다면 기간 내 완성하지 못했을 것.<br>
				+ 다양한 시각을 반영하지 못해 만듦새 또한 만족스럽지 못했을 가능성 큼.&ensp;(특히 페이지 구성)
				</p>
			</div>
		</li>
		<li>
			<h3 style="margin-bottom:0;"> 오답노트 </h3><br>
			<div style="font-size: larger;">
				<p>
				내가 잘못 알고 있던 개념에 대해 바로잡을 수 있었음.<br>
				<br>
				(예시)<br>
				&emsp;HTTP 메소드들은 기능 상 서로 비슷할 수 있지만, 상이한 부분이 분명하게 존재.<br>
				&emsp;이에 따라 일반적인 상황들을 구분해, 각 상활별로 어떠한 메소드를 사용할 지 일종의 약속이 존재.<br>
				&emsp;ex. 제품 카테고리 조회 요청(GET), 신규 회원가입(POST).<br>
				<br>
				&emsp;프로젝트 진행 중반에<br>
				&emsp;클라이언트에서 서버로 요청할 때,<br>
				&emsp;GET 또는 POST 메소드를 일일이 정하지 않고 컨트롤러에서 메소드로 처리하면 되지 않을까?'<br>
				&emsp;ex. 개인정보수정 페이지 : Get 방식 form 전송 요청 →<br>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;컨트롤러 : 로그인유무 확인 & 수정하려는 정보의 회원과 로그인한 회원 일치여부 확인<br>
				<br>
				라는 미숙한 생각했음.<br><br>
				
				<2줄요약><br>
				문제 : HTTP 메소드에 대한 이해가 부족<br>
				해결 : 팀원과의 대화를 통해 개념 확립<br>
				
				</p>
			</div>
		</li>
	</ul>
</div>
<br>
<hr style="border-width: thick;">
<br>
<h2> '나' 에 대한 회고</h2>

<div>
	<ul>
		<li style="padding-top:20px;">
			<h3 style="margin-bottom:0;"> 집중이 아닌 매몰 </h3><br>
			<div style="font-size: larger;">
				<p>
				전체 프로젝트에 대해 내가 맡은 부분이 최소한 감점 요소가 되고 싶지 않았음.<br><br>
				
				그 결과 맡은 역할에만 매몰되어 있던 경향이 있었음.<br>
				그 결과 협업에 충분히 기여하지 못했음.<br>
				그런데 '협업' 프로젝트 하는 중임.<br><br>
				
				결론: 문제가 있었음.<br>
				</p>
			</div>
		</li>
		<li>
			<h3 style="margin-bottom:0;"> sum(최선) != 최선</h3>
			<h5 style="margin-bottom:0; padding-top:5px; color:blue;">부제: 큰그림 그려야 함</h5><br>
			<div style="font-size: larger;">
				<p>
				
				최선의 정의.<br>
				1.	가장 좋고 훌륭함. 또는 그런 일.<br>
				2.	온 정성과 힘.<br><br>
				
				sum(최선 1) != 최선 1<br>
				장바구니 데이터는 업데이트가 빈번, 처리 요청이 아니라고 생각해 서버에 부담을 주지 않는 sessionStorage를 사용.<br>
				DB 상 테이블을 빈번하게 생성/수정/삭제 하지 않아 좋은 방식이라 생각.<br><br>
				
				단점<br>
				클라이언트의 javaScript를 통해서만 접근가능하기 때문에 기능 확장,<br>
				가령 클라이언트가 어떤 제품에 관심이 많은지 등의 정보를 알 수 없음.<br>
				새 탭 페이지, 또는 다른 기기에서 접근 시 장바구니를 불러올 수 없음.<br><br>
				
				<hr style="border-width: 0.2rem;">
				
				sum(최선 2) != 최선 1<br>
				계획 : 기능 구현을 빠르게 성공 → 코드를 변동사항에 맞게 유연하게 수정<br><br>
				
				결과<br>
				API(HTTP API)를 충분히, 적절하게 계획하지 않아 끊임없이 수정중&ensp;(feat. 최종Push&ensp;진짜최종Push&ensp;FINALPUSH)<br>
				ex. 코드 블록 완전히 수정. 제각각의 논리 흐름을 가지는 if문 수정.
				</p>
			</div>
		</li>
	</ul>
</div>


</body>
</html>