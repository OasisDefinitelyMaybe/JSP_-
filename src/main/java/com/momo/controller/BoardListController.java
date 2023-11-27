package com.momo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDao;
import com.momo.dto.BoardDto;
import com.momo.dto.Criteria;
import com.momo.dto.PageDto;

@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("검색어" + request.getParameter("searchWord"));
		System.out.println("검색필드" + request.getParameter("searchField"));
		
		// 리스트를 조회하기 위한 파라미터 수집
		Criteria cri = new Criteria(request.getParameter("pageNo")
				                    , request.getParameter("amount")
				                    , request.getParameter("searchField")
				                    , request.getParameter("searchWord"));
		
//		// 페이지 조회에 필요한 정보를 수집합니다.
//		// pageNo : 요청 페이지 번호
//		// amount : 페이지당 게시물의 수
//		int pageNo =1;
//		int amount = 10;
//		
//		if(request.getParameter("pageNo") != null
//				  && !"".equals(request.getParameter("pageNo"))) {
//			// 숫자로 변환후 저장
//			pageNo = Integer.parseInt(request.getParameter("pageNo"));
//		}
//		if(request.getParameter("amount") != null
//				&& !"".equals(request.getParameter("amount"))) {
//			// 숫자로 변환후 저장
//			amount = Integer.parseInt(request.getParameter("amount"));
//		}
//		System.out.println("pageNo = " + pageNo);
//	    System.out.println("amount = " + amount);
//		
//	       시작번호와 끝번호를 계산
//	       int endNum = pageNo * amount;
//	       int startNum = endNum - (amount-1);
//		
//	       request.setAttribute("list", dao.getList(startNum, endNum));
//		

	      // 리스트 조회후 리퀘스트 영역에 저장
		  BoardDao dao = new BoardDao();
		  List<BoardDto> list = dao.getList(cri);		  
		  // request영역에 저장 -> 화면까지 데이터를 유지하기 위해서
		  request.setAttribute("list", dao.getList(cri));
		 
		  // 페이지 블럭을 생성하기 위해 필요한 정보를 저장
		  // totalCnt : 총 게시물의 수
		  // 조회조건을 세팅하지 않으면 조회되는 게시글의 건수와 페이지블럭이 다르게 표시될 수 있다.
		  int totalCnt = dao.getTotalCnt(cri);
		  PageDto pageDto = new PageDto(totalCnt, cri);		
		  request.setAttribute("pageDto", pageDto);
		  
		  // 자원반납
		   dao.close();
			
		  //페이지 전환
		  // forward방식으로 전환하므로 request영역이 공유됨.
		  request.getRequestDispatcher("/06session/ex/servletEx/board.jsp").forward(request, response);
	
	}

}






