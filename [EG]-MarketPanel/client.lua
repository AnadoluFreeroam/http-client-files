

local dots = {} 
CMD_LASER = ""	
CMD_LASERCOLOR = "" -- Comando troca cor laser
laserWidth = 2 -- dx line
dotSize	= .05	-- sizee


localPlayer = getLocalPlayer()

picklasercolor = 0
colorPickerInitialized = 0
oldcolors = {r=255,g=0,b=0,a=255}

addEventHandler("onClientResourceStart", getRootElement(), function(res)
	if res == getThisResource() then
		SetLaserEnabled(localPlayer, false)
		SetLaserColor(localPlayer, oldcolors.r,oldcolors.g,oldcolors.b,oldcolors.a)
		
		if colorPickerInitialized == 0 then 
			initColorPicker()			
		end
		
	elseif res == getResourceFromName("colorpicker") then
		if colorPickerInitialized == 0 then 
			initColorPicker()
		end
	end
end )
addEventHandler("onClientResourceStop", getRootElement(), function(res)
	if res == getThisResource() then
		SetLaserEnabled(localPlayer, false)		
	end
end )

GUIEditor = {
    checkbox = {},
    button = {},
}

local sWidth, sHeight = guiGetScreenSize()

local tabPanel = {}
local buttons = {}
local labels = {}
local images = {}

local player = localPlayer

screenx,screeny = guiGetScreenSize()
width, height = 682, 500
x, y = (screenx/2-width/2), (screeny/2-height/2)

function shopInterface()
	shop_window = guiCreateWindow(x, y, width, height, "Anadolu Freeroam - Silah Paneli | F2", false)
	guiWindowSetSizable (shop_window, false )
	guiSetVisible(shop_window, false)
----
	arkaplan3 = guiCreateStaticImage(312, 30, 130, 460, "panel/panel.png", false, shop_window)
----can doldur
	guiCreateStaticImage(0, 0, 130, 122, "panel/kalp.png", false, arkaplan3)
	buttons.skill_MaxHealth = guiCreateButton(5, 122, 120, 20, "Can $3.800", false, arkaplan3)
	guiSetProperty(buttons.skill_MaxHealth, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_MaxHealth, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_MaxHealth, "center", false)
	guiSetFont(buttons.skill_MaxHealth, "default-bold-small")
----zirh al
	guiCreateStaticImage(0, 153, 130, 124, "panel/yelek.png", false, arkaplan3)
	buttons.buy_armor = guiCreateButton(5, 277, 120, 20, "Zırh $850", false, arkaplan3)
	guiSetProperty(buttons.buy_armor, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_armor, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_armor, "center", false)
	guiSetFont(buttons.buy_armor, "default-bold-small")
----kas al
	guiCreateStaticImage(0, 308, 130, 130, "panel/kas.png", false, arkaplan3)
	buttons.skill_Muscle = guiCreateButton(5, 435, 120, 20, "Kas $2600", false, arkaplan3)
	guiSetProperty(buttons.skill_Muscle, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_Muscle, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_Muscle, "center", false)
	guiSetFont(buttons.skill_Muscle, "default-bold-small")
----lazerler
	arkaplan2 = guiCreateStaticImage(452, 30, 220, 460, "panel/panel.png", false, shop_window)
	--
	lazerler = guiCreateLabel(0, 10, 220, 30, "LAZER RENGİNİ SEÇ", false, arkaplan2)
	--guiLabelSetHorizontalAlign(lazerler, "center", false)
	--guiLabelSetVerticalAlign(lazerler, "center")
	guiSetFont(lazerler, "default-bold-small")
--
	mavi1png = guiCreateStaticImage(10, 50, 60, 60, "lazer/mavi1.png", false, arkaplan2)
	GUIEditor.checkbox[1] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, mavi1png)
	guiSetProperty(GUIEditor.checkbox[1], "NormalTextColour", "FF0005FF")
--
	sari1png = guiCreateStaticImage(80, 50, 60, 60, "lazer/sari1.png", false, arkaplan2)
	GUIEditor.checkbox[2] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, sari1png)
	guiSetProperty(GUIEditor.checkbox[2], "NormalTextColour", "FFFFF600")
--
	yesil1png = guiCreateStaticImage(150, 50, 60, 60, "lazer/yesil1.png", false, arkaplan2)
	GUIEditor.checkbox[3] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, yesil1png)
	guiSetProperty(GUIEditor.checkbox[3], "NormalTextColour", "FF41FF00")
--
	kirmizi1png = guiCreateStaticImage(10, 120, 60, 60, "lazer/kirmizi1.png", false, arkaplan2)
	GUIEditor.checkbox[4] = guiCreateCheckBox(-18, 0, 999, 999, "", true, false, kirmizi1png)
	guiSetProperty(GUIEditor.checkbox[4], "NormalTextColour", "FFFF0000")
--
	cyan1png = guiCreateStaticImage(80,  120, 60, 60, "lazer/cyan1.png", false, arkaplan2)
	GUIEditor.checkbox[5] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, cyan1png)
	guiSetProperty(GUIEditor.checkbox[5], "NormalTextColour", "FF00FFFB")
--
	pembe1png = guiCreateStaticImage(150, 120, 60, 60, "lazer/pembe1.png", false, arkaplan2)
	GUIEditor.checkbox[6] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, pembe1png)
	guiSetProperty(GUIEditor.checkbox[6], "NormalTextColour", "FFFF00FC")
--
	turuncu1png = guiCreateStaticImage(10, 190, 60, 60, "lazer/turuncu1.png", false, arkaplan2)
	GUIEditor.checkbox[7] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, turuncu1png)
	guiSetProperty(GUIEditor.checkbox[7], "NormalTextColour", "FFFF3C00")
--
	mavi2png = guiCreateStaticImage(80, 190, 60, 60, "lazer/mavi2.png", false, arkaplan2)
	GUIEditor.checkbox[8] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, mavi2png)
	guiSetProperty(GUIEditor.checkbox[8], "NormalTextColour", "FF1E4F56")
--
	pembe3png = guiCreateStaticImage(150, 190, 60, 60, "lazer/pembe3.png", false, arkaplan2)
	GUIEditor.checkbox[9] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, pembe3png)
	guiSetProperty(GUIEditor.checkbox[9], "NormalTextColour", "FFA94DE9")
--
	mor1png = guiCreateStaticImage(10, 260, 60, 60, "lazer/mor1.png", false, arkaplan2)
	GUIEditor.checkbox[10] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, mor1png)
	guiSetProperty(GUIEditor.checkbox[10], "NormalTextColour", "FF4C07E4")
--
	bordo1png = guiCreateStaticImage(80, 260, 60, 60, "lazer/bordo1.png", false, arkaplan2)
	GUIEditor.checkbox[11] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, bordo1png)
	guiSetProperty(GUIEditor.checkbox[11], "NormalTextColour", "FFAE000000")
--
	siyah1png = guiCreateStaticImage(150, 260, 60, 60, "lazer/siyah1.png", false, arkaplan2)
	GUIEditor.checkbox[12] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, siyah1png)
	guiSetProperty(GUIEditor.checkbox[12], "NormalTextColour", "FF000000")
--
	beyaz1png = guiCreateStaticImage(10, 330, 60, 60, "lazer/beyaz1.png", false, arkaplan2)
	GUIEditor.checkbox[13] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, beyaz1png)
	guiSetProperty(GUIEditor.checkbox[13], "NormalTextColour", "FFFFFFFF")
--
	gri1png = guiCreateStaticImage(80, 330, 60, 60, "lazer/gri1.png", false, arkaplan2)
	GUIEditor.checkbox[14] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, gri1png)
	guiSetProperty(GUIEditor.checkbox[14], "NormalTextColour", "FF404040")
--
	koyuyesil1png = guiCreateStaticImage(150, 330, 60, 60, "lazer/koyuyesil1.png", false, arkaplan2)
	GUIEditor.checkbox[15] = guiCreateCheckBox(-18, 0, 999, 999, "", false, false, koyuyesil1png)
	guiSetProperty(GUIEditor.checkbox[15], "NormalTextColour", "FF005900")
--
GUIEditor.button[1] = guiCreateButton(15, 405, 190, 22, "Lazeri Aç", false, arkaplan2)
	guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFFFFFFF")
guiSetFont(GUIEditor.button[1], "default-bold-small")

silahal = guiCreateButton(15, 435, 190, 22, "Silahlarımı Sıfırla", false, arkaplan2)
	guiSetProperty(silahal, "NormalTextColour", "FFFFFFFF")
guiSetFont(silahal, "default-bold-small")
addEventHandler("onClientGUIClick", root, 
function()
local player = localPlayer
		if (source == silahal) then  
triggerServerEvent("yaraginiyiyimsilahimial", player)
		end
end
)
----
	arkaplan1 = guiCreateStaticImage(10, 30, 292, 460, "panel/panel.png", false, shop_window)
	--tekli 
	teklilerpng = guiCreateStaticImage(0, 0, 288, 105, "weapons/tekliler.png", false, arkaplan1)
	buttons.buy_Pistol = guiCreateButton(5, 68, 91, 17, "Satın Al $8.000", false, teklilerpng)
	guiSetProperty(buttons.buy_Pistol, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_Pistol, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_Pistol, "center", false)
	guiSetFont(buttons.buy_Pistol, "default-bold-small")
	--tekli skill
	buttons.skill_Pistol = guiCreateButton(5, 88, 91, 17, "Yetenek $4.100", false, teklilerpng)
	guiSetProperty(buttons.skill_Pistol, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_Pistol, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_Pistol, "center", false)
	guiSetFont(buttons.skill_Pistol, "default-bold-small")
----
	--susturuculu tekli
	buttons.buy_SilencedPistol = guiCreateButton(100, 68, 91, 17, "Satın Al $8.300", false, teklilerpng)
	guiSetProperty(buttons.buy_SilencedPistol, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_SilencedPistol, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_SilencedPistol, "center", false)
	guiSetFont(buttons.buy_SilencedPistol, "default-bold-small")
	--susturuculu tekli skill
	buttons.skill_SilencedPistol = guiCreateButton(100, 88, 91, 17, "Yetenek $4.000", false, teklilerpng)
	guiSetProperty(buttons.skill_SilencedPistol, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_SilencedPistol, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_SilencedPistol, "center", false)
	guiSetFont(buttons.skill_SilencedPistol, "default-bold-small")
----
	--deagle
	buttons.buy_DesertEagle = guiCreateButton(195, 68, 91, 17, "Satın Al $9.200", false, teklilerpng)
	guiSetProperty(buttons.buy_DesertEagle, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_DesertEagle, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_DesertEagle, "center", false)
	guiSetFont(buttons.buy_DesertEagle, "default-bold-small")
	--deagle skill
	buttons.skill_DesertEagle = guiCreateButton(195, 88, 91, 17, "Yetenek $4.500", false, teklilerpng)
	guiSetProperty(buttons.skill_DesertEagle, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_DesertEagle, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_DesertEagle, "center", false)
	guiSetFont(buttons.skill_DesertEagle, "default-bold-small")
----
	--tufek
	tufeklerpng = guiCreateStaticImage(0, 115, 288, 108, "weapons/tufekler.png", false, arkaplan1)
	buttons.buy_Shotgun = guiCreateButton(5, 71, 91, 17, "Satın Al $9.100", false, tufeklerpng)
	guiSetProperty(buttons.buy_Shotgun, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_Shotgun, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_Shotgun, "center", false)
	guiSetFont(buttons.buy_Shotgun, "default-bold-small")
	--tufek skill
	buttons.skill_Shotgun = guiCreateButton(5, 91, 91, 17, "Yetenek $4.300", false, tufeklerpng)
	guiSetProperty(buttons.skill_Shotgun, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_Shotgun, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_Shotgun, "center", false)
	guiSetFont(buttons.skill_Shotgun, "default-bold-small")
----
	--pompali
	buttons.buy_SawnOff = guiCreateButton(100, 71, 91, 17, "Satın Al $9.800", false, tufeklerpng)
	guiSetProperty(buttons.buy_SawnOff, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_SawnOff, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_SawnOff, "center", false)
	guiSetFont(buttons.buy_SawnOff, "default-bold-small")
	--pompali skill
	buttons.skill_SawnOff = guiCreateButton(100, 91, 91, 17, "Yetenek $4.800", false, tufeklerpng)
	guiSetProperty(buttons.skill_SawnOff, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_SawnOff, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_SawnOff, "center", false)
	guiSetFont(buttons.skill_SawnOff, "default-bold-small")
----
	--spaz12
	buttons.buy_SPAZ12 = guiCreateButton(195, 71, 91, 17, "Satın Al $9.500", false, tufeklerpng)
	guiSetProperty(buttons.buy_SPAZ12, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_SPAZ12, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_SPAZ12, "center", false)
	guiSetFont(buttons.buy_SPAZ12, "default-bold-small")
	--spaz12 skill
	buttons.skill_SPAZ12 = guiCreateButton(195, 91, 91, 17, "Yetenek $4.300", false, tufeklerpng)
	guiSetProperty(buttons.skill_SPAZ12, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_SPAZ12, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_SPAZ12, "center", false)
	guiSetFont(buttons.skill_SPAZ12, "default-bold-small")
----
	--uzi
	taramalilarpng = guiCreateStaticImage(0, 230, 288, 108, "weapons/taramalilar.png", false, arkaplan1)
	buttons.buy_Uzi = guiCreateButton(5, 71, 91, 17, "Satın Al $9.400", false, taramalilarpng)
	guiSetProperty(buttons.buy_Uzi, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_Uzi, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_Uzi, "center", false)
	guiSetFont(buttons.buy_Uzi, "default-bold-small")
	--uzi skill
	buttons.skill_Uzi = guiCreateButton(5, 91, 91, 17, "Yetenek $4.800", false, taramalilarpng)
	guiSetProperty(buttons.skill_Uzi, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_Uzi, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_Uzi, "center", false)
	guiSetFont(buttons.skill_Uzi, "default-bold-small")
----
	--mp5
	buttons.buy_MP5 = guiCreateButton(100, 71, 91, 17, "Satın Al $8.900", false, taramalilarpng)
	guiSetProperty(buttons.buy_MP5, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_MP5, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_MP5, "center", false)
	guiSetFont(buttons.buy_MP5, "default-bold-small")
	--mp5 skill
	buttons.skill_MP5 = guiCreateButton(100, 91, 91, 17, "Yetenek $4.200", false, taramalilarpng)
	guiSetProperty(buttons.skill_MP5, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_MP5, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_MP5, "center", false)
	guiSetFont(buttons.skill_MP5, "default-bold-small")
----
	--tec9
	buttons.buy_TEC9 = guiCreateButton(195, 71, 91, 17, "Satın Al $9.250", false, taramalilarpng)
	guiSetProperty(buttons.buy_TEC9, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_TEC9, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_TEC9, "center", false)
	guiSetFont(buttons.buy_TEC9, "default-bold-small")
	--tec9 skill
	buttons.skill_TEC9 = guiCreateButton(195, 91, 91, 17, "Yetenek $4.800", false, taramalilarpng)
	guiSetProperty(buttons.skill_TEC9, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_TEC9, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_TEC9, "center", false)
	guiSetFont(buttons.skill_TEC9, "default-bold-small")
----
	--ak47
	snippng = guiCreateStaticImage(0, 345, 288, 108, "weapons/snip.png", false, arkaplan1)
	buttons.buy_AK47 = guiCreateButton(5, 71, 91, 17, "Satın Al $9.900", false, snippng)
	guiSetProperty(buttons.buy_AK47, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_AK47, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_AK47, "center", false)
	guiSetFont(buttons.buy_AK47, "default-bold-small")
	--ak47 skill
	buttons.skill_AK47  = guiCreateButton(5, 91, 91, 17, "Satın Al $4.500", false, snippng)
	guiSetProperty(buttons.skill_AK47, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_AK47, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_AK47, "center", false)
	guiSetFont(buttons.skill_AK47, "default-bold-small")
----
	--m4
	buttons.buy_M4 = guiCreateButton(100, 71, 91, 17, "Satın Al $10.000", false, snippng)
	guiSetProperty(buttons.buy_M4, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_M4, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_M4, "center", false)
	guiSetFont(buttons.buy_M4, "default-bold-small")
	--m4 skill
	buttons.skill_M4 = guiCreateButton(100, 91, 91, 17, "Yetenek $4.500", false, snippng)
	guiSetProperty(buttons.skill_M4, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_M4, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_M4, "center", false)
	guiSetFont(buttons.skill_M4, "default-bold-small")
----
	--sniper
	buttons.buy_Sniper = guiCreateButton(195, 71, 91, 17, "Satın Al $9.500", false, snippng)
	guiSetProperty(buttons.buy_Sniper, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.buy_Sniper, "center")
	--guiLabelSetHorizontalAlign(buttons.buy_Sniper, "center", false)
	guiSetFont(buttons.buy_Sniper, "default-bold-small")
	--sniper skill
	buttons.skill_Sniper = guiCreateButton(195, 91, 91, 17, "Yetenek $4.000", false, snippng)
	guiSetProperty(buttons.skill_Sniper, "NormalTextColour", "FFFFFFFF")
	--guiLabelSetVerticalAlign(buttons.skill_Sniper, "center")
	--guiLabelSetHorizontalAlign(buttons.skill_Sniper, "center", false)
	guiSetFont(buttons.skill_Sniper, "default-bold-small")
	--
	for _, button in pairs(buttons) do guiSetProperty(button, "HoverTextColour", "FFFFFF00") end
	--
	addEventHandler("onClientGUIClick", GUIEditor.button[1], lazerackapa, false)
end
addEventHandler("onClientResourceStart", resourceRoot, shopInterface)

addEventHandler("onClientMouseMove",root,
function ( x, y )	
	if source == buttons.skill_MaxHealth  then
	elseif source == buttons.buy_armor  then
	elseif source == buttons.damageProof  then
	elseif source == buttons.nitro10x  then
	elseif source == buttons.buy_hydraulics  then
	elseif source == buttons.buy_Pistol  then
	elseif source == buttons.skill_Pistol  then
	elseif source == buttons.buy_SilencedPistol  then
	elseif source == buttons.skill_SilencedPistol  then
	elseif source == buttons.buy_DesertEagle  then
	elseif source == buttons.skill_DesertEagle  then
	elseif source == buttons.buy_Shotgun  then
	elseif source == buttons.skill_Shotgun  then
	elseif source == buttons.buy_SawnOff  then
	elseif source == buttons.skill_SawnOff  then
	elseif source == buttons.buy_SPAZ12  then
	elseif source == buttons.skill_SPAZ12  then
	elseif source == buttons.buy_Uzi  then
	elseif source == buttons.skill_Uzi  then
	elseif source == buttons.buy_MP5  then
	elseif source == buttons.skill_MP5  then
	elseif source == buttons.buy_TEC9  then
	elseif source == buttons.skill_TEC9  then
	elseif source == buttons.buy_AK47  then
	elseif source == buttons.skill_AK47  then
	elseif source == buttons.buy_M4  then
	elseif source == buttons.skill_M4  then
	elseif source == buttons.buy_Sniper  then
	elseif source == buttons.skill_Sniper  then
	elseif source == GUIEditor.button[1]  then
	elseif source == buttons.skill_Muscle then
	end
end)
addEventHandler("onClientMouseLeave",root,
function ( x, y )	
	if source == buttons.skill_MaxHealth  then
	elseif source == buttons.buy_armor  then
	elseif source == buttons.damageProof  then
	elseif source == buttons.nitro10x  then
	elseif source == buttons.buy_hydraulics  then
	elseif source == buttons.buy_Pistol  then
	elseif source == buttons.skill_Pistol  then
	elseif source == buttons.buy_SilencedPistol  then
	elseif source == buttons.skill_SilencedPistol  then
	elseif source == buttons.buy_DesertEagle  then
	elseif source == buttons.skill_DesertEagle  then
	elseif source == buttons.buy_Shotgun  then
	elseif source == buttons.skill_Shotgun  then
	elseif source == buttons.buy_SawnOff  then
	elseif source == buttons.skill_SawnOff  then
	elseif source == buttons.buy_SPAZ12  then
	elseif source == buttons.skill_SPAZ12  then
		elseif source == buttons.buy_Uzi  then
	elseif source == buttons.skill_Uzi  then
	elseif source == buttons.buy_MP5  then
	elseif source == buttons.skill_MP5  then
	elseif source == buttons.buy_TEC9  then
	elseif source == buttons.skill_TEC9  then
	elseif source == buttons.buy_AK47  then
	elseif source == buttons.skill_AK47  then
	elseif source == buttons.buy_M4  then
	elseif source == buttons.skill_M4  then
	elseif source == buttons.buy_Sniper  then
	elseif source == buttons.skill_Sniper  then
	elseif source == GUIEditor.button[1]  then
	elseif source == buttons.skill_Muscle then
	end
end)

addEventHandler("onClientGUIClick",root,
function ( x, y )	
	if source == buttons.skill_MaxHealth  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_armor  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.damageProof  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.nitro10x  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_hydraulics  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_Pistol  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_Pistol  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_SilencedPistol  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_SilencedPistol  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_DesertEagle  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_DesertEagle  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_Shotgun  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_Shotgun  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_SawnOff  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_SawnOff  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_SPAZ12  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_SPAZ12  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_Uzi  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_Uzi  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_MP5  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_MP5  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_TEC9  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_TEC9  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_AK47  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_AK47  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_M4  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_M4  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.buy_Sniper  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_Sniper  then
		playSound("sesler/ses2.mp3")
	elseif source == GUIEditor.button[1]  then
		playSound("sesler/ses2.mp3")
	elseif source == buttons.skill_Muscle then
		playSound("sesler/ses2.mp3")
	end
end)

function lazerackapa( )
	ToggleLaserEnabled()
end



addEventHandler("onClientGUIClick", getResourceGUIElement(getThisResource()), function(buttonN,state)
    if(buttonN == "left" and state == "up") and getElementType(source) == "gui-checkbox" then
		if IsLaserEnabled(localPlayer) == false then
			return
		end
		for i = 1,#GUIEditor.checkbox do
			if GUIEditor.checkbox[i] ~= source then
				guiCheckBoxSetSelected(GUIEditor.checkbox[i],false)
			end	
		end	
        if ( guiCheckBoxGetSelected(source) ) then
			local GetColor = guiGetProperty(source, "NormalTextColour")
			if GetColor then
				local hex = '#'..GetColor
				hex = hex:gsub("#","")
				local r,g,b = tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6)), tonumber("0x"..hex:sub(7,8))
				playSoundFrontEnd(1)
				ChangeLaserColor(cmd, r,g,b,255)
			end	
		end
	end
end
)

addEventHandler("onClientElementDataChange", localPlayer,
	function(dataName, oldValue)
		if getElementType(source) == "player" and source == localPlayer and dataName == "laser.on" then
			local newValue = getElementData(source, dataName)
			if oldValue == true and newValue == false then
				unbindKey("aim_weapon", "both", AimKeyPressed)
			elseif oldValue == false and newValue == true then
				bindKey("aim_weapon", "both", AimKeyPressed)		
			end
		end
	end
)

addEventHandler( "onClientRender",  getRootElement(),
	function()
		local players = getElementsByType("player")
		for k,v in ipairs(players) do
			if getElementData(v, "laser.on") then
				DrawLaser(v)
			end
		end
	end
)
addEventHandler( "onClientPreRender",  getRootElement(),
	function()
		local players = getElementsByType("player")
		for k,v in ipairs(players) do
			if getElementData(v, "laser.on") then
				--DrawLaser(v)
			end
		end
	end
)

function AimKeyPressed(key, state) 
	if state == "down" then
		setElementData(localPlayer, "laser.aim", true, true)
	elseif state == "up" then
		setElementData(localPlayer, "laser.aim", false, true)
	end
end

function DrawLaser(player)
	if getElementData(player, "laser.on") then
		local targetself = getPedTarget(player)
		if targetself and targetself == player then
			targetself = true
		else
			targetself = false
		end		
		
		if getElementData(player, "laser.aim") and IsPlayerWeaponValidForLaser(player) == true and targetself == false then
			local x,y,z = getPedWeaponMuzzlePosition(player)
			if not x then
				outputDebugString("getPedWeaponMuzzlePosition failed")
				x,y,z = getPedTargetStart(player)
			end
			local x2,y2,z2 = getPedTargetEnd(player)
			if not x2 then
				--outputDebugString("getPedTargetEnd failed")
				return
			end			
			local x3,y3,z3 = getPedTargetCollision(player)
			local r,g,b,a = GetLaserColor(player)
			if x3 then -- collision detected, draw til collision and add a dot
				dxDrawLine3D(x,y,z,x3,y3,z3, tocolor(r,g,b,a), laserWidth)
				DrawLaserDot(player, x3,y3,z3)
			else
				dxDrawLine3D(x,y,z,x2,y2,z2, tocolor(r,g,b,a), laserWidth)
				DestroyLaserDot(player)
			end
		else
			DestroyLaserDot(player) 
		end
	else
		DestroyLaserDot(player)
	end
end
function DrawLaserDot (player, x,y,z)
	if not dots[player] then
		dots[player] = createMarker(x,y,z, "corona", .05, GetLaserColor(player))
	else
		setElementPosition(dots[player], x,y,z)
	end
end
function DestroyLaserDot(player)
	if dots[player] and isElement(dots[player]) then
		destroyElement(dots[player])
		dots[player] = nil
	end
end

function SetLaserColor(player,r,g,b,a)
	setElementData(player, "laser.red", r)
	setElementData(player, "laser.green", g)
	setElementData(player, "laser.blue", b)
	setElementData(player, "laser.alpha", a)
	return true
end
function GetLaserColor(player)
	r = getElementData(player, "laser.red")
	g = getElementData(player, "laser.green")
	b = getElementData(player, "laser.blue")
	a = getElementData(player, "laser.alpha")

	return r,g,b,a
end
function IsPlayerWeaponValidForLaser(player) 
	local weapon = getPedWeapon(player)
	if weapon and weapon > 21 and weapon < 39 and weapon ~= 35 and weapon ~= 36 then
		return true
	end
	return false
end

function SetLaserEnabled(player, state) 
	if not player or isElement(player) == false then return false end
	if getElementType(player) ~= "player" then return false end
	if state == nil then return false end
	
	if state == true then -- enable laser
		setElementData(player, "laser.on", true, true)
		setElementData(player, "laser.aim", false, true)
		--bindKey("aim_weapon", "both", AimKeyPressed)   -- done in onClientElementDataChange
		return true
	elseif state == false then -- disable laser
		setElementData(player, "laser.on", false, true)
		setElementData(player, "laser.aim", false, true)
		--unbindKey("aim_weapon", "both", AimKeyPressed)   -- done in onClientElementDataChange
		return true
	end
	return false
end
function IsLaserEnabled(player) -- returns true or false based on player elementdata "laser.on"
	if getElementData(player, "laser.on") == true then
		return true
	else
		return false
	end
end

function ToggleLaserEnabled(cmd)
	local text = ''
	player = localPlayer
	if IsLaserEnabled(player) == false then	
		SetLaserEnabled(player, true)
		outputChatBox("#aabbccLazer #00ff00açıldı.", 255, 255, 255, true)
		text = 'Lazeri Kapat'
	else
		SetLaserEnabled(player, false)
		outputChatBox("#aabbccLazer #ff0000kapatıldı.", 255, 255, 255, true)
		text = 'Lazeri Aç'
	end
	guiSetText(GUIEditor.button[1],text)
end

function ChangeLaserColor(cmd, r,g,b,a)
	local player = localPlayer
	if colorPickerInitialized == 1 and getResourceFromName("colorpicker") then
		oldcolors.r, oldcolors.g, oldcolors.b, oldcolors.a = GetLaserColor(player)
		picklasercolor = 1
		if exports.colorpicker:requestPickColor(true,true,"Choose Laser Color",oldcolors.r,oldcolors.g,oldcolors.b,oldcolors.a) == false then
			exports.colorpicker:cancelPickColor()
			return false
		end
		return true
	else
		if r and g and b and a then
			r,g,b,a = tonumber(r), tonumber(g), tonumber(b), tonumber(a)
			if r and g and b and a then
				if r < 0 or g < 0 or b < 0 or a < 0 or r > 255 or g > 255 or b > 255 or a > 255 then
					outputChatBox("Cor Invalida: (0-255) usage: /" ..CMD_LASERCOLOR.. " r g b a", 245,0,0)
					return false
				else
					outputChatBox("Lazer rengi değiştirildi.",r,g,b)
					SetLaserColor(player,r,g,b,a)
					return true
				end
			end
		end	
	end
	return false
end
addCommandHandler(CMD_LASER, ToggleLaserEnabled)
addCommandHandler(CMD_LASERCOLOR, ChangeLaserColor)



function initColorPicker()
	if getResourceFromName("colorpicker") == false then
		return false
	end
	
	addEventHandler("onClientPickedColor", localPlayer, function(r,g,b,a)
		if picklasercolor == 1 then
			SetLaserColor(source,r,g,b,a)
		end		
	end	)
	
	addEventHandler("onClientCancelColorPick", localPlayer, function()
		if picklasercolor == 1 then
			SetLaserColor(source,oldcolors.r,oldcolors.g,oldcolors.b,oldcolors.a)
			picklasercolor = 0
		end
	end )
	
	colorPickerInitialized = 1
	return true
end

addEventHandler("onClientGUIClick", root, 
function()
local theVehicle = getPedOccupiedVehicle(player)
local money = getPlayerMoney(player)
		if (source == buttons.skill_M4) then  -- Buy: M4 max skill
			local price_M4 = 4500
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_M4, 78)
			
		elseif (source == buttons.skill_AK47) then  -- Buy: AK-47 max skill
			local price_AK47 = 4500
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_AK47, 77)
			
		elseif (source == buttons.skill_SawnOff) then  -- Buy: Sawn-off Shotgun max skill
			local price_SawnOff = 4800
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_SawnOff, 73)
			
		elseif (source == buttons.skill_Shotgun) then  -- Buy: Shotgun max skill
			local price_Shotgun = 4300
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_Shotgun, 72)
			
		elseif (source == buttons.skill_SPAZ12) then  -- Buy: SPAZ-12 max skill
			local price_SPAZ12 = 4300
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_SPAZ12, 74)
			
		elseif (source == buttons.skill_SilencedPistol) then  -- Buy: Silenced pistol max skill
			local price_SilencedPistol = 4000
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_SilencedPistol, 70)
			
		elseif (source == buttons.skill_DesertEagle) then  -- Buy: Desert eagle max skill
			local price_DesertEagle = 4500
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_DesertEagle, 71)
			
		elseif (source == buttons.skill_Pistol) then  -- Buy: Pistol max skill
			local price_Pistol = 4100
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_Pistol, 69)
			
		elseif (source == buttons.skill_MP5) then  -- Buy: MP5 max skill
			local price_MP5 = 4200
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_MP5, 76)
			
		elseif (source == buttons.skill_Uzi) then  -- Buy: Uzi and Tec-9 max skill
			local price_Uzi = 4800
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_Uzi, 75)
			
		elseif (source == buttons.skill_TEC9) then  -- Buy: Uzi and Tec-9 max skill
			local price_Uzi = 4800
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_Uzi, 75)
		
		elseif (source == buttons.skill_Sniper) then  -- Buy: Sniper max skill
			local price_Sniper = 4000
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_Sniper, 79)
			
		elseif (source == buttons.skill_MaxHealth) then  -- Buy: Max health
			local price_MaxHealth = 3800
			triggerServerEvent("onPlayerRequestMaxSkill", player, price_MaxHealth, 24)
				
		elseif (source == buttons.skill_Stamina) then  -- Buy: Max stamina
			local price_MaxStamina = 1000
			triggerServerEvent("onPlayerRequestMaxSkill", player, price_MaxStamina, 22)
			
		elseif (source == buttons.skill_Muscle) then  -- Buy: Max muscle
			local price_MaxMuscle = 2600
			triggerServerEvent("onPlayerRequestMaxSkill", player, price_MaxMuscle, 23)
			
		elseif (source == buttons.skill_Fat) then  -- Buy: Max fat
			local price_MaxFat = 1300
			triggerServerEvent("onPlayerRequestMaxSkill", player, price_MaxFat, 21)
			
		elseif (source == buttons.buy_armor) then  -- Buy: Full armor
			local price_Armor = 850
			triggerServerEvent("onPlayerRequestArmor", player, price_Armor)
			
		elseif (source == buttons.damageProof) then -- Buy: vehicle damage proof	
			local price_DamageProof = 16000
			triggerServerEvent("onPlayerRequestDamageProof", player, price_DamageProof)
			
		elseif (source == buttons.nitro10x) then -- Buy: Nitro 10x
			local price_nitro10x = 500
			triggerServerEvent("onPlayerRequestVehicleUpgrade", player, price_nitro10x, 1010)

		elseif (source == buttons.buy_repair) then  -- Buy: Fix vehicle
			local price_repair = 2000
			triggerServerEvent("onPlayerRequestFixVehicle", player, price_repair)
			
		elseif (source == buttons.buy_flip) then  -- Buy: Flip vehicle
			local price_flip = 1900
			triggerServerEvent("onPlayerRequestFlipVehicle", player, price_flip)
			
		elseif (source == buttons.buy_hydraulics) then  -- Buy: Hydraulics
			local price_hydraulics = 1150
			triggerServerEvent("onPlayerRequestVehicleUpgrade", player, price_hydraulics, 1087)
		end
end
)

function buyWeapon()
local money = getPlayerMoney(player)
		if (source == buttons.buy_Pistol) then  -- Buy: Pistol
			local priceWeapon_Pistol = 8000
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_Pistol, 22, 85)
			
		elseif (source == buttons.buy_SilencedPistol) then	-- Buy: Silenced pistol
			local priceWeapon_SilencedPistol = 8300
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_SilencedPistol, 23, 85)
			
		elseif (source == buttons.buy_DesertEagle) then  -- Buy: Desert eagle
			local priceWeapon_DesertEagle = 9200
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_DesertEagle, 24, 77)

		elseif (source == buttons.buy_Shotgun) then  -- Buy: Shotgun
			local priceWeapon_Shotgun = 9100
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_Shotgun, 25, 30)

		elseif (source == buttons.buy_SawnOff) then  -- Buy: Sawn-off Shotgun
			local priceWeapon_SawnOff = 9800
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_SawnOff, 26, 24)

		elseif (source ==  buttons.buy_SPAZ12) then  -- Buy: SPAZ-12
			local priceWeapon_SPAZ12 = 9550
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_SPAZ12, 27, 35)

		elseif (source == buttons.buy_Uzi) then  -- Buy: Micro Uzi
			local priceWeapon_Uzi = 9400
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_Uzi, 28, 250)

		elseif (source == buttons.buy_MP5) then  -- Buy: MP5
			local priceWeapon_MP5 = 8900
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_MP5, 29, 240)

		elseif (source == buttons.buy_TEC9) then  -- Buy: TEC-9
			local priceWeapon_TEC9 = 9250
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_TEC9, 32, 250)

		elseif (source == buttons.buy_AK47) then  -- Buy: AK-47
			local priceWeapon_AK47 = 9900
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_AK47, 30, 240)

		elseif (source == buttons.buy_M4) then  -- Buy: M4
			local priceWeapon_M4 = 10000
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_M4, 31, 250)

		elseif (source == buttons.buy_Sniper) then  -- Buy: Sniper
			local priceWeapon_Sniper = 9500
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_Sniper, 34, 150)
		end
end
addEventHandler("onClientGUIClick", root, buyWeapon)



bind = false
function bindkey()
    if bind == false and getKeyState( "F4" ) then
        bind = true
		local sound = playSound("sesler/ses1.wav")
		setSoundVolume(sound, 1)
    elseif bind == true and getKeyState( "F4") then
		local sound2 = playSound("sesler/ses1.wav")
		setSoundVolume(sound2, 1)
		bind = false
        end
    end
--bindKey ( "F2", "down", bindkey)

tus = "F2" -- panelin açıp kapatma tuşu
saniye = 2 -- paneli kaç saniyede bir aç kapa yapabilsin?

tick = getTickCount()-(saniye*500)
bindKey(tus,"down",function()
	local now = getTickCount() -- şuanın milisaniyesini çektik
	local fark = now - tick -- son açmadan bu yana geçen süreyi hesapladık
	if fark > saniye*500 then -- eğer geçen süre belirli süreden büyükse
		local durum = guiGetVisible(shop_window) -- panelin görünürlüğünü çektik
		guiSetVisible(shop_window,not durum) -- panelin durumunu değiştirdik
		showCursor(not durum) -- aynı yöntemle mouseun durumunu değiştirdik
		if durum then -- eğer panel kapatılacaksa
			tick = now -- açma süresini şimdi yaptık
		end
	else -- belirli süre geçmemişse
		outputChatBox("#ffffffMarket Panelini #2254ff"..saniye.." #ffffffSaniyede Bir Açabilirsin.",0,0,0,true) -- renk kodu ekleyebilirsin
	end
end)


function silahlaricek()
	local player = localPlayer
	triggerServerEvent("yaraginiyiyimsilahimial", player)
	end
	addCommandHandler("silahlarial", silahlaricek)
