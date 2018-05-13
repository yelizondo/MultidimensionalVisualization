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

function linkData(data1,data2)
	local _table={}
	for i=1,#data1
	do
		local sq={id=data1[i],pair=data2[i]}
		table.insert(_table,sq)
	end
end

function relevanceFactor(pTable, minValueColor, maxValueColor)

	-- se ordenan los datos de acuerdo a cierto criterio

	return {table=pTable, minColor=minValueColor, maxcolor=maxValueColor}	
end