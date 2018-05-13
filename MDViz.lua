MDViz = {}

function MDViz:new()
	p = { pixels = {} }
	setmetatable(p,self)
	self.__index = self
	return p
end


function MDViz:pixel(pX,pY,pId,pPair,pColor,pHLC)
	return {id = pId, 
			x = pX, 
			y = pY,
			pair = pPair,
			color = pColor,
			highlight = false,
			hlColor = pHLC}
end

-----------------------------------------------
--  Las tecnicas generan los pixeles en sus  --
--  respectivos x,y para anadirlos al table  --
-----------------------------------------------

-- Primera tecnica
function MDViz:spiralShapedArrangement(data)
end

-- Segunda tecnica
function MDViz:twoDArrangement(data)
end

-- Tercera tecnica
function MDViz:groupingArrangement(data)
end
-----------------------------------------------


-- Recorro el table de pixels y los dibujo
-- Ademas se encarga de llamar la funcion encargada de la interaccion
function MDViz:drawPixels()
	local hightlight = false

	for i = 1, #self.pixels do

		noStroke()

		if (not self.pixels[i].highlight) then 
			fill(self.pixels[i].color)
		else
			fill(self.pixels[i].hlColor)
		end

		event(CLICKED)
		if (rect(self.pixels[i].x, self.pixels[i].y, 1, 1)) then
			highlight = not highlight
			self.interactionManagment(self.pixels[i].pair,highlight)
		end
	end
end


-- Dado un pixel, busca los pixeles asociados
-- y los resalta o no
function MDViz:interactionManagment(pair,highlight)
	for i=1,#self.pixels do
		if (pixels[i].id == pair) then
			pixels[i].highlight = highlight
		end
	end
end


-- Funcion asociar valores, para poder enlazarlos y graficar con iteracciones
function linkData(data1,data2)
	local _table={}
	for i=1,#data1
	do
		local sq={data1[i],data2[i]}
		table.insert(_table,sq)
	end
end

--[[
	NO OLVIDAR MANEJAR LOS COLORES
]]