<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uyekayit.aspx.cs" Inherits="uyekayit" %>

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


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
            <script src="assets/js/html5shiv.js"></script>
            <script src="assets/js/respond.min.js"></script>
        <![endif]-->
</head>
<body class="page-template page-template-page-contact-php">
    <form id="uyegirisformu" runat="server">
        <div id="uyelikislemleri" style="position:fixed; top:90px; right:0px; z-index:1000000000;width:50px; height:240px;">
            <div>
                <a href="uyegiris"><img src="assets/images/uyegiris.png" /></a>
            </div>
            <div>
                <a href="uyekayit"><img src="assets/images/uyekayit.png" /></a>
            </div>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
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
                        <div class="row page_header">
                            <h1>Üye Kayıt Sayfası</h1>
                            <h3 style="margin-top: 10px;">Bu sayfa üzerinden üye kaydı yapabilirsiniz...</h3>
                        </div>
                        <div class="row contact_tabs">
                            <div class="container" style="padding: 10px !important;">
                                <div class="row heading">

                                    <p>İstenilen bilgileri girerek "KAYDET" butonuna tıklayınız. Üye kayıt başvurunuz sistem yöneticisi tarafından incelendikten sonra e-posta adresinize bilgi e-postası gönderilecektir.</p>
                                </div>
                                <div class="row tab_row">
                                    <ul class="nav nav-tabs" id="contact_tab">
                                        <li class="active col-md-12 text-center"><a href="#mail_form" data-toggle="tab" class="circle gold_bg text-center">
                                            <i class="fa fa-user"></i>
                                        </a></li>

                                    </ul>

                                    <div class="tab-content">
                                        <div class="tab-pane active" id="mail_form">
                                            <div class="row" style="margin-top: 10px;">

                                                <div class="col-xs-12 col-sm-2"></div>
                                                <div class="col-xs-12 col-sm-3">
                                                    <div class="form-group">
                                                        <label for="name" class="sr-only"></label>

                                                        <asp:TextBox ID="tbadsoyad" runat="server" class="form-control required" placeholder="Ad-Soyad"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2"></div>
                                                <div class="col-xs-12 col-sm-3">
                                                    <div class="form-group">
                                                        <label for="email" class="sr-only"></label>
                                                        <asp:TextBox ID="tbeposta" runat="server" class="form-control required" placeholder="E-Posta"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2"></div>
                                            </div>
                                            <div class="row" style="margin-top: 10px;">

                                                <div class="col-xs-12 col-sm-2"></div>
                                                <div class="col-xs-12 col-sm-3">
                                                    <div class="form-group text-center">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ad-Soyad Giriniz!!!" CssClass="alert alert-danger" ControlToValidate="tbadsoyad"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2"></div>
                                                <div class="col-xs-12 col-sm-3">
                                                    <div class="form-group text-center">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="E-Posta Giriniz!!!" CssClass="alert alert-danger" ControlToValidate="tbeposta"></asp:RequiredFieldValidator><br />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Geçerli bir eposta adresi giriniz!!!" ControlToValidate="tbeposta" CssClass="alert alert-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2"></div>
                                            </div>
                                            <div class="row" style="margin-top: 10px;">

                                                <div class="col-xs-12 col-sm-2"></div>
                                                <div class="col-xs-12 col-sm-3">
                                                    <div class="form-group">
                                                        <label for="name" class="sr-only"></label>

                                                        <asp:TextBox ID="tbkullaniciadi" runat="server" class="form-control required" placeholder="Kullanıcı Adı"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2"></div>
                                                <div class="col-xs-12 col-sm-3">
                                                    <div class="form-group">
                                                        <label for="email" class="sr-only"></label>
                                                        <asp:TextBox ID="tbparola" runat="server" class="form-control required" placeholder="Parola" TextMode="Password"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2"></div>
                                            </div>
                                            <div class="row" style="margin-top: 10px;">

                                                <div class="col-xs-12 col-sm-2"></div>
                                                <div class="col-xs-12 col-sm-3">
                                                    <div class="form-group text-center">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Kullanıcı Adı Giriniz!!!" CssClass="alert alert-danger" ControlToValidate="tbkullaniciadi"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2"></div>
                                                <div class="col-xs-12 col-sm-3">
                                                    <div class="form-group text-center">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Parola Giriniz!!!" CssClass="alert alert-danger" ControlToValidate="tbparola"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-2"></div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 text-center">

                                                    <asp:Button ID="btnkayit" runat="server" Text="KAYDET" class="btn btn-default" OnClick="btnkayit_Click" />
                                                </div>
                                                <div class="col-xs-12 col-sm-12 text-center" style="margin-top: 15px;">
                                                    <asp:Label ID="lblislemtamam" runat="server" Text="Kayıt İşlemi Başarılı." CssClass="alert alert-success" Visible="false" Font-Size="14px"></asp:Label>
                                                </div>
                                                <div class="col-xs-12 col-sm-12 text-center" style="margin-top: 15px;">
                                                    <asp:Label ID="lblislemtamamdegil" runat="server" Text="Kayıt İşlemi Başarısız!!!" CssClass="alert alert-danger" Visible="false" Font-Size="14px"></asp:Label>
                                                </div>
                                                <div class="col-xs-12 col-sm-12 text-center" style="margin-top: 15px;">
                                                    <asp:Label ID="lblkullaniciadiuygundegil" runat="server" Text="Girilen kullanıcı adı sisteme kayıtlıdır!!!" CssClass="alert alert-danger" Visible="false" Font-Size="14px"></asp:Label>
                                                </div>
                                            </div>
                                            <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>

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
                <script src="assets/js/preload.js"></script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

