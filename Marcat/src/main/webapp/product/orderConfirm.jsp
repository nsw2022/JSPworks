<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 완료!</title>


</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="container shadow-lg p-3 mb-5 bg-body-tertiary rounded my-3 bg-dark-subtle text-emphasis-dark">
		<h2 class="text-left mx-4 my-4">영수증</h2>
		<div class="row">
			<div class="col-4" align="left">
				<strong>배송 주소<br> 성명: ${shipping_name} </strong><br>
				우편번호: ${shipping_zipCode} <br>
				주소: (${shipping_addressName})
			</div>
			<div class="col-4" align="right">
				<p><em>배송일: ${shipping_shippingDate}</em>
			</div>
		</div><!-- row 닫기 -->
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<c:forEach items="${cartList}" var="product">
				<tr>
					<td class="text-center">${product.pname}</td>
					<td class="text-center">${product.quantity}</td>
					<td class="text-center"><fmt:formatNumber value="${product.unitPrice}" pattern="#,###"/></td>
					<td class="text-center"><fmt:formatNumber value="${product.unitPrice * product.quantity}" pattern="#,###"/></td>
					
				</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td></td>
					
					<td class="text-right"><strong>총액: </strong></td>
					<td class="text-center text-danger"><strong><fmt:formatNumber value="${sum}" pattern="#,###"/></strong></td>
				</tr>
			</table>
			<a href="/shippingInfo.do?cartId=" class="btn btn-secondary"> 이전 </a>
			<a href="/thanksCustomer.do" class="btn btn-success"> 주문 완료 </a>
			<a href="/checkOutCancelled.do" class="btn btn-secondary"> 취소 </a>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>