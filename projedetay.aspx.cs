using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class projedetay : System.Web.UI.Page
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


            //proje detay bilgileri başlangıç
            if (RouteData.Values["Pid"] != null)//Link ile gelen Pid varsa
            {
                if (vtislemler.sql(RouteData.Values["Pid"].ToString()) != -1)//sql injection riski yok
                {

                    if (vtislemler.varmi("select top 1 ProjeID from Projeler where ProjeID='" + RouteData.Values["Pid"] + "'") == true)//Veritabanındaki Projeler tablosunda Pid ile gelen ProjeID ye sahip kayıt var mı? Varsa if çalışşacak, yoksa else çalışacak
                    {
                        var projenindetaybilgileri = new string[5];
                        string projeid = RouteData.Values["Pid"].ToString();
                        projenindetaybilgileri = vtislemler.projedetaybilgileri(projeid);
                        baslik.InnerHtml = projenindetaybilgileri[0];
                        eklenmetarihi.InnerHtml = "<i class=\"fa fa-clock-o\"></i> Eklenme Tarihi: " + Convert.ToDateTime(projenindetaybilgileri[2]).ToString("dd MMMM yyyy") + "";
                        goruntulenmesayisi.InnerHtml = "<i class=\"fa fa-link\"></i> Görüntülenme Sayısı: " + projenindetaybilgileri[3] + "";
                        lbtnbegen.Text = "<i class=\"fa fa-heart-o\"></i>Beğenilme Sayısı: " + projenindetaybilgileri[4] + "";
                        projeaciklamasi.InnerHtml = projenindetaybilgileri[1];
                        System.IO.DirectoryInfo projeresimklasorumuz = new System.IO.DirectoryInfo(Server.MapPath("/assets/images/projeler/" + projeid + "/"));//projeye ait resimleri barındıran klasörü buluyoruz.
                        System.IO.FileInfo[] projeresimleri = projeresimklasorumuz.GetFiles();//proje resimlerini içeren klasörün içindeki resimleri bir diziye aktarıyoruz.
                        string strdataprojeresimleri = "";
                        foreach (System.IO.FileInfo file in projeresimleri)//projeresimleri dizisi içinde döngüyle dönerek slayt gösterisi için gerekli html etiket yapısını oluşturuyoruz.
                        {
                            strdataprojeresimleri += "<div class=\"col-md-3\"><a class=\"group4 col-md-12\" style=\"padding:10px; \" href=\"/assets/images/projeler/" + projeid + "/" + file.Name + "\" title=\"" + projenindetaybilgileri[0] + "\"><img src=\"/assets/images/projeler/" + projeid + "/" + file.Name + "\" class=\"col-md-12 img-rounded img-responsive\"/></a></div>";
                        }
                        projeresimlerislayt.InnerHtml = strdataprojeresimleri;//oluşturduğumuz html etiket yapısını projeresimlerislayt id si verdiğimiz div içerisine gönderiyoruz.
                        vtislemler.ekle_sil_guncelle("update Projeler set GoruntulenmeSayisi=GoruntulenmeSayisi+1 where ProjeID='" + projeid + "'");//projeye ait tüm bilgiler görüntülendiği için projenin görüntülenme sayısını 1 artırıyoruz.
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



            //proje detay bilgileri bitiş
        }

    }




    protected void btnguvenlicikis_Click(object sender, EventArgs e)
    {
        Session.Remove("UyeID");
        Response.Redirect("/Projeler/" + vtislemler.verigetir("select Baslik from Projeler where ProjeID='" + RouteData.Values["Pid"].ToString() + "'", "Baslik").Replace(" ", "-") + "/" + RouteData.Values["Pid"].ToString() + "");
    }

    protected void btnbegen_Click(object sender, EventArgs e)
    {
        string projeid = RouteData.Values["Pid"].ToString();
        vtislemler.ekle_sil_guncelle("update Projeler set BegenilmeSayisi=BegenilmeSayisi+1 where ProjeID='" + projeid + "'");
        lbtnbegen.Text = "<i class=\"fa fa-heart-o\"></i>Beğenilme Sayısı: " + vtislemler.verigetir("select BegenilmeSayisi from Projeler where ProjeID='" + projeid + "'", "BegenilmeSayisi") + "";
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Timer1.Enabled = false;

    }
}