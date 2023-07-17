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
		String clientAddr = request.getRemoteAddr(); // IP 주소
		writer.printf("클라이언트 IP 주소 %s %n", clientAddr);
		
		String contentType = response.getContentType(); // 컨텐츠 유형
		writer.printf("콘텐츠 유형 %s %n", contentType);
		
		writer.printf("현재 일시 %s %n", getCurrentTime()); // 현재 날짜와 시간
		
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

}
