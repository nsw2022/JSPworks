<%@page import="address.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 등록</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>

<jsp:useBean id="abDAO" class="address.AddrBookDAO" scope="application"/>

<%
   // 전달된 username을 받아서 주소 1개 가져오기
   String username = request.getParameter("username");
   AddrBook aB = abDAO.getAddrBook(username);
%>

<body>
   <div id="container">
      <h1>주소록 상세보기</h1>
      <hr>
      <table id="tbl_reg">
         <tbody>
            <tr>
               <td>이름</td>
               <td><input type="text" name="username" maxlength=20 size=20 value="<%= aB.getusername() %>" readonly></td>
            </tr>
            <tr>
               <td>전화번호</td>
               <td><input type="text" name="tel" maxlength=20 size=20 value="<%= aB.getTel() %>" readonly></td>
            </tr>
            <tr>
               <td>이메일</td>
               <td><input type="text" name="email" maxlength=20 size=20 value="<%= aB.getEmail() %>" readonly></td>
            </tr>
            <tr>
               <td>성별</td>
               <td>
                  <select name="gender" disabled>
                     <option <% if(aB.getGender().equals("남")) { %> selected <% } %>>남</option>
                     <option <% if(aB.getGender().equals("여")) { %> selected <% } %>>여</option>
                  </select>
               </td>
            </tr>
            <tr>
               <td colspan="2">
                  <a href='addrList.jsp'><button type="button">목록</button></a>
               </td>
            </tr>
         </tbody>
      </table>
   </div>
</body>
</html>