

Mira = 0
Miras = {}
GUIEditor = {
    button = {},
    scrollpane = {},
    staticimage = {},
    window = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
		local screenW, screenH = guiGetScreenSize()
        GUIEditor.window[1] = guiCreateWindow((screenW - 210) / 1.5, (screenH - 259) / 2, 280, 259, "Anadolu Freeroam - Crosshair Panel", false)
        guiWindowSetSizable(GUIEditor.window[1], false)
		guiSetVisible(GUIEditor.window[1], false)

        GUIEditor.scrollpane[1] = guiCreateScrollPane(10, 28, 260, 194, false, GUIEditor.window[1])

		for i = 1, 15 do
			for k = 1, 4 do
				Mira = Mira + 1
				if fileExists('miras/'..Mira..'.png') then
					Miras[Mira] = guiCreateStaticImage(0 + (60 * (k-1)), 0 + (60 * (i-1)), 50, 50, 'miras/'..Mira..'.png', false, GUIEditor.scrollpane[1])
				end
			end
		end
		
		for k, v in ipairs(Miras) do
			addEventHandler ( "onClientGUIClick", v, function()
				Crosshair_table = dxCreateShader("texreplace.fx")
				engineApplyShaderToWorldTexture(Crosshair_table, "siteM16")
				dxSetShaderValue(Crosshair_table, "gTexture", dxCreateTexture('miras/'..k..'.png'))
				outputChatBox("Crosshair Seçildi !", 0, 255, 0)
				takePlayerMoney(2000)
			end, false)
		end

        GUIEditor.button[1] = guiCreateButton(71, 226, 127, 23, "Kapat", false, GUIEditor.window[1])
	guiSetProperty(GUIEditor.button[1],"NormalTextColour", "FFFFFFFF")
	guiSetProperty(GUIEditor.button[1], "HoverTextColour", "FFFFFFFF")
	guiSetFont(GUIEditor.button[1], "default-bold-small")

		addEventHandler ( "onClientGUIClick", GUIEditor.button[1], function()
			guiSetVisible(GUIEditor.window[1], false)
			showCursor(false)
		end, false)
    end
)
addCommandHandler ( "crosshair", 
function()
	if guiGetVisible(GUIEditor.window[1]) then
		guiSetVisible(GUIEditor.window[1], false)
		showCursor(false)
	else
		guiSetVisible(GUIEditor.window[1], true)
		showCursor(true)
	end
end)

function sistem10ackapat()
	guiSetVisible(GUIEditor.window[1],not guiGetVisible(GUIEditor.window[1]))
	showCursor(guiGetVisible(GUIEditor.window[1]))
end

function kapat()
	guiSetVisible(GUIEditor.window[1],false)
	showCursor(false)
end

function ackapa()
if (guiGetVisible (GUIEditor.window[1]) == true) then
guiSetVisible(GUIEditor.window[1], false)
showCursor(false)

end
end
bindKey ("F1", "down", ackapa)



