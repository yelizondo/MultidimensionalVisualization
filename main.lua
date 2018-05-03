require "LuaDataFrames/DataFrameTools"


function setup()
	size(600,600)
	local path = "carprice.csv"
	local sep = ","
	data =  readCSV(path, sep)
end

function draw()
	background("#272822")
	print("Hola")
end