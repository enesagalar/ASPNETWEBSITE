using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class satilikdetay : System.Web.UI.Page
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


            //satılık detay bilgileri başlangıç
            if (RouteData.Values["Sid"] != null)//Link ile gelen Sid varsa
            {
                if (vtislemler.sql(RouteData.Values["Sid"].ToString()) != -1)//sql injection riski yok
                {

                    if (vtislemler.varmi("select top 1 SatilikID from Satiliklar where SatilikID='" + RouteData.Values["Sid"].ToString() + "'") == true)//Veritabanındaki Satiliklar tablosunda Sid ile gelen SatilikID ye sahip kayıt var mı? Varsa if çalışşacak, yoksa else çalışacak
                    {
                        var detaybilgileri = new string[8];
                        string satilikid = RouteData.Values["Sid"].ToString();
                        detaybilgileri = vtislemler.satilikdetaybilgileri(satilikid);
                        baslik.InnerHtml = detaybilgileri[0];
                        eklenmetarihi.InnerHtml = "<i class=\"fa fa-clock-o\"></i> Eklenme Tarihi: " + Convert.ToDateTime(detaybilgileri[2]).ToString("dd MMMM yyyy") + "";
                        goruntulenmesayisi.InnerHtml = "<i class=\"fa fa-link\"></i> Görüntülenme Sayısı: " + detaybilgileri[3] + "";
                        konum.InnerHtml = "<i class=\"fa fa-map-marker\"></i> " + detaybilgileri[4]+"-"+ detaybilgileri[5] + "";
                        kategori.InnerHtml = "<i class=\"fa fa-building-o\"></i> " + detaybilgileri[7] + "";
                        if (Session["UyeID"] != null)//Session UyeID varsa, yani kullanıcı giriş işlemi başarı ile gerçekleşmişse
                        {
                            fiyat.InnerHtml = "<i class=\"fa fa-money\"></i> " + detaybilgileri[6] + "";
                        }
                        else
                        {
                            fiyat.InnerHtml = "<i class=\"fa fa-money\"></i> Üyelere Özel!!!";
                        }
                        aciklama.InnerHtml = detaybilgileri[1];
                        try
                        {
                            System.IO.DirectoryInfo satilikresimklasorumuz = new System.IO.DirectoryInfo(Server.MapPath("/assets/images/satiliklar/" + satilikid + "/"));//satılığa ait resimleri barındıran klasörü buluyoruz.
                            System.IO.FileInfo[] satilikresimleri = satilikresimklasorumuz.GetFiles();//satılık resimlerini içeren klasörün içindeki resimleri bir diziye aktarıyoruz.
                            string strdatasatilikresimleri = "";
                            foreach (System.IO.FileInfo file in satilikresimleri)//satilikresimleri dizisi içinde döngüyle dönerek slayt gösterisi için gerekli html etiket yapısını oluşturuyoruz.
                            {
                                strdatasatilikresimleri += "<div class=\"col-md-3\"><a class=\"group4 col-md-12\" style=\"padding:10px; \" href=\"/assets/images/satiliklar/" + satilikid + "/" + file.Name + "\" title=\"" + detaybilgileri[0] + "\"><img src=\"/assets/images/satiliklar/" + satilikid + "/" + file.Name + "\" class=\"col-md-12 img-rounded img-responsive\"/></a></div>";
                            }
                            satilikresimlerislayt.InnerHtml = strdatasatilikresimleri;//oluşturduğumuz html etiket yapısını satilikresimlerislayt id si verdiğimiz div içerisine gönderiyoruz.
                        }
                        catch
                        {
                            satilikresimlerislayt.InnerHtml = "Resim yükleme hatası!!!";
                        }
                        vtislemler.ekle_sil_guncelle("update Satiliklar set GoruntulenmeSayisi=GoruntulenmeSayisi+1 where SatilikID='" + satilikid + "'");//Satılığa ait tüm bilgiler görüntülendiği için satılığın görüntülenme sayısını 1 artırıyoruz.
                    }
                    else
                    {
                        Response.Redirect("hatasayfasi.aspx");
                    }
                }
                else//sql injection riski var
                {
                    Response.Redirect("hatasayfasi.aspx");
                }

            }
            else//Link ile gelen Pid yoksa
            {
                Response.Redirect("hatasayfasi.aspx");
            }



            //satılık detay bilgileri bitiş
        }

    }




    protected void btnguvenlicikis_Click(object sender, EventArgs e)
    {
        Session.Remove("UyeID");
        Response.Redirect("/Satılıklar/"+vtislemler.verigetir("select Baslik from Satiliklar where SatilikID='"+ RouteData.Values["Sid"].ToString() + "'","Baslik").Replace(" ", "-") + "/" + RouteData.Values["Sid"].ToString() + "");
    }

   
    
}