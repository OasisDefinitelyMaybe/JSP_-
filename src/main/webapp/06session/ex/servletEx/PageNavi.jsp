<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
    function goPage(pageNo) {
    	searchForm.pageNo.value = pageNo
        searchForm.submit();	
    }
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<%-- <%
    PageDto pageDto = null;
   // Controller에서 request영역에 저장한 pageDto를 화면에서 사용할수 있도록 변수에 저장
	if(request.getAttribute("pageDto") != null 
			&& !"".equals(request.getAttribute("pageDto"))){
		pageDto = (PageDto)request.getAttribute("pageDto");
	} else {
		// 게시글의 총건수를 넣어 페이지 네비게이션을 생성합니다.
		pageDto = new PageDto(150, new Criteria());
	}
%> --%>
</head>
<body>
<br>
<!--
페이지 블럭을 출력하는 방법
   1. 요청 컨트롤러에서 pageDto를 request영역에 저장 
   2. pageNavi.jsp를 include 해야함
      - 리스트 페이지의 페이지블럭을 출력하고 싶은 위치에
   3. searchForm을 생성한다.
        pageNo 요소가 있어야함.
   -->
   

<!-- 페이지네이션 -->
<nav aria-label="...">
  <ul class="pagination" justify-content-center">  
    <!-- 앞으로 가기 버튼 시작 disabled : 비활성화 -->
    <li class="page-item ${pageDto.prev ? '' :  'disabled' }">
      <a class="page-link" onclick="goPage(${pageDto.startNo -1 })">Previous</a>
   
    </li>
    <!--  앞으로가기 버튼 끝 -->
    <c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
         <li class="page-item">
              <a class="page-link ${pageDto.cri.pageNo eq i ? 'active' : '' } "                        
                  onclick="goPage(${i})"
                   > 
                   ${i}  </a>
          </li>   
    </c:forEach>
    
<%--    <%for(int i = pageDto.getStartNo(); i <= pageDto.getEndNo(); i++) {%> 
       <li class="page-item">
          <!-- href="..." 링크로 이동할 경우, 검색어가 유지되지 않습니다. -->
          <!-- 검색어를 유지하기 위해 searchForm을 전송하는 goPage 함수를 생성했습니다. -->
          <!-- 링크를 함수호출로 변경 onClick이벤트가 발생하면 goPage() 함수를 호출합니다. 
                  함수의 파라미터로 페이지번호를 넣어주어야 합니다.
           -->
         <a class="page-link" <%= pageDto.getCri().getPageNo() == i ? "active" : "" %>"                           
                onclick="goPage(<%=i %>)"
                > 
                <%=i %>  </a>
          </li>
    <% }%> 
 --%>
        
    
    <!-- 뒤로가기 버튼 시작 -->
    <li class="page-item ${pageDto.next ? '' :  'disabled' }">
      <a class="page-link" onclick="goPage(${pageDto.endNo+1})">Next</a>
     </li>
     <!-- 뒤로가기 버튼 끝 --> 
  </ul>
</nav>

<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>


<!-- active : 현재 페이지 번호 활성화 
    <li class="page-item active" aria-current="page">
      <a class="page-link" href="#">2</a>
    </li>
    
    <li class="page-item">
        <a class="page-link" href="#">3</a>
    </li>
-->
 <!--   
	   int totalCnt = 160;
	   Criteria cri = new Criteria();  // pageNo =1, amount = 10
	   cri.setPageNo(13);
	   
   int pageNo = 12;
   int startNo = 11;
   int endNo = 15;

   boolean prev = (startNo==1)? false : true;
   boolean next = true; 
   -->
  