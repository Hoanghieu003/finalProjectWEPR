<%-- 
    Document   : index
    Created on : Jan 13, 2021, 1:25:09 PM
    Author     : HoangHieu
--%>

<%@page import="com.learn.finalProjectWEPR.helper.Helper"%>
<%@page import="com.learn.finalProjectWEPR.entities.Category"%>
<%@page import="com.learn.finalProjectWEPR.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.finalProjectWEPR.entities.Product"%>
<%@page import="com.learn.finalProjectWEPR.dao.ProductDao"%>
<%@page import="com.learn.finalProjectWEPR.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce website</title>

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">


        <%@include file="components/commom_css_js.jsp" %>
    </head>
    <body>
        <%@include  file="components/navbar.jsp"%>
        <%            String cat = request.getParameter("category");
            //out.println(cat);

            ProductDao dao = new ProductDao(FactoryProvider.getFactory());
            List<Product> list = dao.getAllProducts();

//            if (cat == null || cat.trim().equals("all")) {
//                list = dao.getAllProducts();
//
//            } else {
//                int cid = Integer.parseInt(cat.trim());
//                list = dao.getAllProductsById(cid);
//
//            }
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cdao.getCategories();

        %>
        <div class="slider-area">
            <!-- Slider -->
            <div class="block-slider block-slider4" >
                <ul class="" id="bxslider-home4">
                    <li>
                        <img src="img/h4-slide.png" alt="Slide" />
                        <div class="caption-group">
                            <h2 class="caption title">
                                iPhone <span class="primary">6 <strong>Plus</strong></span>
                            </h2>
                            <h4 class="caption subtitle">Dual SIM</h4>
                            <a class="caption button-radius" href="#"
                               ><span class="icon"></span>Shop now</a
                            >
                        </div>
                    </li>
                    <li>
                        <img src="img/h4-slide2.png" alt="Slide" />
                        <div class="caption-group">
                            <h2 class="caption title">
                                by one, get one
                                <span class="primary">50% <strong>off</strong></span>
                            </h2>
                            <h4 class="caption subtitle">school supplies & backpacks.*</h4>
                            <a class="caption button-radius" href="#"
                               ><span class="icon"></span>Shop now</a
                            >
                        </div>
                    </li>
                    <li>
                        <img src="img/h4-slide3.png" alt="Slide" />
                        <div class="caption-group">
                            <h2 class="caption title">
                                Apple <span class="primary">Store <strong>Ipod</strong></span>
                            </h2>
                            <h4 class="caption subtitle">Select Item</h4>
                            <a class="caption button-radius" href="#"
                               ><span class="icon"></span>Shop now</a
                            >
                        </div>
                    </li>
                    <li>
                        <img src="img/h4-slide4.png" alt="Slide" />
                        <div class="caption-group">
                            <h2 class="caption title">
                                Apple <span class="primary">Store <strong>Ipod</strong></span>
                            </h2>
                            <h4 class="caption subtitle">& Phone</h4>
                            <a class="caption button-radius" href="#"
                               ><span class="icon"></span>Shop now</a
                            >
                        </div>
                    </li>
                </ul>
            </div>
            <!-- ./Slider -->
        </div>
        <!-- End slider area -->
        <div class="promo-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo1">
                            <i class="fa fa-refresh"></i>
                            <p>30 Days return</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo2">
                            <i class="fa fa-truck"></i>
                            <p>Free shipping</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo3">
                            <i class="fa fa-lock"></i>
                            <p>Secure payments</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo4">
                            <i class="fa fa-gift"></i>
                            <p>New products</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End promo area -->
        <div class="maincontent-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ">
                        <%for (Category c : clist) {
                        %>
                        <div class="latest-product">
                            <h2 class="section-title"><%= c.getCategoryTitle()%></h2>
                            <div class="row mt-4" >
                                <div class = "col-md-12">
                                    <div class="card-columns">
                                        <%
                                            List<Product> plist = dao.getAllProductsById(c.getCategoryId());

                                            for (Product p : plist) {
                                        %>

                                        <div class="card product-card">
                                            <div class="container text-center">
                                                <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt="..."/>

                                            </div>
                                            <div class="card-body">

                                                <h5 style="font-size: 15px;" class="card-title"><%= p.getpName()%></h5>

                                                <p style="font-size: 15px;" class="card-text">
                                                    <%= Helper.get10Words(p.getpDesc())%>
                                                </p>

                                            </div>
                                            <div class = "card-footer text-center">
                                                <button style="font-size: 15px;" class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterAppLyingDiscount()%>)">Add to Cart</button>
                                                <button style="font-size: 15px;" class="btn btn-outline-success"><%= p.getPriceAfterAppLyingDiscount()%>&#8363 /- <span class="text-secondary discount-label"><%= p.getpPrice()%>&#8363 , <%= p.getpDiscount()%>% off</span> </button>
                                            </div>

                                        </div>
                                        <% }

                                            if (list.size() == 0) {
                                                out.println("<h3>No item in this category</h3>");
                                            }


                                        %>
                                    </div>
                                </div>
                            </div>
                            <%                                }
                            %>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End main content area -->
        <div class="brands-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="brand-wrapper">
                            <div class="brand-list">
                                <img src="img/brand1.png" alt="" />
                                <img src="img/brand2.png" alt="" />
                                <img src="img/brand3.png" alt="" />
                                <img src="img/brand4.png" alt="" />
                                <img src="img/brand5.png" alt="" />
                                <img src="img/brand6.png" alt="" />
                                <img src="img/brand1.png" alt="" />
                                <img src="img/brand2.png" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End brands area -->
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
                <li><a href="#">My account</a></li>
                <li><a href="#">Order history</a></li>
                <li><a href="#">Wishlist</a></li>
                <li><a href="#">Vendor contact</a></li>
                <li><a href="#">Front page</a></li>
              </ul>
            </div>
          </div>

          <div class="col-md-3 col-sm-6">
            <div class="footer-menu">
              <h2 class="footer-wid-title">Categories</h2>
              <ul>
                <li><a href="#">Mobile Phone</a></li>
                <li><a href="#">Home accesseries</a></li>
                <li><a href="#">LED TV</a></li>
                <li><a href="#">Computer</a></li>
                <li><a href="#">Gadets</a></li>
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
                <form action="#">
                  <input type="email" placeholder="Type your email" />
                  <input type="submit" value="Subscribe" />
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End footer top area --> 
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
      <!-- End footer bottom area -->
    

        <%@include file="components/common_modals.jsp" %>
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
