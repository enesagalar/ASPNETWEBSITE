<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projeler.aspx.cs" Inherits="projeler" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Deneme İnşaat</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
    <!-- CSS -->
    <link href="style.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/captions-original.css" rel="stylesheet">
    <link href="assets/css/settings.css" rel="stylesheet">
    <link href="assets/css/limon.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/preset/preset1.css" id="presetcss" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" id="layout_css" href="assets/css/preset/width.css" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.js"></script>
        <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="assets/css/colorbox.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="assets/js/jquery.colorbox.js"></script>
    <script>
        var $j = jQuery.noConflict();
        $j(document).ready(function () {

            $j(".group4").colorbox({ rel: 'group4', slideshow: true });

        });
		</script>
</head>
<body class="single single-blog">
     <form id="form" runat="server">
         <div id="uyelikislemleri" style="position:fixed; top:90px; right:0px; z-index:1000000000;width:50px; height:240px;">
            <div>
                <a href="uyegiris"><img src="assets/images/uyegiris.png" /></a>
            </div>
            <div>
                <a href="uyekayit"><img src="assets/images/uyekayit.png" /</a>
            </div>
        </div>

    <header id="site_header">

        <nav class="navbar navbar-inverse navbar-static-top" role="navigation" id="main_navigation" data-spy="affix" data-offset-top="60">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main_nav">
                        <span class="sr-only">Menu</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand logo" href="index.aspx">
                        <h1 id="firmaadi" runat="server"></h1>
                        <h5 id="slogan" runat="server"></h5>
                    </a>
                </div>
                <!--Ana Menü Başladı-->
                <div class="collapse navbar-collapse" id="main_nav">
                    <ul class="nav navbar-nav" id="anamenu" runat="server"></ul>
                </div>
                <!--Ana Menü Bitti-->
            </div>
        </nav>
        <!--Sosyal Site Bağlantıları Başladı-->
        <div id="social_nav">
            <div class="container">
                <div class="row">
                    <ul class="list-inline nav-pills col-md-8" id="sosyalsitebaglantilariust" runat="server"></ul>
                    <div class="text-center col-md-4" style="background: #e74440; height: 60px;">
                        <div id="kullanicipaneli" runat="server" class="text-center" style="margin: 10px; padding: 5px; background-color: #eee8e8; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;">
                            <i class="fa fa-user"></i>
                            <asp:Label ID="lblkullaniciadi" runat="server" Style="margin-right: 20px;"></asp:Label><asp:Button ID="btnguvenlicikis" runat="server" OnClick="btnguvenlicikis_Click" Text="Güvenli Çıkış" CausesValidation="False" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--Sosyal Site Bağlantıları Bitti-->
    </header>
    <section id="main_content_holder">



        <section id="page_template">

            <div class="row page_content" style="margin: 0px !important; padding-top: 60px;">
                <div class="container">
                   <div class="row portfolios">
                       
						
                        <div class="tab-content">
                            <ul class="row gallery list-inline" id="tumprojeler" runat="server">                   	
                                <li class="mix col-xs-12 col-sm-6 portfolio_content">
                                	<img src="http://placehold.it/480x300" alt="Firs One">
                                    <div class="hoverarea gold_bg">
                                        <a href="#port1" class="row post-link" data-toggle="modal" data-target="#portfolioModal1">
                                            <i class="fa fa-search-plus"></i>
                                        </a>
                                        <div class="row metabox">
                                            <div class="col-xs-6 col-sm-6 date">
                                                <a href="" class="right">
                                                    <div class="day left">20</div>
                                                    <div class="mY left">
                                                        <div class="row">nov</div>
                                                        <div class="row">2012</div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 likes">
                                                <a href="" class="left"><i class="fa fa-heart-o"></i> 357</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="mix col-xs-12 col-sm-6 portfolio_content">
                                    <img src="http://placehold.it/480x300" alt="Firs One">
                                    <div class="hoverarea gold_bg">
                                        <a href="#port1" class="row post-link" data-toggle="modal" data-target="#portfolioModal2">
                                            <i class="fa fa-search-plus"></i>
                                        </a>
                                        <div class="row metabox">
                                            <div class="col-xs-6 col-sm-6 date">
                                                <a href="" class="right">
                                                    <div class="day left">20</div>
                                                    <div class="mY left">
                                                        <div class="row">nov</div>
                                                        <div class="row">2012</div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 likes">
                                                <a href="" class="left"><i class="fa fa-heart-o"></i> 357</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="mix col-xs-12 col-sm-6 portfolio_content">
                                    <img src="http://placehold.it/480x300" alt="Firs One">
                                    <div class="hoverarea gold_bg">
                                        <a href="#port1" class="row post-link" data-toggle="modal" data-target="#portfolioModal3">
                                            <i class="fa fa-search-plus"></i>
                                        </a>
                                        <div class="row metabox">
                                            <div class="col-xs-6 col-sm-6 date">
                                                <a href="" class="right">
                                                    <div class="day left">20</div>
                                                    <div class="mY left">
                                                        <div class="row">nov</div>
                                                        <div class="row">2012</div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 likes">
                                                <a href="" class="left"><i class="fa fa-heart-o"></i> 357</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="mix col-xs-12 col-sm-6 portfolio_content">
                                    <img src="http://placehold.it/480x300" alt="Firs One">
                                    <div class="hoverarea gold_bg">
                                        <a href="#port1" class="row post-link" data-toggle="modal" data-target="#portfolioModal4">
                                            <i class="fa fa-search-plus"></i>
                                        </a>
                                        <div class="row metabox">
                                            <div class="col-xs-6 col-sm-6 date">
                                                <a href="" class="right">
                                                    <div class="day left">20</div>
                                                    <div class="mY left">
                                                        <div class="row">nov</div>
                                                        <div class="row">2012</div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 likes">
                                                <a href="" class="left"><i class="fa fa-heart-o"></i> 357</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                
                                
                            </ul>
                           
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <footer style="margin-top: 20px;">
            <!--Footer Start-->
            <nav class="navbar navbar-inverse navbar-static-top" role="navigation" id="foot_navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#foot_nav">
                            <span class="sr-only">Menu</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="foot_nav">
                        <ul class="nav navbar-nav" id="anamenualt" runat="server"></ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </nav>

            <section id="foot_copy">
                <div class="container">
                    <div class="col-xs-12 col-sm-6 copyright">&copy; Copyright 2020 — Deneme İnşaat. Tüm hakları saklıdır</div>
                    <div class="col-xs-12 col-sm-6">
                        <ul class="list-inline nav-pills right" id="sosyalsitebaglantilarialt" runat="server"></ul>
                    </div>

                </div>
                <!-- Back to top -->
                <a href="#" id="back_to_top"><i class="fa fa-chevron-up"></i></a>
            </section>
        </footer>
        <!--Footer End-->


    </section>
</form>
    <script src="assets/js/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="assets/owl-carousel/owl.carousel.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.themepunch.plugins.min.js"></script>
    <script src="assets/js/jquery.themepunch.revolution.min.js"></script>
    <script type="text/javascript" async src="https://assets.pinterest.com/js/pinit.js"></script>
    <script src="assets/js/mixitup.js"></script>
    <script src="assets/js/gmaps.js"></script>
    <script src="assets/js/preset.js"></script>
    <script src="assets/js/script.js"></script>

</body>
</html>
