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
        <div class="container">
            <div class="row mt-3">
                <!--first column-->
                <div class="col-md-4">
                    <div class = "card ">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style= "max-width: 125px;" class="img-fluid" src="img/users.png" alt="user-icon"/>
                            </div>
                            <h1>1214</h1>
                            <h1 class = "text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <!--second column-->
                <div class="col-md-4">
                    <div class = "card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style= "max-width: 125px;" class="img-fluid" src="img/categories.png" alt="categories-icon"/>
                            </div>
                            <h1>4532</h1>
                            <h1 class = "text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <!--third column-->
                <div class="col-md-4">
                    <div class = "card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style= "max-width: 125px;" class="img-fluid" src="img/products.png" alt="products-icon"/>
                            </div>
                            <h1>2342</h1>
                            <h1 class = "text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>

            </div>
            <!--secon row-->
            <div class = "row">
                <div class ="col-md-6">
                    <div class = "card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style= "max-width: 125px;" class="img-fluid" src="img/add-category.png" alt="add-category-icon"/>
                            </div>
                            <p class="mt-2">Click here to add new categories</p>
                            <h1 class = "text-uppercase text-muted">Add Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class = "card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style= "max-width: 125px;" class="img-fluid" src="img/add-product.png" alt="add-product-icon"/>
                            </div>
                            <p class="mt-2">Click here to add new product</p>
                            <h1 class = "text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
