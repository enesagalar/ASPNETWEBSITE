<%@ Page Language="C#" AutoEventWireup="true" CodeFile="anketsonuclari.aspx.cs" Inherits="anketsonuclari" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
    <link rel="stylesheet" type="text/css" href="assets/css/preload.css" />

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
            <section class="our" id="uyari" runat="server" style="padding-top: 80px;">
                <div style="height: auto; max-width: 900px; margin: 0px auto; padding: 0px; margin-top: 20px; border: 1px solid silver; padding: 10px; text-align: center;" class="alert alert-danger">
                    <img src="/assets/images/dikkat.png" width="80px" />
                    <h4 style="line-height: 30px; letter-spacing: 1px; font-size: 16px;">Bu sayfa üyelere özel içerikler barındırmaktadır!!! Lütfen önce <a href="uyegiris">Üye Giriş</a> sayfası üzerinden giriş yapınız. Henüz sitemize üye değilseniz <a href="uyekayit">Üye Kayıt</a> sayfamızdan üyelik başvurusu yapabilirsiniz.</h4>
                </div>

            </section>

            <section class="our" id="anket" runat="server" style="padding-top: 80px;">
                <div id="chartContainer" style="height: 370px; max-width: 900px; margin: 0px auto; padding: 0px; margin-top: 20px; border: 1px solid silver;"></div>
                <script src="/assets/js/canvasjs.min.js"></script>
            </section>
            <!--Firmayı Tanıyın Başladı-->
            <section id="story_of_day" style="margin-top: 20px;">
                <div class="container">
                    <h2><span>Deneme İnşaat'ı Yakından Tanıyın</span></h2>
                    <div class="row top_stories">
                        <div class="col-xs-12 col-sm-4">
                            <div class="row single_blog_summery blog_style_1 post_type_shopping">

                                <div class="row post_desc">
                                    <div class="row post_title">
                                        <a href="hakkimizda">
                                            <h3>Hakkımızda</h3>
                                        </a>
                                    </div>
                                    <div class="row post_summery" id="hakkimizdayazisi" runat="server"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4">
                            <div class="row single_blog_summery blog_style_1 post_type_shopping">

                                <div class="row post_desc">
                                    <div class="row post_title">
                                        <a href="hakkimizda">
                                            <h3>Vizyonumuz</h3>
                                        </a>
                                    </div>
                                   <div class="row post_summery"  id="vizyonumuzyazisi" runat="server"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4">
                            <div class="row single_blog_summery blog_style_1 post_type_shopping">

                                <div class="row post_desc">
                                    <div class="row post_title">
                                        <a href="hakkimizda">
                                            <h3>Misyonumuz</h3>
                                        </a>
                                    </div>
                                   <div class="row post_summery"  id="misyonumuzyazisi" runat="server"></div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </section>
            <!--Firmayı Tanıyın Bitti-->
            <section id="our_services">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4">
                            <div class="service_container row">

                                <div class="anket col-xs-12">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div id="anketsorusu" class="row" runat="server"></div>
                                            <div class="cevaplar row">
                                                <asp:RadioButtonList ID="rbtnlanketcevaplari" runat="server"></asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="rfvanketcevaplari" Font-Size="14px" runat="server" ErrorMessage="Cevap Seçiniz!!!" ControlToValidate="rbtnlanketcevaplari" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="row" style="margin-top: 5px;">
                                                <asp:Button ID="btncevapgonder" runat="server" Text="Cevap Gönder" Style="position: relative !important;" CssClass="btn-danger buton" OnClick="btncevapgonder_Click" />
                                            </div>
                                            <div class="row">
                                                <asp:Label ID="lblislemtamam" runat="server" Text="Cevabınız için teşekkür ederiz." CssClass="alert alert-success" Visible="false" Font-Size="14px"></asp:Label>
                                            </div>
                                            <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="3000" OnTick="Timer1_Tick"></asp:Timer>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>
                                <a href="anketsonuclari" class="read_more gold_bg" style="bottom: 15px !important;">Anket Sonuçları</a>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4">
                            <div class="service_container row">
                                <div class="row icon">
                                    <img src="/assets/images/news/meta/user.png" alt="">
                                </div>
                                <div class="row service_title">Üye olmak için aşağıdaki bağlantıya tıklayınız.</div>
                                <a href="uyekayit" class="read_more gold_bg" style="bottom: -47px !important;">Üye Kayıt</a>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4">
                            <div class="service_container row">
                                <div class="row icon">
                                    <img src="/assets/images/news/meta/user.png" alt="">
                                </div>
                                <div class="row service_title">Üye girişi yapmak için aşağıdaki bağlantıya tıklayınız.</div>
                                <a href="uyegiris" class="read_more gold_bg" style="bottom: -47px !important;">Üye Giriş</a>
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
    <script src="assets/js/preload.js"></script>
      <script>
        window.onload = function () {


            var chart = new CanvasJS.Chart("chartContainer", {
                animationEnabled: true,
                theme: "light1", // "light1", "light2", "dark1", "dark2"
                title: {
                    text: "<%=grafiktekianketsorusu %>"
                },
                axisY: {
                    title: "Adet"
                },
                data: [{
                    type: "column",
                    showInLegend: true,
                    legendMarkerColor: "grey",
                    legendText: "Anket sonuçları yukarıdaki grafikte gösterilmiştir.",
                    dataPoints: [<%=anketverileri %>]
                }]
            });
            chart.render();

        }
    </script>

</body>
</html>
