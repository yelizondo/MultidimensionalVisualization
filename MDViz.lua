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
function MDViz:spiralShapedArrangement(x,y,dataTable,pHColor, minColor, maxColor)
	local turns = {true,false,false,false}
	local steps = 1
	local temp_steps = steps

	data = self.relevanceFactor(dataTable) -- This sorts the data


	for i=1,#data do
		
		-- Aqui se calcula el color
		color = getPixelColor(data[i].id, getMinValue(data), getMaxValue(data), minColor, maxColor)

		-- Aqui se anade el pixel al table de pixels
		table.insert(self.pixels, self.pixel(x,y,data[i].id,data[i].pair,color,pHColors))


		if (turns[1]) then
			
			local mov = goRight(x,y)
			x = mov[1]
			y = mov[2]

			if (temp_steps == 0) then 
				turns[1] = false
				turns[2] = true
				--steps = steps + 1
				temp_steps = steps
			end

			temp_steps = temp_steps - 1

		elseif (turns[2]) then
			local mov = goUp(x,y)
			x = mov[1]
			y = mov[2]

			if (temp_steps == 0) then 
				turns[2] = false
				turns[3] = true
				steps = steps + 1
				temp_steps = steps
			end

			temp_steps = temp_steps - 1

		elseif (turns[3]) then
			local mov = goLeft(x,y)
			x = mov[1]
			y = mov[2]

			if (temp_steps == 0) then 
				turns[3] = false
				turns[4] = true
				--steps = steps + 1
				temp_steps = steps
			end

			temp_steps = temp_steps - 1

		elseif (turns[4]) then
			local mov = goDown(x,y)
			x = mov[1]
			y = mov[2]

			if (temp_steps == 0) then 
				turns[4] = false
				turns[1] = true
				steps = steps + 1
				temp_steps = steps
			end

			temp_steps = temp_steps - 1

		end
	end
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

-- 
function MDViz:getPixelColor(id, minValue, maxValue, minColor, maxColor)
	local temp = map(id,
						minValue,
						maxValue,
						tonumber(removeFirst(minColor),16),
						tonumber(removeFirst(maxColor),16))
	return num2hex(temp)
end

function by_ID(data1, data2)
	return data1.id < data2.id -- compara por id (1er parametro de la tabla)
end

function MDViz:relevanceFactor(pTable)
	print(pTable)
	table.sort(pTable, by_ID)
	-- se ordenan los datos de acuerdo a cierto criterio
	return pTable
end



-- Funcion asociar valores, para poder enlazarlos y graficar con iteracciones
function linkData(data1,data2)
	local _table={}
	for i=1,#data1
	do
		local sq={id=data1[i],pair=data2[i]}
		table.insert(_table,sq)
	end
	return _table
end

function tprint (tbl, indent)
	if not indent then indent = 0 end
	for k, v in pairs(tbl) do
	  formatting = string.rep("  ", indent) .. k .. ": "
	  if type(v) == "table" then
		tprint(v, indent+1)
	  else
		print(formatting .. v)
	  end
	end
end

function getMinValue(sorted)
	return sorted[1].id
end

function getMaxValue(sorted)
	local i = #sorted
	return sorted[i].id
end

function removeFirstStr(str)
	return string.gsub(str,'#','')
end

function num2hex(num)
    local hexstr = '0123456789ABCDEF'
    local s = ''
    while num > 0 do
        local mod = math.fmod(num, 16)
        s = string.sub(hexstr, mod+1, mod+1) .. s
        num = math.floor(num / 16)
    end
    if s == '' then s = '0' end
    return '#' .. s
end