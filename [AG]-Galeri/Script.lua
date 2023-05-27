function AndrixxClient ()
bandeiratxd = engineLoadTXD("1.txd") 
engineImportTXD(bandeiratxd, 9953 )
end
addEventHandler( "onClientResourceStart", resourceRoot, AndrixxClient )