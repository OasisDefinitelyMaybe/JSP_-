<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- id : momo pw : 1234 이면 
     loginOk로 페이지 전환
     아니면 오류 메세지를 출력 할 수 있도록 main페이지로 파라미터를 전달  -->
     
<%
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  
  if("momo".equals(id) && "1234".equals(pw)) {
	    // request영역이 공유가 되지 않음
	    // 웹브라우저로 다른 페이지를 요청할 수 있도록 처리 
	    // 2번의 요청이 발생 
	   response.sendRedirect("loginOk.jsp?id=" +  id);
  } else {
	   request.getRequestDispatcher("main.jsp?loginErr=1")
	           .forward(request, response);
	   // 1번의 요청으로 페이지를 전환하므로 request영역이 공유가 된다.
	   // RequestDispatcher d  = request.getRequestDispatcher("main.jsp");
	   // d.forward(request, response);
  }
  %>
  <h2>페이지를 전환하는 방법</h2>
<p>sendRedirect</p>
<p>forward</p>

id : <%=id %> <br>
pw : <%=pw %>
</body>
</html>