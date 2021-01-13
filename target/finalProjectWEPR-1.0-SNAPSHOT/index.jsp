<%-- 
    Document   : index
    Created on : Jan 13, 2021, 1:25:09 PM
    Author     : HoangHieu
--%>

<%@page import="com.learn.finalProjectWEPR.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            out.print(FactoryProvider.getFactory() + "<br>");
            out.print(FactoryProvider.getFactory() + "<br>");
            out.print(FactoryProvider.getFactory());


        %>
    </body>
</html>
