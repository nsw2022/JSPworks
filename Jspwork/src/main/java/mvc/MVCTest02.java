package mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest02 extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 짝수 홀수 판정 결과 - jsp 보내기
		
		int num = 0;
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		String result = "";
		if (num % 2 == 0) {
			result = "짝수랄까?";
		}else {
			result = "홀수입니다만?";
		}
		
		request.setAttribute("result", result);
		
		//포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/mvc/mvc02.jsp");
		dispatcher.forward(request, response);
		
	}
	

	
}
