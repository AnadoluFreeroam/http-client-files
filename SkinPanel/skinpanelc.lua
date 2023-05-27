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
	renk(lib.panel[panelsayi].baslik,"000000")
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

local SkinTable = { -- skin number, price
{"CJ",0},
--{"Alan Walker",305},
{"Hawlı skin :D",303},
{"Thanos",300},
}
 

 

GUIEditor = {
    button = {},
    window = {},
    scrollbar = {},
    gridlist = {}
}
 


local screenW, screenH = guiGetScreenSize()
addEventHandler("onClientResourceStart", resourceRoot,
    function()
    JanelaPainel = guiCreateWindow((screenW - 300) / 2, (screenH - 428) / 2, 300, 428, "Karakter Panel", false)
    guiWindowSetSizable(JanelaPainel, false)
    guiSetVisible(JanelaPainel,false)
    GUIEditor.gridlist[1] = guiCreateGridList(25, 48, 250, 271, false, JanelaPainel)
    GUIEditor.button[1] = guiCreateButton(25, 324, 250, 34, "Seç", false, JanelaPainel)
	guiSetFont(GUIEditor.button[1],"default-bold-small")
    GUIEditor.button[2] = guiCreateButton(25, 368, 250, 34, "Paneli Kapat", false, JanelaPainel)
	guiSetFont(GUIEditor.button[2],"default-bold-small")
    GUIEditor.scrollbar[1] = guiCreateScrollBar(275, 48, 12, 272, false, false, JanelaPainel)  
    guiGridListSetSelectionMode(GUIEditor.gridlist[1],0)
    skinColumn = guiGridListAddColumn(GUIEditor.gridlist[1],"Skinİsmi",0.6)
    costColumn = guiGridListAddColumn(GUIEditor.gridlist[1],"ID",0.3)
    addEventHandler ("onClientGUIClick", guiRoot, onClientGUIClick)
    setTimer(lolad,800,1)
    end
)

function wastedMessage ()
showCursor(false)
guiSetVisible(JanelaPainel, false)
end
addEventHandler ( "onClientPlayerWasted", getLocalPlayer(), wastedMessage )
 

 
function onClientGUIClick (button, state, absoluteX, absoluteYe)
  if (source == GUIEditor.button[1]) then 
    if (guiGridListGetSelectedItem (GUIEditor.gridlist[1])) then
      local skinName = guiGridListGetItemText (GUIEditor.gridlist[1], guiGridListGetSelectedItem (GUIEditor.gridlist[1]), 2)
      local skinCost = guiGridListGetItemText (GUIEditor.gridlist[1], guiGridListGetSelectedItem (GUIEditor.gridlist[1]), 1)
      triggerServerEvent ("onBuySkin", getLocalPlayer(), skinName, skinCost)
    end
  elseif (source == GUIEditor.button[2]) then
  guiSetVisible (JanelaPainel, false)
  triggerEvent("vipPanelAc",getRootElement(),localPlayer)
  
  end
end
 
addEvent("OpenSkinPanel",true)
function OpenSkinPanel()
guiSetVisible(JanelaPainel,true)
end
 addEventHandler("OpenSkinPanel",getRootElement(),OpenSkinPanel)
addEvent("CloseSkinPanel",true)
function CloseSkinPanel()
guiSetVisible(JanelaPainel,false)
end
 addEventHandler("CloseSkinPanel",getRootElement(),CloseSkinPanel)
function lolad()
for i,v in ipairs (SkinTable) do
    local skinName = tostring((v[1]))
    local row = guiGridListAddRow (GUIEditor.gridlist[1])
    guiGridListSetItemText (GUIEditor.gridlist[1], row, 1, skinName, false, true)
    guiGridListSetItemText (GUIEditor.gridlist[1], row, 2, tostring(v[2]), false, true)
end
end


addEvent("GorevKapat",true)
addEventHandler("GorevKapat",root,
function ()
showCursor(false)
guiSetVisible(JanelaPainel, false)
end)

addEvent("DuelloKapat",true)
addEventHandler("DuelloKapat",root,
function ()
showCursor(false)
guiSetVisible(JanelaPainel, false)
end)

addEvent("Turf-F1Kapat",true)
addEventHandler("Turf-F1Kapat",root,
function ()
showCursor(false)
guiSetVisible(JanelaPainel, false)
end)

addEvent("Maske-F1Kapat",true)
addEventHandler("Maske-F1Kapat",root,
function ()
showCursor(false)
guiSetVisible(JanelaPainel, false)
end)

addEvent("BankaGirKapat",true)
addEventHandler("BankaGirKapat",root,
function ()
showCursor(false)
guiSetVisible(JanelaPainel, false)
end)
