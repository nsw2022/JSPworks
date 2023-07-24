<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>


<script type="text/javascript">
    function addToCart() {
        if (confirm('상품을 장바구니에 추가하시겠습니까?')) {
            document.addForm.submit();
        } else {
            document.addForm.reset();
        }
    }
</script>
</head>
<body>
    <jsp:include page="../header.jsp" />
    <div class="container my-3">
        <h2 class="text-left mx-4 my-4">상품 목록 페이지</h2>
        <div class="row mx-5" align="center">
            <div class="col-5">
                <img alt="노트북" src="../resource/upload/${product.productImage}" style="width: 100%;">
            </div>
            <!--왼쪽의 이미지 col-6-->
            <div class="col-6">
                <h3>${product.pname}</h3>
                <p>${product.description}</p>
                <p>
                    <b>상품 코드:</b> <span class="badge bg-dark">${product.productId}</span>
                </p>
                <p>
                    <b>제조사:</b> ${product.manufacturer}
                </p>
                <p>
                    <b>분류:</b> ${product.category}
                </p>
                <p>
                    <b>재고수:</b> ${product.unitsInStock}
                </p>
                
                <p><fmt:formatNumber value="${product.unitPrice}" pattern="#,###"/>원</p>
      
             		 	<form action="/addCart.do?productId=${product.productId}" 
					 			method="post" name="addForm">
					 		<a href="#" onclick="addToCart()" class="btn btn-info">상품 주문 &raquo; </a>
					 		<a href="/cart.do" class="btn btn-warning">장바구니 &raquo;</a>
							<a href="/productList.do"
						      class="btn btn-secondary">상품 목록 &raquo;</a>
						</form>
         
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
</body>
</html>
