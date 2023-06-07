package redirects;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestGood
 */
@WebServlet("/TestGood")
public class TestGood extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void destroy() {
		System.out.println("주금");
	}

	
	@Override
	public void init() throws ServletException {
		System.out.println("인잇");
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("두겟등장?");
	}

}
