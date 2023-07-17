<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
	<jsp:include page="../hearder.jsp" />
	<h2 style="margin-top: 40px;">회원 정보</h2>
	<table id="detaile">
		<tr>
			<td>
				<label>아이디</label>
			</td>
			
			<td>
				<input type="text" name="memberId" value="${member.memberId}" readonly="readonly">
			</td>
		</tr>
		
		<tr>
			<td>
				<label>비밀번호</label>
			</td>
			
			<td>
				<input type="password" name="passwd" value="${member.passwd}" readonly="readonly">
			</td>
		</tr>
		
		<tr>
			<td>
				<label>이름</label>
			</td>
			
			<td>
				<input type="text" name="name" value="${member.name}" readonly="readonly">
			</td>
		</tr>
		
		<tr>
			<td>
				<label>성별</label>
			</td>
			
			<td>
				<c:if test="${member.gender eq '남' }">
				<label>
					<input type="radio" name="gender" value="남" checked="checked">남
				</label>
				
				<label>
					<input type="radio" name="gender" value="여">여
				</label>
				
				</c:if>
					<c:if test="${member.gender eq '여' }">
						<label>
							<input type="radio" name="gender" value="남" >남
						</label>
						<label>
							<input type="radio" name="gender" value="여" checked="checked">여
						</label>
				</c:if>
			</td>
		</tr>
		<tr>
			<td><label>가입일</label></td>
			<td><input type="text" name="joinDate" value="<fmt:formatDate value="${member.joinDate}"
											pattern="yyyy-MM-dd HH:MM" />" readonly="readonly"></td>
			
		</tr>
		<tr>
			<td colspan="2" class="memberViewBtn">
				<a href="/updateMemberForm.do?memberId=${member.memberId}"
					onclick="return confirm('정말로 수정하시겠습니까?')">
					<button type="button">수정</button>
				</a>
			
				<a href="/deleteMe.do?memberId=${member.memberId }"
					onclick="return confirm('정말로 삭제하시겠습니까?')">
					<button type="button">삭제</button>
				</a>
				
				<a href="/memberList.do">
					<button type="button">목록</button>
				</a>
				
			</td>
		</tr>
	</table>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>
