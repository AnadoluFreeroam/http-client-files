--------------------------------------
-- Default tool
--------------------------------------
toolDefault = {
	name = "Default",
	
	--The flag for the creation of hidden tools
	hidden = true
}

function toolDefault:onPlace ( element )
	local x, y, z = getElementPosition ( element )
	triggerServerEvent ( "onCreateTCTObject", resourceRoot, getElementModel ( element ), x, y, z, g_entityOffset.calcRotation ( ) )
end

--------------------------------------
-- Grab tool
--------------------------------------
toolGrab = {
	name = "Grab",
	desc = "In order to grab the object targeting at it and press [num3]. To place an object, press [num5]."
}

local grabTranslation

function toolGrab:onAccept ( element )
	grabTranslation = { 
		{ getElementPosition ( element ) },
		{ getElementRotation ( element ) },
		getElementAlpha ( element ),
		isElementDoubleSided ( element ) 
	}
	
	setEditorTarget ( element )
end

function toolGrab:onPlace ( element )
	local x, y, z = getElementPosition ( element )
	triggerServerEvent ( "onPlaceTCTElement", element, x, y, z, g_entityOffset.calcRotation ( ) )
	
	setElementAlpha ( element, grabTranslation [ 3 ] )
	setElementDoubleSided ( element, grabTranslation [ 4 ] )
	
	setEditorTarget ( )

	grabTranslation = nil
end

function toolGrab:onCancel ( element )
	setElementPosition ( element, unpack ( grabTranslation [ 1 ] ) )
	setElementRotation ( element, unpack ( grabTranslation [ 2 ] ) )
	setElementAlpha ( element, grabTranslation [ 3 ] )
	setElementDoubleSided ( element, grabTranslation [ 4 ] )
						
	grabTranslation = nil
end

--------------------------------------
-- Remove tool
--------------------------------------
toolRemove = {
	name = "Remove",
	desc = "To remove an object targeting at it and press [num3].",
		
	controls = {
		[ "onl_athd" ] = {
			"checkbox",
			
			text = "Attached only",
			selected = false
		}
	}
}

function toolRemove:onAccept ( element )
	triggerServerEvent ( "onDestroyTCTElement", element, self:getControl ( "onl_athd" ):getData ( ) )
end

--------------------------------------
-- Alpha tool
--------------------------------------
toolAlpha = {
	name = "Alpha",
	desc = "To change the alpha of the object targeting at it and press [num3].",
	
	controls = {
		[ "a_lvl" ] = {
			"scrollbar",
			
			text = "Alpha",
			value = { 
				150,
				min = 0,
				max = 255
			}
		}
	}
}

function toolAlpha:onAccept ( element )
	triggerServerEvent ( "onChangeTCTAlpha", element, self:getControl ( "a_lvl" ):getData ( ) )
end

--------------------------------------
-- Scale tool
--------------------------------------
toolScale = {
	name = "Scale",
	desc = "To scale the object targeting at it and press [num3].",
	
	controls = {
		[ "scale" ] = {
			"scrollbar",
			
			text = "Scale",
			value = { 
				2,
				min = 0.5,
				max = 5
			}
		}
	}
}

function toolScale:onAccept ( element )
	if getElementType ( element ) ~= "object" then
		return
	end

	triggerServerEvent ( "onChangeTCTScale", element, self:getControl ( "scale" ):getData ( ) )
end

--------------------------------------
-- Double sided tool
--------------------------------------
toolDoubleSided = {
	name = "Double sided",
	desc = "To set the double-sidedness of an object targeting at it and press [num3].",
}

function toolDoubleSided:onAccept ( element )
	if getElementType ( element ) ~= "object" then
		outputChatBox ( "This tool can be accepted only to the object" )
		
		return 
	end
	
	triggerServerEvent ( "onSidedTCTElement", element )
end

--------------------------------------
-- Freeze tool
--------------------------------------
toolFreeze = { 
	name = "Freeze",
	desc = "In order to freeze the object targeting at it and press [num3].",
}

function toolFreeze:onAccept ( element )
	local elementType = getElementType ( element )
		
	if elementType ~= "object" and elementType ~= "vehicle" then
		outputChatBox ( "This tool can be accepted only to the object or the vehicle" )
		
		return
	end

	triggerServerEvent ( "onFreezeTCTElement", element )
end

--------------------------------------
-- Attach tool
--------------------------------------
local attachTable

toolAttach = {
	name = "Attach",
	desc = "In order to attach two objects together you have to targeting at that which will be attached to the other and press [num3]. Then targeting at the second object, and also press [num3].",
}

function toolAttach:onAccept ( element )
	if not attachTable then
		attachTable = { 
			element = element
		}
	elseif isElement ( attachTable.element ) then
		if attachTable.element == element then
			return
		end

		triggerServerEvent ( "onAttachTCTElement", attachTable.element, element )

		attachTable = nil
	end
end

function toolAttach:onCancel ( ) 
	attachTable = nil 
end

--------------------------------------
-- Trigger tool
--------------------------------------
local triggerTable

toolTrigger = {
	name = "Trigger",
	desc = "In order to create a new trigger you should targeting at object and press [num3]. To set the end point, place the given object and press [num5]. Similarly, place a marker.",
	
	controls = {
		[ "time" ] = {
			"scrollbar",
			
			text = "Time",
			value = {
				1000,
				min = 0,
				max = 10000
			}
		}
	}
}

function toolTrigger:onAccept ( element )
	if getElementType ( element ) ~= "object" then
		return
	end
	
	local clone = createObject ( getElementModel ( element ), g_entityOffset.calcPosition ( ) )
	if clone then
		setEditorTarget ( clone )
		
		triggerTable = { 
			element = element 
		}
	end
end

function toolTrigger:onPlace ( element )
	local x, y, z = getElementPosition ( element )
	
	if getElementType ( element ) == "marker" then
		triggerServerEvent ( "onAttachTCTTrigger", triggerTable.element, x, y, z, self:getControl ( "time" ):getData ( ),
			triggerTable.x, triggerTable.y, triggerTable.z )
		
		setEditorTarget ( )
		triggerTable = nil
	else
		triggerTable.x = x
		triggerTable.y = y
		triggerTable.z = z
		
		x, y, z = g_entityOffset.calcPosition ( )
		
		local marker =  createMarker ( x, y, z, "cylinder", 1.5, 255, 0, 0, 170 )
		if marker then
			setEditorTarget ( marker )
		end
	end
end

function toolTrigger:onCancel ( )
	triggerTable = nil
end

function initTools ( )
	createTool ( toolDefault )
	createTool ( toolGrab )
    createTool ( toolRemove )
    createTool ( toolAlpha )
	createTool ( toolScale )
	createTool ( toolDoubleSided )
	createTool ( toolFreeze )
	createTool ( toolAttach )
	createTool ( toolTrigger )
	
	--Select the Default tool
	setSelectedTool ( toolDefault )
	
	--Here it is necessary to add a your specific tool
	
	return true
end

Tool = {
	collection = { }
}
Tool.__index = Tool

function createTool ( tool )
	if not tool.hidden then
		tool.gui = guiCreateScrollPane ( 0.48, 0.02, 0.46, 0.96, true, editorForm.toolsTab )
	
		tool.header = guiCreateLabel ( 0.02, 0.02, 0.96, 0.04, tool.name, true, tool.gui )
		guiSetFont ( tool.header , "default-bold-small" )
	
		tool.row = guiGridListAddRow ( editorForm.toolsList )
		guiGridListSetItemText ( editorForm.toolsList, tool.row, 1, tool.name, false, false )
	
		if tool.controls then
			for id, tbl in pairs ( tool.controls ) do
				tool.controls [ id ] = createControl ( tbl, tool.gui )
			end
		end
		
		guiSetVisible ( tool.gui, false )
	end
	
	Tool.collection [ tool.name ] = tool
	setmetatable ( tool, Tool )
	
	return tool
end

function getToolFromName ( name )
	return Tool.collection [ name ]
end

function getSelectedTool ( )
	return Tool.selected
end

function setSelectedTool ( tool )
	if Tool.selected then
		Tool.selected:setVisible ( false )
		
		if Tool.entity then
			Tool.selected:call ( "onCancel", Tool.entity )
			setEditorTarget ( )
		end
	end

	tool:setVisible ( true )
	tool:call ( "onSelected" )
	Tool.selected = tool
	
	if getSettingByID ( "s_thelp" ):getData ( ) and tool.desc then
		createHelpForm ( tool:getName ( ), tool.desc )
	end
end

function Tool:call ( event, ... )
	if type ( self [ event ] ) ~= "function" then
		return false
	end

	local result, err = pcall ( self [ event ], self, ... )
	if not result then
		outputDebugString ( event .. " - " .. err )
		
		return false
	end
	
	return true
end

function Tool:setVisible ( selected )
	if not self.hidden then
		guiSetVisible ( self.gui, selected )
	end
end

function Tool:getName ( )
	return self.name
end

function Tool:getControl ( controlId )
	local control = self.controls [ controlId ]
	if control then
		return control
	end
	
	return false
end