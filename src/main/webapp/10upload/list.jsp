<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>파일목록</h2>
<!-- list : ${list }  -->

<table border="1">
    <tr>
      <th scope="col">파일번호</th>
      <th scope="col">제목</th>
      <th scope="col">아이디</th>
      <th scope="col">카테고리</th>
      <th scope="col">원본파일명</th>
      <th scope="col">저장파일명</th>
      <th scope="col">등록일</th>
    </tr>
    
	<c:forEach items="${list}" var="fileDto">
	<tr>
	    <td></td>
	    <td>${fileDto.title }</td>
	    <td>${fileDto.name }</td>
	    <td>${fileDto.cate }</td>
	    <td>${fileDto.ofile }</td>
	    <td>${fileDto.sfile }</td>
	    <td>${fileDto.postdate }</td>	    
	</tr>
	</c:forEach>

</table>
</body>
</html>