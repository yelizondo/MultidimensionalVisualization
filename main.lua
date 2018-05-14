require "MDViz"
require "LuaDataFrames/DataFrameTools"

function setup()
	size(800,400)
	local f = loadFont("data/Vera.ttf",12)
	textFont(f)
	noLoop()
	frameRate(120)
	-- Random data to test
	dataFrame = readCSV("data/walmartSales.csv", ",")
	vendedores = getCol(dataFrame,"Vendedor")
	precios = getCol(dataFrame, "Precios")

	-- First technique position
	local x1 = 110
	local y1 = 200

	-- Second technique position
	local x2 = 400
	local y2 = 200

	-- Lo que hacen es general los pixels enlazados y 
	-- agregarlos a un {}, para luego dibujarlos

	spiralShapedArrangement(x2,y2,linkData(vendedores,precios),"#FFFF00","#272822","#BCF6DB")
	spiralShapedArrangement(x1,y1,linkData(precios,vendedores),"#FFFF00","#272822","#BCF6DB")
end

function draw()
	background("#272822")

	-- Recorre el arreglo de pixeles y los dibuja
	drawPixels()
end