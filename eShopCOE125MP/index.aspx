<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="eShopCOE125MP.index" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Cool World | Home</title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,500,700,800' rel='stylesheet' type='text/css'>

    <!-- Bootstrap and Font Awesome css -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Css animations  -->
    <link href="css/animate.css" rel="stylesheet">

    <!-- Theme stylesheet, if possible do not edit this stylesheet -->
    <link href="css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- Custom stylesheet - for your changes -->
    <link href="css/custom.css" rel="stylesheet">

    <!-- Responsivity for older IE -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

    <!-- Favicon and apple touch icons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png" />
    <link rel="apple-touch-icon" sizes="57x57" href="img/apple-touch-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="img/apple-touch-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="img/apple-touch-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="img/apple-touch-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="img/apple-touch-icon-152x152.png" />
</head>

<body>
    <form runat="server">

        <div id="all">
            <header>

                <!-- *** TOP ***
_________________________________________________________ -->
                <div id="top">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-5 contact">
                                <p class="hidden-sm hidden-xs"></p>
                                <p class="hidden-md hidden-lg">
                                    <a href="#" data-animate-hover="pulse"><i class="fa fa-phone"></i></a><a href="#" data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
                                </p>
                            </div>
                            <div class="col-xs-7">
                                <%--  <div class="social">
                                    <a href="#" class="external facebook" data-animate-hover="pulse"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="external gplus" data-animate-hover="pulse"><i class="fa fa-google-plus"></i></a>
                                    <a href="#" class="external twitter" data-animate-hover="pulse"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="email" data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
                                </div>--%>

                                <div class="login">
                                    <%--<a href="customer-register.html"><i class="fa fa-user"></i><span class="hidden-xs text-uppercase">Login</span></a>--%>
                                    <asp:Label runat="server" ID="lblHello" Visible="false"></asp:Label><asp:LinkButton runat="server" Text="Login" ID="lnkLogin" OnClick="lnkLogin_Click"></asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- *** TOP END *** -->

                <!-- *** NAVBAR ***
    _________________________________________________________ -->

                <div class="navbar-affixed-top" data-spy="affix" data-offset-top="200">

                    <div class="navbar navbar-default yamm" role="navigation" id="navbar">

                        <div class="container">
                            <div class="navbar-header">

                                <%--  <a class="navbar-brand home" href="index.html">
                                <img src="img/logo.png" alt="Universal logo" class="hidden-xs hidden-sm">
                                <img src="img/logo-small.png" alt="Universal logo" class="visible-xs visible-sm"><span class="sr-only">Universal - go to homepage</span>
                            </a>--%>
                                <div class="navbar-buttons">
                                    <button type="button" class="navbar-toggle btn-template-main" data-toggle="collapse" data-target="#navigation">
                                        <span class="sr-only">Toggle navigation</span>
                                        <i class="fa fa-align-justify"></i>
                                    </button>
                                </div>
                            </div>
                            <!--/.navbar-header -->

                            <div class="navbar-collapse collapse" id="navigation">

                                <ul class="nav navbar-nav navbar-right">
                                    <li class="dropdown active">
                                        <a href="index.aspx" class="dropdown">Home </a>
                                    </li>
                                    <li class="dropdown use-yamm yamm-fw">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <div class="yamm-content">
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <img src="img/template-easy-customize.png" class="img-responsive hidden-xs" alt="">
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <a href="categ.aspx?main=laptop">
                                                                <h5>Laptop</h5>
                                                            </a>
                                                            <ul>
                                                                <li><a href="categ.aspx?main=laptop&sub=dell">Dell</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=laptop&sub=hp">HP</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=laptop&sub=lenovo">Lenovo</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=laptop&sub=msi">MSI</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=laptop&sub=acer">Acer</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=laptop&sub=asus">Asus</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <a href="categ.aspx?main=desktop">
                                                                <h5>Desktop</h5>
                                                            </a>
                                                            <ul>
                                                                <li><a href="categ.aspx?main=desktop&sub=processor">Processor</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=desktop&sub=motherboard">Motherboard</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=desktop&sub=chassis">Chassis</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=desktop&sub=memory">Memory</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=desktop&sub=gpu">Graphics Card</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=desktop&sub=hdd">Hard Drive</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=desktop&sub=psu">Power Supply</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=desktop&sub=other">Others</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <a href="categ.aspx?main=phone">
                                                                <h5>Phone/Tablet</h5>
                                                            </a>
                                                            <ul>
                                                                <li><a href="categ.aspx?main=phone&sub=microsoft">Microsoft</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=phone&sub=apple">Apple</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=phone&sub=samsung">Samsung</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=phone&sub=htc">HTC</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=phone&sub=sony">Sony</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=phone&sub=asus">Asus</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=phone&sub=lg">LG</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <a href="categ.aspx?main=other">
                                                                <h5>Others</h5>
                                                            </a>
                                                            <ul>
                                                                <li><a href="categ.aspx?main=other&sub=accessories">Accessories</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=phone&sub=speaker">Speakers/Headphones</a>
                                                                </li>
                                                                <li><a href="categ.aspx?main=phone&sub=net">Net Device</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown use-yamm yamm-fw">
                                        <a href="compare.aspx" class="dropdown">Compare</a>
                                    </li>
                                    <!-- ========== FULL WIDTH MEGAMENU ================== -->
                                    <li class="dropdown use-yamm yamm-fw">
                                        <a href="cart.aspx" class="dropdown">Cart</a>

                                        <!-- ========== FULL WIDTH MEGAMENU END ================== -->

                                        <li class="dropdown">
                                            <a href="orderstatus.aspx" class="dropdown-toggle">Order Status</a>
                                        </li>
                                </ul>

                            </div>
                            <!--/.nav-collapse -->




                            <!--/.nav-collapse -->

                        </div>


                    </div>
                    <!-- /#navbar -->

                </div>

                <!-- *** NAVBAR END *** -->

            </header>

            <section class="no-mb">
                <!-- *** JUMBOTRON ***
 _________________________________________________________ -->

                <div class="jumbotron">

                    <div class="dark-mask"></div>

                    <div class="container">
                        <div class="row mb-small">
                            <div class="col-sm-12 text-center">
                                <h1>COOL WORLD STORE</h1>
                                <h2>online shopping for electronics can't get any cooler</h2>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6 mb-small">
                                <img class="img-responsive" src="img/template-mac.png" alt="">
                            </div>

                            <div class="col-sm-6 text-center-xs">
                                <p class="text-uppercase">
                                    Laptop. Desktop. Smartphone.<br />
                                    Tablet. ETC. We have it ALL
                                </p>
                                <p>
                                    Explore our catalog now!
                                    
                                </p>
                                <div class="input-group">

                                    <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control"></asp:TextBox>

                                    <span class="input-group-btn">
                                        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-template-main" Text="Search" OnClick="btnSearch_Click"  />
                                    </span>
                                </div>
                                <p><br />
                                <i>Template taken from: https://bootstrapious.com/p/universal-business-e-commerce-template </i>
                                </p>
                                
                            </div>
                        </div>
                    </div>
                </div>

                <!-- *** JUMBOTRON END *** -->
            </section>

            <section class="bar background-white no-mb">
                <div class="container">

                    <div class="col-md-12">
                        <div class="heading text-center">
                            <h2>FEATURED ITEMS</h2>
                        </div>


                        <!-- *** BLOG HOMEPAGE ***
_________________________________________________________ -->


                        <div class="row">
                            <asp:ListView runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="box-image-text blog">
                                            <div class="top">
                                                <div class="image">
                                                    <img src='<%# Eval("pic1src") %>' alt="" class="img-responsive" height="300">
                                                </div>
                                            </div>
                                            <div class="content">
                                                <h5><asp:HyperLink NavigateUrl='<%# Eval("id", "~/view.aspx?id={0}") %>' runat="server" Text='<%# Eval("name") %>' /></h5>
                                                <p class="author-category">
                                                    <asp:Label runat="server" Text='<%# Eval("price", "PHP {0}") %>'></asp:Label>
                                            </div>
                                        </div>
                                        <!-- /.box-image-text -->

                                    </div>

                                </ItemTemplate>
                            </asp:ListView>











                        </div>
                        <!-- /.row -->

                        <!-- *** BLOG HOMEPAGE END *** -->

                    </div>

                </div>
                <!-- /.container -->
            </section>


            <section class="bar background-gray no-mb padding-big text-center-sm">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-6">
                            <h2 class="text-uppercase">Wide variety of laptop and netbook products available!</h2>
                            <p class="mb-small">
                                Explore our wide range of laptops from various popular brands/manufacturers.<br />

                                <br />
                                <i>Icon Source: http://www.freeiconspng.com/free-images/laptop-icon-19532   </i>
                            </p>
                            <p>
                                <a href="categ.aspx?main=laptop" class="btn btn-template-main">Browse</a>
                            </p>
                        </div>
                        <div class="col-md-4 text-center">
                            <img src="img/laptop-icon.png" alt="" class="img-responsive" width="250">
                        </div>
                    </div>
                </div>
            </section>
            <section class="bar no-mb background-gray padding-big text-center-sm">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-4 text-center">
                            <img src="img/pc-icon.png" alt="" class="img-responsive" width="250">
                        </div>
                        <div class="col-md-6">
                            <h2 class="text-uppercase">Desktop parts and accessories!</h2>
                            <p class="mb-small">
                                Build your very own computer by browsing through our desktop catalog which
                                contains various computer parts manufactured by different companies such as 
                                Intel, Nvidia, Corsair, Etc.
                                <br />
                                <br />
                                <i>Icon source: http://www.freeiconspng.com/free-images/computer-icon-1035 </i>
                            </p>

                            <p>
                                <a href="categ.aspx?main=desktop" class="btn btn-template-main">Browse</a>
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <section class="bar background-gray no-mb padding-big text-center-sm">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-6">
                            <h2 class="text-uppercase">Tablets and Smartphones</h2>
                            <p class="mb-small">
                                Browse various smartphones and tablets from popular phone companies in the market!
                                <br />
                                <br />
                                <i>Icon Source: https://www.1001freedownloads.com/free-icon/mobile-2-icon  </i>
                            </p>
                            <p>
                                <a href="categ.aspx?main=phone" class="btn btn-template-main">Browse</a>
                            </p>
                        </div>
                        <div class="col-md-4 text-center">
                            <img src="img/mobile-icon.png" alt="" class="img-responsive" width="250">
                        </div>
                    </div>
                </div>
            </section>

            <section class="bar no-mb background-gray padding-big text-center-sm">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-4 text-center">
                            <img src="img/headphone-icon.png" alt="" class="img-responsive" width="250">
                        </div>
                        <div class="col-md-6">
                            <h2 class="text-uppercase">..and many more!!</h2>
                            <p class="mb-small">
                                Looking to stylize or modify your devices? Check out our "others/accesories" catalog!
                                <br />
                                <br />
                                <i>Icon source: http://www.iconarchive.com/show/flat-icons-by-flat-icons.com/Headphone-icon.html </i>
                            </p>

                            <p>
                                <a href="categ.aspx?main=other" class="btn btn-template-main">Browse</a>
                            </p>
                        </div>
                    </div>
                </div>
            </section>


            <section class="bar no-mb color-white padding-big text-center-sm">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 text-center">
                            <img src="img/Versus.png" alt="" height="300">
                        </div>
                        <div class="col-md-6">
                            <h2 class="text-uppercase">Compare items</h2>
                            <p class="lead mb-small">Can't decide?</p>
                            <p class="mb-small">
                                Login and assign items for comparison when you view them!<p>

                            <p>
                                <a href="compare.aspx" class="btn btn-template-transparent-primary">compare page</a>
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ABOUT US -->

            <section class="bar background-white no-mb">
                <div class="container">
                    <div class="col-md-12">
                        <div class="heading text-center">
                            <h2>Team Members / SNS Contacts</h2>
                        </div>

                        <div class="row">
                            <div class="col-md-3 col-sm-3">
                                <div class="team-member" data-animate="fadeInUp">
                                    <div class="image">
                                        <a href="team-member.html">
                                            <img src="img/person-1.jpg" alt="" class="img-responsive img-circle" width="300">
                                        </a>
                                    </div>
                                    <h3>Christel Lopez</h3>
                                    <div class="text">
                                        <p>https://www.facebook.com/christel.lpz</p>
                                    </div>
                                </div>
                                <!-- /.team-member -->
                            </div>
                            <div class="col-md-3 col-sm-3" data-animate="fadeInUp">
                                <div class="team-member">
                                    <div class="image">
                                        <a href="team-member.html">
                                            <img src="img/person-2.jpg" alt="" class="img-responsive img-circle" width="300">
                                        </a>
                                    </div>
                                    <h3>Daniel Patrick Marquez </h3>
                                    <div class="text">
                                        <p>https://www.facebook.com/danielpatrick.marquez</p>
                                    </div>
                                </div>
                                <!-- /.team-member -->
                            </div>
                            <div class="col-md-3 col-sm-3" data-animate="fadeInUp">
                                <div class="team-member">
                                    <div class="image">
                                        <a href="team-member.html">
                                            <img src="img/person-3.jpg" alt="" class="img-responsive img-circle" width="300">
                                        </a>
                                    </div>
                                    <h3>Jvee Mikell Primero </h3>

                                    <div class="text">
                                        <p>https://www.facebook.com/kouyaNoMidori</p>
                                    </div>
                                </div>
                                <!-- /.team-member -->
                            </div>
                            <div class="col-md-3 col-sm-3" data-animate="fadeInUp">
                                <div class="team-member">
                                    <div class="image">
                                        <a href="team-member.html">
                                            <img src="img/person-4.jpg" alt="" class="img-responsive img-circle" width="300">
                                        </a>
                                    </div>
                                    <h3>Marj Tepora Topacio </h3>
                                    <div class="text">
                                        <p>https://www.facebook.com/marjaarine</p>
                                    </div>
                                </div>
                                <!-- /.team-member -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                </div>
            </section>

            <section class="bar background-white no-mb">
                <div class="container">
                    <div class="col-md-12">
                        <div class="heading text-center">
                            <h2>Contact Us</h2>
                            <a name="contact"></a>
                        </div>

                        <div class="row">
                            <asp:Label runat="server" ID="lblDone" Text="Message Sent!" Visible="false" ForeColor="#009933"></asp:Label><br />
                            <br />
                            <asp:TextBox runat="server" CssClass="form-control" placeholder="E-Mail" ID="txtEmail" TextMode="Email"></asp:TextBox><br />
                            <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Message" Height="200" Style="resize: none;" ID="txtMessage"></asp:TextBox><br />
                            <i>*Please include your name, city, postal code, phone number, and time frame of purchase if there are any concerns with your purchase</i><br />
                            <br />
                            <asp:Button runat="server" CssClass="btn btn-template-primary" Text="Send" ID="btnSend" OnClick="btnSend_Click" />
                        </div>
                    </div>
                </div>
            </section>

            <!-- /.row -->
        </div>
        <!-- /.container -->
        <!-- /#content -->


        <!-- *** GET IT ***
_________________________________________________________ -->


        <!-- *** GET IT END *** -->


        <!-- *** FOOTER ***
_________________________________________________________ -->


        <!-- *** FOOTER END *** -->

        <!-- *** COPYRIGHT ***
_________________________________________________________ -->

        <div id="copyright">
            <div class="container">
                <div class="col-md-12">
                    <p class="pull-left">&copy; 2017. Your company / name goes here</p>
                    <p class="pull-right">
                        Template by <a href="https://bootstrapious.com">Bootstrapious</a> & <a href="https://remoteplease.com">Remote Please</a>
                        <!-- Not removing these links is part of the license conditions of the template. Thanks for understanding :) If you want to use the template without the attribution links, you can do so after supporting further themes development at https://bootstrapious.com/donate  -->
                    </p>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </div>
        </div>
        <!-- /#copyright -->

        <!-- *** COPYRIGHT END *** -->


        <!-- /#all -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbStoreConnectionString %>" SelectCommand="featuredSelect" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

        <!-- #### JAVASCRIPT FILES ### -->

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>
            window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')
        </script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

        <script src="js/jquery.cookie.js"></script>
        <script src="js/waypoints.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/jquery.parallax-1.1.3.js"></script>
        <script src="js/front.js"></script>


    </form>


</body>

</html>
