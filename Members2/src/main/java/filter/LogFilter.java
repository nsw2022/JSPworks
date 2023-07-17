package filter;

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

public class LogFilter implements Filter{
	
	PrintWriter writer;

	// 로그 파일 설정	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("로그필터 초기화");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 콘솔 로그 파일의 기록 내용
		String clientAddr = request.getRemoteAddr(); // IP 주소
		System.out.println("클라이언트 IP 주소: " + clientAddr + "\n");
		
		long start = System.currentTimeMillis();
		System.out.println("접근한 url 경로" + getURLpath(request));
		System.out.println("요청 처리 시작 시간 " + getCurrentTime());
		
		long end = System.currentTimeMillis();
		System.out.println("요청 처리 종료 시간 " + getCurrentTime());
		System.out.println("소요시간"+(end-start));
		System.out.println("==========================================");
		
		chain.doFilter(request, response);// 필터 처리
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

	// 현재 날짜와 시간
	private String getCurrentTime() {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter datetime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		return now.format(datetime);
	}
	
	@Override
	public void destroy() {
		System.out.println("로그필터 해제");
		writer.close();
	}

}
