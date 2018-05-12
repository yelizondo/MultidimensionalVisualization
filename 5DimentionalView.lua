require "LuaDataFrames/DataFrameTools"
local csv = require("csv")
local path= csv.open("data/ProductSaleData.csv")

function setup()
    background(0)
    frameRate(15)
    sizeX = 600
	sizeY = 600
	size(sizeX,sizeY)
    local f = loadFont("data/Vera.ttf",12)
    textFont(f)
end

function draw()

end

