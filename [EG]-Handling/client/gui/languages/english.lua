guiLanguage.english = {
    --
    -- GENERAL STRINGS
    --
    windowHeader = "Anadolu Freeroam Handling Panel",
    
    restrictedPassenger = "Yolcuyken Hand Editleyici kullanma iznin yok.",
    needVehicle = "Hand Editleyici kullanmak için araç kullanmalısın!",
    needLogin = "Kullanmak için giriş yapman gerek.",
    needAdmin = "Kullanmak için admin olarak giriş yapman gerek.",
    invalidMenu = "Böyle bir menü yok!",
    disabledMenu = "Bu menü devre dışı bırakıldı.",
    notifyUpdate = "Hand Editleyici sen son kullandığın zamandan beri güncellendi . Değişiklik listesini görmek ister misin? \nDeğişiklik listesini istediğin zaman görebilirsin 'Extra > Updates'",
    notifyUpgrade = "Hand Editleyici güncellendi. Bu senin bazı editlerinin farklı bir şekile dönüştüğü anlamına gelir.",
    outdatedUpdate = "Bu server Hand Editleyici farklı bir versiyonunu kullanıyor. Sonuç olarak bazı şeyler kayıp olabilir.",
    outdatedUpgrade = "Bu server Hand Editleyicinin çok eski bir sürümünü kullanıyor. Kullanılabilmesi için güncellenmesi gerekiyor.",
    mtaUpdate = "Eğer MTA 1.1 sürümüne ait Handleriniz varsa, onlar artık ulaşılamaz.",
    
    sameValue = "Bu değer (%s) zaten yapılmış!",
    exceedLimits = "Kullanılan değer %s limiti aşıyor. [%s]!",
    cantSameValue = "%s bununla aynı değil %s!",
    needNumber = "Sayı kullanmak zorundasın!",
    unsupportedProperty = "Bu %s desteklenmeyen bir özellik .",
    successRegular = "Bu %s buna dönüştürüldü %s.",
    successHex = "%s %s.",
    unableToChange = "Bu %s buna %s! dönüştürülemez.",
	disabledProperty = "Bunu %s editlemek bu serverde kapatıldı!",
    
    resetted = "Hand ayarların başarılı bir şekilde sıfırlandı!",
    loaded = "Hand ayarların başarılı bir şekilde yüklendi!",
    imported = "Hand ayarların başarılı bir şekilde girildi!",
    invalidImport = "Aktarma başarısız; kullandığın handling kodları geçersiz!",
    invalidSave = "Lütfen handin kaydedilmesi için geçerli bir isim ve açıklama gir!",
    
    confirmReplace = "Varolan kayıtın üzerine kaydetmek istediğine emin misin?",
    confirmLoad = "Bu hand ayarlarını yüklemek istediğine emin misin? Kaydedilmemiş her değişiklik kaybedilecek!",
    confirmDelete = "Bu hand ayarlarını silmek istediğine emin misin?",
    confirmReset = "Bu hand ayarlarını resetlemek istediğine emin misin? Kaydedilmemiş her değişiklik kaybedilecek!",
    confirmImport = "Bu hand ayarlarını aktarmak istediğine emin misin? Kaydedilmemiş her değişiklik kaybedilecek!",

    successSave = "Hand ayarların başarılı bir şekilde kaydedildi.!",
    successLoad = "Hand ayarların başarılı bir şekilde yüklendi!",
    
	confirmVersionReset = "Bu serverin Hand ayarlayıcı sürümünü resetlemek istediğine emin misin? Kaydedilmiş editlerin kullanılamayabilir.",
	successVersionReset = "Senin Hand ayarlayıcın güncellendi.",
    wantTheSettings = "Bu ayarları uygulamak istediğine emin misin? Hand ayarlarıcı tekrar başlatılacak.",
    
    vehicle = "Araba",
    unsaved = "Kaydedilmemiş",
    
    clickToEdit = "Editlemek için tıklayın.",
    enterToSubmit = "Onaylamak için ENTER basın.",
    clickToViewFullLog = "Araç kaydının tamamını açmak için tıklayın.",
    copiedToClipboard = "Hand ayarları panoya kopyalandı!",
    
    special = {
        commode = {
            "Böl",
            "Birleştir"
        }
    },
    
    --
    -- BUTTON / MENU STRINGS
    --
    
    --Warning level strings
    warningtitles = {
        info = "Bilgilendirme.",
        question = "Soru?",
        warning = "Uyarı!",
        ["error"] = "Hata!"
    },
    --Strings for the buttons at the top
    utilbuttons = {
        handling = "Handling",
        tools = "Araçlar",
        extra = "Ekstralar",
        close = "X"
    },

    --Strings for the buttons at the right
    menubuttons = {
        engine = "Motor",
        body = "Gövde",
        wheels = "Tekerler",
        appearance = "Görünüş",
        modelflags = "Araç\nModeller",
        handlingflags = "Özel\nAyarlar",
        dynamometer = "Dinamo",
        help = "Yardım"
    },
    
    --Strings for the various menus of the editor. Empty strings are placeholder to avoid debug as the debug is meant to show items which are missing text.
    menuinfo = {
        engine = {
            shortname = "Motor",
            longname = "Motor Ayarları"
        },
        body = {
            shortname = "Gövde",
            longname = "Gövde ve Süspansiyon Ayarları"
        },
        wheels = {
            shortname = "Tekerler",
            longname = "Teker Ayarları"
        },
        appearance = {
            shortname = "Görünüş",
            longname = "Görünüş Ayarları"
        },
        modelflags = {
            shortname = "Araç ve Modeller",
            longname = "Araç Modeli Ayarları"
        },
        handlingflags = {
            shortname = "Hand Ayarları",
            longname = "Özel Hand Ayarları"
        },
        dynamometer = {
            shortname = "Dinamo",
            longname = "Dinamo Ölçeri Başlat"
        },
        help = {
            shortname = "Yardım ve Bilgilendirme",
            longname = "Yardım",
            itemtext = {
                textlabel = "Resmi MTA Hand Editleyicisine hoş geldiniz! Bu özellik size herhangi bir aracın ayarlarını editlemenize yardımcı olur.\n"..
                            "Yaptığınız editleri kaydedebilir ve yükleyebilirsiniz, menünün sol üst kısmındaki 'Handling' kısmından.\n"..
                            "Bu 'Hand Editleyici' Reckless tarafından editlenmiştir.\n /dc yazarak Discord sunucusuna katılabilirsiniz.",
                websitebox = "185.185.232.161:22003",
                morelabel = "Anadolu Freeroam'i tercih ettiğiniz için teşekkür ederiz!"
            }
        },
        reset = {
            shortname = "Sıfırla",
            longname = "Bu aracın hand ayarlarını sıfırla.",
            itemtext = {
                label = "Temel Araç:",
                combo = "-----",
                button = "Sıfırla"
            }
        },
        save = {
            shortname = "Kaydet",
            longname = "Bu aracın hand ayarlarını kaydet.",
            itemtext = {
                nameLabel = "Adı",
                descriptionLabel = "Açıklaması",
                button = "Kaydet",
                grid = "",
                nameEdit = "",
                descriptionEdit = ""
            }
        },
        load = {
            shortname = "Yükle",
            longname = "Kayıtlı Hand ayarları yükle.",
            itemtext = {
                button = "Yükle",
                grid = ""
            }
        },
        import = {
            shortname = "Aktar",
            longname = "handling.cfg kodlarına uygun hand ayarları aktar.",
            itemtext = {
                button = "Aktar",
                III = "III",
                VC = "VC",
                SA = "SA",
                IV = "IV",
                memo = ""
            }
        },
        export = {
            shortname = "Kopyala",
            longname = "Hand ayarlarına ait kodları kopyala.",
            itemtext = {
                button = "Kopyala",
                memo = ""
            }
        },
        get = {
            shortname = "Al",
            longname = "Başka bir oyuncudan hand ayarlarını al."
        },
        share = {
            shortname = "Paylaş",
            longname = "Başka bir oyuncuya hand ayarlarını paylaş."
        },
        upload = {
            shortname = "Depola",
            longname = "Hand ayarlarını servere depola."
        },
        download = {
            shortname = "İndir",
            longname = "Serverden kaydedilmiş hand ayarı indir."
        },
        
        resourcesave = {
            shortname = "Resource save",
            longname = "Save your handling to a resource."
        },
        resourceload = {
            shortname = "Resource load",
            longname = "Load a handling from a resource."
        },
        options = {
            shortname = "Ayarlar",
            longname = "Ayarlar",
            itemtext = {
                label_key = "Panel Tuşu",
                label_cmd = "Açan komut:",
                label_template = "GUI kimliği:",
                label_language = "Dil:",
                label_commode = "Ağırlık merkezi ayarlama modu:",
                checkbox_versionreset = "Downgrade my version number from %s to %s?",
                button_save = "Uygula",
                combo_key = "",
                combo_template = "",
                edit_cmd = "",
                combo_commode = "",
                combo_language = "",
				checkbox_lockwhenediting = "Editlerken aracı kilitlemek ister misin?"
            }
        },
        administration = {
            shortname = "Yönetim",
            longname = "Yönetim araçları."
        },
        handlinglog = {
            shortname = "Handling Log",
            longname = "Log of recent changes to handling settings.",
            itemtext = {
                logpane = ""
            }
        },
        updatelist = {
            shortname = "Güncelleme",
            longname = "Son güncelleme.",
            itemtext = {
                scrollpane = ""
            }
        },
        mtaversionupdate = {
            shortname = "MTA Update",
            longname = "Multi Theft Auto has been updated!",
            itemtext = {
                infotext = "Multi Theft Auto has been updated. Because of this, your saved handlings in the previous version are no longer compatible. Please visit the link below for help and get your handlings back.",
                websitebox = "http://hedit.googlecode.com/"
            }
        }
    },
    
    --
    --NOTE: 12/17/2011 This section is pending review for typos and grammar.
    --
    handlingPropertyInformation = { 
        ["identifier"] = {
            friendlyName = "Vehicle Identifier",
            information = "This represents the vehicle identifier to be used in handling.cfg.",
            syntax = { "String", "Only use valid identifiers, otherwise exporting wont work." }
        },
        ["mass"] = {
            friendlyName = "Ağırlık",
            information = "Aracın ağırlığını KG cinsinden ayarlar.",
            syntax = { "Değer", "Remember to change the 'turnMass' first to avoid bouncing!" }
        },
        ["turnMass"] = {
            friendlyName = "Dönüş Ağırlığı",
            information = "Hareket efektleri ayarlamak için kullanılır.",
            syntax = { "Değer", "Daha yüksek değerler aracın daha fazla süzülmesine neden olur." }
        },
        ["dragCoeff"] = {
            friendlyName = "Direnç",
            information = "Aracın harekete karşı direncini ayarlar.",
            syntax = { "Değer", "Daha yüksek değerler, aracın göreceği en fazla hızı düşürür." }
        },
        ["centerOfMass"] = {
            friendlyName = "Ağırlık Merkezi",
            information = "Aracın yer çekimi noktasını ayarla, metre olarak.",
            syntax = { "Değer", "X, Y, veya Z'nin üzerinde dur daha fazla bilgi için." }
        },
        ["centerOfMassX"] = {
            friendlyName = "X Ağırlık Merkezi.",
            information = "Ağırlık merkezinin ön-arka mesafesini metre olarak ayarlar.",
            syntax = { "Değer", "Yüksek değerler öne doğru, az değerler arkaya doğru." }
        },
        ["centerOfMassY"] = {
            friendlyName = "Y Ağırlık Merkezi",
            information = "Ağırlık merkezinin sol-sağ mesafesini metre olarak ayarlar.",
            syntax = { "Değer", "Yüksek değerler sağa, alçak değerler sola doğru." }
        },
        ["centerOfMassZ"] = {
            friendlyName = "Z Ağırlık Merkezi",
            information = "Ağırlık merkezinin yüksekliğini metre olarak ayarlar.",
            syntax = { "Değer", "Yüksek değerler, merkezi de yükseletecektir." }
        },
        ["percentSubmerged"] = {
            friendlyName = "Su Altında Kalma Yüzdesi",
            information = "Aracın motorunun bozulması için ne kadarının suya girmesi gerektiğini ayarla.",
            syntax = { "Yüzde", "Yüksek değerler aracın daha derine dalmasına neden olur." }
        },
        ["tractionMultiplier"] = {
            friendlyName = "Dönüş Gücü",
            information = "Viraj alırken aracınızın yola tutunma miktarını ayarlar.",
            syntax = { "Değer", "Daha yüksek değerler aracınızın daha fazla yol tutuşunu sağlar." }
        },
        ["tractionLoss"] = {
            friendlyName = "Çekiş Kaybı",
            information = "Aracın hızlanırken ve yavaşlarkenki yol tutuşunu ayarlar.",
            syntax = { "Değer", "Yüksek değerler aracın virajlardan daha iyi çıkmasına neden olur." }
        },
        ["tractionBias"] = {
            friendlyName = "Çekiş Eğilimi",
            information = "Tekerleklerin tüm tutuşunun nereye gideceğini ayarlar.",
            syntax = { "Değer", "Yüksek değerler daha fazla öne eğilime neden olur." }
        },
        ["numberOfGears"] = {
            information = "Sets the number of gears you want to have on your vehicle.",
            syntax = { "Integer", "Has no effect on top speed or acceleration." }
        },
        ["maxVelocity"] = {
            friendlyName = "Maksimum Hız",
            information = "Aracın KM/H cinsinden maksimum hızını ayarlar.",
            syntax = { "Değer", "Diğer tercihlerden etkilenir." }
        },
        ["engineAcceleration"] = {
            friendlyName = "Hızlanma",
            information = "Aracın milisaniyenin karesi kadar sürede ne kadar hızlanacağını ayarlar.",
            syntax = { "Değer", "Yüksek değerler aracın hızlanmasını arttırır." }
        },
        ["engineInertia"] = {
            friendlyName = "Eylemsizlik",
            information = "Yumuşak ya da daha sert hızlanmayı ayarlar.",
            syntax = { "Değer", "Yüksek değerler hızlanmayı daha yumuşak yapar." }
        },
        ["driveType"] = {
            friendlyName = "Sürüş tipi",
            information = "Sürüşte hangi tekerlerin kullanılacağını ayarlar.",
            syntax = { "String", "'Tüm Tekerler' i seçmek daha iyi araç kontrolünü sağlar." },
            options = { ["f"]="Ön Tekerler",["r"]="Arka Tekerler",["4"]="Tüm Tekerler" }
        },
        ["engineType"] = {
            friendlyName = "Motor Tipi",
            information = "Aracın için motor tipini ayarlar.",
            syntax = { "String", "[UNKNOWN]" },
            options = { ["p"]="Benzin",["d"]="Dizel",["e"]="Elektrik" }
        },
        ["brakeDeceleration"] = {
            friendlyName = "Fren kuvveti",
            information = "Milisaniyenin karesi kadar bir zmaanda ne kadar yavaşlayacağını ayarlar.",
            syntax = { "Değer", "Yüksek değerler frenlemenin daha güçlü olmasını sağlar, ancak çekiş çok düşükse kayabilir." }
        },
        ["brakeBias"] = {
            friendlyName = "Fren eğilimi",
            information = "Frenlerin merkezini ayarlar.",
            syntax = { "Değer", "Yüksek değerler daha fazla öne eğilim sağlar." }
        },
        ["ABS"] = {
            friendlyName = "ABS",
            information = "Enable or disable ABS on your vehicle.",
            syntax = { "Bool", "No effect." },
            options = { ["true"]="Enabled",["false"]="Disabled" }
        },
        ["steeringLock"] = {
            friendlyName = "Teker dönme açısı",
            information = "Aracın dönerken alabileceği maksimum açıyı ayarlar.",
            syntax = { "Değer", "Açının daha az olması daha hızlı gitmeye neden olur." }
        },
        ["suspensionForceLevel"] = {
            friendlyName = "Süspansiyon kuvveti seviyesi",
            information = "Bilinmeyen etkiler.",
            syntax = { "Değer", "Test edilmesi gerek." }
        },
        ["suspensionDamping"] = {
            friendlyName = "Süspansiyon Gömülmesi",
            information = "Bilinmeyen etkiler.",
            syntax = { "Değer", "Test edilmesi gerek." }
        },
        ["suspensionHighSpeedDamping"] = {
            friendlyName = "Hızlıyken süspansiyon sönümlemesi",
            information = "Daha hızlı sürerken süspansiyonun daha sert olmasını sağlar.",
            syntax = { "Değer", "Test edilmesi gerek" } -- HERE
        },
        ["suspensionUpperLimit"] = {
            friendlyName = "Maksimum süspansiyon limiti",
            information = "Metre cinsinden tekerin en üst hareketi.",
            syntax = { "Değer", "Test edilmesi gerek" } -- HERE
        },
        ["suspensionLowerLimit"] = {
            friendlyName = "Minimum süspansiyon limiti",
            information = "Süspansiyonunun yüksekliği.",
            syntax = { "Değer", "Düşük değerler aracının daha yüksek olmasını sağlar." }
        },
        ["suspensionFrontRearBias"] = {
            friendlyName = "Süspansiyon eğilimi",
            information = "Süspansiyon gücünün çoğunun ne tarafa gideceğini ayarla.",
            syntax = { "Değer", "Yüksek değerler daha fazla öne eğilmeyi sağlar." }
        },
        ["suspensionAntiDiveMultiplier"] = {
            friendlyName = "Süspansiyon antigömülme çarpanı",
            information = "Hızlanırken ve frenlerken gövdenin yalpalama miktarını ayarlar.",
            syntax = { "Değer", "" }
        },
        ["seatOffsetDistance"] = {
            friendlyName = "Araçtan iniş mesafesi",
            information = "Araçtan inerken ve binerkenki mesafeyi ayarlar.",
            syntax = { "Değer", "" }
        },
        ["collisionDamageMultiplier"] = {
            friendlyName = "Çarpışma hasarı çarpanı",
            information = "Aracın çarpışmalardan alacağı hasarı ayarlar.",
            syntax = { "Değer", "" }
        },
        ["monetary"] = {
            friendlyName = "Monetary Value",
            information = "Sets the exact price of your vehicle.",
            syntax = { "Integer", "" }
        },
        ["modelFlags"] = {
            friendlyName = "Model Flags",
            information = "Special animations features of the which can be enabled or disabled.",
            syntax = { "Hexadecimal", "" },
            items = {
                {
                    ["1"] = {"IS_VAN","Arka taraf için çift kapı animasyonu kullanır."},
                    ["2"] = {"IS_BUS","Araç otobüs duraklarında durmaya ve yolcu almaya çalışır."},
                    ["4"] = {"IS_LOW","Şoför ve yolcular daha alçak oturur ve yaslanır."},
                    ["8"] = {"IS_BIG","NPC nin virajlardan döndüğü yönü değiştirir."}
                },
                {
                    ["1"] = {"REVERSE_BONNET","Kaput ve bagaj normalden zıt yönde açılır."},
                    ["2"] = {"HANGING_BOOT","Bagaj üst kapaktan açılır."},
                    ["4"] = {"TAILGATE_BOOT","Bagaj alt kenardan açılır."},
                    ["8"] = {"NOSWING_BOOT","Bagaj açılmaz."}
                },
                {
                    ["1"] = {"NO_DOORS","Kapının açılma ve kapanma animasyonlarını geçer."},
                    ["2"] = {"TANDEM_SEATS","Ön yolcu koltuğunu iki kişi kullanacak."},
                    ["4"] = {"SIT_IN_BOAT","Botta ayakta durmak yerine oturma animasyonunu kullanır."},
                    ["8"] = {"CONVERTIBLE","Kancaların çalışma şeklini ve diğer küçük efektleri değiştirir."}
                },
                {
                    ["1"] = {"NO_EXHAUST","Bütün egzoz dumanlarını kapatır."},
                    ["2"] = {"DBL_EXHAUST","2. bir egzoz dumanını aktive eder."},
                    ["4"] = {"NO1FPS_LOOK_BEHIND","Birinci kişi modundayken arkaya bakmayı engeller."},
                    ["8"] = {"FORCE_DOOR_CHECK","Test edilmeye ihtiyacı var."}
                },
                {
                    ["1"] = {"AXLE_F_NOTILT","Arka tekerlekler GTA 3 gibi araca dik durur."},
                    ["2"] = {"AXLE_F_SOLID","Arka tekerler birbirine paralel durur."},
                    ["4"] = {"AXLE_F_MCPHERSON","Arka tekerlekler GTA Vice City gibi eğilir."},
                    ["8"] = {"AXLE_F_REVERSE","AXLE_R_MCPHERSON süspansiyonunu kullanırken tekerleklerin eğilmesini tersine çevir."}
                },
                {
                    ["1"] = {"AXLE_R_NOTILT","Arka tekerlekler GTA 3 gibi araca dik durur."},
                    ["2"] = {"AXLE_R_SOLID","Arka tekerler birbirine paralel durur."},
                    ["4"] = {"AXLE_R_MCPHERSON","Arka tekerlekler GTA Vice City gibi eğilir."},
                    ["8"] = {"AXLE_R_REVERSE","AXLE_R_MCPHERSON süspansiyonunu kullanırken tekerleklerin eğilmesini tersine çevir."}
                },
                {
                    ["1"] = {"IS_BIKE","Bisiklet bölümünde ekstra hand ayarlarını kullanın."},
                    ["2"] = {"IS_HELI","Uçuş bölümünde ekstra hand ayarlarını kullanın."},
                    ["4"] = {"IS_PLANE","Uçuş bölümünde ekstra hand ayarlarını kullanın."},
                    ["8"] = {"IS_BOAT","Uçuş bölümünde ekstra hand ayarlarını kullanın."}
                },
                {
                    ["1"] = {"BOUNCE_PANELS","Test edilmeye ihtiyacı var."},
                    ["2"] = {"DOUBLE_RWHEELS","Her bir arka tekerin kopyasını orjinalinin yanına yerleştirir."},
                    ["4"] = {"FORCE_GROUND_CLEARANCE","Test edilmeye ihtiyacı var."},
                    ["8"] = {"IS_HATCHBACK","Test edilmeye ihtiyacı var."}
                }
            }
        },
        ["handlingFlags"] = {
            friendlyName = "Handling Flags",
            information = "Special performance features.",
            syntax = { "Hexadecimal", "" },
            items = {
                {
                    ["1"] = {"1G_BOOST","Kalkışlarda daha fazla motor gücü verir; dağ tırmanışında işe yarar."},
                    ["2"] = {"2G_BOOST","Yüksek hızlarda daha fazla motor gücü verir."},
                    ["4"] = {"NPC_ANTI_ROLL","NPC tarafından sürülürken kimse araçtan atlamaz."},
                    ["8"] = {"NPC_NEUTRAL_HANDL","NPC tarafından sürüldüğünde araçtan inme olasılığı düşüktür."}
                },
                {
                    ["1"] = {"NO_HANDBRAKE","El frenini devre dışı bırakır."},
                    ["2"] = {"STEER_REARWHEELS","Arka tekerler frenler, forklift gibi."},
                    ["4"] = {"HB_REARWHEEL_STEER","El freni ön teker gibi arka tekere de müdehale eder, canavar kamyon gibi"},
                    ["8"] = {"ALT_STEER_OPT","Test edilmeye ihtiyacı var."}
                },
                {
                    ["1"] = {"WHEEL_F_NARROW2","Çok dar ön tekerler."},
                    ["2"] = {"WHEEL_F_NARROW","Dar ön tekerler."},
                    ["4"] = {"WHEEL_F_WIDE","Geniş ön tekerler."},
                    ["8"] = {"WHEEL_F_WIDE2","Çok geniş ön tekerler."}
                },
                {
                    ["1"] = {"WHEEL_R_NARROW2","Çok dar arka tekerler."},
                    ["2"] = {"WHEEL_R_NARROW","Dar arka tekerler."},
                    ["4"] = {"WHEEL_R_WIDE","Geniş arka tekerler."},
                    ["8"] = {"WHEEL_R_WIDE2","Çok geniş arka tekerler."}
                },
                {
                    ["1"] = {"HYDRAULIC_GEOM","Test edilmeye ihtiyacı var."},
                    ["2"] = {"HYDRAULIC_INST","Araç yaratıldığında hidrolike sahip olacak."},
                    ["4"] = {"HYDRAULIC_NONE","Hidrolik araca yapılamaz."},
                    ["8"] = {"NOS_INST","Araç yaratıldığında otomatik nitrosu olur."}
                },
                {
                    ["1"] = {"OFFROAD_ABILITY","Araç toprak gibi zeminlerde daha iyi performans gösterir."},
                    ["2"] = {"OFFROAD_ABILITY2","Araç kum gibi yumuşak düzeylerde daha iyi performans gösterir."},
                    ["4"] = {"HALOGEN_LIGHTS","Farların daha parlak ve mavi olmasına neden olur."},
                    ["8"] = {"PROC_REARWHEEL_1ST","Test edilmeye ihtiyacı var."}
                },
                {
                    ["1"] = {"USE_MAXSP_LIMIT","Aracın maksimum hızını aşmasını engeller."},
                    ["2"] = {"LOW_RIDER","Aracın Loco Low Co shops da modifiye edilmesine izin verir."},
                    ["4"] = {"STREET_RACER","Ayarlandığında, araç sadece Wheel Arch Angels da modifiye edilir."},
                    ["8"] = {"UNDEFINED","Test edilmeye ihtiyacı var."}
                },
                {
                    ["1"] = {"SWINGING_CHASSIS","Süspansiyonların araç gövdesini hareket ettirmesine izin verir."},
                    ["2"] = {"UNDEFINED","Test edilmeye ihtiyacı var."},
                    ["4"] = {"UNDEFINED","Test edilmeye ihtiyacı var."},
                    ["8"] = {"UNDEFINED","Test edilmeye ihtiyacı var."}
                }
            }
        },
        ["headLight"] = {
            friendlyName = "Head Lights",
            information = "Sets the type of front lights your vehicle will have.",
            syntax = { "Integer", "" },
            options = { ["0"]="Long",["1"]="Small",["2"]="Big",["3"]="Tall" }
        },
        ["tailLight"] = {
            friendlyName = "Tail Lights",
            information = "Sets the type of rear lights your vehicle will have.",
            syntax = { "Integer", "" },
            options = { ["0"]="Long",["1"]="Small",["2"]="Big",["3"]="Tall" }
        },
        ["animGroup"] = {
            friendlyName = "Animation Group",
            information = "Sets the group of animation your ped will use for it's vehicle.",
            syntax = { "Integer", "" }
        }
    }
}