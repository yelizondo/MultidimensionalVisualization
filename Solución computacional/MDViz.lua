require "colores"
require "utils"
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

function drawCircleTechnique(x,y,w,h,pMin,pMax)
	local grid = drawPixels(w,h,pMin,pMax)
	image(grid,x,y)
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
	setColorScale("DEFAULT")
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
	local rojo = getColorScales("ROJOS")
	fill(rojo.background)
	if rect(x+5, y+5, btnWidth, btnHeight) then
		showFilter = not showFilter
		if (showFilter) then
			setColorScale("ROJOS")
		else
			setColorScale("DEFAULT")
		end
	end

	-- Boton Dos
	local verde = getColorScales("VERDES")
	fill(verde.background)
	if rect(x+5, y+btnHeight + 5*2, btnWidth, btnHeight) then
		showFilter = not showFilter
		if (showFilter) then
			setColorScale("VERDES")
		else
			setColorScale("DEFAULT")
		end
	end

	-- Boton Tre
	local magenta = getColorScales("MAGENTAS")
	fill(magenta.background)
	if rect(x+5, y+btnHeight*2 + 5*3, btnWidth, btnHeight) then
		showFilter = not showFilter
		if (showFilter) then
			setColorScale("MAGENTAS")
		else
			setColorScale("DEFAULT")
		end
	end

	-- Boton Cua
	local cafe = getColorScales("CAFES")
	fill(cafe.background)
	if rect(x+5, y+btnHeight*3 + 5*4, btnWidth, btnHeight) then
		showFilter = not showFilter
		if (showFilter) then
			setColorScale("CAFES")
		else
			setColorScale("DEFAULT")
		end
	end

	-- Boton azu
	local azul = getColorScales("AZULES")
	fill(azul.background)
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
function drawPixels(width, height,pMin,pMax)
	local grid
	local ncols = 500
	local nrows = 500
	
	grid = createImage(nrows,ncols)

	local px = loadPixels(grid)

	
	local colors = getColorScale()
	local colorScale = getColorScales(colors)

	local min = math.floor(pMin+0.5)
	local max = math.floor(pMax+0.5)
	 
    -- Aqui se usan esos colores para hacer los rangos y pintar los pixeles
	for i=1, #pixels do
		local x = pixels[i].x
		local y = pixels[i].y
		local id = pixels[i].id
		local clr = hex2rgb(getPixelColor(id,min,max+500,colorScale.min,colorScale.max))

		px[x*nrows+y] = rgb(clr)
	end

	updatePixels(grid,px)
	return grid
end

