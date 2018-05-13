require "MDViz"
require "LuaDataFrames/DataFrameTools"

function setup()
	size(800,800)

	-- Random data to test
	dataFrame = readCSV("data/walmartSales.csv", ",")
	vendedores = getCol(dataFrame,"Vendedor")
	precios = getCol(dataFrame, "Precios")

	-- First technique position
	local x1 = 100
	local y1 = 200

	-- Second technique position
	local x2 = 400
	local y2 = 200

	-- Lo que hacen es general los pixels enlazados y 
	-- agregarlos a un {}, para luego dibujarlos

	spiralShapedArrangement(x1,y1,linkData(vendedores,precios),"#E62660","#272822","#BCF6DB")
	spiralShapedArrangement(x2,y2,linkData(precios,vendedores),"#E62660","#272822","#BCF6DB")
end

function draw()
	background("#272822")

	-- Recorre el arreglo de pixeles y los dibuja
	drawPixels()
end