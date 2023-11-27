<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 메세지 출력후 다른 페이지를 요청하거나 뒤로가기 합니다. -->
<!-- <script type="text/javascript"> 
   alert('${msg}');
   // 만약 URL에 값이 있다면 URL요청(location.href=url)
   let url = '${url}';
   if(url != '') {
	   // url로 이동
	   location.href = url;
   } else {
	   // 뒤로가기
        history.back();   
   } -->
   
<!-- 메세지 출력후 다른 페이지를 요청하거나 뒤로가기 합니다. -->   
<script type="text/javascript">
       // 서버로부터 전달받은 메세지를 출력합니다.
       let msg = '${msg}';
       // 서버로부터 전달받은 url로 이동합니다.
       
       // 단, url이 없다면 뒤로가기를 실행합니다.
       let url = '${url}';
       if(msg != '') {
	   alert('${msg}');    	   
       }
       if(url != '') {
    	   location.href = url;
       } else {
    	   history.go(-1);
       }
	   // 웹브라우저객체 BOM - location
	   // 페이지 요청
	   // location.href='/book/list'
	   // 뒤로가기
	   // history.go(-1);
</script>
</body>
</html>