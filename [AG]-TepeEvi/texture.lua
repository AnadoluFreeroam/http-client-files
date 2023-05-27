function replaceModel() 
  txd = engineLoadTXD("des_ranch.txd", 11490 )
  engineImportTXD(txd, 11490)
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)

addCommandHandler ( "reload", replaceModel )