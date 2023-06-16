package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

@WebServlet("/checkid")
public class CheckId extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = utf-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("memberId");
		MemberDAO memberDAO = new MemberDAO();
		boolean duplicatedID = memberDAO.checkId(id);
		System.out.println(duplicatedID);
		
		if (duplicatedID == true) {
			out.println("not_useable");
			
		}else {
			out.println("usable");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
