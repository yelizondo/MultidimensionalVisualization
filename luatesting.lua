require "LuaDataFrames/DataFrameTools"

function setup()
	size(600,600)
	dataFrame = readCSV("data/walmartSales.csv", ",")
	vendedores = getCol(dataFrame,"Vendedor")
	precios = getCol(dataFrame, "Precios")
end

function draw()
	background("#27274F")
end