<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정보 상세</title>
	</head>
	<body>
		<jsp:include page="../common/menuBar.jsp"></jsp:include>
		ID : ${member.memberId } <br> NAME : ${member.memberName } <br> EMAIL : ${member.memberEmail } <br> 
		PHONE : ${member.memberPhone } <br> ADDRESS : ${member.memberAddr} <br>
		가입날짜 : ${member.enrollDate} <br> 수정날짜 : ${member.updateDate }
	</body>
</html>