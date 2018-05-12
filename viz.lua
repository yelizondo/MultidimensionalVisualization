require "pixels"
require "LuaDataFrames/DataFrameTools"

-- Random data to test
data1 = {}
data2 = {}
for i=1, 100000 do
	table.insert(data1,math.random(100))
	table.insert(data2,math.random(100))
end	

table.sort(data1)
table.sort(data2)


function setup()
	size(600,600)
	
end

function draw()
	background("#272822")

	spiralShapedArrangement(data1)
end