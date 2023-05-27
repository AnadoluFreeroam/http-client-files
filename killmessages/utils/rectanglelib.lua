dxRectangle = {}
dxRectangle_mt = { __index = dxRectangle }
local g_screenX,g_screenY = guiGetScreenSize()
local visibleRectangles = {}
------
local defaults = {
	fX							= 0.5,
	fY							= 0.5,
	fWidth						= 0,
	fHeight						= 0,
	bRelativePosition			= true,
	bRelativeSize				= true,
	tColor 						= {0,0,0,150},
	bColor 						= {150,0,0,255},
	tThickness 					= 1,
	bPostGUI 					= false,
	bVisible 					= true,
}

function dxRectangle:create(x, y, width, height, color )
	assert(not self.fX, "attempt to call method 'create' (a nil value)")
	if ( not tonumber(x) ) or ( not tonumber(y) ) then
		outputDebugString ( "dxRectangle:create - Bad argument", 0, 112, 112, 112 )
		return false
	end
    local new = {}
	setmetatable( new, dxRectangle_mt )
	--Add default settings
	for i,v in pairs(defaults) do
		new[i] = v
	end
	new.fX = x or new.fX
	new.fY = y or new.fY
	new.tColor = color
	new.fWidth = width or new.fWidth
	new.fHeight = height or new.fHeight
	if type(relative) == "boolean" then
		new.bRelativePosition = relative
		new.bRelativeSize = relative
	end
	visibleRectangles[new] = true
	return new
end
--[[
function dxRectangle:border(path)
	if type(path) ~= "string" then return self.strPath end
	self.strPath = path
	return true
end]]

function dxRectangle:position(x,y,relative)
	if not tonumber(x) then return self.fX, self.fY end
	self.fX = x
	self.fY = y
	if type(relative) == "boolean" then
		self.bRelativePosition = relative
	else
		self.bRelativePosition = true
	end
	return true
end

function dxRectangle:size(x,y,relative)
	if not tonumber(x) then return self.fWidth, self.fHeight end
	self.fWidth = x
	self.fHeight = y
	if type(relative) == "boolean" then
		self.bRelativeSize = relative
	else
		self.bRelativeSize = true
	end
	return true
end

function dxRectangle:color(r,g,b,a)
	if not tonumber(r) then return unpack(self.tColor) end
	g = g or self.tColor[2]
	b = b or self.tColor[3]
	a = a or self.tColor[4]
	self.tColor = { r,g,b,a }
	return true
end

function dxRectangle:visible(bool)
	if type(bool) ~= "boolean" then return self.bVisible end
	self.bVisible = bool
	if bool then
		visibleRectangles[self] = true
	else
		visibleRectangles[self] = nil
	end
	return true
end

function dxRectangle:destroy()
	self.bDestroyed = true
	setmetatable( self, self )
	return true
end

function dxRectangle:postGUI(bool)
	if type(bool) ~= "boolean" then return self.bPostGUI end
	self.bPostGUI = bool
	return true
end

addEventHandler ( "onClientRender", getRootElement(),
	function()
	if not getElementData(localPlayer,"oldurme:mesaj") then
		for self,_ in pairs(visibleRectangles) do
			while true do
				if self.bDestroyed then
					visibleRectangles[self] = nil
					break
				end
				local x,y,width,height = self.fX,self.fY,self.fWidth,self.fHeight
				if self.bRelativePosition then
					x = x/g_screenX
					y = y/g_screenY
				end
				if self.bRelativeSize then
					width = width/g_screenX
					height = height/g_screenY
				end
				dxDrawRectangle ( x,y, width, height, tocolor(unpack(self.tColor)), self.bPostGUI )
				break
			end
		end
	end
	end
)