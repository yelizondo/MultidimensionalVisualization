require "LuaDataFrames/DataFrameTools"

function setup()
	size(600,600)
	dataFrame = readCSV("data/walmartSales.csv", ",")
	vendedores = getCol(dataFrame,"Vendedor")
	precios = getCol(dataFrame, "Precios")
	local data = linkData(vendedores,precios)
	local result = relevanceFactor(data)
	print(#data)
	print(#result)
	tprint(result)
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
	return _table
end


function by_ID(data1, data2)
	return data1.id < data2.id -- compara por id (1er parametro de la tabla)
end

function relevanceFactor(pTable)
	table.sort(pTable, by_ID)
	-- se ordenan los datos de acuerdo a cierto criterio
	return pTable
end

function tprint (tbl, indent)
	if not indent then indent = 0 end
	for k, v in pairs(tbl) do
	  formatting = string.rep("  ", indent) .. k .. ": "
	  if type(v) == "table" then
		tprint(v, indent+1)
	  else
		print(formatting .. v)
	  end
	end
  end