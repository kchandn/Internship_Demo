<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.ConnectDB"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
    <head>
        <title>Klook</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/jquery-ui.css">

        <link rel="stylesheet" href="css/style.css">

    </head>
    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

        
        <%
      	  Connection connection=ConnectDB.connect();
          PreparedStatement ps=connection.prepareStatement("select * from user where email=?");
          ps.setString(1, (String)session.getAttribute("USERNAME"));
          ResultSet rs=ps.executeQuery();
        	while(rs.next()){%>
                
                
                
        <div class="site-wrap">

            <div class="site-mobile-menu site-navbar-target">
                <div class="site-mobile-menu-header">
                    <div class="site-mobile-menu-close mt-3">
                        <span class="icon-close2 js-menu-toggle"></span>
                    </div>
                </div>
                <div class="site-mobile-menu-body"></div>
            </div>


            <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">

                <div class="container">
                    <div class="row align-items-center">

                        <div class="col-6 col-xl-2">
                            <h1 class="mb-0 site-logo"><a href="index.html" class="h2 mb-0">Klook<span class="text-primary">.</span> </a></h1>
                        </div>

                        <div class="col-12 col-md-10 d-none d-xl-block">
                            <nav class="site-navigation position-relative text-right" role="navigation">

                                <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                                    <li><a href="index.jsp" class="nav-link">Home</a></li>
                                    <li><a href="#" class="nav-link">About Us</a></li>
                                    <li><a href="#" class="nav-link">Contact</a></li>
                                    <li><a href="#" class="nav-link">Cart</a></li>
                                    <li><a href="#" class="nav-link">Recently Viewed</a></li>
                                    <li><a href="#" class="nav-link active">Log In</a></li>
                                    <li><a href="signup.jsp" class="nav-link">Sign Up</a></li>
                                </ul>
                            </nav>
                        </div>


                        <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-black float-right"><span class="icon-menu h3"></span></a></div>

                    </div>
                </div>

            </header>



            <div class="site-blocks-cover overlay" style="background-image: url(images/white.jpg);" data-aos="fade">
                <div class="container">
                    <div class="row align-items-center justify-content-center">


                        <form class="form container-fluid" action="submitdetail" method="post">
                            <div class="form-inline">
                                <label class="control-label col-sm-2" for="title">Title:</label>
                                <div class="col-sm-2">
                                    <select class="form-control" name="title">
                                        <option>Select an Option</option>
                                        <option value="Mr.">Mr.</option>
                                        <option value="Miss.">Miss.</option>
                                        <option value="Mrs.">Mrs.</option>
                                    </select>
                                </div>
                                <label class="control-label col-sm-2" for="fname">F Name:</label>
                                <div class="col-sm-2">          
                                    <input type="text" class="form-control" id="fname" placeholder="Enter First Name" name="fname">
                                </div>
                                <label class="control-label col-sm-2" for="lname">L Name:</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" id="lname" placeholder="Enter Last Name" name="lname">
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-6" for="country">Country:</label>
                                    <input type="text" class="form-control col-sm-6" id="country" placeholder="Enter Country" name="country">
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="ccode">C Code:</label>
                                    <input type="text" class="form-control col-sm-8" id="ccode" placeholder="Enter Country Code" name="ccode">
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="mobile">Mobile No:</label>
                                    <input type="text" maxlength="10" size="10" class="form-control col-sm-8" id="mobile" placeholder="Enter Phone" name="mobile">
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="email">Email</label>
                                    <input type="text" class="form-control col-sm-8" id="email" name="email" value="<%=rs.getString(1)%>" readonly="readonly">
                                </div>
                                <div class="form-group">        
                                    <div class="col-sm-offset-2 col-sm-6">
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    </div>
                                </div>
                                <div class="form-group">        
                                    <div class="col-sm-offset-2 col-sm-6">
                                        <button type="reset" class="btn btn-default">Reset</button>
                                    </div>
                                </div>
                        </form>
					<%} %>
                    </div>
                </div>
            </div>  






            <footer class="site-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-5">
                                    <h2 class="footer-heading mb-4">About Us</h2>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque facere laudantium magnam voluptatum autem. Amet aliquid nesciunt veritatis aliquam.</p>
                                </div>
                                <div class="col-md-3 ml-auto">
                                    <h2 class="footer-heading mb-4">Quick Links</h2>
                                    <ul class="list-unstyled">
                                        <li><a href="#">About Us</a></li>
                                        <li><a href="#">Log In</a></li>
                                        <li><a href="signup.jsp">Sign Up</a></li>
                                        <li><a href="#">Contact Us</a></li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-4">
                                <h2 class="footer-heading mb-4">Subscribe Newsletter</h2>
                                <form action="#" method="post" class="footer-subscribe">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control border-secondary text-white bg-transparent" placeholder="Enter Email" aria-label="Enter Email" aria-describedby="button-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary text-black" type="button" id="button-addon2">Send</button>
                                        </div>
                                    </div>
                                </form>  
                            </div>

                            <div class="">
                                <h2 class="footer-heading mb-4">Follow Us</h2>
                                <a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
                                <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
                                <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
                                <a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
                            </div>


                        </div>
                    </div>
                    <div class="row pt-5 mt-5 text-center">
                        <div class="col-md-12">
                            <div class="border-top pt-5">
                                <p>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved |
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
            </footer>

        </div> <!-- .site-wrap -->

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.fancybox.min.js"></script>
        <script src="js/jquery.sticky.js"></script>


        <script src="js/main.js"></script>

    </body>
</html>