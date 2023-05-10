using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class uyekayit : System.Web.UI.Page
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

            if (Session["UyeID"] != null)//Session UyeID varsa, yani kullanıcı giriş işlemi başarı ile gerçekleşmişse
            {

                kullanicipaneli.Visible = true;
                lblkullaniciadi.Text = "  " + vtislemler.verigetir("select top 1 KullaniciAdi from Kullanicilar where KullaniciID='" + Session["UyeID"] + "'", "KullaniciAdi") + " olarak giriş yaptınız.";
            }
            else
            {
                kullanicipaneli.Visible = false;
            }
        }

    }

    protected void btnkayit_Click(object sender, EventArgs e)
    {
        string kullaniciadi = tbkullaniciadi.Text;
        string parola = tbparola.Text;
        string adsoyad = tbadsoyad.Text;
        string eposta = tbeposta.Text;
        if (vtislemler.varmi("select top 1 KullaniciID from Kullanicilar where KullaniciAdi='" + kullaniciadi + "'") == true)//girilen kullanıcıadına sahip önceden kayıtlı bir kullanıcı varmı?
        {
            lblkullaniciadiuygundegil.Visible = true;
            lblislemtamamdegil.Visible = false;
            lblislemtamam.Visible = false;
        }
        else
        {
            try
            {
                vtislemler.ekle_sil_guncelle("insert into Kullanicilar (KullaniciAdi,EPosta,Parola,AdSoyad) values ('"+kullaniciadi+"','"+eposta+"','"+parola+"','"+adsoyad+"')");
                lblislemtamam.Visible = true;
                lblislemtamamdegil.Visible = false;
                lblkullaniciadiuygundegil.Visible = false;
                if (Timer1.Enabled == true)
                {
                    Timer1.Enabled = false;
                }
                else
                {
                    Timer1.Enabled = true;
                }
            }
            catch
            {
                lblislemtamam.Visible = false;
                lblislemtamamdegil.Visible = true;
                lblkullaniciadiuygundegil.Visible = false;
               
            }
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Timer1.Enabled = false;
        lblislemtamam.Visible = false;
        lblislemtamamdegil.Visible = false;
        lblkullaniciadiuygundegil.Visible = false;
        Response.Redirect("uyekayit");
    }
    protected void btnguvenlicikis_Click(object sender, EventArgs e)
    {
        Session.Remove("UyeID");
        Response.Redirect("uyekayit");
    }
}