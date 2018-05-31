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

function drawCircleTechnique(x,y,w,h)
	local grid = drawPixels(w,h)
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

	if (colorScale ~= "DEFAULT") then 
		colors = colorScale
	else
		colors = "DEFAULT"
	end

	 
    -- Aqui se usan esos colores para hacer los rangos y pintar los pixeles
	for i=1, #pixels do
		local x = pixels[i].x
		local y = pixels[i].y
		local id = pixels[i].id
		local clr = nil
		if (colors == "DEFAULT") then
			clr = hex2rgb(getPixelColor(id,0,3500,"#1F2326","#C7CBD1"))
		elseif (colors == "ROJOS") then
				clr = hex2rgb(getPixelColor(id,0,3500,"#f96d6d","#ba0000"))
		elseif (colors == "AZULES") then
				clr = hex2rgb(getPixelColor(id,0,3500,"#568fea","#004cc6"))
		end

		px[x*nrows+y] = rgb(clr)
	end

	updatePixels(grid,px)
	return grid
end

