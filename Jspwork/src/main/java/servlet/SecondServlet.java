package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SecondServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("세칸도 doGet 호출");
	}

	@Override
	public void destroy() {
		System.out.println("세칸도 destroy 호출");
	}

	@Override
	public void init() throws ServletException {
		System.out.println("세칸도 init 호출");
	}
	
}
