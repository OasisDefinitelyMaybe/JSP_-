package com.momo.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.dao.BookDao;
import com.momo.lib.dto.BookDto;

/**
 * Servlet implementation class BookViewController
 */
@WebServlet("/book/view")
public class BookViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 도서정보를 조회 후 request영역에 저장하고 view.jsp 이동합니다.
     */
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도저정보를 조회후 request영역에 저장
		BookDao dao = new BookDao();		
		BookDto dto = dao.view(request.getParameter("no"));
	    request.setAttribute("bookDto", dto);
	    
	    // 자원반납
	    dao.close();
	    
	    // book.view.jsp 페이지 전환
		request.getRequestDispatcher("/book/view.jsp")
		                        .forward(request, response);

	}

}
