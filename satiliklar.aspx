<%@ Page Language="C#" AutoEventWireup="true" CodeFile="satiliklar.aspx.cs" Inherits="satiliklar" %>

<!DOCTYPE html>
<html>
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
</head>
<body>
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
            <section id="page_template" style="padding-top: 70px;">


                <div class="row search_content_widgets">
                    <div class="container">
                        <div class="col-md-12 page_title" style="margin-bottom:20px; padding:5px;font-size: 16px !important; line-height: 20px !important; letter-spacing: 1px !important;">Deneme İnşaat tarafından üretimim yapılan projelerden satılıkları aşağıda görebilirsiniz. Fiyatları görebilmek için üye girişi yapılmalıdır.  <a href="uyegiris">Üye Giriş</a> sayfası üzerinden giriş yapınız. Henüz sitemize üye değilseniz <a href="uyekayit">Üye Kayıt</a> sayfamızdan üyelik başvurusu yapabilirsiniz.</div>
                        <div class="col-xs-12 col-sm-8 search_contents">
                            <ul class="media-list search_items" id="satiliklistesi" runat="server"></ul>
                        </div>
                        <div class="col-xs-12 col-sm-4 search_sidebar">
                            <div class="instagram_widget row widget">
                                <div class="insta_heading widget_heading row">Kategoriler</div>

                                <!-- Kategoriler -->
                                <div class="insta_grids row">
                                    <ul id="kategoriler" runat="server" class="media-list recent_comments" style="padding: 20px;"></ul>
                                </div>
                                <!-- Kategoriler -->


                            </div>
                            <div class="recent_coments_ppNews_Tab row widget">
                                <ul class="nav nav-tabs" id="tabbed_widget">
                                    <li class="active"><a href="#ensonyuklenenler" data-toggle="tab">Son Yüklenenler</a></li>

                                    <li><a href="#encokgoruntulenenler" data-toggle="tab">Çok Görüntülenler</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="ensonyuklenenler">
                                        <ul class="media-list recent_blogs" id="son" runat="server"></ul>
                                    </div>

                                    <div class="tab-pane" id="encokgoruntulenenler">
                                        <ul class="media-list recent_blogs" id="cok" runat="server"></ul>
                                    </div>
                                </div>
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
    </form>
</body>
</html>
