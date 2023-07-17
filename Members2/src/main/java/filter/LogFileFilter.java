package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter{
	
	PrintWriter writer;

	// 로그 파일 설정	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String filename = filterConfig.getInitParameter("filename");
		if (filename == null) {
			throw new ServletException("로그파일의 이름을 찾을 수 있습니다."); // 강제로 예외 발생
		}
		
		try {
			writer = new PrintWriter(new FileWriter(filename, true), true);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServletException("로그파일을 열수가 없습니다."); 
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 로그파일의 기록 내용
		// 콘솔 로그 파일의 기록 내용
		String clientAddr = request.getRemoteAddr(); // IP 주소
		writer.println("클라이언트 IP 주소: " + clientAddr + "\n");
		System.out.println("클라이언트 IP 주소: " + clientAddr + "\n");
		
		long start = System.currentTimeMillis();
		writer.println("접근한 url 경로" + getURLpath(request));
		writer.println("요청 처리 시작 시간 \" + getCurrentTime()");
		
		System.out.println("접근한 url 경로" + getURLpath(request));
		System.out.println("요청 처리 시작 시간 " + getCurrentTime());
		
		
		
		long end = System.currentTimeMillis();
		System.out.println("요청 처리 종료 시간 " + getCurrentTime());
		System.out.println("소요시간"+(end-start));
		System.out.println("==========================================");
		
		writer.println("요청 처리 종료 시간 " + getCurrentTime());
		writer.println("소요시간"+(end-start));
		writer.println("==========================================");
		
		
		chain.doFilter(request, response);// 필터 처리
	}
		
	// 현재 날짜와 시간
	private String getCurrentTime() {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter datetime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		return now.format(datetime);
	}
	
	@Override
	public void destroy() {
		writer.close();
	}
	
	private String getURLpath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath = "";
		String queryString = "";
		
		if (request instanceof HttpServletRequest) {
			req = (HttpServletRequest) request; // 다운 캐스팅
			currentPath = req.getRequestURI(); // uri
			queryString = req.getQueryString(); // ? 쿼리스트링
			queryString = queryString == null ? "" : "?" + queryString;
			
		}
		return currentPath + queryString;	
	}
		
}
