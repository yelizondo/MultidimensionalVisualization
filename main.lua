require "MDViz"
require "LuaDataFrames/DataFrameTools"

function setup()
	size(900,700)
	local f = loadFont("data/Vera.ttf",12)
	textFont(f)
	
	frameRate(120)
	-- Random data to test
	dataFrame = readCSV("data/walmartSales.csv", ",")
	precios = getCol(dataFrame, "Precios")
	precios = numberConvertion(precios)
	min = getMinValue(precios)
	max = getMaxValue(precios)

	setupCircleTechnique(precios,600,600)
	noLoop()
end

function draw()
	background("#272822")
	drawCircleTechnique(100,100,600,600,min,max)
	interactionAxis(750, 150,100, 300)
end