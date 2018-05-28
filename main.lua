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
	vendedores = getCol(dataFrame,"Vendedor")
	precios = getCol(dataFrame, "Precios")

	techniqueWidth = 200
	techniqueHeight = 200
	vendedores = numberConvertion(vendedores)
	precios = numberConvertion(precios)
	local data = linkData(vendedores,precios)
	grid = setupCircleTechnique(data, "#EFF2E9", "#282923", "#FFDD33")

end

function draw()
	background("#272822")
	drawCircleTechnique(100,100,grid)

	drawCircleTechnique(500,100,grid)
end