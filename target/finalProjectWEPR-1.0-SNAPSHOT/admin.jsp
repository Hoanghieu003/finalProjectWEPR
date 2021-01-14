<%-- 
    Document   : admin
    Created on : Jan 14, 2021, 9:57:53 PM
    Author     : HoangHieu
--%>
<%@page import="com.learn.finalProjectWEPR.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin!! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
        <%@include file="components/commom_css_js.jsp" %>
    </head>
    <body>
        <%@include  file="components/navbar.jsp"%>
        <h1>This is admin panel page</h1>
    </body>
</html>
