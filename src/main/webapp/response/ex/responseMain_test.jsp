<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인</h1>
<%
   String loginErr = request.getParameter("loginErr");
   String id = "momo";
   if(request.getParameter("id") !=null) {
	   id = request.getParameter("id");
   }
%>
<%= "1".equals(loginErr) ? "아이디 비밀번호를 확인해주세요" : "" %>
<form action="./login.jsp" method="post">
  
  아이디 :<input type="text" name="id" value="<%=id%>"><br>
  비밀번호 :<input type="password" name="pw" value="1234"><br>

       성별 : <input type="radio" name="sex" value="man">
             <input type="radio" name="sex" value="woman" checked="checked">
       <br>      
       관심사항 :<input type="checkbox" name="favo" value="eco">경제
              <input type="checkbox" name="favo" value="pol">정치
              <input type="checkbox" name="favo" value="ent">연예
       <br>
       
  <input type="submit" value="로그인">
 
</form>
</body>
</html>