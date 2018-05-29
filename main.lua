require "MDViz"
require "LuaDataFrames/DataFrameTools"

function setup()
	size(800,700)
	local f = loadFont("data/Vera.ttf",12)
	textFont(f)
	noLoop()
	frameRate(120)
	-- Random data to test
	dataFrame = readCSV("data/walmartSales.csv", ",")
	precios = getCol(dataFrame, "Precios")

	precios = numberConvertion(precios)
	grid = setupCircleTechnique(precios)

end

function draw()
	background("#272822")
	drawCircleTechnique(100,100,grid)
end