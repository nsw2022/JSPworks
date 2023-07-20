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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String uri = request.getRequestURI();
		String command = uri.substring(uri.lastIndexOf("/"));
		System.out.println(command);
		
		String nextPage = null;
		
		if (command.equals("/productList.do")) {//상품 목록 페이지 요청
			
			ArrayList<Product> productList = (ArrayList<Product>) productDAO.getProductList();
			request.setAttribute("productList", productList);
			nextPage = "/product/productList.jsp";
			
		}else if (command.equals("/productInfo.do")) {// 상품 상세 보기
			String id = request.getParameter("productId");
			
			Product product = productDAO.getProduct(id);
			
			// 모델 생성 
			request.setAttribute("product", product);
			
			nextPage = "/product/productInfo.jsp";
		}else if (command.equals("/productForm.do")) {// 상품 입력 폼
			nextPage = "/product/productForm.jsp";
		}else if (command.equals("/addProduct.do")) {// 상품 등록 폼
			 
			
			String realFolder = "E:/NSW/green_project/JSPworks/Marcat/src/main/webapp/resource/upload";
			MultipartRequest multi = 
			new MultipartRequest(request, realFolder, 5*1024*1024, "utf-8",new DefaultFileRenamePolicy());
			
			// name 속성 가져오기
			String id = multi.getParameter("productId");
			String pname = multi.getParameter("pname");
			int unitPrice = Integer.parseInt(multi.getParameter("unitPrice"));
			String description = multi.getParameter("description");
			String category = multi.getParameter("category");
			String manufacturer = multi.getParameter("manufacturer");
			long unitsInStock = Long.parseLong(multi.getParameter("unitsInStock"));
			String condition = multi.getParameter("condition");
			
			//productImage 속성 가져오기
			String name="";
			String productImage = "" ;
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
		}// 상품 등록 폼 끝
		
		else if (command.equals("/editProduct.do")) { // 상품 수정
			
			List<Product> productList = productDAO.getProductList();
			
			String edit = request.getParameter("edit");
			
			// 모델생성
			request.setAttribute("productList", productList);
			request.setAttribute("edit", edit);
			
			nextPage = "/product/EditProduct.jsp";
		}// 상품 수정 끝
		
		else if (command.equals("/deleteProduct.do")) {// 상품 삭제
			String productId = request.getParameter("productId");
			productDAO.delectProduct(productId);
			nextPage = "editProduct.do?edit=delete";
		}// 상품 삭제 끝
		
		
		// 페이지 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

}
