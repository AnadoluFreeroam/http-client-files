local lib = {
 panel = {},
 button = {},
 border = {},
 line = {},
 liste = {},
 edit = {},
 memo = {},
 genel = {},
 checkbox = {},
}
local font = guiCreateFont("lib/font.ttf",10.5)
local fontl = guiCreateFont("lib/font.ttf",8.3)
--renk
function renk(resim,hex)
	guiSetProperty(resim,"ImageColours","tl:FF"..hex.." tr:FF"..hex.." bl:FF"..hex.." br:FF"..hex)
end
--panel
function guiCreateWindow(x,y,w,h,yazi,relative,parent,cizgirenk)
	--iprint("Panel Var")
	panelsayi = #lib.panel + 1
	if relative  then
		px,pu = guiGetSize(parent,false)
		x,y,w,h = x*px,y*pu,w*px,h*pu
		relative = false
	end
	if not lib.panel[panelsayi] then lib.panel[panelsayi] = {} end
	--iprint(panelsayi)
	lib.panel[panelsayi].arkataraf = guiCreateStaticImage(x,y,w,h,"lib/beyaz.png",relative,parent)
	renk(lib.panel[panelsayi].arkataraf,"000000")
	guiSetAlpha(lib.panel[panelsayi].arkataraf,0.9)
	--baslik
	lib.panel[panelsayi].baslik = guiCreateStaticImage(0,0,w,20,"lib/beyaz.png",false,lib.panel[panelsayi].arkataraf)
	renk(lib.panel[panelsayi].baslik,"222222")
	--border
	lib.panel[panelsayi].kenarlar = {
		ortaust = guiCreateStaticImage(1, 0, w - 2, 1,"lib/beyaz.png",false,lib.panel[panelsayi].arkataraf),
		ortaalt = guiCreateStaticImage(1, h-1, w - 2, 1,"lib/beyaz.png",false,lib.panel[panelsayi].arkataraf),
		sol = guiCreateStaticImage(0, 1, 1, h-2,"lib/beyaz.png",false,lib.panel[panelsayi].arkataraf),
		sag = guiCreateStaticImage(w-1, 1, 1, h-2,"lib/beyaz.png",false,lib.panel[panelsayi].arkataraf)
	}
	for i,v in pairs(lib.panel[panelsayi].kenarlar) do
		renk(v,"000000")
		guiSetProperty(v, "AlwaysOnTop", "True")
	end	
	--cizgi
	lib.panel[panelsayi].panelcizgi = guiCreateStaticImage(1,20,w-2,1,"lib/beyaz.png",false,lib.panel[panelsayi].arkataraf)
	renk(lib.panel[panelsayi].panelcizgi,cizgirenk or "989898")
	guiSetProperty(lib.panel[panelsayi].panelcizgi, "AlwaysOnTop", "True")
	--panelyazi
	lib.panel[panelsayi].label = guiCreateLabel((w/2)-((string.len(yazi)*10)/2),0.5,(string.len(yazi)*10),20, yazi, false,lib.panel[panelsayi].baslik)
	guiSetFont(lib.panel[panelsayi].label,font)
	guiLabelSetHorizontalAlign(lib.panel[panelsayi].label, "center")
	guiLabelSetColor(lib.panel[panelsayi].label,137, 137, 137)

	return lib.panel[panelsayi].arkataraf
end
--button
function guiCreateButton(x,y,w,h,yazi,relative,parent,butoncizgirenk)
	butonsayi = #lib.button + 1
	if relative  then
		px,pu = guiGetSize(parent,false)
		x,y,w,h = x*px,y*pu,w*px,h*pu
		relative = false
	end
	if not lib.button[butonsayi] then lib.button[butonsayi] = {} end
	lib.button[butonsayi].arkataraf = guiCreateStaticImage(x,y,w,h,"lib/beyaz.png",relative,parent)
	renk(lib.button[butonsayi].arkataraf,"000000")
	
	lib.button[butonsayi].kenarlar = {
		ortaust = guiCreateStaticImage(1, 0, w - 2, 1,"lib/beyaz.png",false,lib.button[butonsayi].arkataraf),
		ortaalt = guiCreateStaticImage(1, h-1, w - 2, 1,"lib/beyaz.png",false,lib.button[butonsayi].arkataraf),
		sol = guiCreateStaticImage(0, 1, 1, h-2,"lib/beyaz.png",false,lib.button[butonsayi].arkataraf),
		sag = guiCreateStaticImage(w-1, 1, 1, h-2,"lib/beyaz.png",false,lib.button[butonsayi].arkataraf)		
	}
	for i,v in pairs(lib.button[butonsayi].kenarlar) do
		renk(v,butoncizgirenk or "333333")
		guiSetProperty(v, "AlwaysOnTop", "True")
		guiSetAlpha(v,1)
	end	
	lib.button[butonsayi].label = guiCreateLabel(0,-2,w,h, yazi, false,lib.button[butonsayi].arkataraf)
	guiSetFont(lib.button[butonsayi].label,"default-bold-small")
	guiLabelSetHorizontalAlign(lib.button[butonsayi].label, "center")
	guiLabelSetVerticalAlign(lib.button[butonsayi].label, "center")
	guiLabelSetColor(lib.button[butonsayi].label,200, 200, 200)
	lib.genel[lib.button[butonsayi].label] = lib.button[butonsayi].kenarlar
	return lib.button[butonsayi].label 
end
--liste
_guiCreateGridList = guiCreateGridList
function guiCreateGridList(x,y,g,u,relative,parent,listekenarrenk,a)
	listesayi =  #lib.liste + 1
	if not lib.liste[listesayi] then lib.liste[listesayi] = {} end
	if relative  then
		px,pu = guiGetSize(parent,false)
		x,y,g,u = x*px,y*pu,g*px,u*pu
	end
	local relative = false
	local a = a or 30.5
	lib.liste[listesayi].resim = guiCreateLabel(x,y,g,u, "", relative, parent)
	lib.liste[listesayi].listee = _guiCreateGridList(-10,-8,g+35, u+a,false, lib.liste[listesayi].resim)
	guiSetFont(lib.liste[listesayi].listee,fontl)
	lib.liste[listesayi].kenarlar = {
		ortaust = guiCreateStaticImage(1, 0, g - 2, 1,"lib/beyaz.png",false,lib.liste[listesayi].resim),
		ortaalt = guiCreateStaticImage(1, u-1, g - 2, 1,"lib/beyaz.png",false,lib.liste[listesayi].resim),
		sol = guiCreateStaticImage(0, 1, 1, u-2,"lib/beyaz.png",false,lib.liste[listesayi].resim),
		sag = guiCreateStaticImage(g-1, 1, 1, u-2,"lib/beyaz.png",false,lib.liste[listesayi].resim)		
	}
	for i,v in pairs(lib.liste[listesayi].kenarlar) do
		renk(v,listekenarrenk or "333333")
		guiSetProperty(v, "AlwaysOnTop", "True")
		guiSetAlpha(v,0.7)
	end	
	lib.genel[lib.liste[listesayi].listee] = lib.liste[listesayi].kenarlar
	return lib.liste[listesayi].listee
end
--checkbox
--_guiCreateCheckBox = guiCreateCheckBox
function guiCreateCheckBox(x,y,g,u,yazi,secilimi,relative,parent,kenarenk)
	tiksayi =  #lib.checkbox + 1
	if not lib.checkbox[tiksayi] then lib.checkbox[tiksayi] = {} end
	--lib.checkbox[tiksayi] = lib.checkbox[tiksayi]
	if relative  then
		px,pu = guiGetSize(parent,false)
		x,y,g,u = x*px,y*pu,g*px,u*pu
	end
	local relative = false
	lib.checkbox[tiksayi].secili = secilimi 
	lib.checkbox[tiksayi].arkaresim = guiCreateStaticImage(x,y,20,20,"lib/beyaz.png",relative,parent)
	renk(lib.checkbox[tiksayi].arkaresim,"000000")
	guiSetAlpha(lib.checkbox[tiksayi].arkaresim,0.7)

	lib.checkbox[tiksayi].tik = guiCreateStaticImage(5,5,10,10,"lib/beyaz.png",relative,lib.checkbox[tiksayi].arkaresim)
	renk(lib.checkbox[tiksayi].tik,kenarenk or "333333")
	guiSetVisible(lib.checkbox[tiksayi].tik,lib.checkbox[tiksayi].secili)

	lib.checkbox[tiksayi].yazi = guiCreateLabel(x+22,y+1,g,20,yazi,false,parent)
	guiSetFont(lib.checkbox[tiksayi].yazi,font)

	lib.checkbox[tiksayi].kenarlar = {
		ortaust = guiCreateStaticImage(1, 0, 20 - 2, 1,"lib/beyaz.png",false,lib.checkbox[tiksayi].arkaresim),
		ortaalt = guiCreateStaticImage(1, 20-1, 20 - 2, 1,"lib/beyaz.png",false,lib.checkbox[tiksayi].arkaresim),
		sol = guiCreateStaticImage(0, 1, 1, 20-2,"lib/beyaz.png",false,lib.checkbox[tiksayi].arkaresim),
		sag = guiCreateStaticImage(20-1, 1, 1, 20-2,"lib/beyaz.png",false,lib.checkbox[tiksayi].arkaresim),		
	}
	for i,v in pairs(lib.checkbox[tiksayi].kenarlar) do
		renk(v,kenarenk or "333333")
		guiSetProperty(v, "AlwaysOnTop", "True")
		guiSetAlpha(v,0.7)
	end	
	lib.genel[lib.checkbox[tiksayi].arkaresim] = lib.checkbox[tiksayi].kenarlar
	--lib.genel[lib.checkbox[tiksayi].arkaresim] = lib.checkbox[tiksayi].yazi
	lib.genel[lib.checkbox[tiksayi].yazi] = lib.checkbox[tiksayi].kenarlar
	return lib.checkbox[tiksayi].yazi
end
function tikmi(element)
	for i,v in pairs(lib.checkbox) do
		if v.yazi == element then
			return v,i
		end	
	end
end
function guiCheckBoxGetSelected(element)
	local sira = tikmi(element)
	return sira.secili
end
function guiCheckBoxSetSelected(element,bool)
	local sira = tikmi(element)
	if sira then 
		guiSetVisible(sira.tik,bool)
		sira.secili = bool
	return true
	end
end
--editbox
_guiCreateMemo = guiCreateMemo
function guiCreateMemo(x,y,g,u,yazi,relative,parent,kenarrenk)
	memosayi = #lib.memo +1
	if not lib.memo[memosayi] then lib.memo[memosayi] = {} end
	if relative  then
		px,pu = guiGetSize(parent,false)
		x,y,g,u = x*px,y*pu,g*px,u*pu
	end
	local relative = false
	lib.memo[memosayi].resim = guiCreateLabel(x,y,g,u, "", relative, parent)
	lib.memo[memosayi].memoo = _guiCreateMemo(-5.4,-5,g+30, u+8,yazi,false, lib.memo[memosayi].resim)
	guiSetFont(lib.memo[memosayi].memoo,font)
	
	lib.memo[memosayi].kenarlar = {
		ortaust = guiCreateStaticImage(0,0,g,1,"lib/beyaz.png",false,lib.memo[memosayi].resim),
		ortaalt = guiCreateStaticImage(0,u-1,g,1,"lib/beyaz.png",false,lib.memo[memosayi].resim),
		sol = guiCreateStaticImage(0,0,1,u,"lib/beyaz.png",false,lib.memo[memosayi].resim),
		sag = guiCreateStaticImage(g-1,0,1,u,"lib/beyaz.png",false,lib.memo[memosayi].resim)		
	}
	for i,v in pairs(lib.memo[memosayi].kenarlar) do
		renk(v,editboxkenarrenk or "000000")
		guiSetProperty(v, "AlwaysOnTop", "True")
		guiSetAlpha(v,1)
	end	
	
	return lib.memo[memosayi].memoo
end

_guiCreateEdit = guiCreateEdit
function guiCreateEdit(x,y,g,u,yazi,relative,parent,kenarrenk)
	editsayi = #lib.edit +1
	if not lib.edit[editsayi] then lib.edit[editsayi] = {} end
	if relative  then
		px,pu = guiGetSize(parent,false)
		x,y,g,u = x*px,y*pu,g*px,u*pu
	end
	local relative = false
	lib.edit[editsayi].resim = guiCreateLabel(x,y,g,u, "", relative, parent)
	lib.edit[editsayi].editbox = _guiCreateEdit(-5.4,-5,g+15, u+8,yazi,false, lib.edit[editsayi].resim)
	guiSetFont(lib.edit[editsayi].editbox,font)
	
	lib.edit[editsayi].kenarlar = {
		ortaust = guiCreateStaticImage(0,0,g,1,"lib/beyaz.png",false,lib.edit[editsayi].resim),
		ortaalt = guiCreateStaticImage(0,u-1,g,1,"lib/beyaz.png",false,lib.edit[editsayi].resim),
		sol = guiCreateStaticImage(0,0,1,u,"lib/beyaz.png",false,lib.edit[editsayi].resim),
		sag = guiCreateStaticImage(g-1,0,1,u,"lib/beyaz.png",false,lib.edit[editsayi].resim)		
	}
	for i,v in pairs(lib.edit[editsayi].kenarlar) do
		renk(v,editboxkenarrenk or "000000")
		guiSetProperty(v, "AlwaysOnTop", "True")
		guiSetAlpha(v,1)
	end	
	
	return lib.edit[editsayi].editbox
end


--events
addEventHandler("onClientMouseEnter", resourceRoot, function()
	for i,v in pairs(lib.genel) do
		if source == i then
			for i,v in pairs(v) do
				guiSetAlpha(v, 0.6)
			end	
		end
		for i,v in pairs(lib.checkbox) do
			if source == v.arkaresim or source == v.yazi or source == v.tik  then 
				guiSetAlpha(v.yazi,0.5)
			end
		end
	end
end)
addEventHandler("onClientMouseLeave", resourceRoot, function()
	for i,v in pairs(lib.genel) do
		if source == i then
			for i,v in pairs(v) do
				guiSetAlpha(v, 1)
			end	
		end
		for i,v in pairs(lib.checkbox) do
			if source == v.arkaresim or source == v.yazi or source == v.tik  then 
				guiSetAlpha(v.yazi,1)
			end
		end
	end
end)
addEventHandler("onClientGUIClick",resourceRoot,function()
	for i,v in pairs(lib.checkbox) do
		if source == v.arkaresim or source == v.yazi or source == v.tik then 
			guiSetVisible(v.tik, not guiGetVisible(v.tik))		
			if v.secili == true then 
			v.secili = false
			else
			v.secili = true
			end
		end
	end
end)












local sx, sy = guiGetScreenSize()
localPlayer = getLocalPlayer()
local visible = false
local key = "F2"

local neonname = {
[1] = "Kırmızı Neon",
[2] = "Mavi Neon",
[3] = "Yeşil Neon",
[4] = "Sarı Neon",
[5] = "Pembe Neon",
[6] = "Beyaz Neon",
[7] = "Neon'u Kaldır",
[8] = "Panel'i Kapat"
}

local idModel = {
[1] = 14399,
[2] = 14400,
[3] = 14401,
[4] = 14402,
[5] = 14403,
[6] = 14404
}

function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    return guiSetPosition(center_window, x, y, false)
end

function openGui()
local xBtn = 27
local yBtn = 30
local wBtn = 150
local hBtn = 21
local space = 28
     window = guiCreateWindow(sx/2-150,sy/2-115,200,280,"Anadolu - 	Neon Panel",false)
     Btn1 = guiCreateButton(xBtn,yBtn,wBtn,hBtn,neonname[1],false, window,"B22222")
     Btn2 = guiCreateButton(xBtn,yBtn+space,wBtn,hBtn,neonname[2],false, window,"0066FF")
     Btn3 = guiCreateButton(xBtn,yBtn+2*space,wBtn,hBtn,neonname[3],false, window,"228B22")
     Btn4 = guiCreateButton(xBtn,yBtn+3*space,wBtn,hBtn,neonname[4],false, window,"FFCC00")
     Btn5 = guiCreateButton(xBtn,yBtn+4*space,wBtn,hBtn,neonname[5],false, window,"FF1493")
     Btn6 = guiCreateButton(xBtn,yBtn+5*space,wBtn,hBtn,neonname[6],false, window,"FFFFFF")
     Btn7 = guiCreateButton(xBtn,yBtn+6*space,wBtn,hBtn,neonname[7],false, window)
     info = guiCreateLabel(0, 222, 300, 15,"----------------------- ☉ ---------------------------", false, window) 
	 Btn8 = guiCreateButton(xBtn,yBtn+7.6*space,wBtn,hBtn+5,neonname[8],false, window)
     centerWindow( window )
guiSetVisible(window, visible)
end


function Kapat()
if (source == Btn8) then
    guiSetVisible(window,false)
    showCursor(false)
	end
end
addEventHandler ( "onClientGUIClick", getRootElement(), Kapat )

function start_cl_resource()
	openGui()
          if ( guiGetVisible(window) == true ) then
             showCursor(true)
          end
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),start_cl_resource)

function kapatt ()

if guiGetVisible(window) == true then

guiSetVisible(window,false)

showCursor(false)

end

end

bindKey("F1","down",kapatt)



addEvent("anadolu:neonpanel",true)

addEventHandler("anadolu:neonpanel", root, function()

guiSetVisible(window, not guiGetVisible(window))

showCursor(guiGetVisible(window))

end)



function onGuiClickPanel (button, state, absoluteX, absoluteY)
  if (source == Btn1) then
       setElementData( localPlayer, "neon", idModel[1] )
       local theVehicle = getPedOccupiedVehicle ( localPlayer )
       triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
       triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
  elseif (source == Btn2) then
       setElementData( localPlayer, "neon", idModel[2] )
       local theVehicle = getPedOccupiedVehicle ( localPlayer )
       triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
       triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
  elseif (source == Btn3) then
       setElementData( localPlayer, "neon", idModel[3] )
       local theVehicle = getPedOccupiedVehicle ( localPlayer )
       triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
       triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
  elseif (source == Btn4) then
       setElementData( localPlayer, "neon", idModel[4] )
       local theVehicle = getPedOccupiedVehicle ( localPlayer )
       triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
       triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
  elseif (source == Btn5) then
       setElementData( localPlayer, "neon", idModel[5] )
       local theVehicle = getPedOccupiedVehicle ( localPlayer )
       triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
       triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
  elseif (source == Btn6) then
       setElementData( localPlayer, "neon", idModel[6] )
       local theVehicle = getPedOccupiedVehicle ( localPlayer )
       triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
       triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
  elseif (source == Btn7) then
       setElementData( localPlayer, "neon", 0 )
       local theVehicle = getPedOccupiedVehicle ( localPlayer )
       triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
  end
end
addEventHandler ("onClientGUIClick", getRootElement(), onGuiClickPanel)


function replaceTXD() 
txd = engineLoadTXD ( "models/MatTextures.txd" )
engineImportTXD ( txd, idModel[1] )
engineImportTXD ( txd, idModel[2] )
engineImportTXD ( txd, idModel[3] )
engineImportTXD ( txd, idModel[4] )
engineImportTXD ( txd, idModel[5] )
engineImportTXD ( txd, idModel[6] )

col = engineLoadCOL("models/RedNeonTube1.col")
engineReplaceCOL(col, idModel[1])
col = engineLoadCOL("models/BlueNeonTube1.col")
engineReplaceCOL(col, idModel[2])
col = engineLoadCOL("models/GreenNeonTube1.col")
engineReplaceCOL(col, idModel[3])
col = engineLoadCOL("models/YellowNeonTube1.col")
engineReplaceCOL(col, idModel[4])
col = engineLoadCOL("models/PinkNeonTube1.col")
engineReplaceCOL(col, idModel[5])
col = engineLoadCOL("models/WhiteNeonTube1.col")
engineReplaceCOL(col, idModel[6])

dff = engineLoadDFF ( "models/RedNeonTube1.dff", idModel[1] )
engineReplaceModel ( dff, idModel[1] ) 
dff = engineLoadDFF ( "models/BlueNeonTube1.dff", idModel[2] )
engineReplaceModel ( dff, idModel[2] ) 
dff = engineLoadDFF ( "models/GreenNeonTube1.dff", idModel[3] )
engineReplaceModel ( dff, idModel[3] ) 
dff = engineLoadDFF ( "models/YellowNeonTube1.dff", idModel[4] )
engineReplaceModel ( dff, idModel[4] ) 
dff = engineLoadDFF ( "models/PinkNeonTube1.dff", idModel[5] )
engineReplaceModel ( dff, idModel[5] ) 
dff = engineLoadDFF ( "models/WhiteNeonTube1.dff", idModel[6] )
engineReplaceModel ( dff, idModel[6] ) 
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceTXD)