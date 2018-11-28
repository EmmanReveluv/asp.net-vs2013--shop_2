<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="categ.aspx.cs" Inherits="eShopCOE125MP.categ" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Cool World | Categories</title>

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
                                    <li class="dropdown use-yamm yamm-fw">
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

            <div id="heading-breadcrumbs">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7">
                            <h1>
                                <asp:Label runat="server" Text="Category - " ID="lblHead"></asp:Label></h1>
                        </div>

                    </div>
                </div>
            </div>

            <div id="content">
                <div class="container">
                    <div class="row">

                        <!-- /.row -->
                        <!-- *** LEFT COLUMN ***
			_________________________________________________________ -->

                        <div class="col-sm-3">

                            <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
                            <div class="panel panel-default sidebar-menu">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Search</h3>
                                </div>
                                <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" /><br />
                                <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-template-main" text="Go" OnClick="btnSearch_Click"/><br />
                                <div class="panel-heading">
                                    <h3 class="panel-title"><br />Categories</h3>
                                </div>

                                <div class="panel-body">
                                    <ul class="nav nav-pills nav-stacked category-menu">
                                        <li>
                                            <a href="categ.aspx?main=laptop">Laptop</a>
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
                                        </li>
                                        <li>
                                            <a href="categ.aspx?main=desktop">Desktop</a>
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
                                        </li>
                                        <li>
                                            <a href="categ.aspx?main=phone">Phone/Tablet</a>
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
                                        </li>
                                        <li>
                                            <a href="categ.aspx?main=other">Others</a>
                                            <ul>
                                                <li><a href="categ.aspx?main=other&sub=accessories">Accessories</a>
                                                </li>
                                                <li><a href="categ.aspx?main=phone&sub=speaker">Speakers/Headphones</a>
                                                </li>
                                                <li><a href="categ.aspx?main=phone&sub=net">Net Device</a>
                                                </li>
                                            </ul>
                                        </li>

                                    </ul>

                                </div>

                            </div>


                        </div>
                        <!-- /.end category-->
                        <div class="col-sm-9">
                            <br />
                            <div class="row products">
                                <asp:DataList ID="dataview1" DataSourceID="SqlDataSource1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="300px">
                                    <ItemTemplate>
                                        <div style="width: 300px">
                                            <div class="product">
                                                <div class="image">
                                                    <a href='<%# Eval("id", "view.aspx?id={0}") %>'>
                                                        <asp:Image runat="server" src='<%# Eval("pic1src") %>' height="300px" ImageAlign="AbsMiddle" />
                                                    </a>
                                                </div>
                                                <!-- /.image -->
                                                <div class="text">
                                                    <h3>
                                                        <asp:HyperLink NavigateUrl='<%# Eval("id", "~/view.aspx?id={0}") %>' runat="server" Text='<%# Eval("name") %>' />
                                                    </h3>
                                                    <p class="price">
                                                        PHP
                                                    <asp:Label runat="server" Text=' <%# Eval("price") %>' />
                                                    </p>
                                                    <p class="buttons">
                                                        <asp:HyperLink NavigateUrl='<%# Eval("id", "~/view.aspx?id={0}") %>' runat="server" Text='<%# Eval("name") %>' />

                                                    </p>
                                                </div>

                                            </div>
                                        &nbsp
                                        &nbsp
                                        &nbsp
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container -->

            </div>
            <!-- /#content -->
















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



        </div>
        <!-- /#all -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbStoreConnectionString %>" SelectCommand="filteredSelect" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="subcategory" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

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
