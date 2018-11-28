<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminorders.aspx.cs" Inherits="eShopCOE125MP.adminorders" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Cool World | Admin Orders/Delivery</title>

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
                                        <a href="admininventory.aspx" class="dropdown">Inventory </a>
                                    </li>
                                    <li class="dropdown use-yamm yamm-fw">
                                        <a href="adminadd.aspx" class="dropdown">Add Item</a>
                                    </li>
                                    <li class="dropdown use-yamm yamm-fw">
                                        <a href="adminmessages.aspx" class="dropdown">Messages</a>
                                    </li>
                                    <!-- ========== FULL WIDTH MEGAMENU ================== -->
                                    <li class="dropdown active">
                                        <a href="adminorders.aspx" class="dropdown">Orders</a>
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
                                <asp:Label runat="server" Text="Orders/Delivery"></asp:Label></h1>
                        </div>

                    </div>
                </div>
            </div>

            <div id="content">
                <div class="container">

                    <!-- /.row -->
                    <div class="row">


                        <div class="col-md-12 clearfix" id="basket">
                            <div class="box">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="did" DataSourceID="SqlDataSource1" CellPadding="6">
                                    <Columns>
                                        <asp:HyperLinkField HeaderText="Delivery ID" DataTextField="did" DataNavigateUrlFields="did" DataNavigateUrlFormatString="admindeliveryview.aspx?id={0}" />
                                        <asp:BoundField DataField="product" HeaderText="product" SortExpression="product" ItemStyle-Width="450" />
                                        
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email"  ItemStyle-Width="150"/> 
                                        <asp:BoundField DataField="method" HeaderText="method" SortExpression="method" ItemStyle-Width="100"/>
                                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" ItemStyle-Width="200" />
                                        
                                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" ItemStyle-Width="100" />
                                     </Columns>
                                </asp:GridView>
                            </div>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbStoreConnectionString %>" SelectCommand="deliveryallSelect" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>

                            <!-- /.box -->

                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container -->
        </div>
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

        <div>
        </div>
        <!-- /#all -->




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
