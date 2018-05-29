require "colores"
pixels = {}
COLOR_SCALE_TO_DISPLAY = ""


function pixel(pX,pY,pId,pPair,pColor,pHLC)
	return {id = pId, 
			x = pX, 
			y = pY,
			pair = pPair,
			color = pColor,
			highlight = false,
			hlColor = pHLC}
end

function relevanceFactor(pTable)
	-- se ordenan los datos de acuerdo a cierto criterio
	return quicksort(pTable)
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

function setupCircleTechnique(dataTable, width, height)
	local data = relevanceFactor(dataTable) -- This sorts the data

	-- Calculate x & y positions

	for i=1,#data do
		local t = math.rad(i)
		local x = width/2 + math.floor(((t * math.cos(t)) / 3.7)+0.5)
		local y = height/2 +math.floor(((t * math.sin(t)) / 3.7)+0.5)
		table.insert(pixels, pixel(x, y, data[i]))		
	end

	return drawPixels(width,height)
end

function interactionAxis(x,y,w,h)
	local showFilter = false

	fill(0)
	rect(x,y,w,h)

	-- Width y height de los botones
	local btnWidth = w - 10
	local btnHeight = (h/5) - 6

	event(CLICKED)

	-- Boton Uno
	local rojo = getMainColor("ROJO")
	fill(rojo[1],rojo[2],rojo[3])
	if rect(x+5, y+5, btnWidth, btnHeight) then
		showFilter = not showFilter
		if (showFilter) then
			setColorScale("ROJOS")
		else
			setColorScale("DEFAULT")
		end
	end

	-- Boton Dos
	local verde = getMainColor("VERDE")
	fill(verde[1],verde[2],verde[3])
	if rect(x+5, y+btnHeight + 5*2, btnWidth, btnHeight) then
		showFilter = not showFilter
		if (showFilter) then
			setColorScale("VERDES")
		else
			setColorScale("DEFAULT")
		end
	end

	-- Boton Tre
	local magenta = getMainColor("MAGENTA")
	fill(magenta[1],magenta[2],magenta[3])
	if rect(x+5, y+btnHeight*2 + 5*3, btnWidth, btnHeight) then
		showFilter = not showFilter
		if (showFilter) then
			setColorScale("MAGENTAS")
		else
			setColorScale("DEFAULT")
		end
	end

	-- Boton Cua
	local cafe = getMainColor("CAFE")
	fill(cafe[1],cafe[2],cafe[3])
	if rect(x+5, y+btnHeight*3 + 5*4, btnWidth, btnHeight) then
		showFilter = not showFilter
		if (showFilter) then
			setColorScale("CAFES")
		else
			setColorScale("DEFAULT")
		end
	end

	-- Boton azu
	local azul = getMainColor("AZUL")
	fill(azul[1],azul[2],azul[3])
	if rect(x+5, y+btnHeight*4 + 5*5, btnWidth, btnHeight) then
		showFilter = not showFilter
		if (showFilter) then
			setColorScale("AZULES")
		else
			setColorScale("DEFAULT")
		end
	end
end

function setColorScale(colorScale)
	COLOR_SCALE_TO_DISPLAY = colorScale
end

function getColorScale()
	return COLOR_SCALE_TO_DISPLAY
end

-----------------------------------------------

-- Recorro el table de pixels y los dibujo
-- Ademas se encarga de llamar la funcion encargada de la interaccion
function drawPixels(width, height)
	local grid
	local ncols = 500
	local nrows = 500

	grid = createImage(nrows,ncols)

	local px = loadPixels(grid)

	local colorScale = getColorScale()
	local colors = nil

	if (colorScale == "DEFAULT") then 
		colors = getColorScale("DEFAULT")
    elseif (colorScale == "MAGENTAS") then
    	colors = getColorScale("MAGENTAS")
    elseif (colorScale == "CAFES") then
    	colors = getColorScale("CAFES")
    elseif (colorScale == "AZULES") then
    	colors = getColorScale("AZULES")
    elseif (colorScale == "VERDES") then
    	colors = getColorScale("VERDES")
    elseif (colorScale == "ROJOS") then
    	colors = getColorScale("ROJOS")
    end

    -- Aqui se usan esos colores para hacer los rangos y pintar los pixeles
	local juandi=color(0,255,0,255)
	for i=1, #pixels do
		local x = pixels[i].x
		local y = pixels[i].y
		px[x*nrows+y] = juandi
	end

	updatePixels(grid,px)
	return grid
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