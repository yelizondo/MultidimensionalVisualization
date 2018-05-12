require "LuaDataFrames/DataFrameTools"
local csv = require("csv")
local data= csv.open("data/ProductSaleData.csv")

function setup()
    background("#272822")
    frameRate(15)
    sizeX = 600
	sizeY = 600
	size(sizeX,sizeY)
    local f = loadFont("data/Vera.ttf",12)
    textFont(f)
end

function draw()

end

function sale(pNeto,pFacturado,pAgente,pTipo,pNombreArt,pCodArt)
	mini={
		neto=pNeto,
	    Facturado=pFacturado,
        agente=pAgente,
        tipo=pTipo,
        nombreArt=pNombreArt,
        codArt=pCodArt}
	return mini
end

function readCSV(data)
    local _table = {}
    for fields in data:lines() do
		local st = sale(fields[1],fields[12],fields[3],fields[6],fields[9],fields[8])
        table.insert(_table, st)
    end
    return _table
end

function Right5Dim(x,y)
	x = x + 1
	return {x,y}
end

function Left5Dim(x,y)
	x = x - 1	
	return {x,y}
end

function Up5Dim(x,y)
	y = y - 1
	return {x,y}
end

function Down5Dim(x,y)
	y = y + 1
	return {x,y}
end
