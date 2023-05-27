addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
function()
   	txd = engineLoadTXD ( "data/spdwparox.txd" )
	engineImportTXD ( txd, 2212 )
	txd = engineLoadTXD ( "data/spdwparox.txd" )
	engineImportTXD ( txd, 2213 )
	
	col = engineLoadCOL ( "data/speedway1.col" )
	engineReplaceCOL ( col, 2212 )
	col = engineLoadCOL ( "data/speedway2.col" )
	engineReplaceCOL ( col, 2213 )   

	dff = engineLoadDFF("data/speedway1.dff", 2212)
	engineReplaceModel(dff, 2212)
	dff = engineLoadDFF("data/speedway2.dff", 2213)
	engineReplaceModel(dff, 2213)

	engineSetModelLODDistance(2212, 300)
	engineSetModelLODDistance(2213, 300)
end)
-- http://www.mtascriptleri.com