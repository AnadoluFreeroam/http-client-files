event = false

addEvent("KorumaliAlan:AlanKontrol", true)
addEventHandler("KorumaliAlan:AlanKontrol", root, function(area,kontrol)
    if kontrol == "Girdi" then
        event = true
        if event then
            addEventHandler("onClientPlayerDamage", source, iptalFunc)
            addEventHandler("onClientRender", root, render)
            triggerServerEvent("onFreeroamLocalSettingChange",localPlayer,"ghostmode",true)
        end
        setRadarAreaFlashing(area, true)
    elseif kontrol == "Cikti" then
        event = false
        removeEventHandler("onClientPlayerDamage", source, iptalFunc)
        removeEventHandler("onClientRender", root, render)
        setRadarAreaFlashing(area, false)
        triggerServerEvent("onFreeroamLocalSettingChange",localPlayer,"ghostmode",false)
    end
end)


function iptalFunc()
    cancelEvent()
end    

function render()
    if event and getPedWeaponSlot(localPlayer) ~= 0 then
        setPedWeaponSlot(localPlayer,0)
    end    
end   