




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


function getMinValue(sorted)
	return sorted[1].id
end

function getMaxValue(sorted)
	local i = #sorted
	return sorted[i].id
end

