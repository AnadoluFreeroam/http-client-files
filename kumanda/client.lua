--By Reventon

function SilahYukle364()
    local txd = engineLoadTXD ('Dosyalar/1.txd')
    engineImportTXD(txd,364)
    local dff = engineLoadDFF('Dosyalar/2.dff',364)
    engineReplaceModel(dff,364)
end
addEventHandler('onClientResourceStart',getResourceRootElement(getThisResource()),SilahYukle364)

--By Reventon