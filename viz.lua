require "MDViz"
require "LuaDataFrames/DataFrameTools"

function setup()
	size(600,600)

	-- Random data to test
	local data1 = {}
	local data2 = {}

	-- First technique position
	local x1 = 100
	local y1 = 100

	-- Second technique position
	local x2 = 100
	local y2 = 100

	mdv = MDViz:new()

	-- Lo que hacen es general los pixels enlazados y 
	-- agregarlos a un {}, para luego dibujarlos
	mdv:spiralShapedArrangement(x1,y1,linkData(data1,data2))
	mdv:secondTechnique(x2,y2,linkData(data2,data1))
	
end

function draw()
	background("#272822")

	-- Recorre el arreglo de pixeles y los dibuja
	mdv:drawPixels()
end