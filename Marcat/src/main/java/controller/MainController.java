package controller;

import java.io.IOException;
import java.lang.reflect.Member;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.Annotation.AnnotationTargetAllowed;

import com.mysql.cj.Session;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDAO;
import dao.ProductDAO;
import vo.Product;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductDAO productDAO;
	private MemberDAO memberDAO;

	@Override
	public void init(ServletConfig config) throws ServletException {
		productDAO = new ProductDAO();
		memberDAO = new MemberDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String uri = request.getRequestURI();
		String command = uri.substring(uri.lastIndexOf("/"));
		System.out.println(command);

		String nextPage = null;

		// 세션 생성
		HttpSession session = request.getSession();
		
		 if (command.equals("/productList.do")) {// 상품 목록 페이지 요청

			ArrayList<Product> productList = (ArrayList<Product>) productDAO.getProductList();
			request.setAttribute("productList", productList);
			nextPage = "/product/productList.jsp";

		} else if (command.equals("/productInfo.do")) {// 상품 상세 보기
			String id = request.getParameter("productId");

			Product product = productDAO.getProduct(id);
			

			// 모델 생성
			request.setAttribute("product", product);

			nextPage = "/product/productInfo.jsp";
		} else if (command.equals("/productForm.do")) {// 상품 입력 폼
			nextPage = "/product/productForm.jsp";
		} else if (command.equals("/addProduct.do")) {// 상품 등록 폼

			String realFolder = "E:/NSW/green_project/JSPworks/Marcat/src/main/webapp/resource/upload";
			MultipartRequest multi = new MultipartRequest(request, realFolder, 5 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());

			// name 속성 가져오기
			String id = multi.getParameter("productId");
			String pname = multi.getParameter("pname");
			int unitPrice = Integer.parseInt(multi.getParameter("unitPrice"));
			String description = multi.getParameter("description");
			String category = multi.getParameter("category");
			String manufacturer = multi.getParameter("manufacturer");
			long unitsInStock = Long.parseLong(multi.getParameter("unitsInStock"));
			String condition = multi.getParameter("condition");

			// productImage 속성 가져오기
			String name = "";
			String productImage = "";
			Enumeration<String> files = multi.getFileNames();
			if (files.hasMoreElements()) {
				name = files.nextElement(); // 파일이 있으면 이름을 저장
				productImage = multi.getFilesystemName(name);// 이름을 매개변수로 서버에 저장된 파일 이름을 저장
			}
			Product product = new Product();
			product.setProductId(id);
			product.setPname(pname);
			product.setUnitPrice(unitPrice);
			product.setDescription(description);
			product.setCategory(category);
			product.setManufacturer(manufacturer);
			product.setUnitsInStock(unitsInStock);
			product.setCondition(condition);
			product.setProductImage(productImage);

			// DAO의 addProduct 메서드를 호출하여 상품 등록
			productDAO.addProduct(product);
			nextPage = "/productList.do";
		} // 상품 등록 폼 끝

		else if (command.equals("/editProduct.do")) { // 상품 수정

			List<Product> productList = productDAO.getProductList();

			String edit = request.getParameter("edit");

			// 모델생성
			request.setAttribute("productList", productList);
			request.setAttribute("edit", edit);

			nextPage = "/product/EditProduct.jsp";
		} // 상품 수정 끝

		else if (command.equals("/deleteProduct.do")) {// 상품 삭제
			String productId = request.getParameter("productId");
			productDAO.delectProduct(productId);
			nextPage = "editProduct.do?edit=delete";
		} // 상품 삭제 끝

		else if (command.equals("/addCart.do")) { // 카트 추가
			String id = request.getParameter("productId");

			// 상품 목록
			List<Product> godsList = productDAO.getProductList();
			Product goods = new Product();

			// 목록중에서 추가한 상품을 찾음
			for (int i = 0; i < godsList.size(); i++) {
				goods = godsList.get(i);
				if (goods.getProductId().equals(id))
					break;
			}
			// 요청 아이디의 상품을 담은 장바구니를 초기화 함
			List<Product> list = (List<Product>) session.getAttribute("cartlist");
			if (list == null) {
				list = new ArrayList<>();
				session.setAttribute("cartlist", list); // 장바구니 세션 발급
			}

			// 요청 아이디의 상품이 장바구니에 담긴 목록이면 해당 상품의 수량을 증가시킴
			int cnt = 0;
			Product goodsQnt = new Product();

			for (int i = 0; i < list.size(); i++) {
				goodsQnt = list.get(i);
				if (goodsQnt.getProductId().equals(id)) {
					cnt++; // 해당 아이디와 같은 품목이면 1증가
					int orderQuantity = goodsQnt.getQuantity() + 1; // 주문 수량 합계
					goodsQnt.setQuantity(orderQuantity);
				}
			}

			// 장바구니에 담긴 목록이 아니면 해당 상품의 수량을 1로하고, 장바구니 목록에 추가함
			if (cnt == 0) {
				goods.setQuantity(1);
				list.add(goods);
			}

		} // 카트 추가
		
		// 장바구니 페이지
		else if(command.equals("/cart.do")) { //장바구니 페이지
			//장바구니에 세션 가져오기(세션 유지)
			ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
			if(cartList == null){
				cartList = new ArrayList<>();
			}
			
			// 총합계 계산하기
			Product product = null;
			int sum = 0;
			int total = 0;
			for(int i=0; i<cartList.size(); i++){
				product = cartList.get(i);	//장바구니에 들어있는 상품
				total = product.getUnitPrice() * product.getQuantity();	//품목별 합계 = 가격 x 수량					
				sum += total;   //총액
			}
			
			
			String cartId = session.getId();  //cartId - 주문 코드로 사용
			
			//모델 생성
			request.setAttribute("cartList", cartList);
			request.setAttribute("sum", sum);
			request.setAttribute("cartId", cartId);
			
			nextPage = "/product/cart.jsp";
		}////장바구니 페이지 끝
		
		else if(command.equals("/removeCart.do")) { //장바구니의 개별 품목 삭제
			String id = request.getParameter("productId");
			
			//장바구니 가져오기(세션 유지)
			ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
			
			Product selProduct = new Product();  //삭제할 품목 선택
			for(int i=0; i<cartList.size(); i++) {
				selProduct = cartList.get(i);
				if(selProduct.getProductId().equals(id)) { //외부 입력된 상품코드와 일치하면
					cartList.remove(selProduct); //해당 품목 삭제
				}	
			}
		}
		
		else if(command.equals("/deleteCart.do")) {  //장바구니 초기화(삭제)
			//session.invalidate(); //장바구니 세션 삭제
			session.removeAttribute("cartlist");
		}
		//장바구니의 개별 품목 삭제 끝
		
		else if (command.equals("/shoppingInfo.do")) {
			String cartId = request.getParameter("cartId");
			// 모델 생성후 보내기
			request.setAttribute("cartId", cartId);
			
			nextPage = "/product/shippingInfo.jsp";
			
			
		}else if(command.equals("/processShippingInfo.do")) {
			//쿠키 발행
			Cookie shippingId = new Cookie("Shipping_cartId", 
					URLEncoder.encode(request.getParameter("cartId"), "utf-8"));  //쿠키 이름 - 주문번호
			Cookie name = new Cookie("Shipping_name", 
					URLEncoder.encode(request.getParameter("name"), "utf-8"));  //쿠키 이름 - 이름
			Cookie shippingDate = new Cookie("Shipping_shippingDate", 
					URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));  //쿠키 이름 - 배송일
			Cookie country = new Cookie("Shipping_country", 
					URLEncoder.encode(request.getParameter("country"), "utf-8"));  //쿠키 이름 - 국가
			Cookie zipCode = new Cookie("Shipping_zipCode", 
					URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));  //쿠키 이름 - 우편번호
			Cookie addressName = new Cookie("Shipping_addressName", 
					URLEncoder.encode(request.getParameter("addressName"), "utf-8"));  //쿠키 이름 - 주소
					
			//쿠키 유효기간 1일
			shippingId.setMaxAge(24*60*60);
			name.setMaxAge(24*60*60);
			shippingDate.setMaxAge(24*60*60);
			country.setMaxAge(24*60*60);
			zipCode.setMaxAge(24*60*60);
			addressName.setMaxAge(24*60*60);
			
			//클라이언트 컴으로 쿠키 보내기
			response.addCookie(shippingId);
			response.addCookie(name);
			response.addCookie(shippingDate);
			response.addCookie(country);
			response.addCookie(zipCode);
			response.addCookie(addressName);
			
			//쿠키를 받아서 사용할 변수
			//String cartId = session.getId();   //주문번호 - 세션 아이디
			String shipping_cartId = "";       //주문번호
			String shipping_name = "";         //주문자 이름
			String shipping_shippingDate = ""; //배송일
			String shipping_country = "";      //국가
			String shipping_zipCode = "";      //우편번호
			String shipping_addressName = "";  //주소
			
			Cookie[] cookies = request.getCookies(); //쿠기 받기(배열)
			
			if(cookies != null){
				for(int i=0; i<cookies.length; i++){
					Cookie cookie = cookies[i];
					String cname = cookie.getName();  //쿠키이름
					if(cname.equals("Shipping_cartId")) //쿠기이름과 같으면
						//쿠키 값을 가져옴
						shipping_cartId = URLDecoder.decode(cookie.getValue(), "utf-8");
					if(cname.equals("Shipping_name"))
						shipping_name = URLDecoder.decode(cookie.getValue(), "utf-8");
					if(cname.equals("Shipping_shippingDate"))
						shipping_shippingDate = URLDecoder.decode(cookie.getValue(), "utf-8");
					if(cname.equals("Shipping_country"))
						shipping_country = URLDecoder.decode(cookie.getValue(), "utf-8");
					if(cname.equals("Shipping_zipCode"))
						shipping_zipCode = URLDecoder.decode(cookie.getValue(), "utf-8");
					if(cname.equals("Shipping_addressName"))
						shipping_addressName = URLDecoder.decode(cookie.getValue(), "utf-8");
				}
			}
			
			String cartId = request.getParameter("cartId");
			
			//장바구니에 세션 가져오기(세션 유지)
			ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
			if(cartList == null){
				cartList = new ArrayList<>();
			}
			
			Product product = null;
			int sum = 0;
			int total = 0;
			for(int i=0; i<cartList.size(); i++){
				product = cartList.get(i);	//장바구니에 들어있는 상품
				total = product.getUnitPrice() * product.getQuantity();	//품목별 합계 = 가격 x 수량					
				sum += total;   //총액
			}
			
			//모델 - 쿠키
			request.setAttribute("shipping_name", shipping_name);
			request.setAttribute("shipping_shippingDate", shipping_shippingDate);
			request.setAttribute("shipping_zipCode", shipping_zipCode);
			request.setAttribute("shipping_addressName", shipping_addressName);
			
			//모델 - 계산
			request.setAttribute("cartList", cartList);
			request.setAttribute("sum", sum);
			request.setAttribute("cartId", cartId);
			
			nextPage = "/product/orderConfirm.jsp";
		}
		
		
		else if(command.equals("/thanksCustomer.do")) {// 배송완료
			
			String shipping_cartId = "";
			String shipping_shippingDate = "";
			
			Cookie[] cookies = request.getCookies();
			
			if(cookies != null){
				for(int i=0; i<cookies.length; i++){
					Cookie cookie = cookies[i];
					String name = cookie.getName();
					if(name.equals("Shipping_cartId"))
						shipping_cartId = URLDecoder.decode(cookie.getValue(), "utf-8");
					if(name.equals("Shipping_shippingDate"))
						shipping_shippingDate = URLDecoder.decode(cookie.getValue(), "utf-8");
				}
			}
			
			// 모델생성
			request.setAttribute("shipping_cartId", shipping_cartId);
			request.setAttribute("shipping_shippingDate", shipping_shippingDate);
			
			// 모든 세션 삭제
			session.invalidate();
			
			// 모든 쿠키 삭제
			if(cookies != null){
				for(int i=0; i<cookies.length; i++){
					Cookie cookie = cookies[i];
					String name = cookie.getName();
					if(name.equals("Shipping_cartId"))
						cookie.setMaxAge(0);
					if(name.equals("Shipping_shippingDate"))
						cookie.setMaxAge(0);
					if (name.equals("Shipping_name")) 
						cookie.setMaxAge(0);
					if (name.equals("Shipping_country")) 
						cookie.setMaxAge(0);
					if (name.equals("Shipping_zipCode")) 
						cookie.setMaxAge(0);
					if (name.equals("Shipping_addressName")) 
						cookie.setMaxAge(0);
					
					
					
				}
			}
			
			nextPage = "/product/thanksCustomer.jsp";
		}
		else if (command.equals("/checkOutCancelled.do")) {// 상품 입력 폼
			nextPage = "/product/checkOutCancel.jsp";
		}
		else if (command.equals("/updateProductForm.do")) {
			String id = request.getParameter("productId");
			
			Product product = productDAO.getProduct(id);
			
			//모델 생성
			request.setAttribute("product", product);
			
			nextPage = "/product/updateProductForm.jsp"; 
		}
		
		else if (command.equals("/updateProduct.do")) {// 상품 입력 폼

			String realFolder = "E:/NSW/green_project/JSPworks/Marcat/src/main/webapp/resource/upload";
			MultipartRequest multi = new MultipartRequest(request, realFolder, 5 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());

			// name 속성 가져오기
			String id = multi.getParameter("productId");
			String pname = multi.getParameter("pname");
			int unitPrice = Integer.parseInt(multi.getParameter("unitPrice"));
			String description = multi.getParameter("description");
			String category = multi.getParameter("category");
			String manufacturer = multi.getParameter("manufacturer");
			long unitsInStock = Long.parseLong(multi.getParameter("unitsInStock"));
			String condition = multi.getParameter("condition");

			// productImage 속성 가져오기
			String name = "";
			String productImage = "";
			Enumeration<String> files = multi.getFileNames();
			if (files.hasMoreElements()) {
				name = files.nextElement(); // 파일이 있으면 이름을 저장
				productImage = multi.getFilesystemName(name);// 이름을 매개변수로 서버에 저장된 파일 이름을 저장
			}
			Product product = new Product();
			product.setProductId(id);
			product.setPname(pname);
			product.setUnitPrice(unitPrice);
			product.setDescription(description);
			product.setCategory(category);
			product.setManufacturer(manufacturer);
			product.setUnitsInStock(unitsInStock);
			product.setCondition(condition);
			product.setProductImage(productImage);
			
			if (productImage != null) {
				productDAO.updateProduct(product);
			}else {
				productDAO.updateProduct(product);
			}

			// DAO의 addProduct 메서드를 호출하여 상품 등록
			productDAO.updateProduct(product);
			
			nextPage = "/editProduct.do?edit=update";
		}
		 
		 	//회원 Control
			if(command.equals("/memberList.do")) { //회원 목록
				List<vo.Member> memberList = memberDAO.getMemberList();
				request.setAttribute("memberList", memberList);
				nextPage = "/member/memberList.jsp";
			} else if(command.equals("/memberForm.do")) { //회원 가입 폼 요청
				nextPage = "/member/memberForm.jsp";
			} else if(command.equals("/addMember.do")) {  //회원 가입 처리
				//폼 데이터 받기  
				String mid = request.getParameter("mid");
				String passwd = request.getParameter("passwd1");
				String mname = request.getParameter("mname");
				String gender = request.getParameter("gender");
				//birth
				String year = request.getParameter("birthyy");
				String month = request.getParameterValues("birthmm")[0];
				String day = request.getParameter("birthdd");
				String birth = year + "/" + month + "/" + day;
				//email
				String email1 = request.getParameter("email1");
				String email2 = request.getParameterValues("email2")[0];
				String email = email1 + "@" + email2;
		
				String phone = request.getParameter("phone");
				String address = request.getParameter("address");
				
				vo.Member newMember = new vo.Member();  //회원 객체 생성
				newMember.setMid(mid);
				newMember.setPasswd(passwd);
				newMember.setMname(mname);
				newMember.setGender(gender);
				newMember.setBirth(birth);
				newMember.setPhone(phone);
				newMember.setEmail(email);
				newMember.setAddress(address);
				
				session.setAttribute("sessionId", mid);  //세션 발급
				memberDAO.addMember(newMember);  //회원 가입 및 자동 로그인
				
				nextPage="index.jsp";
			}else if(command.equals("/loginForm.do")) { //로그인 페이지 요청
				nextPage = "/member/loginForm.jsp";
			}else if(command.equals("/processLogin.do")) { //로그인 처리
				String mid = request.getParameter("mid");
				String passwd = request.getParameter("passwd");
				
				vo.Member member = new vo.Member();
				member.setMid(mid);
				member.setPasswd(passwd);
				
				boolean result = memberDAO.checkLogin(member);
				if(result) {
					session.setAttribute("sessionId", mid);
					nextPage = "index.jsp";
				}else {
					String error = "아이디나 비밀번호를 확인해 주세요";
					request.setAttribute("error", error);
					nextPage = "/loginForm.do";
				}
			}else if(command.equals("/logout.do")) { //로그아웃
				session.invalidate();
				nextPage = "index.jsp";
			}else if(command.equals("/memberInfo.do")) {  //나의 정보
				String mid = request.getParameter("mid");
				vo.Member member = (vo.Member) memberDAO.getMember(mid);
				request.setAttribute("member", member);
				nextPage = "/member/memberInfo.jsp";
			}else if (command.equals("/deleteMember.do")) {// 멤버 삭제
				String mid = request.getParameter("mid");
				memberDAO.delectProduct(mid);
				session.invalidate();
				nextPage="/main.jsp";
				
			}
			
			//페이지 이동 - 포워딩
			if(command.equals("/addCart.do")) {
				String id = request.getParameter("productId");
				
				response.sendRedirect("/productInfo.do?productId=" + id);  //상세 정보 페이지 이동
			}else if(command.equals("/removeCart.do") || command.equals("/deleteCart.do")) {
				response.sendRedirect("/cart.do");  //장바구니 페이지로 이동
			}else if (command.equals("deleteMember.do")) {
				response.sendRedirect("main.do");
			}
			else {
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher(nextPage);
				
				dispatcher.forward(request, response);
			}
		}
		


}
