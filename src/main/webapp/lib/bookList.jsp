<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- header 외부파일 인클루드 -->
<%@ include file="common/header.jsp" %>

<!-- 도서목록을 출력합니다. -->
<br>${list }
<!-- footer 외부파일 인클루드 -->
<%@ include file="common/footer.jsp" %>


</body>
</html>