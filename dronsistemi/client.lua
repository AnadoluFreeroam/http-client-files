--DEĞİŞKENLER DOKUNMAYINIZ
 local dronkontrol=false
 local screenW, screenH = guiGetScreenSize()
 local altyazizamanlayicidegisken=false
 destroylananaracid=0
 altyazisure=false
 ziplamazaman=false
 butonmaksbasmadeger=0
  panelacmadeger=false
function centerWindow(center_window) --panel ortalama
  local screenW,screenH=guiGetScreenSize()
  local windowW,windowH=guiGetSize(center_window,false)
  local x,y = (screenW-windowW)/2,(screenH-windowH)/2
  guiSetPosition(center_window,x,y,false)
end
function panel() --PANEL GENEL AYARLARI
  showCursor ( true ) 
  yazitipibuyuk2 = guiCreateFont( yazitipidosya2, yaztipibuyukpuntodeger2)
  yazitipibuyuk = guiCreateFont( yazitipidosya, yaztipibuyukpuntodeger)
  yazitipiorta = guiCreateFont( yazitipidosya, yaztipiortapuntodeger)
  yazitipikucuk = guiCreateFont( yazitipidosya,yaziyipikucukpuntodeger)
  --panel genel ayarları
  main = guiCreateStaticImage(250, 250, 250, 160, "panel/anapanel.png", false, paneli)
  serverismi = guiCreateLabel(53,16,170,80, serverismiyaz, false, main)
  guiSetFont( serverismi, yazitipibuyuk2)
  centerWindow( main )
  --oyuncakaraba butonu ayarları
  oyuncakarababuton = guiCreateStaticImage(18,50,100,40, "panel/kucukbuton.png", false, main)
  oyuncakarababutonlabel = guiCreateLabel(10,6,100,40, "ARABA", false, oyuncakarababuton)
  guiSetFont( oyuncakarababutonlabel, yazitipibuyuk)
  guiLabelSetColor(oyuncakarababutonlabel,0,0,0)

  --insansizhavaaraci butonu ayarları
  insansizhavaaracibuton = guiCreateStaticImage(18,100,100,40, "panel/kucukbuton.png", false, main)
  insansizhavaaracibutonlabel = guiCreateLabel(30,6,100,40, "IHA", false, insansizhavaaracibuton)
  guiSetFont( insansizhavaaracibutonlabel, yazitipibuyuk)
  guiLabelSetColor(insansizhavaaracibutonlabel,0,0,0)

  --dron butonu ayarları
  dronbuton = guiCreateStaticImage(130,50,100,40, "panel/kucukbuton.png", false, main)
  dronbutonlabel = guiCreateLabel(20,6,100,40, "DRON", false, dronbuton)
  guiSetFont( dronbutonlabel, yazitipibuyuk)
  guiLabelSetColor(dronbutonlabel,0,0,0)

  --robot butonu ayarları
  robotbuton = guiCreateStaticImage(130,100,100,40, "panel/kucukbuton.png", false, main)
  robotbutonlabel = guiCreateLabel(13,6,100,40, "ROBOT", false, robotbuton)
  guiSetFont( robotbutonlabel, yazitipibuyuk)
  guiLabelSetColor(robotbutonlabel,0,0,0)

  --kapat butonu ayarları
  kapatbuton = guiCreateStaticImage(208,15,20,20, "panel/kucukbuton.png", false, main)
  kapatbutonlabel = guiCreateLabel(6,2,20,20, "X", false, kapatbuton)
  guiSetFont( kapatbutonlabel, yazitipiorta)
  guiLabelSetColor(kapatbutonlabel,0,0,0)
end
function butonabasma() --BUTONA BASINCA YAPILAN GENEL AYARLAR
  --Oyuncak araba dronuna basılınca
   if source == oyuncakarababutonlabel and dronkontrol==false then
    local arabadamioyuncu=isPedInVehicle(localPlayer)
    local oyuncuarabasi=getPedOccupiedVehicle(localPlayer)
    if oyuncuarabasi==false then 
    else
      local oyuncuarabasimodel=getElementModel(oyuncuarabasi)
    end
    if arabadamioyuncu==false or oyuncuarabasimodel==441 or oyuncuarabasimodel==464 or oyuncuarabasimodel==594 or oyuncuarabasimodel==501 then 
      px,py,pz=getElementPosition(getLocalPlayer())
      if lasventurasengel==true then
       if px>= yasaklialanxalt and px<=yasaklialanxust and py>=yasaklialanysol and py<=yasaklialanysag then
         outputChatBox(yasaklialanmesaj,255,0,0)
       else
 
         triggerServerEvent("araba",localPlayer)
         dronkontrol=true
         toggleControl("enter_exit",false)
       --timer ayarlama değişkenleri
          altyazisure=false
          altyazizamanlayicidegisken=false
          butonmaksbasmadeger=0
          birakmabutonubasmadeger=0
         guiSetVisible(main,false)
         showCursor(false)
         panelacmadeger=false
       end
 
      else
       triggerServerEvent("araba",localPlayer)
       dronkontrol=true
       toggleControl("enter_exit",false)
       --timer ayarlama değişkenleri
        altyazisure=false
        altyazizamanlayicidegisken=false
        butonmaksbasmadeger=0
        birakmabutonubasmadeger=0
       guiSetVisible(main,false)
       showCursor(false)
       panelacmadeger=false
      end
    elseif  butonmaksbasmadeger<=butonabasmasiniri then
      outputChatBox("Araçta kullanamazsın!",255,0,0)
      butonmaksbasmadeger=butonmaksbasmadeger+1
    end
   elseif source == oyuncakarababutonlabel and dronkontrol==true and butonmaksbasmadeger<=butonabasmasiniri then
    outputChatBox("Daha fazla uzaktan kumandalı araba alamazsın önce aldığını kapat.",255,0,0)
    butonmaksbasmadeger=butonmaksbasmadeger+1
  end

  --Helikopter dronuna basılınca
   if source == dronbutonlabel and dronkontrol==false then
    local arabadamioyuncu=isPedInVehicle(localPlayer)
    local oyuncuarabasi=getPedOccupiedVehicle(localPlayer)
    if oyuncuarabasi==false then 
    else
      local oyuncuarabasimodel=getElementModel(oyuncuarabasi)
    end
    if arabadamioyuncu==false or oyuncuarabasimodel==441 or oyuncuarabasimodel==464 or oyuncuarabasimodel==594 or oyuncuarabasimodel==501 then 
      px,py,pz=getElementPosition(getLocalPlayer())
      if lasventurasengel==true then
       if px>= yasaklialanxalt and px<=yasaklialanxust and py>=yasaklialanysol and py<=yasaklialanysag then
         outputChatBox(yasaklialanmesaj,255,0,0)
       else
         triggerServerEvent("hdron",localPlayer)
         dronkontrol=true
         toggleControl("enter_exit",false)
          --timer ayarlama
           altyazisure=false
           altyazizamanlayicidegisken=false
           butonmaksbasmadeger=0
           birakmabutonubasmadeger=0
         guiSetVisible(main,false)
         showCursor(false)
         panelacmadeger=false
       end
 
      else
       triggerServerEvent("hdron",localPlayer)
       dronkontrol=true
       toggleControl("enter_exit",false)
     --timer ayarlama değişkenleri
        altyazisure=false
        altyazizamanlayicidegisken=false
        butonmaksbasmadeger=0
        birakmabutonubasmadeger=0
       guiSetVisible(main,false)
       showCursor(false)
       panelacmadeger=false
      end
    elseif butonmaksbasmadeger<=butonabasmasiniri then
      outputChatBox("Araçta kullanamazsın!",255,0,0)
      butonmaksbasmadeger=butonmaksbasmadeger+1
    end
   elseif source == dronbutonlabel and dronkontrol==true and  butonmaksbasmadeger<=butonabasmasiniri then
    outputChatBox("Daha fazla dron alamazsın önce aldığını kapat.",255,0,0)
    butonmaksbasmadeger=butonmaksbasmadeger+1
  end

  --iha dronuna basılınca
   if source == insansizhavaaracibutonlabel and dronkontrol==false then
    local arabadamioyuncu=isPedInVehicle(localPlayer)
    local oyuncuarabasi=getPedOccupiedVehicle(localPlayer)
    if oyuncuarabasi==false then 
    else
      local oyuncuarabasimodel=getElementModel(oyuncuarabasi)
    end
    if arabadamioyuncu==false or oyuncuarabasimodel==441 or oyuncuarabasimodel==464 or oyuncuarabasimodel==594 or oyuncuarabasimodel==501 then 
      px,py,pz=getElementPosition(getLocalPlayer())
      if lasventurasengel==true then
       if px>= yasaklialanxalt and px<=yasaklialanxust and py>=yasaklialanysol and py<=yasaklialanysag then
         outputChatBox(yasaklialanmesaj,255,0,0)
       else
         triggerServerEvent("insansizdron",localPlayer)
         dronkontrol=true
         toggleControl("enter_exit",false)
          --timer ayarlama
           altyazisure=false
           altyazizamanlayicidegisken=false
           butonmaksbasmadeger=0
           birakmabutonubasmadeger=0
         guiSetVisible(main,false)
         showCursor(false)
         panelacmadeger=false
       end
 
      else
       triggerServerEvent("insansizdron",localPlayer)
       dronkontrol=true
       toggleControl("enter_exit",false)
     --timer ayarlama değişkenleri
        altyazisure=false
        altyazizamanlayicidegisken=false
        butonmaksbasmadeger=0
        birakmabutonubasmadeger=0
       guiSetVisible(main,false)
       showCursor(false)
       panelacmadeger=false
      end
    elseif butonmaksbasmadeger<=butonabasmasiniri then
      outputChatBox("Araçta kullanamazsın!",255,0,0)
      butonmaksbasmadeger=butonmaksbasmadeger+1
    end
   elseif source == insansizhavaaracibutonlabel and dronkontrol==true and butonmaksbasmadeger<=butonabasmasiniri then
    outputChatBox("Daha fazla İHA alamazsın önce aldığını kapat.",255,0,0)
    butonmaksbasmadeger=butonmaksbasmadeger+1
  end

  --robot dronuna basılınca
   if source ==robotbutonlabel and dronkontrol==false then
    local arabadamioyuncu=isPedInVehicle(localPlayer)
    local oyuncuarabasi=getPedOccupiedVehicle(localPlayer)
    if oyuncuarabasi==false then 
    else
      local oyuncuarabasimodel=getElementModel(oyuncuarabasi)
    end
    if arabadamioyuncu==false or oyuncuarabasimodel==441 or oyuncuarabasimodel==464 or oyuncuarabasimodel==594 or oyuncuarabasimodel==501 then 
      px,py,pz=getElementPosition(getLocalPlayer())
      if lasventurasengel==true then
       if px>= yasaklialanxalt and px<=yasaklialanxust and py>=yasaklialanysol and py<=yasaklialanysag then
         outputChatBox(yasaklialanmesaj,255,0,0)
       else
         triggerServerEvent("robot",localPlayer)
         dronkontrol=true
         toggleControl("enter_exit",false)
          --timer ayarlama
           altyazisure=false
           altyazizamanlayicidegisken=false
         guiSetVisible(main,false)
         butonmaksbasmadeger=0
         birakmabutonubasmadeger=0
         showCursor(false)
         panelacmadeger=false
       end
 
      else
       triggerServerEvent("robot",localPlayer)
       dronkontrol=true
       toggleControl("enter_exit",false)
     --timer ayarlama değişkenleri
        altyazisure=false
        altyazizamanlayicidegisken=false
        birakmabutonubasmadeger=0
        butonmaksbasmadeger=0
       guiSetVisible(main,false)
       showCursor(false)
       panelacmadeger=false
      end
    elseif
    butonmaksbasmadeger<=butonabasmasiniri then
      outputChatBox("Araçta kullanamazsın!",255,0,0)
      butonmaksbasmadeger=butonmaksbasmadeger+1
    end
   elseif source == robotbutonlabel and dronkontrol==true and butonmaksbasmadeger<=butonabasmasiniri then
    outputChatBox("Daha fazla robot alamazsın önce aldığını kapat.",255,0,0)
    butonmaksbasmadeger=butonmaksbasmadeger+1
  end

 --kapat butonuna basılınca
  if source == kapatbutonlabel then
      panelacma()
 end
end
function panelacma() --PANEL AÇMA KAPAMA
  if dronkontrol == false then
    if panelacmadeger==false then
      panel()
      panelacmadeger=true
    else
        guiSetVisible(main,false)
        showCursor(false)
        panelacmadeger=false
    end
  else
    dronkontrol=false
    triggerServerEvent("drondanin",localPlayer)
    triggerServerEvent("dronsilme",localPlayer)
  end

end
function pedhasaryedi ( attacker,weapon,bodypart) --ped hasar yiyince canının gitmesi

   if bodypart==9 then
     setElementHealth(source,0)
     elseif weapon==50 then 
      cancelEvent()
     else
     can= getElementHealth(source)
     can=can-35
     setElementHealth(source,can)
   end

end 
function arabayabinme  ( theVehicle, seat ) --araçtan inince yapılacak ayarlar
  if ( getElementModel ( theVehicle ) == 464 ) then 
      toggleControl ( "vehicle_secondary_fire", false )
      if seat>=1 then 
        triggerServerEvent("drondanin",localPlayer)
      end
  else --
      toggleControl ( "vehicle_secondary_fire", true ) 
  end
  if ( getElementModel ( theVehicle ) == 594 ) then 
    if seat>=1 then 
      triggerServerEvent("drondanin",localPlayer)
    end
  end
  if ( getElementModel ( theVehicle ) == 501) then 
    if seat>=1 then 
      triggerServerEvent("drondanin",localPlayer)
    end
  end
end
function pedoldu()--ped ölünce 
  for k, v in ipairs(getElementsByType('ped')) do
    if getElementData(v, "sahipped") == getPlayerName(getLocalPlayer()) then
      dronkontrol=false
      triggerServerEvent("drondanin",localPlayer)
      triggerServerEvent("dronsilme",localPlayer)
      setElementHealth(getLocalPlayer(),0)
     --timer ayarlama
      if (isTimer(altyazitimer)==nil) then --timer ayarlama
        
      elseif (isTimer(altyazitimer)==true) then
       killTimer(altyazitimer)
      else
    end
    end
 end
end
function dronatesengel(attacker,weapon,bodypart) --drondaki oyuncu hasar yerse canı gitmiyor
  if (isPedInVehicle(localPlayer)) then 
   local arac= getPedOccupiedVehicle ( getLocalPlayer() )
   local aracmodel=getElementModel(arac)
  end
  local saldirganmodel=getElementModel(attacker)
  if weapon==50 and saldirganmodel==501 then 
    cancelEvent()
  end
  if dronkontrol==true  then
   if aracmodel==441 or aracmodel==464 or aracmodel==594 or aracmodel==501 then
    cancelEvent()
    
   end
  end
end
function menzil()  --MENZİLDEN ÇIKARSA DENİZE DÜŞERSE V.B OLAYLARI İÇİN
    --VV--Dron alt yazısı
    if dronkontrol==true and altyazisure==false then 
       if (isPedInVehicle(getLocalPlayer())) then 
         local oyuncuaraba=getPedOccupiedVehicle(getLocalPlayer())
         local aracmodel=getElementModel(oyuncuaraba)
          function altyazizaman()
           altyazisure=true
          end
           if aracmodel == 441 then
            dxDrawText("Uzaktan kumandalı aracı kullanmayı bırakmak  için 'N' basınız ya da '/dron' yazınız.", screenW * 0.2481, screenH * 0.944, screenW * 0.7231, screenH * 0.0689, tocolor(255, 255,255, 255), 0.60, "bankgothic", "left", "top", false, false, false, true, false)
           end
           if aracmodel == 464 then
             dxDrawText("İHA'yı kullanmayı bırakmak için 'N' basınız ya da '/dron' yazınız.", screenW * 0.3181, screenH * 0.944, screenW * 0.7231, screenH * 0.0689, tocolor(255, 255,255, 255), 0.60, "bankgothic", "left", "top", false, false, false, true, false)
           end
           if aracmodel == 594 then
             dxDrawText("Robotu kullanmayı bırakmak için 'N' basınız ya da '/dron' yazınız.", screenW * 0.2681, screenH * 0.944, screenW * 0.7231, screenH * 0.0689, tocolor(255, 255,255, 255), 0.60, "bankgothic", "left", "top", false, false, false, true, false)
           end
           if aracmodel == 501 then
             dxDrawText( "Dronu kullanmayı bırakmak için 'N' basınız ya da '/dron' yazınız.", screenW * 0.2941, screenH * 0.944, screenW * 0.7231, screenH * 0.0689, tocolor(255, 255,255, 255), 0.60, "bankgothic", "left", "top", false, false, false, true, false)
             dxDrawText( "Dron sabitleme modunu kullanmak için 'X' basınız.", screenW * 0.3281, screenH * 0.965, screenW * 0.7231, screenH * 0.0689, tocolor(255, 255,255, 255), 0.60, "bankgothic", "left", "top", false, false, false, true, false)
           end
           if altyazizamanlayicidegisken==false then
           altyazitimer=setTimer(altyazizaman,15000,1) 
           altyazizamanlayicidegisken=true
           end
       end
     end
  local arabadamikontrol=isPedInVehicle(getLocalPlayer())
  if dronkontrol==true  and arabadamikontrol==true then
    local ox,oy,oz=getElementPosition(getLocalPlayer())
    local oyuncuaraba=getPedOccupiedVehicle(getLocalPlayer())
    local aracmodel=getElementModel(oyuncuaraba)
    local arabacan=getElementHealth(oyuncuaraba)
    local isik=getVehicleOverrideLights(oyuncuaraba)
    xustmenzil=px+dronalansinir
    xaltmenzil=px-dronalansinir
    ysolmenzil=py-dronalansinir
    ysagmenzil=py+dronalansinir
    if aracmodel==594 and isik==2 or isik== 0 then
      setVehicleOverrideLights(oyuncuaraba,1)
    end
    if aracmodel==441 or aracmodel==464 or aracmodel==594 or aracmodel==501 then -- canı azken silme
      if arabacan<=400 then 
        triggerServerEvent("drondanin",localPlayer)
        triggerServerEvent("dronsilme",localPlayer)
        dronkontrol=false
        --timer ayarlama
          if (isTimer(altyazitimer)==nil) then --timer ayarlama        
          elseif (isTimer(altyazitimer)==true) then
         killTimer(altyazitimer)
         else
        end
        local ozelaraba=getPedOccupiedVehicle(localPlayer)
        local ozelarabamodel=getElementModel(ozelaraba)
        if ozelarabamodel == 441 then
         outputChatBox("Uzaktan kumandalı aracının sinyali gitti!",255,0,0) 
        end
        if ozelarabamodel ==464 then
         outputChatBox("İnsansız hava aracının sinyali gitti!",255,0,0) 
        end
        if ozelarabamodel == 594 then
         outputChatBox("Robotunun sinyali gitti!",255,0,0) 
        end
        if ozelarabamodel == 501 then
         outputChatBox("Dronunun sinyali gitti!",255,0,0) 
        end
      end
    end
    if  aracmodel==441 or aracmodel==464 or aracmodel==594 or aracmodel==501 then --hayalet modu ekleme
      if aracmodel== 501 then
        setHeliBladeCollisionsEnabled (oyuncuaraba, false)
      end
      for i,v in pairs (getElementsByType("vehicle")) do 
        if (isElementCollidableWith(v,oyuncuaraba) == true) then
          for i,v in pairs (getElementsByType("vehicle")) do 
           setElementCollidableWith(v, oyuncuaraba,false) 
           
          end
       end
     end 
     for i,v in pairs (getElementsByType("ped")) do 
        if (isElementCollidableWith(v,oyuncuaraba) == true) then
          for i,v in pairs (getElementsByType("ped")) do 
           setElementCollidableWith(v, oyuncuaraba,false) 
          end
       end
     end
       for i,v in pairs (getElementsByType("player")) do 
        if (isElementCollidableWith(v,oyuncuaraba) == true) then
          for i,v in pairs (getElementsByType("player")) do 
           setElementCollidableWith(v, oyuncuaraba,false) 
          end
       end
     end
     
    end
    if ox>=xaltmenzil and ox<=xustmenzil and oy>=ysolmenzil and oy<=ysagmenzil then --alan menzilinden çıkma
     else
      triggerServerEvent("drondanin",localPlayer)
      triggerServerEvent("dronsilme",localPlayer)
      dronkontrol=false
      --timer ayarlama
        if (isTimer(altyazitimer)==nil) then --timer ayarlama        
        elseif (isTimer(altyazitimer)==true) then
       killTimer(altyazitimer)
       else
      end
      local ozelaraba=getPedOccupiedVehicle(localPlayer)
      local ozelarabamodel=getElementModel(ozelaraba)
      if ozelarabamodel == 441 then
       outputChatBox("Uzaktan kumandalı aracının sinyali gitti!",255,0,0) 
      end
      if ozelarabamodel ==464 then
       outputChatBox("İnsansız hava aracının sinyali gitti!",255,0,0) 
      end
      if ozelarabamodel == 594 then
       outputChatBox("Robotunun sinyali gitti!",255,0,0) 
      end
      if ozelarabamodel == 501 then
       outputChatBox("Dronunun sinyali gitti!",255,0,0) 
      end
    end
    if lasventurasengel==true and ox>= yasaklialanxalt and ox<=yasaklialanxust and oy>=yasaklialanysol and oy<=yasaklialanysag then 
      triggerServerEvent("drondanin",localPlayer)
      triggerServerEvent("dronsilme",localPlayer)
      dronkontrol=false
     --timer ayarlama
      if (isTimer(altyazitimer)==nil) then --timer ayarlama   
      elseif (isTimer(altyazitimer)==true) then
      killTimer(altyazitimer)
      else
     end
      outputChatBox(yasaklialanmesaj,255,0,0)
    end
    if arabadamikontrol==true then
      if aracmodel==441 or aracmodel==464 or aracmodel==594 or aracmodel==501 then 
      else
       dronkontrol=false
      --timer ayarlama
       if (isTimer(altyazitimer)==nil) then --timer ayarlama 
       elseif (isTimer(altyazitimer)==true) then
       killTimer(altyazitimer)
       else
      end
       outputChatBox("Dronun silindi lütfen tekrar al.",255,0,0)
       triggerServerEvent("dronsilme",localPlayer)
      end
   end
   if isElementInWater (oyuncuaraba) then --suya düşerse
     triggerServerEvent("drondanin",localPlayer)
     triggerServerEvent("dronsilme",localPlayer)
     dronkontrol=false
     --timer ayarlama
      if (isTimer(altyazitimer)==nil) then --timer ayarlama   
      elseif (isTimer(altyazitimer)==true) then
     killTimer(altyazitimer)
     else
     end
     local ozelaraba=getPedOccupiedVehicle(localPlayer)
     local ozelarabamodel=getElementModel(ozelaraba)
     if ozelarabamodel == 441 then
      outputChatBox("Uzaktan kumandalı aracının sinyali gitti!",255,0,0) 
     end
     if ozelarabamodel ==464 then
      outputChatBox("İnsansız hava aracının sinyali gitti!",255,0,0) 
     end
     if ozelarabamodel == 594 then
      outputChatBox("Robotunun sinyali gitti!",255,0,0) 
     end
     if ozelarabamodel == 501 then
      outputChatBox("Dronunun sinyali gitti!",255,0,0) 
     end
   end
  end
  if arabadamikontrol==false and dronkontrol==true then --dron silinirse
    if destroylananaracid==441 or destroylananaracid==464 or destroylananaracid==594 or destroylananaracid==501 then 
      dronkontrol=false
     --timer ayarlama
      if (isTimer(altyazitimer)==nil) then --timer ayarlama
      elseif (isTimer(altyazitimer)==true) then
      killTimer(altyazitimer)
      else
    end
      destroylananaracid=nil
      local ozelaraba=getPedOccupiedVehicle(localPlayer)
      local ozelarabamodel=getElementModel(ozelaraba)
      if ozelarabamodel == 441 then
       outputChatBox("Uzaktan kumandalı aracın silindi.",255,0,0) 
      end
      if ozelarabamodel ==464 then
       outputChatBox("İnsansız hava aracın silindi.",255,0,0) 
      end
      if ozelarabamodel == 594 then
       outputChatBox("Robotun silindi.",255,0,0) 
      end
      if ozelarabamodel == 501 then
       outputChatBox("Dronun silindi.",255,0,0) 
      end
      triggerServerEvent("dronsilme",localPlayer) 
    end
  end
end
addEventHandler("onClientElementDestroy", resourceRoot, function () --aracı silinirse herhangi bir panelden oyuncuyu düzeltiyor
	if getElementType(source) == "vehicle" and getPedOccupiedVehicle(getLocalPlayer()) == source then
      destroylananaracid=getElementModel(source)
	end
end)
function zipla() --ziplamak için
  if oyuncuarabaziplamaizni==true and dronkontrol==true then 
    local oyuncuaraba=getPedOccupiedVehicle(getLocalPlayer())
    local oyuncuarabamodel=getElementModel(oyuncuaraba)
    if oyuncuarabamodel==441 and ziplamazaman==false  then
      function zaman()
      ziplamazaman=false
      end
      local ox,oy,oz=getElementPosition(getLocalPlayer())
      local rox,roy,roz=getElementRotation(getLocalPlayer())
      setElementPosition(oyuncuaraba,ox,oy,oz+ziplamadeger)
      setElementRotation(oyuncuaraba,rox-25,roy,roz)
      ziplamazaman=true
      setTimer(zaman,5000,1) 
    end 
  end 
end
function dronubirak()
  if dronkontrol==true then 
    dronkontrol=false
    --timer ayarlama
     if (isTimer(altyazitimer)==nil) then --timer ayarlama    
     elseif (isTimer(altyazitimer)==true) then
     killTimer(altyazitimer)
     else
    end
    triggerServerEvent("drondanin",localPlayer)
    triggerServerEvent("dronsilme",localPlayer)
  end
end
function sabitdronmodu ()
 if dronkontrol==true then 
  local dron = getPedOccupiedVehicle(localPlayer)
  local dronmodel=getElementModel(dron)
	local dronmoduonoff = isElementFrozen(dron)
	if isPedInVehicle(localPlayer) then
    if dronmodel==501 then
      if getPedOccupiedVehicleSeat(localPlayer) == 0 then
        if dronmoduonoff == false then
          setElementFrozen(dron,true)
        elseif dronmoduonoff == true then
          setElementFrozen(dron,false)
        end
      end 
    end
	end
 end
end
function silahengel()
  if dronkontrol==true then 
    setPedWeaponSlot(localPlayer,0)
  end
end
function arabadaninme()
  if dronkontrol==true then 
    dronkontrol=false
    --timer ayarlama
     if (isTimer(altyazitimer)==nil) then --timer ayarlama    
     elseif (isTimer(altyazitimer)==true) then
     killTimer(altyazitimer)
     else
    end
    triggerServerEvent("drondanin",localPlayer)
    triggerServerEvent("dronsilme",localPlayer)
  end
end
bindKey("x","down",sabitdronmodu)
bindKey("lshift","down",zipla)
bindKey("n","down",dronubirak)
addEventHandler("onClientPlayerWeaponSwitch", localPlayer, silahengel) -- silah alırsa dronda engellenecek
addEventHandler ( "onClientPreRender", root, menzil )
addEventHandler ( "onClientPlayerDamage", localPlayer, dronatesengel)
addEventHandler("onClientPedWasted", root, pedoldu)
addEventHandler ( "onClientPlayerVehicleEnter", localPlayer, arabayabinme )-- baronun ateş etmesini engelledik
addEventHandler ( "onClientPlayerVehicleExit", localPlayer, arabadaninme )-- baronun ateş etmesini engelledik
addEventHandler ( "onClientPedDamage", resourceRoot, pedhasaryedi ) 
addEventHandler("onClientGUIClick",root,butonabasma)
addCommandHandler("dron",panelacma)



-- Sitemiz : https://sparrow-mta.blogspot.com/

-- Facebook : https://facebook.com/sparrowgta/
-- İnstagram : https://instagram.com/sparrowmta/
-- YouTube : https://youtube.com/c/SparroWMTA/

-- Discord : https://discord.gg/DzgEcvy