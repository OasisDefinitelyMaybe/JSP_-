<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 등록</title>
</head>
<style type="text/css">
    .w-10 {width : 10%}    
    .w-15 {width : 15%; justify-content: center;}
    .w-20 {width : 20%}
</style>

<body>
<script type="text/javascript">
    window.onload = function() {
    	
    	// regBtm 요소에 이벤트를 추가 합니다. (아이디로 접근하는 방법)
    	regBtn.addEventListener('click', function() {
    		// form요소의 이름으로 접근하여 폼을 전송합니다. (새로운 페이지 요청)
    		// 등록 처리를 하고 결과페이지를 출력 합니다.
    		regForm.submit();
    	})
    }
</script>
<!-- 도서 등록 화면  -->

<%@ include file="/header.jsp" %>

<!-- 메인컨텐츠 영역 시작-->
<div class="container-fluid">
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
         <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">도서목록</h6>
         </div>
         <div class="card-body">
             <!-- 등록폼 -->
             <form action="/book/bookRegProcess" name="regForm" method="post">
                   
                   <div class="input-group mb-3">
					  <span class="w-15 input-group-text" id="basic-addon1">도서명</span>
					  <!-- 서버에 값을 넘길 요소 -->
					  <input type="text" class="form-control" name="title" aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3">
					  <span class="w-15 input-group-text" id="basic-addon1">작가명</span>
					  <input type="text" class="form-control" name="author" aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3">
					  <span class="w-15 input-group-text" id="basic-addon1">도서소개</span>
					  <input type="text" class="form-control" name="content" aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3">
					  <span class="w-15 input-group-text" id="basic-addon1">표지이미지</span>
				   <input type="file" class="form-control" id="inputGroupFile01" name="imgFile">
					  
					</div>        
                   <p><button type="button" class="btn btn-dark" id="regBtn">도서등록</button></p>
                           
             </form>
            </div>
      </div>
</div>
     
<!-- 메인컨텐츠 영역 끝-->

<%@ include file="/footer.jsp" %>
</body>
</html>