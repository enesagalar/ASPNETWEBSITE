using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class satiliklar : System.Web.UI.Page
{
    veritabaniislemleri vtislemler = new veritabaniislemleri();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {

            //genelayarlar başlangıç
            var sayfaayarlari = new string[12];
            sayfaayarlari = vtislemler.genelayarlar();
            Page.Title = sayfaayarlari[7];

            HtmlMeta MetaKeywords = new HtmlMeta();
            //Keywords için Meta tag nesnemizi oluşturuyoruz ve nesnemize name ve content niteliklerini ekliyoruz
            MetaKeywords.Attributes.Add("name", "Keywords");
            MetaKeywords.Attributes.Add("content", sayfaayarlari[6]);
            //Şimdi oluşturduğumuz meta yı header kısmına ekliyoruz
            Header.Controls.Add(MetaKeywords);


            //Description için Meta tag nesnemizi oluşturuyoruz ve nesnemize name ve content niteliklerini ekliyoruz
            HtmlMeta MetaDescription = new HtmlMeta();
            MetaDescription.Attributes.Add("name", "Description");
            MetaDescription.Attributes.Add("content", sayfaayarlari[5]);
            Header.Controls.Add(MetaDescription);

            firmaadi.InnerHtml = "<span>" + sayfaayarlari[0] + "</span> ";
            slogan.InnerHtml = sayfaayarlari[1];
         
            //genelayarlar bitiş


            anamenu.InnerHtml = vtislemler.anamenu();//anamenü
            anamenualt.InnerHtml = vtislemler.anamenu();//sayfanın altındaki anamenü

            sosyalsitebaglantilariust.InnerHtml = vtislemler.sosyalsitebaglantilari();
            sosyalsitebaglantilarialt.InnerHtml = vtislemler.sosyalsitebaglantilari();


            bool uyegirisyaptimi = false;
            if (Session["UyeID"] != null)//Session UyeID varsa, yani kullanıcı giriş işlemi başarı ile gerçekleşmişse
            {

                kullanicipaneli.Visible = true;
                lblkullaniciadi.Text = "  " + vtislemler.verigetir("select top 1 KullaniciAdi from Kullanicilar where KullaniciID='" + Session["UyeID"] + "'", "KullaniciAdi") + " olarak giriş yaptınız.";
                uyegirisyaptimi = true;
            }
            else
            {
                kullanicipaneli.Visible = false;
            }
            //satılık listesi başlangıç

            if (RouteData.Values["Kid"] != null)//Link ile gelen Sid varsa
            {
                if (vtislemler.sql(RouteData.Values["Kid"].ToString()) != -1)//sql injection riski yok
                {

                    if (vtislemler.varmi("select top 1 KategoriID from Kategoriler where Ad='" + RouteData.Values["Kid"] + "'") == true)//Veritabanındaki Kategoriler tablosunda Kid ile gelen KategoriID ye sahip kayıt var mı? Varsa if çalışşacak, yoksa else çalışacak
                    {
                        string ketegoriid = vtislemler.verigetir("select KategoriID from Kategoriler where Ad='" + RouteData.Values["Kid"].ToString() + "'", "KategoriID");
                        string liste= vtislemler.satiliklistesi(uyegirisyaptimi, ketegoriid);
                        if (liste == "")
                        {
                            satiliklistesi.InnerHtml = "<li><div style=\"height: auto; max-width: 900px; margin: 0px auto; padding: 0px; border: 1px solid silver; padding: 10px; text-align: center;\" class=\"alert alert-danger\"><img src=\"/assets/images/dikkat.png\" width=\"80px\"/><h4 style=\"line-height: 30px; letter-spacing: 1px; font-size: 16px;\">Seçilen kategoriye ait satılık bulunmamaktadır!!!</h4></div></li>";
                        }
                        else
                        {
                            satiliklistesi.InnerHtml = liste;
                        }
                    }
                    else
                    {
                        Response.Redirect("hatasayfasi.aspx");
                    }
                }
                else
                {
                    Response.Redirect("hatasayfasi.aspx");
                }
            }
            else
            {
                satiliklistesi.InnerHtml = vtislemler.satiliklistesi(uyegirisyaptimi, null);
            }

            //satılık listesi bitiş

            //satılık listesi başlangıç
            kategoriler.InnerHtml = vtislemler.kategoriler("Satılıklar");
            //satılık listesi bitiş

            //son eklenen satılıklar başlangıç
            son.InnerHtml = vtislemler.soneklenensatiliklar();
            //son eklenen satılıklar bitiş

            //çok görüntülenen satılıklar başlangıç
            cok.InnerHtml = vtislemler.cokgoruntulenensatiliklar();
            //çok görüntülenen satılıklar bitiş
        }

    }





    protected void btnguvenlicikis_Click(object sender, EventArgs e)
    {
        Session.Remove("UyeID");
        Response.Redirect("/satılıklar");
    }
}