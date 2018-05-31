require "MDViz"
require "LuaDataFrames/DataFrameTools"

function setup()
	size(900,700)
	local f = loadFont("data/Vera.ttf",12)
	textFont(f)
	noLoop()
	frameRate(120)
	-- Random data to test
	dataFrame = readCSV("data/walmartSales.csv", ",")
	precios = getCol(dataFrame, "Precios")

	precios = numberConvertion(precios)
	setupCircleTechnique(precios,600,600)

end

function draw()
	background("#272822")
	drawCircleTechnique(100,100,grid)
	interactionAxis(750, 150,100, 300)
end