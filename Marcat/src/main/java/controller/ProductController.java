package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.Annotation.AnnotationTargetAllowed;

import com.mysql.cj.Session;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import product.Product;
import product.ProductDAO;

@WebServlet("*.do")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductDAO productDAO;

	@Override
	public void init(ServletConfig config) throws ServletException {
		productDAO = new ProductDAO();
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
			session.invalidate(); //장바구니 세션 삭제
		}
		//장바구니의 개별 품목 삭제 끝
		
		// 페이지 포워딩
		if (command.equals("/addCart.do")) {
			String id = request.getParameter("productId");
			response.sendRedirect("/productInfo.do?productId=" + id);  //상세 정보 페이지 이동
		}else if (command.equals("/removeCart.do") || command.equals("/deleteCart.do")) {
			response.sendRedirect("/cart.do");  //장바구니 페이지로 이동
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);			
		}
	}

}
