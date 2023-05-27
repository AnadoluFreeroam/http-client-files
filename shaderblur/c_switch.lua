--
-- c_switch.lua
--

----------------------------------------------------------------
----------------------------------------------------------------
-- Effect switching on and off
--
--	To switch on:
--			triggerEvent( "switchDoF", root, true )
--
--	To switch off:
--			triggerEvent( "switchDoF", root, false )
--
----------------------------------------------------------------
----------------------------------------------------------------

--------------------------------
-- onClientResourceStart
--		Auto switch on at start
--------------------------------

--------------------------------
-- Switch effect on or off
--------------------------------
function switchDoF( aaOn )
	outputDebugString( "switchDoF: " .. tostring(aaOn) )
	if aaOn then
		enableDoF()
	else
		disableDoF()
	end
end

addEvent( "switchDoF", true )
addEventHandler( "switchDoF", resourceRoot, switchDoF )
