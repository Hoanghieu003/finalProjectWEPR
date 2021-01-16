<%-- 
    Document   : admin
    Created on : Jan 14, 2021, 9:57:53 PM
    Author     : HoangHieu
--%>
<%@page import="java.util.List"%>
<%@page import="com.learn.finalProjectWEPR.entities.Category"%>
<%@page import="com.learn.finalProjectWEPR.dao.CategoryDao"%>
<%@page import="com.learn.finalProjectWEPR.helper.FactoryProvider"%>
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


        <div class = "container-fluid mt-3">
            <%@include file="components/message.jsp" %>
        </div>

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
        <!--second row-->
        <div class = "row">
            <div class ="col-md-6">
                <div class = "card" data-toggle="modal" data-target="#add-category-modal">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style= "max-width: 125px;" class="img-fluid" src="img/add-category.png" alt="add-category-icon"/>
                        </div>
                        <p class="mt-2">Click here to add new categories</p>
                        <h1 class = "text-uppercase text-muted">Add Categories</h1>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class = "card " data-toggle="modal" data-target="#add-product-modal">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style= "max-width: 125px;" class="img-fluid" src="img/add-product.png" alt="add-product-icon"/>
                        </div>
                        <p class="mt-2">Click here to add new product</p>
                        <h1 class = "text-uppercase text-muted">Add Product</h1>
                    </div>
                </div>
            </div>
        </div>

        <!--add category modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">
                                <input type ="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 300px" class="form-control" placeholder="Enter Category Description" name = "catDescription" required></textarea>

                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <!--End add category modal-->



        <!--product modal-->

        <!--++++++++++++++++++++++++++++++++++++++++++++++-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--form-->
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct"/>
                            
                            
                            <!--product title-->
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required= />                                      
                            </div>
                            <!--product description-->
                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>
                            </div>
                            <!--product price-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required= />                                      
                            </div>

                            <!--product discount-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required= />                                      
                            </div>

                            <!--product quantity-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required= />                                      
                            </div>

                            <!--product category-->
                            <%                                
                                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();
                            %>

                            <div class="form-group">
                                <select name="catId" class="form-control" id="">

                                    <%                                        
                                            for (Category c : list) {

                                    %>

                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <%}%>
                                </select>


                            </div>


                            <!--product file-->

                            <div class="form-group">
                                <labbel for="pPic">Select Picture product</labbel>
                                <br>
                                <input type="file" name="pPic" required />
                            </div>

                            <!--submit button-->
                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add product</button>
                            </div>


                        </form>





                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>




        <%@include  file="components/common_modals.jsp"%>

        <!--End product modal-->
    </body>
</html>
