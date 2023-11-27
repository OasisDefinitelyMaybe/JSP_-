<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
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

<script type="text/javascript">
// 화면에서 동적인 처리
window.onload = function(){
	console.log('onload event ==============');
	let logoutBtn = document.querySelector("#logoutBtn");
	let loginBtn = document.querySelector("#loginBtn");
	
	if(logoutBtn != null) {
	logoutBtn.onclick = function() {
		//로그아웃
		loginForm.action = "/logout";
		loginForm.submit();
	}
}
	if(loginBtn != null){
		// 로그인페이지로 이동
		
	loginBtn.addEventListener('click', function() {
		//alert('test');
		// 같은 경로에 있는 파일을 호출했기 때문에 오류가 발생하지 않았음.
		// 하지만 루트경로가 바뀌면 오류발생
		// 본인 위치기준으로 본인 부분만 바뀌기 떄문에 경로를 찾지 못함.
		//loginForm.action = "loginForm.jsp";
		// 실제경로를 가지고 움직이기 떄문에 오류발생이 낮음
		// 여러곳에서 사용하는 경우, 경로 전체를 입력해줘야함.
		loginForm.action = "/06session/ex/servletEx/loginForm.jsp";
		loginForm.submit();
	}) ;
  }
	
	//select 요소의 옵션을 선택하는 방법
	var searchField = '${pageDto.cri.searchField }';
	console.log("searchField : ", searchField);
	
	var options = searchForm.searchField.options;
	
	// select 요소의 옵션의 selected 속성을 제거
	for(let i = 0; i < options.length; i++) {
		options[i].removeAttribute("selected");
	}
	
	// select 요소의 옵션의 selected 속성을 부여
	for(var i = 0; i< searchForm.searchField.options.length; i++) {
		console.log(searchForm.searchField.options[i].value);
		if(searchForm.searchField.options[i].value == searchField) {
			searchForm.searchField.options[i].setAttribute("selected", "selected");
		}
	}
}

// 함수는 onload 함수 외부에 작성합니다
// 입력받은 페이지 번호로 이동합니다.
  
function goPage(pageNo) {
// 파라미터로 넘어온 페이지번호를 searchForm에 pageNo에 입력 
   searchForm.action = '/boardList'
   searchForm.pageNo.value = pageNo;
   searchForm.submit();
 }
 
 /*
  상세 페이지로 이동하기
 */
function goDetail(num) {
	// 파라미터로 넘어온 페이지번호를 searchForm에 pageNo에 입력 
	/* 
	   /boardRead?num=${dto.num }
	
	*/
	   searchForm.action = '/boardRead';
	   searchForm.num.value = num;
	   searchForm.submit();
}
 
 /**
   폼을 전송(요청)합니다.
 */
 function formSubmit() {
	 //1. 폼을 선택 - 폼의 이름을 불러줍니다.
	 //2. 폼의 요소를 선택 - 폼이름.요소의이름
	 searchForm.pageNo.value = '페이지 번호';
	 // form.action = '';
	 //3. 폼 전송하기 - form의 action속성에 정의된 url을 요청합니다.
	 //             - 폼안에 요소들을 파라미터로 전달
	 
	 searchForm.submit();
	 
 }
 
</script>
<!-- 로그인 여부를 체크
	로그인을 했을때 = 세션에 userId가 저장되어 있으면
		- 로그아웃 버튼을 출력
	없으면 
		- 로그인 버튼을 출력
 -->
<!-- 

	submit : form의 요소들을 파라메터로 가지고 서버에 요청
	action : 서버에 요청할 url 주소
	method : 요청 방식
				get : 조회용 파라메터 
				post: 등록, 수정용 파라메터
				
	* 버튼 생성했더라도 form안에 버튼이 하나밖에 없다면 해당 버튼은 서브밋 버튼이 된다!!!!!
  -->
  
<%@ include file="header.jsp" %> 

<table width="90%" align="center">
    <tr>
        <td>
          
<h2>게시글 목록</h2>
<!-- 검색폼 
pageDto : ${pageDto }
<br>cri : ${pageDto.cri }
<br>pageNo : ${pageDto.cri.pageNo }
<br>searchField : ${pageDto.cri.searchField }
<br>searchWord : ${pageDto.cri.searchWord }
-->
<form name="searchForm">
pageNo : <input type="text" name="pageNo" value="${pageDto.cri.pageNo }">
num : <input type="text" name="num" value="">
<div class="input-group">
  <select class="form-select" name="searchField" id="inputGroupSelect04" aria-label="Example select with button addon">
   <!-- 선택된 요소의 value값이 서버로 넘어갑니다. -->
    <option value="title"
          ${pageDto.cri.searchField eq 'title' ? 'selected' : ''}
          >제목</option>
    <option value="id" 
          ${pageDto.cri.searchField eq 'id' ? 'selected' : ''}
          >작성자</option>
    <option value="content"
          ${pageDto.cri.searchField eq 'content' ? 'selected' : ''}
          >내용</option>
  </select>
  <input type="text" name="searchWord" value="${pageDto.cri.searchWord }" class="form-control" aria-label="Text input with dropdown button">
  <button class="btn btn-outline-secondary" type="submit">검색</button>
</div>

</form>
<br>
  <!-- 변수를 4가지 영역중 한곳에 저장 
  
<hr>
<table border=1>
     <tr>
	       <td>일련번호</td>
	       <td>제목</td>
	       <th>작성자</th>
	       <td>작성일</td>    
     </tr>  
   
 <c:forEach items="${list }" var="boardDto">
      <tr>
	       <td>${boardDto.num }</td>
	       <td>${boardDto.title }</td>
	       <th>${boardDto.id }</th>
	       <td>${boardDto.postdate }</td>    
     </tr>    
  </c:forEach>
  </table>
 <hr>
-->
<table border="1" class="table">
  <tr>
    <th>일련번호</th>
    <th>제목</th>
    <th>내용</th>
    <th>작성자</th>
    <th>작성일</th>
    <th>조회수</th>
  </tr>
<!-- 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다를 출력 -->
<!-- 만약 리스트의 사이즈가 0이 아니라면 목록을 출력 -->
    <c:if test="${empty list}" var="result">

    
    <tr><td colspan="6">조회된 데이터가 존재하지 않습니다.</td></tr>
    </c:if>
 
    <c:forEach items="${list }" var="dto">
         <tr>
         <td>${dto.num }</td>
         <td><a onclick="goDetail(${dto.num })">${dto.title }</a></td>
         <td>${dto.content }</td>
         <td>${dto.id }</td>
         <td>${dto.postdate }</td>
         <td>${dto.visitcount }</td>
         </tr>   
    </c:forEach>
 
</table>
<!-- pageNavi include -->
<%@include file="PageNavi.jsp" %>
<!-- 페이지 네비게이션 작성
     - 페이지 번호 pageNo
     - 페이지블럭당 페이지 수 ? 
         페이지블럭의 시작번호 ~ 페이지블럭의 끝번호
         
      - 총 게시물의 수  totalCnt
      - 페이지당 게시물의 수 amount
          진짜 블럭의 끝번호                 
 -->

     </td>    
    </tr>
</table>
</body>
</html>
