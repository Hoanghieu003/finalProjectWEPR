<%-- 
    Document   : index
    Created on : Jan 13, 2021, 1:25:09 PM
    Author     : HoangHieu
--%>

<%@page import="com.learn.finalProjectWEPR.entities.Category"%>
<%@page import="com.learn.finalProjectWEPR.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.finalProjectWEPR.entities.Product"%>
<%@page import="com.learn.finalProjectWEPR.dao.ProductDao"%>
<%@page import="com.learn.finalProjectWEPR.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart-Home</title>

        <%@include file="components/commom_css_js.jsp"%>

    </head>
    <body>
        <%@include  file="components/navbar.jsp"%>

        <div class="row mt-3">


            <%                
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = pdao.getAllProducts();
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist=cdao.getCategories();
            
            
            %>



            <!--show categories-->
            <div class="col-md-2 mx-2">
                <h1><%= clist.size() %></h1>
                <% 
                
                for(Category c:clist){
                    
                    out.println(c.getCategoryTitle()+"<br>");
                }
                
                %>
                
            </div>

            <!--show products-->
            <div class="col-md-8">
                <h1>Number of products is <%= list.size()%></h1>

                <% 
                    for(Product product:list){
                        out.println(product.getpPhoto()+"<br>");
                        out.println(product.getpName()+"<br><br>");
                        
                        
                        
                    }
                %>
            </div>

        </div>
    </body>
</html>
