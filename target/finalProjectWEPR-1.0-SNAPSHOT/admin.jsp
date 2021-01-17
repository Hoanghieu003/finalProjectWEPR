<%-- 
    Document   : admin
    Created on : Jan 14, 2021, 9:57:53 PM
    Author     : HoangHieu
--%>
<%@page import="com.learn.finalProjectWEPR.entities.Product"%>
<%@page import="com.learn.finalProjectWEPR.dao.ProductDao"%>
<%@page import="java.util.Map"%>
<%@page import="com.learn.finalProjectWEPR.helper.Helper"%>
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

<%
    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> clist = cdao.getCategories();
    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
    List<Product> list = dao.getAllProducts();
//    geting count

    Map<String, Long> m = Helper.getCount(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
        <%@include file="components/commom_css_js.jsp" %>
        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
        <!-- Bootstrap -->
        <!--<link rel="stylesheet" href="css/bootstrap.min.css">-->

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>
        <%@include  file="components/navbar.jsp"%>
        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>Shopping Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
                        <h1><%= m.get("userCount")%></h1>
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
                        <h1><%= clist.size()%></h1>
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
                        <h1><%= m.get("productCount")%></h1>
                        <h1 class = "text-uppercase text-muted">Products</h1>
                    </div>
                </div>
            </div>

        </div>
        <!--second row-->
        <!--add category-->
        <div class = "row">
            <div class ="col-md-4">
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
            <!--add product-->
            <div class="col-md-4">
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

            <!--delete product-->
            <div class="col-md-4">
                <div class = "card " data-toggle="modal" data-target="#delete-product-modal">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style= "max-width: 125px;" class="img-fluid" src="img/add-product.png" alt="add-product-icon"/>
                        </div>
                        <p class="mt-2">Click here to delete new product</p>
                        <h1 class = "text-uppercase text-muted">Delete Product</h1>
                    </div>
                </div>
            </div>

        </div>


        <!-- Modal -->
        <!--add category modal-->

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

        <!-- Product modal-->

        <!--++++++++++++++++++++++++++++++++++++++++++++++-->

        <!-- Add Modal -->
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

                            <div class="form-group">
                                <select name="catId" class="form-control" id="">

                                    <%  for (Category c : clist) {

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

        <!-- delete product modal-->

        <!-- Modal -->
        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="classInfo" aria-hidden="true" id="delete-product-modal" >
            <div class="modal-dialog modal-lg" >
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete Product</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <!--form-->

                        <div align="center">
                            <table class="table table-bordered" border="1" cellpadding="8">
                                 <tr>
                                    <th>ID</th>
                                    <th>Title Product</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Discount</th>
                                    <th>Quantity</th>
                                    <th>Category</th>
                                    <th>Action</th>
                                </tr>  

                                <%  for (Product p : list) {

                                %>

                                <tr>                                    
                                    <td value="<%= p.getpId()%>"><%= p.getpId()%></td>
                                    <td value="<%= p.getpId()%>"><%= p.getpName()%></td>
                                    <td value="<%= p.getpId()%>"><%= p.getpDesc()%></td>
                                    <td value="<%= p.getpId()%>"><%= p.getpPrice()%></td>
                                    <td value="<%= p.getpId()%>"><%= p.getpDiscount()%></td>
                                    <td value="<%= p.getpId()%>"><%= p.getpQuantity()%></td>
                                    <td value="<%= p.getpId()%>"><%= p.getCategory()%></td>
                                    <td>
                                        <a href="ProductOperationServlet?operation=deleteproduct&pId=<%= p.getpId()%>">Delete</a>
                                    </td> 

                                </tr>


                                <%}%>    



                            </table>
                        </div> 



                    </div>
                </div>
            </div>




        </div>
        <div class="footer-top-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="footer-about-us">
                            <h2>u<span>Stora</span></h2>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                Perferendis sunt id doloribus vero quam laborum quas alias
                                dolores blanditiis iusto consequatur, modi aliquid eveniet
                                eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit,
                                debitis, quisquam. Laborum commodi veritatis magni at?
                            </p>
                            <div class="footer-social">
                                <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">User Navigation</h2>
                            <ul>
                                <li><a href="">My account</a></li>
                                <li><a href="">Order history</a></li>
                                <li><a href="">Wishlist</a></li>
                                <li><a href="">Vendor contact</a></li>
                                <li><a href="">Front page</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">Categories</h2>
                            <ul>
                                <li><a href="">Mobile Phone</a></li>
                                <li><a href="">Home accesseries</a></li>
                                <li><a href="">LED TV</a></li>
                                <li><a href="">Computer</a></li>
                                <li><a href="">Gadets</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-newsletter">
                            <h2 class="footer-wid-title">Newsletter</h2>
                            <p>
                                Sign up to our newsletter and get exclusive deals you wont find
                                anywhere else straight to your inbox!
                            </p>
                            <div class="newsletter-form">
                                <input type="email" placeholder="Type your email" />
                                <input type="submit" value="Subscribe" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="copyright">
                            <p>
                                &copy; 2015 uCommerce. All Rights Reserved.
                                <a href="http://www.freshdesignweb.com" target="_blank"
                                   >freshDesignweb.com</a
                                >
                            </p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="footer-card-icon">
                            <i class="fa fa-cc-discover"></i>
                            <i class="fa fa-cc-mastercard"></i>
                            <i class="fa fa-cc-paypal"></i>
                            <i class="fa fa-cc-visa"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include  file="components/common_modals.jsp"%>

        <!--End product modal-->
        <!-- Latest jQuery form server -->
        <script src="https://code.jquery.com/jquery.min.js"></script>

        <!-- Bootstrap JS form CDN -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <!-- jQuery sticky menu -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.sticky.js"></script>

        <!-- jQuery easing -->
        <script src="js/jquery.easing.1.3.min.js"></script>

        <!-- Main Script -->
        <script src="js/main.js"></script>

        <!-- Slider -->
        <script type="text/javascript" src="js/bxslider.min.js"></script>
        <script type="text/javascript" src="js/script.slider.js"></script>
    </body>
</html>
