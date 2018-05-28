pixels = {}
mt = {}

mt = {}          -- create the matrix
for i=1,200 do
	for j=1,200 do
    	mt[i*200 + j] = 0
  	end
end

function pixel(pX,pY,pId,pPair,pColor,pHLC)
	return {id = pId, 
			x = pX, 
			y = pY,
			pair = pPair,
			color = pColor,
			highlight = false,
			hlColor = pHLC}
end

function by_ID(data1, data2)
	return data1.id < data2.id -- compara por id (1er parametro de la tabla)
end

function relevanceFactor(pTable)
	table.sort(pTable, by_ID)
	-- se ordenan los datos de acuerdo a cierto criterio
	return pTable
end

function drawCircleTechnique(x,y,grid)
	image(grid,x,y)
end

function numberConvertion(table)
	for i=1,#table do
		table[i] = tonumber(table[i])
	end
	return table
end

function quicksort(t)
  if #t<2 then return t end
  local pivot=t[1]
  local a,b,c={},{},{}
  for _,v in ipairs(t) do
    if     v<pivot then a[#a+1]=v
    elseif v>pivot then c[#c+1]=v
    else                b[#b+1]=v
    end
  end
  a=quicksort(a)
  c=quicksort(c)
  for _,v in ipairs(b) do a[#a+1]=v end
  for _,v in ipairs(c) do a[#a+1]=v end
  return a
end


-----------------------------------------------
--  Las tecnicas generan los pixeles en sus  --
--  respectivos x,y para anadirlos al table  --
-----------------------------------------------

-- Primera tecnica
function setupCircleTechnique(dataTable,minColor, maxColor, highlightColor)
	local turns = {true,false,false,false}
	local steps = 1
	local temp_steps = steps
	data = relevanceFactor(dataTable) -- This sorts the data

	-- Calculate x & y positions
	local x = 100
	local y = 100

	for i=1,#data do
		
		-- Aqui se calcula el color
		local colore = getPixelColor(data[i].id, getMinValue(data), getMaxValue(data), minColor, maxColor)
		-- Aqui se anade el pixel al table de pixels
		table.insert(pixels, pixel(x, y, data[i].id, data[i].pair, colore, highlightColor))
		mt[x*200 + y] = color(hex2rgb(colore)[1],hex2rgb(colore)[3],hex2rgb(colore)[3],255)

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

	return drawPixels(width,height)
end

-- Segunda tecnica
function twoDArrangement(data)
end

-- Tercera tecnica
function groupingArrangement(data)
end
-----------------------------------------------

-- Recorro el table de pixels y los dibujo
-- Ademas se encarga de llamar la funcion encargada de la interaccion
function drawPixels(width, height)
	local grid
	local ncols = 200
	local nrows = 200

	grid = createImage(nrows,ncols)

	local px = loadPixels(grid)
--[[
	for i=1,#pixels do
		local pixel = pixels[i]
		local x = pixel.x 
		local y = pixel.y 
		local clr = pixel.color
		local rgb = hex2rgb(clr)
		if (x == 100 and y == 100) then print(clr) end


		--px[y*nrows+x] = color(rgb[1],rgb[2],rgb[3],255)
	end 
	]]

	local clr = "#EFF2E9"
	local rgb = hex2rgb(clr)

	for i=1,200 do
		for j=1,200 do

			px[i*nrows+j] = color(rgb[1],rgb[2],rgb[3],255)
			end
	end
	updatePixels(grid,px)
	return grid
end


-- Dado un pixel, busca los pixeles asociados
-- y los resalta o no
function interactionManagment(pair,highlight)
	for i=1,#pixels do
		if (pixels[i].id == pair or pixels[i].pair == pair) then
			pixels[i].highlight = highlight
		end
	end
end

-- 
function getPixelColor(id, minValue, maxValue, minColor, maxColor)
	local temp = map(id,
						minValue,
						maxValue,
						tonumber(removeFirstStr(minColor),16),
						tonumber(removeFirstStr(maxColor),16))
	return '#' .. num2hex(temp)
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

function hex2rgb(hex)
    hex = hex:gsub("#","")
    return {tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))}
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
    return s
end

function goRight(x,y)
	x = x + 1
	return {x,y}
end

function goLeft(x,y)
	x = x - 1	
	return {x,y}
end

function goUp(x,y)
	y = y - 1
	return {x,y}
end

function goDown(x,y)
	y = y + 1
	return {x,y}
end