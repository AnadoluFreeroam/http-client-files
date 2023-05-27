local screenWidth,screenHeight = guiGetScreenSize()
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        myScreenSource = dxCreateScreenSource ( screenWidth, screenHeight )         
    end
)
	
	--outputChatBox("#ff123fEkrandakileri Yok Etmek Icin 9 Tusuna Basiniz.", 255, 25, 25, true)

 
function cleanmyscreen()
	if myScreenSource then
		dxUpdateScreenSource( myScreenSource )                  
		dxDrawImage( screenWidth - screenWidth,  screenHeight - screenHeight,  screenWidth, screenHeight, myScreenSource, 0, 0, 0, tocolor (255, 255, 255, 255), true)      
	end
end


function tooglecleanmyscreen ()
enabled = not enabled
if enabled then
	addEventHandler( "onClientRender", root, cleanmyscreen)
	else
	removeEventHandler( "onClientRender", root, cleanmyscreen)
end
end
bindKey ("F10", "down", tooglecleanmyscreen)