Config = {}

-- NOT !! : BU SCRİPT EFFRONTE TARAFINDAN TROLLERİN MESLEK ARAÇLARINI ÇALIP TROLL YAPMASINI ÖNLEMEK İÇİN VE MESLEĞE ÖZEL ARAÇLARIN SADECE O MESLEĞİN KULLANABİLMESİ İÇİN YAPILMIŞTIR
-- SCRİPT NEW QB COREDİR NOTİFY OLARAK QBCORE SERVER'DAN AYARLADIĞINIZ NOTİFYE GÖNDERİR EKSTRA BİR AYAR YOKTUR
-- TÜM HERŞEY CONFİGE ÇEKİLMİŞTİR EKSTRA OLARAK POLİS ALERT KISMI SERVER.LUA EN ALTTADIR CUSTOM EKLEYECEKSENİZ ORADAN EKLEYİN.
-- GRADE ÖZEL YAPMAYA ÇALIŞTIM FAKAT SİSTEMİ TAMAMEN DEĞİŞMEM GEREKİYORDU ÇOK İSTENİRSE GRADE ÖZELDE YAPABİLİRİM
-- SCRİPT İSMİNİ DEĞİŞMEYİNİZ LÜTFEN!!
-- KİCK EVENT: effronte-antistealjobcar:kickl
-- KİŞİYE ÖZEL VERSİYONUNU https://github.com/f4st3rxd/f4st-donateprotection BURADAN İNDİREBİLİRSİNİZ!!
-- DİSCORD: discord.gg/leakhouse Effrontê @effronte
-- HER TÜRLÜ DESTEK İÇİN BANA ULAŞABİŞİRSİNİZ
---------------------
--------------------- Config.OnlyOnDuty = true  -- Mesai kontrolü için eklenmiştir true ise mesai dışındakiler meslek araçlarını kullanamazlar!
--------------------- GÜNCELLEME İLE GELİCEK ---------------------
Config.LogGondersinmi = true  -- EĞER BU KISIM TRUE İSE HERŞEYİ LOG GÖNDERİR TEK BİR KANAL OLARA AYARLANMIŞTIR! CONFİG.WEBHOOK KISMINDAN WEBHOOK_URL GİRİNİZ VE MESAJLARI KENDİNİZE GÖRE DİZAYN EDİNİZ!
Config.Aracisilsinmi = true -- EĞER BU AÇIKSA SÜRÜCÜ KOLTUĞUNA OTURULUAN ARAÇ SİLİNİR TAVSİYEM FALSE KALSIN AÇMAYIN'
Config.Kickatsinmi = false  -- EĞER BU AÇIKSA NOTİFY GÖNDERİP ARAÇTAN İNDİRMEK YERİNE OYUNDAN ATAR VE DİSCORD LOG GÖNDERİR!

Config.JobVehicles = {
    --["meslekkodu"] = {"arackodu1", "arackodu2"} -- istediğiniz kadar ekleyip çoğaltabilirsiniz en sondaki virgüllere dikkat edin! son satırın sonunda virgül olmayacak!!
    ["police"] = {"drafter", "policecar2", "policecar3"}, 
    ["ambulance"] = {"zentorno", "ambulancecar2"},
    ["sheriff"] = {"sheriffcar1", "sheriffcar2"},
    ["sasp"] = {"saspcar1", "saspcar2", "saspcar3"},
    ["state"] = {"statecar1", "statecar2"},
    ["fbi"] = {"fbi1", "fbi2", "fbi3"},
    ["gtf"] = {"gtf1", "gtf2"},
    ["effrontefamily"] = {"donateracimvito", "donateracimbmw"}
}

Config.Notify = {
    ["izinyok"] = "Bu aracı kullanamazsın bu araç mesleğe özel veya sen mesaide değilsin!",  -- EĞER Config.Aracsilinsinmi kapalıysa bu notifyı gönderir mesajı kendinize göre düzenleyebilirsiniz
    ["aracsilindi"] = "Bu aracı kullanamazsın bu araç mesleğe özel veya sen mesaide değilsin, ARACI SİLDİM!", -- EĞER Config.Aracsilinsinmi açıksa bu notifyı gönderir değilse bir işe yaramaz
    ["KickMessage"] = "MESLEK ARACI ÇALMAYA ÇALIŞMA! discord.gg/leakhouse", -- EĞER Config.Kickatsinmi AÇIKSA KİCK EKRANINDA GÖSTERİLEN YAZIDIR İSTEĞİNİZE GÖRE DÜZELTEBİLİRSİNİZ
    ["type"] = "error" -- BU KISIM NOTİFYIN TYPE KISMIDIR DEFAULT OLARAK ERROR KALABİLİR İSTERSENİZ İNFO VEYA WARN YAPABİLİRSİNİZ SİZİN NOTİFYINIZA BAĞLI
}

Config.Webhook = { -- BU KISIM Config.LogGondersinmi AÇIK İSE İŞİNİZE YARAR!
    ["WEBHOOK_URL"] = "DİSCORD_WEBHOOK_URL_GİRİNİZ",  -- LOGLARIN GİDECEĞİ KISIM WEBHOOKU BU KISMA YAPIŞTIRIN 
    ["LOG_BASLİK_OYUNCU"] = "Oyuncu %s (ID: %s) %s MESLEK ARACINI ÇALMAYI DENEDİ", -- %s YAZANLARA BİLMİYORSAN ELLEME DİĞER KISMI DEĞİŞEBİLİRSİNİZ İSTEĞİNİZE GÖRE WEBHOOK BAŞLIĞIIDIR
    ["LOG_MESAJ_OYUNCU"] = "Oyuncu %s (ID: %s) %s kullanmaya çalıştI",  -- %s YAZANLARA BİLMİYORSAN ELLEME DİĞER KISMI DEĞİŞEBİLİRSİNİZ İSTEĞİNİZE GÖRE WEBHOOK BAŞLIĞIIDIR
    ["KICK_PLAYER_BASLIK"] = "Oyuncu %s (ID: %s) KİCKLENDİ! araç: %s ", -- %s YAZANLARA BİLMİYORSAN ELLEME DİĞER KISMI DEĞİŞEBİLİRSİNİZ İSTEĞİNİZE GÖRE GÖRE OYUNCU KİCKLENİNCE GELEN LOGUN BAŞLIĞIIDIR
    ["KICKPLAYER_MESSAGE"] = "Oyuncu %s (ID: %s) %s MESLEK ARACINI ÇALMAYA ÇALIŞTIĞI İÇİN KİCKLENDİ!" -- %s YAZANLARA BİLMİYORSAN ELLEME DİĞER KISMI DEĞİŞEBİLİRSİNİZ İSTEĞİNİZE GÖRE OYUNCU KİCKLENİNCE GELEN MESAJIDIR 
  --["LOG_MESAJ_MESAİDIŞI"] = "Oyuncu %s (ID: %s) mesaide olmadan %s aracını(Meslek Aracı) kullanmaya çalıştı.", -- %s YAZANLARA BİLMİYORSAN ELLEME DİĞER KISMI DEĞİŞEBİLİRSİNİZ İSTEĞİNİZE GÖRE MESAI DIŞI ARAÇA GİRMEYE ÇALIŞAN LOGUN MESAJIDIR
  --["LOG_BASLİK_MESAİDIŞI"] = "Oyuncu %s (ID: %s) mesaide olmadan %s aracını(Meslek Aracı) kullanmaya çalıştı.", -- %s YAZANLARA BİLMİYORSAN ELLEME DİĞER KISMI DEĞİŞEBİLİRSİNİZ İSTEĞİNİZE GÖRE MESAI DIŞI ARAÇA GİRMEYE ÇALIŞAN LOGUN BAŞLIĞIDIR
}

Config.PolisBildirim = { -- TEST EDİLMEDİ !!
    Enabled = true,  -- Uyarı sistemi açık/kapalı
    ALertType = "tgiann-policealert",  -- Uyarı tipi: "tgiann-policealert", "ps-dispatch", "custom"
    Customscriptname = "custom-pdalert",
    Message = "Bir oyuncu yetkisiz araç kullanmaya çalışıyor."
}