package product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//Product를 관리할 클래스(DAO)
public class ProductService {
	// 자료구조(Data Structure - collection)
	Map<String, Product> products = new HashMap<>();
	
	// 생성자 상품생성
	public ProductService() {
		Product p1 = new Product("p-11", "Galaxy 21", "샘송",
				1_000_000, "2023-03-16");
		Product p2 = new Product("p-12", "LG Gram", "에르쥐",
				1_500_000, "2023-04-16");
		Product p3 = new Product("p-13", "iPhone", "애쁠",
				1_200_000, "2023-04-16");
		// 회원을 생성 후 저장
		products.put("p-11", p1);
		products.put("p-12", p2);
		products.put("p-13", p3);
	}
	
	// 상품 목록 보기
	public List<Product> getProductList() {
		return new ArrayList<>(products.values());
	}
	
	// 상품 1개 보기(상세 보기)
	public Product getProduct(String pid) {
		return products.get(pid);
	}
	
}
