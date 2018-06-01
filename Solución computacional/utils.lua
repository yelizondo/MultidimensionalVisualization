function numberConvertion(table)
	for i=1,#table do
		table[i] = tonumber(table[i])
	end
	return table
end

function quicksort(t)
  if #t<2 then return t end
  local pivot=t[1]
  local a,b,c={},{},{}
  for _,v in ipairs(t) do
    if     v<pivot then a[#a+1]=v
    elseif v>pivot then c[#c+1]=v
    else                b[#b+1]=v
    end
  end
  a=quicksort(a)
  c=quicksort(c)
  for _,v in ipairs(b) do a[#a+1]=v end
  for _,v in ipairs(c) do a[#a+1]=v end
  return a
end

function getMinValue(table)
  table = quicksort(table)
  return table[1]
end

function getMaxValue(table)
  table = quicksort(table)
  return table[#table]
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

function getPixelColor(id, minValue, maxValue, minColor, maxColor)
  local temp = map(id,
            minValue,
            maxValue,
            tonumber(removeFirstStr(minColor),16),
            tonumber(removeFirstStr(maxColor),16))
  return '#' .. num2hex(temp)
end

function removeFirstStr(str)
  return string.gsub(str,'#','')
end

function num2hex(num)
    local hexstr = '0123456789ABCDEF'
    local s = ''
    while num > 0 do
        local mod = math.fmod(num, 16)
        s = string.sub(hexstr, mod+1, mod+1) .. s
        num = math.floor(num / 16)
    end
    if s == '' then s = '0' end
    return s
end

function hex2rgb(hex)
    hex = hex:gsub("#","")
    return {tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))}
end

function rgb(rgbTable)  
    return color(rgbTable[1],rgbTable[2],rgbTable[3],255)
end