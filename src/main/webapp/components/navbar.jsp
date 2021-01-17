
<%@page import="com.learn.finalProjectWEPR.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");

%>
<!-- Google Fonts -->
<link
    href="http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600"
    rel="stylesheet"
    type="text/css"
    />
<link
    href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300"
    rel="stylesheet"
    type="text/css"
    />
<link
    href="http://fonts.googleapis.com/css?family=Raleway:400,100"
    rel="stylesheet"
    type="text/css"
    />

<!-- Bootstrap -->
<link rel="stylesheet" href="../css/bootstrap.min.css" />

<!-- Font Awesome -->
<link rel="stylesheet" href="../css/font-awesome.min.css" />

<!-- Custom CSS -->
<link rel="stylesheet" href="../css/owl.carousel.css" />
<link rel="stylesheet" href="../style.css" />
<link rel="stylesheet" href="../css/responsive.css" />

<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="user-menu">
                    <ul>
                        <li>
                            <a href="#"><i class="fa fa-user"></i> My Account</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-heart"></i> Wishlist</a>
                        </li>                        
                        <li>
                            <a href="checkout.jsp"
                               ><i class="fa fa-user"></i> Checkout</a
                            >
                        </li>
                        <%   if (user1 == null) {
                        %>
                        <li>
                            <a href="login.jsp"><i class="fa fa-user"></i> Login</a>
                        </li>
                        <li>
                            <a href="register.jsp"><i class="fa fa-user"></i>Register</a>
                        </li>
                        <%
                        } else {
                        %>

                        <li>
                            <a href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "index.jsp"%>"><i class="fa fa-user"></i><%=user1.getUserName()%></a>
                        </li>

                        <%
                            }
                        %>

                        <li class="nav-item active">
                            <a class="nav-link" href="LogoutServlet">Logout </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="header-right">

                </div>
            </div>
        </div>
    </div>
</div>
<!-- End header area -->
<div class="site-branding-area">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="logo">
                    <h1>
                        <a href="index.jsp"><img src="img/logo.png" /></a>
                    </h1>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="shopping-item">
                    <a href="#" data-toggle="modal" data-target="#cart"
                       >Cart
                        <i class="fa fa-shopping-cart"></i>    
                        <span  class="ml-0 cart-items">(0)</span></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End site branding area -->
<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-header">
                <button
                    type="button"
                    class="navbar-toggle"
                    data-toggle="collapse"
                    data-target=".navbar-collapse"
                    >
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav" style="display: inline;" >
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li><a href="index.jsp">Shop page</a></li>
                    <li><a href="#">Single product</a></li>
                    <li><a href="#">Cart</a></li>
                    <li><a href="checkout.jsp">Checkout</a></li>
                    <li><a href="#">Category</a></li>
                    <li><a href="#">Others</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End mainmenu area -->
<!-- Latest jQuery form server -->
        <script src="https://code.jquery.com/jquery.min.js"></script>

        <!-- Bootstrap JS form CDN -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <!-- jQuery sticky menu -->
        <script src="../js/owl.carousel.min.js"></script>
        <script src="../js/jquery.sticky.js"></script>

        <!-- jQuery easing -->
        <script src="../js/jquery.easing.1.3.min.js"></script>

        <!-- Main Script -->
        <script src="../js/main.js"></script>

        <!-- Slider -->
        <script type="text/javascript" src="../js/bxslider.min.js"></script>
        <script type="text/javascript" src="../js/script.slider.js"></script>