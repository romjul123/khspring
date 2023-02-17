<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<style>
			h1 { text-align : center; }
			ul { list-style-type : none;}
			#navigator {
				margin : 0;
				padding : 0;
				height : 100px;
			}
			#navigator .item {
				float : left;
				width : 25%;
				text-align : center;
				line-height : 50px;
				background-color : #ccc;
				margin-top : 20px;
			}
			#login-wrapper {
				--display : flex;
				--justify-content : end;
				width : 250px;
				margin-left : auto;
			}
			
			#login-area {
				margin : 0;
				padding : 0;
			}
			#login-area .login-item {
				margin : 10px 0px;
			}
			#login-area .login-item label {
				width : 50px;
				text-align : left;
				float : left;
			}
			#login-btn {
				text-align : center;
			}
			a { display : block;}
			a:link, a:visited {
				text-decoration : none;
				color : black;
			}
			a:hover {
				cursor : pointer;
				background : #000;
				color : #fff;
			}
		</style>
	</head>
	<body>
		<h1>
			Welcome to Spring Web!  
		</h1>
<!--  	 리다이렉트 용으로 사용 가능(jsp 포워드로 사용)  -->	
		<c:if test="${sessionScope.loginUser eq null }">
			<div id="login-wrapper">
				<form action="/member/login.do" method="post">
					<ul id="login-area">
						<li class="login-item">
							<label>ID :</label>
							<input type="text" name="member-id">
						</li>
						<li class="login-item">
							<label>PW :</label>
							<input type="password" name="member-pw">
						</li>
					</ul>
					<div id="login-btn">
						<input type="submit" value="로그인">
						<input type="reset" value="취소">
					</div>
				</form>
			</div>
		</c:if>
		<c:if test="${sessionScope.loginUser ne null }">
			${sessionScope.loginUser.memberName } 님 환영합니다.
			<a href="/member/logout.do">로그아웃</a>
		</c:if>
		<ul id="navigator">
			<li class="item"><a href="javascript:void(0)" onclick="goHome();">Home</a></li>
			<li class="item"><a href="javascript:void(0)" onclick="goNoticeList();">공지사항</a></li>
			<li class="item"><a href="#">자유게시판</a></li>
			<li class="item"><a href="#">관리자페이지</a></li>
		</ul>
		<script>
			function goHome() {
				location.href = "/home.do";
			}
			function goNoticeList() {
//				event.preventDefault();
				location.href = "/notice/list.do";
				return false;
			}
		</script>
	</body>
</html>
