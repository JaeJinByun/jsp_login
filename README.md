    

# jsp_login
<h3> jsp 로 만들어본 간단한 로그인 구현 </h3>


<p align="center">
<img src="https://user-images.githubusercontent.com/103496262/163549112-ff4f4ff9-a2e1-4b62-bef9-3687842165e8.gif">
</p>

<div align=center> 
   	<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
   	<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
	<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
 	<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
	<img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
	<img src="https://img.shields.io/badge/eclipse-IDE-F7DF1E?style=for-the-badge&logo=eclipse&logoColor=black">
	
</div>
<br><br>

<div align=center> 
연습용이므로, 중요도가 높은 jsp 와 db 사이의 데이터통신과 데이터처리 로직에 초점을 맞춘다.

기본적으로 웹브라우저에서 보이는 화면, 그 화면을 제어하는 컨트롤러,<br>
데이터베이스와 연결하는 비즈니스, 그리고 정보가 들어갈 데이터베이스가 있어야 한다.
</div>

#
**1.) 화면(View)**

	1.1)화면의 종류는 6개다.

	Main.jsp       : 로그인 화면
	modifyForm.jsp : 수정하기 위한 비밀번호 재확인 화면
	modifyView.jsp : 개인정보 수정 화면
	deleteForm.jsp : 아이디 삭제전 비밀번호 재확인 화면  
	InputForm.jsp  : 회원정보 입력 화면
	loginForm.jsp  : 회원가입후 로그인창 

**2.) 컨트롤러(Controller)**

	2.1) 컨트롤러의 종류는 5개다.
	
	loginPro.jsp	: 로그인 프로세스
	inputPro.jsp	: 회원가입 프로세스
	deletePro.jsp	: 아이디삭제 프로세스
	modifyPro.jsp	: 아이디 수정 프로세스

**3.) 모델(Model)**

	3.1) 모델은 DB와 소통하는 DAO, DTO다.
	(jsp_login/JSP_login_form/src/main/java/login)
	LoginDBBean.java   : DAO의 역활을 수행한다. DB에 접속
	LogonDataBean.java : Data 이동을 위한 바구니역활






#
**페이지 이동 흐름도** 
```

`-- jsp_login/JSP_login_form/src/main/webapp
	`-- member
	    `-- Main.jsp 
	        |-- loginPro.jsp			[로그인버튼클릭시]
	        |   `-- action      			[수정버튼,삭제버튼,로그아웃버튼]
	        |      |-- modifyForm.jsp		[비밀번호확인창]
	        |      |   `-- modifyView.java		[수정화면]
		|	   |	   `-- modifyPro.java <--->  DB [수정처리]        
	        |      	   |-- deleteForm.jsp 
		|	   |   `-- deletePro.jsp <---> DB [삭제처리]
	        |          |-- logout.jsp
	        |              `-- Main.jsp 		[로그인화면]
	        |              
	        |-- InputForm.jsp 			회원가입 화면]
	        |   `-- inputPro.jsp <----> DB 		[가입처리]
	        |     `-- confirmid.jsp			[아이디중복확인화면]
		| 
	 	|-- setting.jsp 			[전역변수 저장소]
	        |-- style_member.css			[view style]
	        |-- script.js				[event method]


