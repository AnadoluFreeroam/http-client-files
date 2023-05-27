addEvent ( "onClientTCTToggle", true )

editorForm = {
	settings = { }
}

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






function createMainWindow ( )
	editorForm.wnd = guiCreateWindow ( sw / 2 - 360, sh / 2 - 282.5, 740, 565, "Anadolu Freeroam - TCT Sistemi", false )
	
	editorForm.leftPanel = guiCreateTabPanel ( 0.02, 0.05, 0.57, 0.92, true, editorForm.wnd )
	
	createEntityTab ( "Objeler", "objects.xml" )
	--createEntityTab ( "Vehicle", "vehicles.xml" )
	createEntityTab ( "Karakterler", "peds.xml" )
	
	--editorForm.createEdit = guiCreateEdit ( 0.02, 0.92, 0.35, 0.045, "", true, editorForm.wnd )
	--editorForm.createBtn = guiCreateButton ( 0.38, 0.92, 0.21, 0.045, "Create", true, editorForm.wnd )
	
	editorForm.rightPanel = guiCreateTabPanel ( 0.6, 0.05, 0.38, 0.92, true, editorForm.wnd )

	editorForm.toolsTab = guiCreateTab ( "Araçlar", editorForm.rightPanel )
	editorForm.toolsList = guiCreateGridList ( 0.02, 0.02, 0.42, 0.96, true, editorForm.toolsTab )
	guiGridListAddColumn ( editorForm.toolsList, "Araçlar", 0.8 )
	guiGridListSetSortingEnabled ( editorForm.toolsList, false )
	guiGridListSetSelectionMode ( editorForm.toolsList, 0 )
     
	editorForm.optionsTab = guiCreateTab ( "Ayarlar", editorForm.rightPanel )
	editorForm.optionsScrollPane = guiCreateScrollPane ( 0.04, 0.02, 0.92, 0.96, true, editorForm.optionsTab )
 
	createSetting ( "s_step", { 
		"edit",
		
		text = "Step", 
		value = 0.1
	} )
	createSetting ( "s_saveOffs", { 
		"checkbox",
		
		text = "Save offsets", 
		selected = true
	} )
	createSetting ( "s_thelp", { 
		"checkbox",
		
		text = "Tool helper", 
		selected = true
	} )
	createSetting ( "s_resetOffs", { 
		"button",
		
		text = "Reset offsets", 
		onClick = function ( )
			g_entityOffset.reset ( )
		end
	} )
  
	addEventHandler ( "onClientGUIClick", editorForm.wnd, click )
  
	guiSetVisible ( editorForm.wnd, false )
end

function click ( )
	if getElementType ( source ) == "gui-gridlist" then
		local selectedRow = guiGridListGetSelectedItem ( source )
		
		if selectedRow < 0 then
			setSelectedTool ( getToolFromName ( "Default" ) )
				
			for element, _ in pairs ( bindedGridLists ) do
				guiGridListSetSelectedItem ( element, -1, 0 )
			end
						
			guiGridListSetSelectedItem ( editorForm.toolsList, -1, 0 )
			
			return
		end
	end
	
	if source == editorForm.createBtn then
		local model = tonumber ( guiGetText ( editorForm.createEdit ) )
		
		if model then
			setSelectedTool ( getToolFromName ( "Default" ) )
			
			for gridlist, _ in pairs ( bindedGridLists ) do
				guiGridListSetSelectedItem ( gridlist, -1, 0 )
			end
			
			guiGridListSetSelectedItem ( editorForm.toolsList, -1, 0 )
   
			local element = createEntity ( model, g_entityOffset.calcPosition ( ) )
			if element then
				setEditorTarget ( element )
			else
				outputChatBox ( "WBO: Incorrect object model" )
			end
		else
			outputChatBox ( "WBO: Incorrect object model" )
		end
	elseif source == editorForm.toolsList then  
		for gridlist, _ in pairs ( bindedGridLists ) do
			guiGridListSetSelectedItem ( gridlist, -1, 0 )
		end
  
		local selectedItem = guiGridListGetSelectedItem ( source )
		if selectedItem > -1 then
			local toolName = guiGridListGetItemText ( source, selectedItem, 1 )
			setSelectedTool ( getToolFromName ( toolName ) )
		end
	end
end



addEventHandler ( "onClientTCTToggle", resourceRoot,
	function ( )
--if (getElementDimension(localPlayer) == 1)  true then return false end
--if getElementDimension(localPlayer) ~= 1 then return end

		local visible = not guiGetVisible ( editorForm.wnd )
	
		guiSetInputEnabled ( visible )
		guiSetVisible ( editorForm.wnd, visible )
		showCursor ( visible )
	end
, false )

function editorCreateEntity ( gridlist, model )
	setSelectedTool ( getToolFromName ( "Default" ) )
						
	for element, _ in pairs ( bindedGridLists ) do
		if element ~= gridlist then
			guiGridListSetSelectedItem ( element, -1, 0 )
		end
	end
						
	guiGridListSetSelectedItem ( editorForm.toolsList, -1, 0 )
					
	local element = createEntity ( tonumber ( model ), g_entityOffset.calcPosition ( ) )
	if element then
		setEditorTarget ( element )
	end
end

function createEntityTab ( name, xmlfile )
	local entityTab = { 
		tab = guiCreateTab ( name, editorForm.leftPanel )
	}
	entityTab.gridlist = guiCreateGridList ( 0.02, 0.02, 0.96, 0.96, true, entityTab.tab )
	
	guiGridListSetSortingEnabled ( entityTab.gridlist, false )
	guiGridListSetSelectionMode ( entityTab.gridlist, 0 )
	guiGridListAddColumn ( entityTab.gridlist, "İsim", 0.8 )
	
	
	guiGridListLoadTable ( entityTab.gridlist, loadList ( "conf\\" .. xmlfile ), editorCreateEntity )
	
	return entityTab
end

function createSetting ( id, tbl )
	editorForm.settings [ id ] = createControl ( tbl, editorForm.optionsScrollPane )
	
	return editorForm.settings [ id ]
end

function getSettingByID ( id )
	return editorForm.settings [ id ]
end