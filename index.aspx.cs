using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class index : System.Web.UI.Page
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
            if (sayfaayarlari[2].Length > 300)
            {
                hakkimizdayazisi.InnerHtml = sayfaayarlari[2].ToString().Substring(0, 300) + "... Devamı için <a href=\"hakkimizda\">tıklayınız.</a>";
            }
            else
            {
                hakkimizdayazisi.InnerHtml = sayfaayarlari[2];
            }

            if (sayfaayarlari[3].Length > 300)
            {
                vizyonumuzyazisi.InnerHtml = sayfaayarlari[3].ToString().Substring(0, 300) + "... Devamı için <a href=\"hakkimizda\">tıklayınız.</a>";
            }
            else
            {
                vizyonumuzyazisi.InnerHtml = sayfaayarlari[3];
            }

            if (sayfaayarlari[4].Length > 300)
            {
                misyonumuzyazisi.InnerHtml = sayfaayarlari[4].ToString().Substring(0, 300) + "... Devamı için <a href=\"hakkimizda\">tıklayınız.</a>";
            }
            else
            {
                misyonumuzyazisi.InnerHtml = sayfaayarlari[4];
            }
            
            //genelayarlar bitiş


            anamenu.InnerHtml = vtislemler.anamenu();//anamenü
            anamenualt.InnerHtml = vtislemler.anamenu();//sayfanın altındaki anamenü

            sosyalsitebaglantilariust.InnerHtml = vtislemler.sosyalsitebaglantilari();
            sosyalsitebaglantilarialt.InnerHtml = vtislemler.sosyalsitebaglantilari();

            slayt.InnerHtml = vtislemler.slaytgosterisi();

            second_slider.InnerHtml = vtislemler.sonprojeler();

            //Anketler tablosundaki Durum='Aktif' olan anketin AnketID verisini buldum.
            string aktifanketid = vtislemler.verigetir("select AnketID from Anketler where Durum='Aktif'", "AnketID");
            //Üst satırda bulduğum AnketID ye sahip soruyu AnketSoruları tablosundan buldum ve id, runat="server" özelliklerini verdiğim etikete gönderdim.
            anketsorusu.InnerHtml = vtislemler.verigetir("select Soru from AnketSorulari where AnketID='" + aktifanketid + "'", "Soru");
            //cevaplar için eklediğim rbtnlanketcevaplari id sine sahip radiobuttonlist içine bulduğum AnketID ye sahip cevapları doldurdum.
            vtislemler.rbtnllist_aktar("select Cevap from AnketCevaplari where AnketID='" + aktifanketid + "' order by Siralama", rbtnlanketcevaplari);
            rbtnlanketcevaplari.ClearSelection();
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

    protected void btncevapgonder_Click(object sender, EventArgs e)
    {
        //Anketler tablosundaki Durum='Aktif' olan anketin AnketID verisini buldum.
        string aktifanketid = vtislemler.verigetir("select AnketID from Anketler where Durum='Aktif'", "AnketID");
        //seçilen cevaba ait CevapID verisini buldum.
        string secilencevapid = vtislemler.verigetir("select CevapID from AnketCevaplari where AnketID='" + aktifanketid + "' and Cevap='" + rbtnlanketcevaplari.SelectedItem.Text + "'", "CevapID");
        //bulduğum CevapID ye sahip cevabın CevapAdet alanındaki değerini 1 artırarak update ettim.
        vtislemler.ekle_sil_guncelle("update AnketCevaplari set CevapAdet=CevapAdet+1 where CevapID='" + secilencevapid + "'");
        rbtnlanketcevaplari.ClearSelection();
        lblislemtamam.Visible = true;
        anketsorusu.Visible = false;
        rbtnlanketcevaplari.Visible = false;
        btncevapgonder.Visible = false;
        if (Timer1.Enabled == true)
        {
            Timer1.Enabled = false;
        }
        else
        {
            Timer1.Enabled = true;
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Timer1.Enabled = false;
        lblislemtamam.Visible = false;
        anketsorusu.Visible = true;
        rbtnlanketcevaplari.Visible = true;
        btncevapgonder.Visible = true;
    }

    protected void btnguvenlicikis_Click(object sender, EventArgs e)
    {
        Session.Remove("UyeID");
        Response.Redirect("index.aspx");
    }
}