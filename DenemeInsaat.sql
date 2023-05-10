-- SQL Manager Lite for SQL Server 4.1.1.46173
-- ---------------------------------------
-- Host      : .\SQLEXPRESS
-- Database  : DenemeInsaat
-- Version   : Microsoft SQL Server 2017 (RTM 14.0.2027.2


--
-- Definition for table Anamenu : 
--

CREATE TABLE dbo.Anamenu (
  MenuID uniqueidentifier DEFAULT newid() NOT NULL,
  MenuAdi nvarchar(max) COLLATE Turkish_CI_AS NULL,
  AcacagiSayfa nvarchar(max) COLLATE Turkish_CI_AS NULL,
  AcilisSekli nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Siralama int NULL,
  PRIMARY KEY CLUSTERED (MenuID)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table AnketCevaplari : 
--

CREATE TABLE dbo.AnketCevaplari (
  CevapID uniqueidentifier DEFAULT newid() NOT NULL,
  AnketID uniqueidentifier NULL,
  Cevap nvarchar(max) COLLATE Turkish_CI_AS NULL,
  CevapAdet int DEFAULT 0 NULL,
  Siralama int NULL,
  PRIMARY KEY CLUSTERED (CevapID)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table Anketler : 
--

CREATE TABLE dbo.Anketler (
  AnketID uniqueidentifier DEFAULT newid() NOT NULL,
  Durum nvarchar(max) COLLATE Turkish_CI_AS DEFAULT 'Pasif' NULL,
  Baslik varchar(max) COLLATE Turkish_CI_AS NULL,
  PRIMARY KEY CLUSTERED (AnketID)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table AnketSorulari : 
--

CREATE TABLE dbo.AnketSorulari (
  AnketID uniqueidentifier NULL,
  SoruID uniqueidentifier DEFAULT newid() NOT NULL,
  Soru nvarchar(max) COLLATE Turkish_CI_AS NULL,
  PRIMARY KEY CLUSTERED (SoruID)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table GenelAyarlar : 
--

CREATE TABLE dbo.GenelAyarlar (
  AyarID uniqueidentifier DEFAULT newid() NOT NULL,
  FirmaAdi nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Slogan nvarchar(max) COLLATE Turkish_CI_AS NULL,
  HakkimizdaYazisi text COLLATE Turkish_CI_AS NULL,
  VizyonumuzYazisi text COLLATE Turkish_CI_AS NULL,
  MisyonumuzYazisi text COLLATE Turkish_CI_AS NULL,
  SiteOzeti text COLLATE Turkish_CI_AS NULL,
  AnahtarKelimeler text COLLATE Turkish_CI_AS NULL,
  SayfaBasliklari nvarchar(max) COLLATE Turkish_CI_AS NULL,
  MapHtml nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Adres varchar(max) COLLATE Turkish_CI_AS NULL,
  Telefon varchar(max) COLLATE Turkish_CI_AS NULL,
  EPosta varchar(max) COLLATE Turkish_CI_AS NULL,
  PRIMARY KEY CLUSTERED (AyarID)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Definition for table Hizmetler : 
--

CREATE TABLE dbo.Hizmetler (
  HizmetID uniqueidentifier CONSTRAINT DF_Hizmetler_ProjeID DEFAULT newid() NULL,
  Baslik nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Aciklamasi text COLLATE Turkish_CI_AS NULL,
  EklenmeZamani datetime CONSTRAINT DF_Hizmetler_EklenmeTarihi DEFAULT getdate() NULL,
  Resim varchar(max) COLLATE Turkish_CI_AS NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Definition for table Kategoriler : 
--

CREATE TABLE dbo.Kategoriler (
  KategoriID uniqueidentifier CONSTRAINT DF_Kategoriler_KategoriID DEFAULT newid() NULL,
  Ad nvarchar(max) COLLATE Turkish_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table Kiraliklar : 
--

CREATE TABLE dbo.Kiraliklar (
  KiralikID uniqueidentifier CONSTRAINT DF_Kiraliklar_SatilikID DEFAULT newid() NULL,
  Baslik nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Aciklamasi text COLLATE Turkish_CI_AS NULL,
  EklenmeZamani datetime CONSTRAINT DF_Kiraliklar_EklenmeZamani DEFAULT getdate() NULL,
  GoruntulenmeSayisi int CONSTRAINT DF_Kiraliklar_GoruntulenmeSayisi DEFAULT 0 NULL,
  Il nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Ilce nvarchar(max) COLLATE Turkish_CI_AS NULL,
  KategoriID uniqueidentifier NULL,
  Fiyat nvarchar(max) COLLATE Turkish_CI_AS NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Definition for table Kullanicilar : 
--

CREATE TABLE dbo.Kullanicilar (
  KullaniciID uniqueidentifier DEFAULT newid() NOT NULL,
  KullaniciAdi nvarchar(max) COLLATE Turkish_CI_AS NULL,
  EPosta nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Parola nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Durum nvarchar(max) COLLATE Turkish_CI_AS DEFAULT 'Onaylanmadı' NULL,
  AdSoyad nvarchar(max) COLLATE Turkish_CI_AS NULL,
  PRIMARY KEY CLUSTERED (KullaniciID)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table Mesajlar : 
--

CREATE TABLE dbo.Mesajlar (
  MesajID uniqueidentifier CONSTRAINT DF_Mesajlar_MesajID DEFAULT newid() NULL,
  AdSoyad nvarchar(max) COLLATE Turkish_CI_AS NULL,
  EPosta nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Mesaj text COLLATE Turkish_CI_AS NULL,
  EklenmeZamani datetime CONSTRAINT DF_Mesajlar_EklenmeZamani DEFAULT getdate() NULL,
  Durum nvarchar(max) COLLATE Turkish_CI_AS CONSTRAINT DF_Mesajlar_Durum DEFAULT 'Okunmadı' NULL,
  Cevap text COLLATE Turkish_CI_AS NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Definition for table Projeler : 
--

CREATE TABLE dbo.Projeler (
  ProjeID uniqueidentifier CONSTRAINT DF_Projeler_ProjeID DEFAULT newid() NULL,
  Baslik nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Aciklamasi text COLLATE Turkish_CI_AS NULL,
  EklenmeZamani datetime CONSTRAINT DF_Projeler_EklenmeTarihi DEFAULT getdate() NULL,
  GoruntulenmeSayisi int DEFAULT 0 NULL,
  BegenilmeSayisi int DEFAULT 0 NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Definition for table Satiliklar : 
--

CREATE TABLE dbo.Satiliklar (
  SatilikID uniqueidentifier CONSTRAINT DF_Satiliklar_SatilikID DEFAULT newid() NULL,
  Baslik nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Aciklamasi text COLLATE Turkish_CI_AS NULL,
  EklenmeZamani datetime CONSTRAINT DF_Satiliklar_EklenmeZamani DEFAULT getdate() NULL,
  GoruntulenmeSayisi int CONSTRAINT DF_Satiliklar_GoruntulenmeSayisi DEFAULT 0 NULL,
  Il nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Ilce nvarchar(max) COLLATE Turkish_CI_AS NULL,
  KategoriID uniqueidentifier NULL,
  Fiyat nvarchar(max) COLLATE Turkish_CI_AS NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Definition for table Slaytlar : 
--

CREATE TABLE dbo.Slaytlar (
  SlaytID uniqueidentifier DEFAULT newid() NOT NULL,
  Yazi text COLLATE Turkish_CI_AS NULL,
  Resim nvarchar(max) COLLATE Turkish_CI_AS NULL,
  EklenmeZamani datetime DEFAULT getdate() NULL,
  PRIMARY KEY CLUSTERED (SlaytID)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Definition for table SosyalSiteBaglantilari : 
--

CREATE TABLE dbo.SosyalSiteBaglantilari (
  MenuID uniqueidentifier DEFAULT newid() NOT NULL,
  SiteAdi nvarchar(max) COLLATE Turkish_CI_AS NULL,
  AcacagiSayfa nvarchar(max) COLLATE Turkish_CI_AS NULL,
  Siralama int NULL,
  Durum varchar(30) COLLATE Turkish_CI_AS DEFAULT 'Kapalı' NULL,
  PRIMARY KEY CLUSTERED (MenuID)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Data for table dbo.Anamenu  (LIMIT 0,500)
--

INSERT INTO dbo.Anamenu (MenuID, MenuAdi, AcacagiSayfa, AcilisSekli, Siralama)
VALUES 
  (N'{31B7942B-DE6B-42FF-A0D7-3C8966F1B623}', N'HİZMETLER', N'hizmetler.aspx', N'_self', 3)
GO

INSERT INTO dbo.Anamenu (MenuID, MenuAdi, AcacagiSayfa, AcilisSekli, Siralama)
VALUES 
  (N'{A2738376-A974-4D24-88D1-432F479F42E4}', N'HAKKIMIZDA', N'hakkimizda.aspx', N'_self', 2)
GO

INSERT INTO dbo.Anamenu (MenuID, MenuAdi, AcacagiSayfa, AcilisSekli, Siralama)
VALUES 
  (N'{10493778-B2FB-4B27-99AE-67F72BDBAAA6}', N'İLETİŞİM', N'iletisim.aspx', N'_self', 7)
GO

INSERT INTO dbo.Anamenu (MenuID, MenuAdi, AcacagiSayfa, AcilisSekli, Siralama)
VALUES 
  (N'{251264FE-804D-4FF6-9D87-6A02DEC486B4}', N'KİRALIKLAR', N'kiraliklar.aspx', N'_self', 5)
GO

INSERT INTO dbo.Anamenu (MenuID, MenuAdi, AcacagiSayfa, AcilisSekli, Siralama)
VALUES 
  (N'{614FC8A1-56FB-4806-84DF-793A203B5A58}', N'ANASAYFA', N'index.aspx', N'_self', 1)
GO

INSERT INTO dbo.Anamenu (MenuID, MenuAdi, AcacagiSayfa, AcilisSekli, Siralama)
VALUES 
  (N'{F8021923-1754-4FB8-BCB5-946F9474C005}', N'SATILIKLAR', N'satiliklar.aspx', N'_self', 4)
GO

INSERT INTO dbo.Anamenu (MenuID, MenuAdi, AcacagiSayfa, AcilisSekli, Siralama)
VALUES 
  (N'{CE260B5D-C3D8-4A84-A790-C34A6CFE9052}', N'PROJELER', N'projeler.aspx', N'_self', 6)
GO

--
-- Data for table dbo.AnketCevaplari  (LIMIT 0,500)
--

INSERT INTO dbo.AnketCevaplari (CevapID, AnketID, Cevap, CevapAdet, Siralama)
VALUES 
  (N'{8DD98D89-5761-400C-8D4A-0BF2CF200FCB}', N'{160AB739-208A-4180-9C7F-60F4B1DE6C61}', N'Evet', 16, 1)
GO

INSERT INTO dbo.AnketCevaplari (CevapID, AnketID, Cevap, CevapAdet, Siralama)
VALUES 
  (N'{F9E07D05-5887-4507-9449-407FDFA982DB}', N'{160AB739-208A-4180-9C7F-60F4B1DE6C61}', N'Hayır', 22, 2)
GO

INSERT INTO dbo.AnketCevaplari (CevapID, AnketID, Cevap, CevapAdet, Siralama)
VALUES 
  (N'{07A7582B-1AE4-4C97-BF70-5E884BED471B}', N'{160AB739-208A-4180-9C7F-60F4B1DE6C61}', N'Kararsızım', 57, 3)
GO

INSERT INTO dbo.AnketCevaplari (CevapID, AnketID, Cevap, CevapAdet, Siralama)
VALUES 
  (N'{2A78AAC5-F75E-4076-A028-B901E3060D9A}', N'{BB8B22A1-5965-462B-B63C-F79EEE4F12AD}', N'Olmaz', 11, 2)
GO

INSERT INTO dbo.AnketCevaplari (CevapID, AnketID, Cevap, CevapAdet, Siralama)
VALUES 
  (N'{6790ECA7-DAFC-41DE-B8C4-C2917C83D8AC}', N'{160AB739-208A-4180-9C7F-60F4B1DE6C69}', N'Hayır', 15, 2)
GO

INSERT INTO dbo.AnketCevaplari (CevapID, AnketID, Cevap, CevapAdet, Siralama)
VALUES 
  (N'{E57833E8-A7A6-4720-9798-DA4BB33A916D}', N'{160AB739-208A-4180-9C7F-60F4B1DE6C69}', N'Evet', 20, 1)
GO

INSERT INTO dbo.AnketCevaplari (CevapID, AnketID, Cevap, CevapAdet, Siralama)
VALUES 
  (N'{DAA6FC18-8742-42A6-98B4-DADB1D869FA7}', N'{BB8B22A1-5965-462B-B63C-F79EEE4F12AD}', N'Olur', 9, 1)
GO

--
-- Data for table dbo.Anketler  (LIMIT 0,500)
--

INSERT INTO dbo.Anketler (AnketID, Durum, Baslik)
VALUES 
  (N'{160AB739-208A-4180-9C7F-60F4B1DE6C61}', N'Aktif', N'Öğrenci Anketi')
GO

INSERT INTO dbo.Anketler (AnketID, Durum, Baslik)
VALUES 
  (N'{160AB739-208A-4180-9C7F-60F4B1DE6C69}', N'Pasif', N'Zoom Anketi')
GO

INSERT INTO dbo.Anketler (AnketID, Durum, Baslik)
VALUES 
  (N'{BB8B22A1-5965-462B-B63C-F79EEE4F12AD}', N'Pasif', N'Seçim Anketi')
GO

--
-- Data for table dbo.AnketSorulari  (LIMIT 0,500)
--

INSERT INTO dbo.AnketSorulari (AnketID, SoruID, Soru)
VALUES 
  (N'{BB8B22A1-5965-462B-B63C-F79EEE4F12AD}', N'{6A1B7AFC-F582-40DD-B5DE-3A9D671DED67}', N'Erken seçim olur mu?')
GO

INSERT INTO dbo.AnketSorulari (AnketID, SoruID, Soru)
VALUES 
  (N'{160AB739-208A-4180-9C7F-60F4B1DE6C69}', N'{9F94CCF3-AC74-48E1-885F-4D57AC3DD2C5}', N'Zoom derslerini faydalı buluyor musunuz?')
GO

INSERT INTO dbo.AnketSorulari (AnketID, SoruID, Soru)
VALUES 
  (N'{160AB739-208A-4180-9C7F-60F4B1DE6C61}', N'{ACBFA22C-A9C4-4D00-9FCD-B8DC31FA539C}', N'Okulunuzu özlediniz mi?')
GO

--
-- Data for table dbo.GenelAyarlar  (LIMIT 0,500)
--

INSERT INTO dbo.GenelAyarlar (AyarID, FirmaAdi, Slogan, HakkimizdaYazisi, VizyonumuzYazisi, MisyonumuzYazisi, SiteOzeti, AnahtarKelimeler, SayfaBasliklari, MapHtml, Adres, Telefon, EPosta)
VALUES 
  (N'{5E1AE031-815A-485F-A8E7-6363F34BE4A8}', N'Al Sana Firma Adı', N'Al Sana Slogan', N'Modern hayatı şekillendiren yeni keşiflerin öncülüğünü üstlenerek daha iyi bir yaşamın standartlarını oluşturmak için çalışan Doğuş Grubu, 1951 yılında kurulmuştur. Müşterilerinin yanı sıra çalışanları, iş ortakları ve hatta rakipleri için bir tutkuya dönüşecek, sınıfının en iyisi yaşam tarzı markalarını bünyesinde barındıran Doğuş, çalıştığı alanlarda küresel bir oyuncu olma hedefiyle çalışmalarına devam etmektedir.

Otomotiv; inşaat; medya; yeme-içme, turizm & perakende; gayrimenkul ve enerji olmak üzere altı ana sektörde faaliyet gösteren Doğuş Grubu ayrıca, mevcut hizmet verdiği sektörlerin yanı sıra teknoloji, spor ve eğlence alanındaki yeni yatırımlarıyla da büyümesini sürdürmektedir. Grup 300’ün üzerindeki şirketi ve 20 bini aşkın çalışanıyla müşterilerine üstün teknoloji, yüksek marka kalitesi ve dinamik bir insan kaynağı ile hizmet vermektedir.

Doğuş Grubu’nun ulaştığı başarının arkasında, müşteri odaklı ve verimliliği merkez alan bir yönetim yaklaşımı yer almaktadır. Bu yaklaşımın bir sonucu olarak, Grup dünya ölçeğinde saygın markalarla yaptığı iş birlikleriyle, Türkiye’yi bütün dünyada temsil etmektedir. Doğuş Grubu’nun, otomotivde Volkswagen AG ve TÜVSÜD, turizmde Hyatt International Ltd., marinacılıkta Latsis Grubu ve Kiriacoulis Grubu’nun yanı sıra yeme-içme sektöründe de bünyesinde Coya, Roka, Zuma ve Oblix gibi markaları bulunduran uluslararası Azumi Grubu ile Amazonico, Ten Con Ten, El Paraguas markalarına sahip Paraguas Group ve e-ticaret alanında Güney Koreli SK Group gibi büyük küresel oyuncularla işbirlikleri ve ortaklıkları bulunmaktadır.', N'Modern hayatı şekillendiren yeni keşiflerin öncülüğünü üstlenerek daha iyi bir yaşamın standartlarını oluşturmak için çalışan Doğuş Grubu, 1951 yılında kurulmuştur. Müşterilerinin yanı sıra çalışanları, iş ortakları ve hatta rakipleri için bir tutkuya dönüşecek, sınıfının en iyisi yaşam tarzı markalarını bünyesinde barındıran Doğuş, çalıştığı alanlarda küresel bir oyuncu olma hedefiyle çalışmalarına devam etmektedir.

Otomotiv; inşaat; medya; yeme-içme, turizm & perakende; gayrimenkul ve enerji olmak üzere altı ana sektörde faaliyet gösteren Doğuş Grubu ayrıca, mevcut hizmet verdiği sektörlerin yanı sıra teknoloji, spor ve eğlence alanındaki yeni yatırımlarıyla da büyümesini sürdürmektedir. Grup 300’ün üzerindeki şirketi ve 20 bini aşkın çalışanıyla müşterilerine üstün teknoloji, yüksek marka kalitesi ve dinamik bir insan kaynağı ile hizmet vermektedir.

Doğuş Grubu’nun ulaştığı başarının arkasında, müşteri odaklı ve verimliliği merkez alan bir yönetim yaklaşımı yer almaktadır. Bu yaklaşımın bir sonucu olarak, Grup dünya ölçeğinde saygın markalarla yaptığı iş birlikleriyle, Türkiye’yi bütün dünyada temsil etmektedir. Doğuş Grubu’nun, otomotivde Volkswagen AG ve TÜVSÜD, turizmde Hyatt International Ltd., marinacılıkta Latsis Grubu ve Kiriacoulis Grubu’nun yanı sıra yeme-içme sektöründe de bünyesinde Coya, Roka, Zuma ve Oblix gibi markaları bulunduran uluslararası Azumi Grubu ile Amazonico, Ten Con Ten, El Paraguas markalarına sahip Paraguas Group ve e-ticaret alanında Güney Koreli SK Group gibi büyük küresel oyuncularla işbirlikleri ve ortaklıkları bulunmaktadır.', N'Modern hayatı şekillendiren yeni keşiflerin öncülüğünü üstlenerek daha iyi bir yaşamın standartlarını oluşturmak için çalışan Doğuş Grubu, 1951 yılında kurulmuştur. Müşterilerinin yanı sıra çalışanları, iş ortakları ve hatta rakipleri için bir tutkuya dönüşecek, sınıfının en iyisi yaşam tarzı markalarını bünyesinde barındıran Doğuş, çalıştığı alanlarda küresel bir oyuncu olma hedefiyle çalışmalarına devam etmektedir.

Otomotiv; inşaat; medya; yeme-içme, turizm & perakende; gayrimenkul ve enerji olmak üzere altı ana sektörde faaliyet gösteren Doğuş Grubu ayrıca, mevcut hizmet verdiği sektörlerin yanı sıra teknoloji, spor ve eğlence alanındaki yeni yatırımlarıyla da büyümesini sürdürmektedir. Grup 300’ün üzerindeki şirketi ve 20 bini aşkın çalışanıyla müşterilerine üstün teknoloji, yüksek marka kalitesi ve dinamik bir insan kaynağı ile hizmet vermektedir.

Doğuş Grubu’nun ulaştığı başarının arkasında, müşteri odaklı ve verimliliği merkez alan bir yönetim yaklaşımı yer almaktadır. Bu yaklaşımın bir sonucu olarak, Grup dünya ölçeğinde saygın markalarla yaptığı iş birlikleriyle, Türkiye’yi bütün dünyada temsil etmektedir. Doğuş Grubu’nun, otomotivde Volkswagen AG ve TÜVSÜD, turizmde Hyatt International Ltd., marinacılıkta Latsis Grubu ve Kiriacoulis Grubu’nun yanı sıra yeme-içme sektöründe de bünyesinde Coya, Roka, Zuma ve Oblix gibi markaları bulunduran uluslararası Azumi Grubu ile Amazonico, Ten Con Ten, El Paraguas markalarına sahip Paraguas Group ve e-ticaret alanında Güney Koreli SK Group gibi büyük küresel oyuncularla işbirlikleri ve ortaklıkları bulunmaktadır.', N'Sanane', N'İnşaat, Tadilat, Anahtar Teslim Tadilat
', N'Onane123
', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3046.7822654272863!2d29.029342314755244!3d40.213906075874945!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNDDCsDEyJzUwLjEiTiAyOcKwMDEnNTMuNSJF!5e0!3m2!1str!2str!4v1592393094109!5m2!1str!2str" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', N'Adresim budur', N'Ara beni', N'Mail at bana')
GO

--
-- Data for table dbo.Hizmetler  (LIMIT 0,500)
--

INSERT INTO dbo.Hizmetler (HizmetID, Baslik, Aciklamasi, EklenmeZamani, Resim)
VALUES 
  (N'{D3FB1946-D0EE-48B2-A221-975F33D28B82}', N'Tadilat', N'Açıklama hazırlanıyor...', '20200428 18:08:15.490', N'news-thumb.png')
GO

INSERT INTO dbo.Hizmetler (HizmetID, Baslik, Aciklamasi, EklenmeZamani, Resim)
VALUES 
  (N'{535A017A-BE7C-4979-8128-CCF13626A3D5}', N'Satış', N'Açıklama hazırlanıyor...', '20200428 18:08:28.240', N'news-thumb_sml.png')
GO

INSERT INTO dbo.Hizmetler (HizmetID, Baslik, Aciklamasi, EklenmeZamani, Resim)
VALUES 
  (N'{E81E5D4D-DD7A-4D77-B402-B2F1FBBFC0E4}', N'Anahtar Teslim Onarım', N'Açıklama hazırlanıyor...', '20200428 18:09:38.333', N'news-thumb2.png')
GO

INSERT INTO dbo.Hizmetler (HizmetID, Baslik, Aciklamasi, EklenmeZamani, Resim)
VALUES 
  (N'{6AA7B769-CFB5-405C-9AFB-D9CDFAAB4F32}', N'Boya-Badana', N'Açıklama hazırlanıyor...', '20200428 18:10:11.847', N'news-thumb4.png')
GO

--
-- Data for table dbo.Kategoriler  (LIMIT 0,500)
--

INSERT INTO dbo.Kategoriler (KategoriID, Ad)
VALUES 
  (N'{43EA1C05-AA20-4222-ADA7-A3E4B825F88B}', N'Konut')
GO

INSERT INTO dbo.Kategoriler (KategoriID, Ad)
VALUES 
  (N'{15B85889-82F2-4349-B89C-403D72C93DB3}', N'Arsa')
GO

INSERT INTO dbo.Kategoriler (KategoriID, Ad)
VALUES 
  (N'{065A9DA0-8EEB-4F38-8894-B2922AAAE187}', N'Tarla')
GO

--
-- Data for table dbo.Kiraliklar  (LIMIT 0,500)
--

INSERT INTO dbo.Kiraliklar (KiralikID, Baslik, Aciklamasi, EklenmeZamani, GoruntulenmeSayisi, Il, Ilce, KategoriID, Fiyat)
VALUES 
  (N'{ED1A0502-D7C5-4182-8091-B41620F2CC10}', N'Eşyalı Lüks Daire', N'Açıklama gelecek', '20200622 10:33:18.913', 27, N'Bursa', N'Nilüfer', N'{43EA1C05-AA20-4222-ADA7-A3E4B825F88B}', N'550000 TL')
GO

--
-- Data for table dbo.Kullanicilar  (LIMIT 0,500)
--

INSERT INTO dbo.Kullanicilar (KullaniciID, KullaniciAdi, EPosta, Parola, Durum, AdSoyad)
VALUES 
  (N'{5C482DE0-BD0C-494B-B027-272578C79A2C}', N'sb', NULL, N'123', N'Onaylanmadı', NULL)
GO

INSERT INTO dbo.Kullanicilar (KullaniciID, KullaniciAdi, EPosta, Parola, Durum, AdSoyad)
VALUES 
  (N'{5081A516-E021-450F-B427-2ECB5609A0D3}', N'burak', NULL, N'000', N'Onaylandı', NULL)
GO

INSERT INTO dbo.Kullanicilar (KullaniciID, KullaniciAdi, EPosta, Parola, Durum, AdSoyad)
VALUES 
  (N'{11FEEBE7-187F-4B7B-8F2B-A915F5293A1A}', N'sedat', NULL, N'111', N'Onaylandı', NULL)
GO

INSERT INTO dbo.Kullanicilar (KullaniciID, KullaniciAdi, EPosta, Parola, Durum, AdSoyad)
VALUES 
  (N'{ED1A0502-D7C5-4182-8091-B41620F2CC10}', N'sbıyık', N'sedat.biyik@hotmail.com', N'159', N'Onaylanmadı', N'Sedat BIYIK')
GO

INSERT INTO dbo.Kullanicilar (KullaniciID, KullaniciAdi, EPosta, Parola, Durum, AdSoyad)
VALUES 
  (N'{5187B268-89F3-453D-88FE-BBB3B5E72D62}', N'yusuf', NULL, N'321', N'Onaylanmadı', NULL)
GO

INSERT INTO dbo.Kullanicilar (KullaniciID, KullaniciAdi, EPosta, Parola, Durum, AdSoyad)
VALUES 
  (N'{20672246-2738-4340-9743-E6033C1886F0}', N'sedatbıyık', N's@b.com', N'159', N'Onaylanmadı', N'Sedat')
GO

--
-- Data for table dbo.Mesajlar  (LIMIT 0,500)
--

INSERT INTO dbo.Mesajlar (MesajID, AdSoyad, EPosta, Mesaj, EklenmeZamani, Durum, Cevap)
VALUES 
  (N'{840C1D25-C8A5-4726-A7DF-C9555B7FA790}', N'Sedat BIYIK', N'sedat.biyik@hotmail.com', N'Mesaj Deneme', '20200617 13:49:58.017', N'Okunmadı', NULL)
GO

INSERT INTO dbo.Mesajlar (MesajID, AdSoyad, EPosta, Mesaj, EklenmeZamani, Durum, Cevap)
VALUES 
  (N'{A73C7C52-E92C-45F8-8165-85F0B47BBFE3}', N'Sedat BIYIK', N'sedat.biyik@hotmail.com', N'Mesaj Deneme', '20200617 13:51:04.223', N'Okunmadı', NULL)
GO

INSERT INTO dbo.Mesajlar (MesajID, AdSoyad, EPosta, Mesaj, EklenmeZamani, Durum, Cevap)
VALUES 
  (N'{27D04A52-14C9-4206-AD1B-18FA7829FE4C}', N'ss', N'ss@ss.com', N'ss', '20200617 14:14:01.027', N'Okunmadı', NULL)
GO

INSERT INTO dbo.Mesajlar (MesajID, AdSoyad, EPosta, Mesaj, EklenmeZamani, Durum, Cevap)
VALUES 
  (N'{39661C19-2B60-42AD-B006-604561096AA3}', N's', N's@a.com', N'a', '20200617 14:14:21.510', N'Okunmadı', NULL)
GO

INSERT INTO dbo.Mesajlar (MesajID, AdSoyad, EPosta, Mesaj, EklenmeZamani, Durum, Cevap)
VALUES 
  (N'{5A976046-DF14-419F-A707-5F4B8EDFA30D}', N'd', N'd@f.com', N'd', '20200617 14:15:06.860', N'Okunmadı', NULL)
GO

INSERT INTO dbo.Mesajlar (MesajID, AdSoyad, EPosta, Mesaj, EklenmeZamani, Durum, Cevap)
VALUES 
  (N'{8FA35448-D5FF-4633-B04F-99EE3C0321C8}', N'a', N'a@a.com', N'a', '20200627 16:27:22.137', N'Okunmadı', NULL)
GO

--
-- Data for table dbo.Projeler  (LIMIT 0,500)
--

INSERT INTO dbo.Projeler (ProjeID, Baslik, Aciklamasi, EklenmeZamani, GoruntulenmeSayisi, BegenilmeSayisi)
VALUES 
  (N'{D3FB1946-D0EE-48B2-A221-975F33D28B82}', N'Uludağ Evleri 1', N'Açıklama hazırlanıyor...', '20200428 18:08:15.490', 13, 22)
GO

INSERT INTO dbo.Projeler (ProjeID, Baslik, Aciklamasi, EklenmeZamani, GoruntulenmeSayisi, BegenilmeSayisi)
VALUES 
  (N'{535A017A-BE7C-4979-8128-CCF13626A3D5}', N'Uludağ Evleri 2', N'Açıklama hazırlanıyor...', '20200428 18:08:28.240', 36, 42)
GO

INSERT INTO dbo.Projeler (ProjeID, Baslik, Aciklamasi, EklenmeZamani, GoruntulenmeSayisi, BegenilmeSayisi)
VALUES 
  (N'{E81E5D4D-DD7A-4D77-B402-B2F1FBBFC0E4}', N'Uludağ Evleri 3', N'Açıklama hazırlanıyor...', '20200428 18:09:38.333', 118, 87)
GO

INSERT INTO dbo.Projeler (ProjeID, Baslik, Aciklamasi, EklenmeZamani, GoruntulenmeSayisi, BegenilmeSayisi)
VALUES 
  (N'{6AA7B769-CFB5-405C-9AFB-D9CDFAAB4F32}', N'Uludağ Evleri 4', N'Açıklama hazırlanıyor...', '20200428 18:10:11.847', 107, 102)
GO

INSERT INTO dbo.Projeler (ProjeID, Baslik, Aciklamasi, EklenmeZamani, GoruntulenmeSayisi, BegenilmeSayisi)
VALUES 
  (N'{E4B690F4-E110-4229-9430-C3987BDB3CB1}', N'Uludağ Evleri 5', N'Açıklama hazırlanıyor...', '20200428 18:10:19.387', 143, 109)
GO

--
-- Data for table dbo.Satiliklar  (LIMIT 0,500)
--

INSERT INTO dbo.Satiliklar (SatilikID, Baslik, Aciklamasi, EklenmeZamani, GoruntulenmeSayisi, Il, Ilce, KategoriID, Fiyat)
VALUES 
  (N'{ED1A0502-D7C5-4182-8091-B41620F2CC10}', N'Satılık Lüks Daire', N'Açıklama gelecek', '20200622 10:33:18.913', 42, N'Bursa', N'Nilüfer', N'{43EA1C05-AA20-4222-ADA7-A3E4B825F88B}', N'550000 TL')
GO

--
-- Data for table dbo.Slaytlar  (LIMIT 0,500)
--

INSERT INTO dbo.Slaytlar (SlaytID, Yazi, Resim, EklenmeZamani)
VALUES 
  (N'{81F58B06-4BDA-44DC-AE78-26D54796487C}', N'Slayt 2', N'assets/images/slaytlar/2.jpg', '20200420 22:24:02')
GO

INSERT INTO dbo.Slaytlar (SlaytID, Yazi, Resim, EklenmeZamani)
VALUES 
  (N'{FFB8F58B-D8C2-44C5-9294-98B234DD0A33}', N'Slayt3', N'assets/images/slaytlar/3.jpg
', '20200420 22:28:45')
GO

INSERT INTO dbo.Slaytlar (SlaytID, Yazi, Resim, EklenmeZamani)
VALUES 
  (N'{F35063B2-4E11-4685-A6B0-D6C91C6790D8}', N'Slayt1', N'assets/images/slaytlar/1.jpg', '20200420 22:23:31')
GO

--
-- Data for table dbo.SosyalSiteBaglantilari  (LIMIT 0,500)
--

INSERT INTO dbo.SosyalSiteBaglantilari (MenuID, SiteAdi, AcacagiSayfa, Siralama, Durum)
VALUES 
  (N'{29638BFA-8BA1-4FF5-A1DF-0F505AE443CE}', N'twitter', N'http://www.twitter.com
', 1, N'Açık')
GO

INSERT INTO dbo.SosyalSiteBaglantilari (MenuID, SiteAdi, AcacagiSayfa, Siralama, Durum)
VALUES 
  (N'{4B7DA4E5-13E3-4CE8-9CB4-311629A74450}', N'facebook', N'http://www.facebook.com', 2, N'Açık')
GO

INSERT INTO dbo.SosyalSiteBaglantilari (MenuID, SiteAdi, AcacagiSayfa, Siralama, Durum)
VALUES 
  (N'{21109161-81CE-4CFD-BF4A-AC1DB95AD30D}', N'dribbble', N'a', 3, N'Kapalı')
GO

INSERT INTO dbo.SosyalSiteBaglantilari (MenuID, SiteAdi, AcacagiSayfa, Siralama, Durum)
VALUES 
  (N'{12B9E173-0EE9-468F-9386-D67B638B9E66}', N'google-plus', N'b', 4, N'Kapalı')
GO

INSERT INTO dbo.SosyalSiteBaglantilari (MenuID, SiteAdi, AcacagiSayfa, Siralama, Durum)
VALUES 
  (N'{BD337C94-F611-4B84-9510-F8FAC03D3C32}', N'instagram', N'c', 5, N'Açık')
GO

