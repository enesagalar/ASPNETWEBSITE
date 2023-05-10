using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

public class veritabaniislemleri
{
    string strveritabanibaglantisi = ConfigurationManager.ConnectionStrings["DenemeInsaat"].ToString();
    public string[] genelayarlar()
    {
        var sayfaayarlari = new string[12];
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand("select * from GenelAyarlar", baglanti))
            {
                baglanti.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        sayfaayarlari[0] = reader["FirmaAdi"].ToString();
                        sayfaayarlari[1] = reader["Slogan"].ToString();
                        sayfaayarlari[2] = reader["HakkimizdaYazisi"].ToString();
                        sayfaayarlari[3] = reader["VizyonumuzYazisi"].ToString();
                        sayfaayarlari[4] = reader["MisyonumuzYazisi"].ToString();
                        sayfaayarlari[5] = reader["SiteOzeti"].ToString();
                        sayfaayarlari[6] = reader["AnahtarKelimeler"].ToString();
                        sayfaayarlari[7] = reader["SayfaBasliklari"].ToString();
                        sayfaayarlari[8] = reader["MapHtml"].ToString();
                        sayfaayarlari[9] = reader["Adres"].ToString();
                        sayfaayarlari[10] = reader["Telefon"].ToString();
                        sayfaayarlari[11] = reader["EPosta"].ToString();

                    }

                }
                finally
                {
                    if (reader != null)
                        ((IDisposable)reader).Dispose();
                }

                baglanti.Close();

            }

        }

        return sayfaayarlari;


    }


    public string[] projedetaybilgileri(string projeid)
    {
        var projebilgileri = new string[5];
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Projeler where ProjeID='"+projeid+"'", baglanti))
            {
                baglanti.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        projebilgileri[0] = reader["Baslik"].ToString();
                        projebilgileri[1] = reader["Aciklamasi"].ToString();
                        projebilgileri[2] = reader["EklenmeZamani"].ToString();
                        projebilgileri[3] = reader["GoruntulenmeSayisi"].ToString();
                        projebilgileri[4] = reader["BegenilmeSayisi"].ToString();
                        

                    }

                }
                finally
                {
                    if (reader != null)
                        ((IDisposable)reader).Dispose();
                }

                baglanti.Close();

            }

        }

        return projebilgileri;


    }

    public string[] satilikdetaybilgileri(string satilikid)
    {
        var satilikbilgileri = new string[8];
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Satiliklar where SatilikID='" + satilikid + "'", baglanti))
            {
                baglanti.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        satilikbilgileri[0] = reader["Baslik"].ToString();
                        satilikbilgileri[1] = reader["Aciklamasi"].ToString();
                        satilikbilgileri[2] = reader["EklenmeZamani"].ToString();
                        satilikbilgileri[3] = reader["GoruntulenmeSayisi"].ToString();
                        satilikbilgileri[4] = reader["Il"].ToString();
                        satilikbilgileri[5] = reader["Ilce"].ToString();
                        satilikbilgileri[6] = reader["Fiyat"].ToString();
                        satilikbilgileri[7] = verigetir("select Ad from Kategoriler where KategoriID='"+ reader["KategoriID"].ToString() + "'","Ad");


                    }

                }
                finally
                {
                    if (reader != null)
                        ((IDisposable)reader).Dispose();
                }

                baglanti.Close();

            }

        }

        return satilikbilgileri;


    }

    public string[] kiralikdetaybilgileri(string kiralikid)
    {
        var kiralikbilgileri = new string[8];
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Kiraliklar where KiralikID='" + kiralikid + "'", baglanti))
            {
                baglanti.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        kiralikbilgileri[0] = reader["Baslik"].ToString();
                        kiralikbilgileri[1] = reader["Aciklamasi"].ToString();
                        kiralikbilgileri[2] = reader["EklenmeZamani"].ToString();
                        kiralikbilgileri[3] = reader["GoruntulenmeSayisi"].ToString();
                        kiralikbilgileri[4] = reader["Il"].ToString();
                        kiralikbilgileri[5] = reader["Ilce"].ToString();
                        kiralikbilgileri[6] = reader["Fiyat"].ToString();
                        kiralikbilgileri[7] = verigetir("select Ad from Kategoriler where KategoriID='" + reader["KategoriID"].ToString() + "'", "Ad");


                    }

                }
                finally
                {
                    if (reader != null)
                        ((IDisposable)reader).Dispose();
                }

                baglanti.Close();

            }

        }

        return kiralikbilgileri;


    }
    public string anamenu()
    {
        DataTable dt = DataTableGetir("select * from Anamenu order by Siralama");
        string strdata = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string donusturulmus = UrlDonustur(dt.Rows[i]["MenuAdi"].ToString().ToLower());//url route larımızı ayarladık. Burada linkleri url route lara uygun hale getiriyoruz. Öncden linklerde index.aspx, hakkimizda.aspx gibi açılacak sayfa adları vardı. Artık linklerde url route larımıza uygun olarak anasayfa/hakkimizda gibi değerleri yazdırıyoruz.
            strdata += "<li><a href=\""+ String.Format("/" + donusturulmus + "") + "\" target=\"" + dt.Rows[i]["AcilisSekli"] + "\">" + dt.Rows[i]["MenuAdi"] + "</a></li>";
        }
        return strdata;
       
    }

    public string tumprojeler()
    {
        DataTable dt = DataTableGetir("select * from Projeler order by EklenmeZamani desc");
        string strdata = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string donusturulmus = UrlDonustur("/Projeler/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/" + dt.Rows[i]["ProjeID"] + "");
            strdata += "<li class=\"mix col-xs-12 col-sm-6 portfolio_content\"><img src=\"/assets/images/projeler/"+dt.Rows[i]["ProjeID"]+ "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"><h2 style=\"width:100%; height:auto; color:#fff; background:rgba(50,50,50,0.8);top:50%;\">" + dt.Rows[i]["Baslik"] + "</h2><div class=\"hoverarea gold_bg\"><a href=\""+ string.Format(donusturulmus) + "\" class=\"row post-link\"><i class=\"fa fa-search-plus\"></i><h2 style=\"width:100%; height:auto; color:#fff; background:rgba(50,50,50,0.8);top:-10%;\">" + dt.Rows[i]["Baslik"] + "</h2></a></div></li>";
        }
        return strdata;
       
    }

    public string kategoriler(string kategorileritalepedensayfaadi)
    {
        DataTable dt = DataTableGetir("select * from Kategoriler order by Ad");
        string strdata = "";
        if (kategorileritalepedensayfaadi == "Satılıklar")
        {
            strdata += "<li class=\"media\"><a href=\"/satılıklar\">Tüm Satılıklar</a></li>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string donusturulmus = UrlDonustur("/Satılıklar/" + dt.Rows[i]["Ad"].ToString().Replace(" ", "-") + "");
                strdata += "<li class=\"media\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Ad"] + "</a></li>";
            }
        }
        else
        {
            strdata += "<li class=\"media\"><a href=\"/kiralıklar\">Tüm Kiralıklar</a></li>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string donusturulmus = UrlDonustur("/Kiralıklar/" + dt.Rows[i]["Ad"].ToString().Replace(" ", "-") + "");
                strdata += "<li class=\"media\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Ad"] + "</a></li>";
            }
        }
        return strdata;

    }

    public string satiliklistesi(bool uyegirisyaptimi, string KategoriID)
    {
        DataTable dt = new DataTable();
        if (KategoriID == null)//Session UyeID varsa, yani kullanıcı giriş işlemi başarı ile gerçekleşmişse
        {
            dt = DataTableGetir("select * from Satiliklar order by EklenmeZamani desc");
        }
        else
        {
            dt = DataTableGetir("select * from Satiliklar where KategoriID='"+KategoriID+"' order by EklenmeZamani desc");
        }
        string strdata = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string donusturulmus = UrlDonustur("/Satılıklar/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/"+ dt.Rows[i]["SatilikID"].ToString() + "");
            if (uyegirisyaptimi == true)//giriş yapıldı, fiyatları göster
            {
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" width=\"180px\" height=\"150px\" src=\"/assets/images/satiliklar/" + dt.Rows[i]["SatilikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h3 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h3><div class=\"post_meta row\"><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-map-marker left\"></i><span>"+ dt.Rows[i]["Il"]+" - "+dt.Rows[i]["Ilce"] + "</span></a></div><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-building-o left\"></i><span>" + verigetir("select Ad from Kategoriler where KategoriID='"+ dt.Rows[i]["KategoriID"] + "'","Ad") + "</span></a></div><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-money left\"></i><span>" + dt.Rows[i]["Fiyat"] + "</span></a></div></div></div></li>";

            }
            else//giriş yapılmadı, fiyatları gösterme
            {
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" width=\"180px\" height=\"150px\" src=\"/assets/images/satiliklar/" + dt.Rows[i]["SatilikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h3 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h3><div class=\"post_meta row\"><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-map-marker left\"></i><span>" + dt.Rows[i]["Il"] + " - " + dt.Rows[i]["Ilce"] + "</span></a></div><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-building-o left\"></i><span>" + verigetir("select Ad from Kategoriler where KategoriID='" + dt.Rows[i]["KategoriID"] + "'", "Ad") + "</span></a></div><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-money left\"></i><span>Üyelere Özel!!!</span></a></div></div></div></li>";
            }
           
        }
        return strdata;

    }

    public string soneklenensatiliklar()
    {
        DataTable dt = DataTableGetir("select * from Satiliklar order by EklenmeZamani desc");
        string strdata = "";
        if (dt.Rows.Count > 5)
        {
            for (int i = 0; i < 5; i++)
            {
                string donusturulmus = UrlDonustur("/Satılıklar/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/" + dt.Rows[i]["SatilikID"].ToString() + "");
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" src=\"/assets/images/satiliklar/"+ dt.Rows[i]["SatilikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h5 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h5></div></li>";
            }
        }
        else
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string donusturulmus = UrlDonustur("/Satılıklar/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/" + dt.Rows[i]["SatilikID"].ToString() + "");
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" src=\"/assets/images/satiliklar/" + dt.Rows[i]["SatilikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h5 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h5></div></li>";
            }
        }

        return strdata;

    }

    public string cokgoruntulenensatiliklar()
    {
        DataTable dt = DataTableGetir("select * from Satiliklar order by GoruntulenmeSayisi desc");
        string strdata = "";
        if (dt.Rows.Count > 5)
        {
            for (int i = 0; i < 5; i++)
            {
                string donusturulmus = UrlDonustur("/Satılıklar/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/" + dt.Rows[i]["SatilikID"].ToString() + "");
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" src=\"/assets/images/satiliklar/" + dt.Rows[i]["SatilikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h5 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h5></div></li>";
            }
        }
        else
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string donusturulmus = UrlDonustur("/Satılıklar/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/" + dt.Rows[i]["SatilikID"].ToString() + "");
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" src=\"/assets/images/satiliklar/" + dt.Rows[i]["SatilikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h5 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h5></div></li>";
            }
        }

        return strdata;

    }

    public string kiraliklistesi(bool uyegirisyaptimi, string KategoriID)
    {
        DataTable dt = new DataTable();
        if (KategoriID == null)//Session UyeID varsa, yani kullanıcı giriş işlemi başarı ile gerçekleşmişse
        {
            dt = DataTableGetir("select * from Kiraliklar order by EklenmeZamani desc");
        }
        else
        {
            dt = DataTableGetir("select * from Kiraliklar where KategoriID='" + KategoriID + "' order by EklenmeZamani desc");
        }
        string strdata = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string donusturulmus = UrlDonustur("/Kiralıklar/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/" + dt.Rows[i]["KiralikID"].ToString() + "");
            if (uyegirisyaptimi == true)//giriş yapıldı, fiyatları göster
            {
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" width=\"180px\" height=\"150px\" src=\"/assets/images/kiraliklar/" + dt.Rows[i]["KiralikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h3 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h3><div class=\"post_meta row\"><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-map-marker left\"></i><span>" + dt.Rows[i]["Il"] + " - " + dt.Rows[i]["Ilce"] + "</span></a></div><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-building-o left\"></i><span>" + verigetir("select Ad from Kategoriler where KategoriID='" + dt.Rows[i]["KategoriID"] + "'", "Ad") + "</span></a></div><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-money left\"></i><span>" + dt.Rows[i]["Fiyat"] + "</span></a></div></div></div></li>";

            }
            else//giriş yapılmadı, fiyatları gösterme
            {
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" width=\"180px\" height=\"150px\" src=\"/assets/images/kiraliklar/" + dt.Rows[i]["KiralikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h3 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h3><div class=\"post_meta row\"><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-map-marker left\"></i><span>" + dt.Rows[i]["Il"] + " - " + dt.Rows[i]["Ilce"] + "</span></a></div><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-building-o left\"></i><span>" + verigetir("select Ad from Kategoriler where KategoriID='" + dt.Rows[i]["KategoriID"] + "'", "Ad") + "</span></a></div><div class=\"col-xs-4 col-sm-4\"><a href=\""+ string.Format(donusturulmus) + "\"><i class=\"fa fa-money left\"></i><span>Üyelere Özel!!!</span></a></div></div></div></li>";
            }

        }
        return strdata;

    }

    public string soneklenenkiraliklar()
    {
        DataTable dt = DataTableGetir("select * from Kiraliklar order by EklenmeZamani desc");
        string strdata = "";
        if (dt.Rows.Count > 5)
        {
            for (int i = 0; i < 5; i++)
            {
                string donusturulmus = UrlDonustur("/Kiralıklar/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/" + dt.Rows[i]["KiralikID"].ToString() + "");
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" src=\"/assets/images/kiraliklar/" + dt.Rows[i]["KiralikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h5 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h5></div></li>";
            }
        }
        else
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string donusturulmus = UrlDonustur("/Kiralıklar/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/" + dt.Rows[i]["KiralikID"].ToString() + "");
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" src=\"/assets/images/kiraliklar/" + dt.Rows[i]["KiralikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h5 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h5></div></li>";
            }
        }
        return strdata;
    }

    public string cokgoruntulenenkiraliklar()
    {
        DataTable dt = DataTableGetir("select * from Kiraliklar order by GoruntulenmeSayisi desc");
        string strdata = "";
        if (dt.Rows.Count > 5)
        {
            for (int i = 0; i < 5; i++)
            {
                string donusturulmus = UrlDonustur("/Kiralıklar/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/" + dt.Rows[i]["KiralikID"].ToString() + "");
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" src=\"/assets/images/kiraliklar/" + dt.Rows[i]["KiralikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h5 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h5></div></li>";
            }
        }
        else
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string donusturulmus = UrlDonustur("/Kiralıklar/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/" + dt.Rows[i]["KiralikID"].ToString() + "");
                strdata += "<li class=\"media\"><a class=\"pull-left blog_thumb\" href=\""+ string.Format(donusturulmus) + "\"><img class=\"media-object\" src=\"/assets/images/kiraliklar/" + dt.Rows[i]["KiralikID"] + "/1.jpg\" alt=\"" + dt.Rows[i]["Baslik"] + "\"></a><div class=\"media-body\"><h5 class=\"media-heading\"><a href=\""+ string.Format(donusturulmus) + "\">" + dt.Rows[i]["Baslik"] + "</a></h5></div></li>";
            }
        }

        return strdata;

    }

    public string hizmetlerimiz()
    {
        DataTable dt = DataTableGetir("select * from Hizmetler order by EklenmeZamani desc");
        string strdata = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {

            strdata += "<div class=\"row single_blog_summery blog_style_3 blog_feature_img_left\"><div class=\"row img_summery post_desc\"><div class=\"col-xs-12 col-sm-2 blog_feature_img_cat\"><img src=\"/assets/images/hizmetler/"+dt.Rows[i]["Resim"]+ "\" alt=\"" + dt.Rows[i]["Baslik"] + "\" class=\"row feature_img img-rounded img-thumbnail\" style=\"margin-bottom:20px;\"></div><div class=\"col-xs-12 col-sm-10\" style=\"padding-left:20px;\"><div class=\"row post_title\"><h3>" + dt.Rows[i]["Baslik"] + "</h3></div><div class=\"row post_summery\">" + dt.Rows[i]["Aciklamasi"] + "</div></div></div></div>";
        }
        return strdata;

    }
    public string sosyalsitebaglantilari()
    {
        DataTable dt = DataTableGetir("select * from SosyalSİteBaglantilari where Durum='Açık' order by Siralama");
        string strdata = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            strdata += "<li><a href=\""+dt.Rows[i]["AcacagiSayfa"]+"\" target=\"_blank\"><i class=\"fa fa-"+ dt.Rows[i]["SiteAdi"] + "\"></i></a></li>";
        }
        strdata += "<li></li>";
        return strdata;

    }

    public string slaytgosterisi()
    {
        DataTable dt = DataTableGetir("select * from Slaytlar order by EklenmeZamani desc");
        string strdata = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            strdata += "<li data-transition=\"fade\" data-slotamount=\"1\" data-masterspeed=\"3000\" class=\"clr\"><img src=\"" + dt.Rows[i]["Resim"] + "\" alt=\"Deneme İnşaat\"><div class=\"caption large_text lft\" data-x=\"122\" data-y=\"360\" data-speed=\"800\" data-start=\"1600\" data-easing=\"easeOutExpo\"><p class=\"slider_common_p\">" + dt.Rows[i]["Yazi"] + "</p></div></li>";
        }
        
        return strdata;

    }

  
    public string sonprojeler()
    {
        DataTable dt = DataTableGetir("select top 5 * from Projeler order by EklenmeZamani desc");//sorgumuz Projeler tablosundaki verileri EklenmeZamani alanındaki verilere göre
        //tersten sıralayacak ve ilk 5 kayda ait tüm alanlardaki verileri verecek.
        string strdata = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string donusturulmus = UrlDonustur("/Projeler/" + dt.Rows[i]["Baslik"].ToString().Replace(" ", "-") + "/"+ dt.Rows[i]["ProjeID"] + "");
            strdata += "<a href=\""+ string.Format(donusturulmus) + "\" target=\"_self\"><div class=\"item\"><img width=\"170px\" height=\"170px\" src=\"/assets/images/projeler/"+ dt.Rows[i]["ProjeID"] + "/1.jpg\" alt=\"Deneme İnşaat\" class=\"img-circle\"/><h4 class=\"caption\">"+ dt.Rows[i]["Baslik"] + "</h4></div></a>";
        }

        return strdata;

    }

    public void ekle_sil_guncelle(string sorgu)
    {
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand(sorgu, baglanti))
            {
                cmd.CommandType = CommandType.Text;
                baglanti.Open();
                cmd.ExecuteNonQuery();
                baglanti.Close();
            }
        }
    }
    public DataTable DataTableGetir(string sorgu)
    {
        DataTable dt = new DataTable();
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand(sorgu, baglanti))
            {
                baglanti.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(sorgu, baglanti);
                try
                {
                    adapter.Fill(dt);
                }
                catch
                {

                }
                baglanti.Close();
            }
        }
        return dt;
    }
    
    //bu fonksiyon kendisine gönderilen string deger içindeki sayfalarınızı hackleme ihtimali olabilecek 
    //veritabanına sızma(sql injection) strSonuclerini silerek, size geri string değişken gönderir.
    //Daha çok query string ya da session yöntemleriyle sayfalar arası değer gönderme işlemlerinde kullanılır.
    public int sql(String deger)
    {
        int index = 0;
        string[] blist = { "/", "</", ">", "<script>", "</script>", "--", ";--", ";", "/*", "*/", "@@", "@", "char", "nchar", "varchar", "nvarchar", "alter", "begin", "cast", "create", "cursor", "declare", "delete", "drop", "end", "exec", "execute", "fetch", "insert", "kill", "open", "select", "sys", "sysobjects", "syscolumns", "table", "update" };

        for (int a = 0; a < blist.Length; a++) { if (deger.IndexOf(blist[a]) != -1) { index = -1; } }
        return index;
    }

    //bu fonksiyon kendisine gönderilen string değerin sayı olup olmadığını bulur.
    //gönderilen değer sayı ile bool türünden true, sayı değilse bool türünden false değer döndürür.
    public bool sayimi(String deger)
    {
        bool kontrol = Regex.IsMatch(Convert.ToString(deger), @"-?\d+(\.\d+)?");
        return kontrol;
    }
   
    
    public DataRow DataRowGetir(string sorgu)
    {
        DataTable tablo = DataTableGetir(sorgu);
        if (tablo.Rows.Count == 0) return null;
        return tablo.Rows[0];
    }

    //bu fonksiyon kendisine gönderilen sql sorgusu sonucu dönen kayıt sayısını geri döndürür.
    public int say(string sorgu)
    {
        int sayi = 0;
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand(sorgu, baglanti))
            {
                baglanti.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        sayi += 1;
                    }
                }
                finally
                {
                    if (reader != null)
                        ((IDisposable)reader).Dispose();
                }
                baglanti.Close();
            }

        }
        return sayi;

    }

    //bu fonksiyon kendisine gönderilen sql sorgusu sonucu dönen kayıt sayısını geri döndürür.
    public int sayigetir(string sorgu)
    {



        int veri = 0;
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand(sorgu, baglanti))
            {
                baglanti.Open();


                try
                {
                    veri = Convert.ToInt32(cmd.ExecuteScalar());

                }
                catch
                {

                }

                baglanti.Close();

            }

        }

        return veri;


    }
  
    public string verigetir(string sorgu, string alan)
    {



        string strdata = "";





        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand(sorgu, baglanti))
            {
                baglanti.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        strdata = reader["" + alan + ""].ToString();
                    }

                }
                finally
                {
                    if (reader != null)
                        ((IDisposable)reader).Dispose();
                }

                baglanti.Close();

            }

        }
        return strdata;


    }

    //bu fonksiyon kendisine gönderilen sql sorgusu sonucu kayıt dönerse bool türde true, dönmezse bool türde false geri döndürür.
    public bool varmi(String sorgu)
    {
        bool varmii;
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand(sorgu, baglanti))
            {
                baglanti.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    if (reader.HasRows)
                    {
                        varmii = true;
                    }
                    else
                    {
                        varmii = false;
                    }

                }
                finally
                {
                    if (reader != null)
                        ((IDisposable)reader).Dispose();
                }

                baglanti.Close();

            }

        }
        return varmii;
    }
    public string tektirnakdegistir(string degisken)
    {
        string ayiklanmisdegisken = degisken.Replace("'", "&#8217;");
        return ayiklanmisdegisken;
    }



   
    public SqlTransaction cokluislem(SqlCommand sorgu)
    {
        SqlTransaction sqlTran;
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            baglanti.Open();
            sqlTran = baglanti.BeginTransaction();
            sorgu.Connection = baglanti;
            sorgu.Transaction = sqlTran;
            sorgu.ExecuteNonQuery();
            sqlTran.Commit();
            baglanti.Close();

        }
        return sqlTran;
    }
    //bu fonksiyon kendisine gönderilen sorgu sonucu dönen kayıtları listboxa doldurur.
    public void list_aktar(string sql, System.Web.UI.WebControls.ListBox lb)
    {


        lb.Items.Clear();




        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand(sql, baglanti))
            {
                baglanti.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        lb.Items.Add(reader[0].ToString());
                    }

                }
                finally
                {
                    if (reader != null)
                        ((IDisposable)reader).Dispose();
                }

                baglanti.Close();

            }

        }
    }
    //bu fonksiyon kendisine gönderilen sorgu sonucu dönen kayıtları dropdown a doldurur.
    public void ddlist_aktar(string sql, System.Web.UI.WebControls.DropDownList ddl)
    {
        ddl.Items.Clear();
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand(sql, baglanti))
            {
                baglanti.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        ddl.Items.Add(reader[0].ToString());
                    }

                }
                finally
                {
                    if (reader != null)
                        ((IDisposable)reader).Dispose();
                }

                baglanti.Close();

            }

        }
    }

    //bu fonksiyon kendisine gönderilen sorgu sonucu dönen kayıtları radiobuttonlist e doldurur.
    public void rbtnllist_aktar(string sql, System.Web.UI.WebControls.RadioButtonList rbtnl)
    {
        rbtnl.Items.Clear();
        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand(sql, baglanti))
            {
                baglanti.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        rbtnl.Items.Add(reader[0].ToString());
                    }
                }
                finally
                {
                    if (reader != null)
                        ((IDisposable)reader).Dispose();
                }
                baglanti.Close();
            }

        }
    }


    //bu fonksiyon kendisine gönderilen sorgu sonucu dönen kayıtları ilk satıra Seçiniz... yazdıktan sonra dropdown a doldurur.

    public void ddlist_aktar1(string sql, System.Web.UI.WebControls.DropDownList ddl)
    {



        ddl.Items.Clear();
        ddl.Items.Add("Seçiniz...");



        using (SqlConnection baglanti = new SqlConnection(strveritabanibaglantisi))
        {
            using (SqlCommand cmd = new SqlCommand(sql, baglanti))
            {
                baglanti.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        ddl.Items.Add(reader[0].ToString());
                    }

                }
                finally
                {
                    if (reader != null)
                        ((IDisposable)reader).Dispose();
                }

                baglanti.Close();

            }

        }
    }

    public string UrlDonustur(string Yazi)
    {
        try
        {
            string strSonuc = Yazi;

            strSonuc = strSonuc.Replace("ş", "s");
            strSonuc = strSonuc.Replace("Ş", "S");
            strSonuc = strSonuc.Replace(".", "");
            strSonuc = strSonuc.Replace(":", "");
            strSonuc = strSonuc.Replace(";", "");
            strSonuc = strSonuc.Replace(",", "");
            strSonuc = strSonuc.Replace(" ", "-");
            strSonuc = strSonuc.Replace("!", "");
            strSonuc = strSonuc.Replace("(", "");
            strSonuc = strSonuc.Replace(")", "");
            strSonuc = strSonuc.Replace("'", "");
            strSonuc = strSonuc.Replace("ğ", "g");
            strSonuc = strSonuc.Replace("Ğ", "G");
            strSonuc = strSonuc.Replace("ı", "i");
            strSonuc = strSonuc.Replace("I", "i");
            strSonuc = strSonuc.Replace("ç", "c");
            strSonuc = strSonuc.Replace("ç", "C");
            strSonuc = strSonuc.Replace("ö", "o");
            strSonuc = strSonuc.Replace("Ö", "O");
            strSonuc = strSonuc.Replace("ü", "u");
            strSonuc = strSonuc.Replace("Ü", "U");
            strSonuc = strSonuc.Replace("`", "");
            strSonuc = strSonuc.Replace("=", "");
            strSonuc = strSonuc.Replace("&", "");
            strSonuc = strSonuc.Replace("%", "");
            strSonuc = strSonuc.Replace("#", "");
            strSonuc = strSonuc.Replace("<", "");
            strSonuc = strSonuc.Replace(">", "");
            strSonuc = strSonuc.Replace("*", "");
            strSonuc = strSonuc.Replace("?", "");
            strSonuc = strSonuc.Replace("+", "-");
            strSonuc = strSonuc.Replace("\"", "-");
            strSonuc = strSonuc.Replace("»", "-");
            strSonuc = strSonuc.Replace("|", "-");
            strSonuc = strSonuc.Replace("^", "");
            return strSonuc;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}