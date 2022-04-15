# jsp_login #jdbc #eclipes #java #html #css #javascript #servlet #mvc1
<h3> jsp 로 만들어본 간단한 로그인 구현 </h3>


<p align="center">
<img src="https://user-images.githubusercontent.com/103496262/163549112-ff4f4ff9-a2e1-4b62-bef9-3687842165e8.gif" width="400px" height="390px">
</p>


연습용이므로, 중요도가 높은 jsp 와 db 사이의 데이터통신과 데이터처리 로직에 초점을 맞춘다. 

기본적으로 웹브라우저에서 보이는 화면, 그 화면을 제어하는 컨트롤러, 데이터베이스와 연결하는 비즈니스, 그리고 정보가 들어갈 데이터베이스가 있어야 한다.

1. 화면

(1) src/main/webapp/WEB-INF/view/ 밑에 화면들이 들어간다.

(2) 화면의 종류는 모두 6개다.

boardList.jsp 

boardDetail.jsp

boardCreate.jsp

boardModify.jsp

boardLogin.jsp

boardSignin.jsp

(3) boardList.jsp는 게시판 목록을 뿌려준다.

(4) boardDetail.jsp는 게시글의 내용 등, 세부 사항을 보여준다. 로그인한 사용자의 권한을 체크해서 만일 글 작성자라면 삭제, 수정이 가능하다.

(5) boardCreate.jsp는 새로운 글 등록 화면이다.

(6) boardModify.jsp는 기존의 글을 수정하는 화면이다.

(7) boardLogin.jsp는 로그인 화면이다.

(8) boardSignin.jsp는 아이디 등을 입력 받아 회원 가입을 진행한다.

















