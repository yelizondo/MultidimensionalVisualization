pixels = {} -- Class to save the pixels

function pixels:new()
	p = {}
	setmetatable(p,self)
	self.__index = self
	return p
end

function pixels:add(id,pixel)
	self.id = pixel
end

function setup()
	sizeX = 600
	sizeY = 600
	size(sizeX,sizeY)

	
 
end

function interactionManagment(pixelInfo)

end

function pixel(x,y,pID,pPair)
	local pxlInfo = {
		id = pID,
		pair = pPair
	}

	event(CLICKED)
	fill("#E8263C")
	if (rect(x,y,10,10)) then
		interactionManagment(pxlInfo)
	end

	return pxlInfo
end

function draw()
	background("#272822")

	pixels.
	pixel(100,100,"0","1")
	pixel(200,20,"1","0")
end


