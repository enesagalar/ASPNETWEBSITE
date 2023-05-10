<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Collections.Specialized" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Web.Routing" %>
<script RunAt="server">
    veritabaniislemleri vtislemler = new veritabaniislemleri();

    public void RegisterRoutes(RouteCollection routes)
    {
        //ben kendi projeme uygun olarak kodları yazdım. Siz kendi projenize uygun olarak aşağıdaki kodları optimize etmelisiniz.

        //Anamenu ve Altmenü içerisinde yer alan linklere url routing uyguluyorum.
        DataTable dturlroutesanamenutr = vtislemler.DataTableGetir("select * from AnaMenu");
        for (int i = 0; i < dturlroutesanamenutr.Rows.Count; i++)//for döngüsüyle anamenu tablomuz içinde dönerek linklere url routing uyguluyoruz.
        {
            string donusturulmus = vtislemler.UrlDonustur(dturlroutesanamenutr.Rows[i]["MenuAdi"].ToString().ToLower());//menu adları içindeki Türkçe karakterler yerine İngiliz alfabesindeki karşılıklarını yerleştiriyoruz. Arama motorları Türkçe karakterleri  algılayamayabilir.
            routes.MapPageRoute("" + dturlroutesanamenutr.Rows[i]["MenuAdi"].ToString() + i.ToString() + "", donusturulmus + "", "~/" + dturlroutesanamenutr.Rows[i]["AcacagiSayfa"].ToString() + "");
            //routes.MapPageRoute("UrlRoute adı, diğerlerinden farklı bir isim olmalı", "mevcut linke karşılık gelecek Url örneğin anasayfa", "mevcut link örneğin index.aspx"); 
            //Bu yapıya dikkat ederek tüm anasayfa elemanlarına ait url route ları oluşturuyoruz.
            //Bu aşamadan sonra anamenu ve altmenuyü oluşturan fonksiyonumuzda gerekli ayarlamaları yapmamız gerekiyor. Bakınız veritabaniislemleri.cs dosyası satır 196,197
        }
        //Anamenu ve Altmenü içerisinde yer alan linklere url routing uygulama işlemi bitti.

        //Projemde yer alan diğer sayfalara url routing uyguluyorum
        routes.MapPageRoute("HataSayfasi", "Hata", "~/hatasayfasi.aspx");
        routes.MapPageRoute("Uyegiris", "uyegiris", "~/uyegiris.aspx");
        routes.MapPageRoute("UyeKayit", "uyekayit", "~/uyekayit.aspx");
        routes.MapPageRoute("AnketSonuclari", "anketsonuclari", "~/anketsonuclari.aspx");
        routes.MapPageRoute("ProjeDetay", "Projeler/{Baslik}/{Pid}", "~/projedetay.aspx");
        routes.MapPageRoute("SatilikDetay", "Satiliklar/{Baslik}/{Sid}", "~/satilikdetay.aspx");
        routes.MapPageRoute("KiralikDetay", "Kiraliklar/{Baslik}/{Kiid}", "~/kiralikdetay.aspx");
        routes.MapPageRoute("Satiliklar", "Satiliklar/{Kid}", "~/satiliklar.aspx");
        routes.MapPageRoute("Kiraliklar", "Kiraliklar/{Kid}", "~/kiraliklar.aspx");
        //Projemde yer alan diğer sayfalara url routing uygulama işlemi bitti.
    }

    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);
    }

    void Session_Start(object sender, EventArgs e)
    {
        Session.Timeout = 5;
    }

    void Session_End(object sender, EventArgs e)
    {

    }
    void Application_End(object sender, EventArgs e)
    {

    }
    protected void Application_BeginRequest(object sender, EventArgs e)
    {


    }





</script>
