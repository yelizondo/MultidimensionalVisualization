require "LuaDataFrames/DataFrameTools"
	data = {}
	for i=1, 100000 do
		table.insert(data,math.random((100)))
	end	
	table.sort(data)

function node()
	mini={
		x=0,
		y=0,
		Data1=0,
		Data2=0,
		Name=""}
	return mini
end

function setup()
	sizeX = 600
	sizeY = 600
	size(sizeX,sizeY)

	frameRate(15)

	local path = "carprice.csv"
	local sep = ","
	--data =  readCSV(path, sep)
	--printDataFrame(data)
	--rownames(data)


end

function goRight(x,y)
	x = x + 1
	return {x,y}
end

function goLeft(x,y)
	x = x - 1	
	return {x,y}
end

function goUp(x,y)
	y = y - 1
	return {x,y}
end

function goDown(x,y)
	y = y + 1
	return {x,y}
end

function drawPixel(x,y,color)
	if (type(color) == "number" or type(color) == "string") then
		fill(color)
	elseif (type(color == "table")) then 
		fill(color[1],color[2],color[3])
	end
	noStroke()
	rect(x,y,1,1)
end

function drawPixels(data,x,y)
				--   R    U     L     D
	local turns = {true,false,false,false}
	local steps = 1
	local temp_steps = steps

	for i=1,#data do
		
		if (0 <= data[i] and data[i] < 15) then
			drawPixel(x,y,"#41EF38")
		elseif (15 <= data[i] and data[i] < 20) then
			drawPixel(x,y,"#05BF86")
		elseif (20 <= data[i] and data[i] < 25) then
			drawPixel(x,y,"#115BBB")
		elseif (25 <= data[i] and data[i] < 40) then
			drawPixel(x,y,"#411BAF")
		elseif (40 <= data[i] and data[i] < 45) then
			drawPixel(x,y,"#570B9E")
		elseif (45 <= data[i]  and data[i] < 60) then
			drawPixel(x,y,"#67038B")
		elseif (60 <= data[i] and data[i] < 80) then
			drawPixel(x,y,"#7B006D")
		elseif (80 <= data[i] and data[i] < 85) then
			drawPixel(x,y,"#80025F")
		elseif (85 <= data[i] and data[i] < 100) then
			drawPixel(x,y,"#851333")
		end


		if (turns[1]) then
			
			local mov = goRight(x,y)
			x = mov[1]
			y = mov[2]

			if (temp_steps == 0) then 
				turns[1] = false
				turns[2] = true
				--steps = steps + 1
				temp_steps = steps
			end

			temp_steps = temp_steps - 1

		elseif (turns[2]) then
			local mov = goUp(x,y)
			x = mov[1]
			y = mov[2]

			if (temp_steps == 0) then 
				turns[2] = false
				turns[3] = true
				steps = steps + 1
				temp_steps = steps
			end

			temp_steps = temp_steps - 1

		elseif (turns[3]) then
			local mov = goLeft(x,y)
			x = mov[1]
			y = mov[2]

			if (temp_steps == 0) then 
				turns[3] = false
				turns[4] = true
				--steps = steps + 1
				temp_steps = steps
			end

			temp_steps = temp_steps - 1

		elseif (turns[4]) then
			local mov = goDown(x,y)
			x = mov[1]
			y = mov[2]

			if (temp_steps == 0) then 
				turns[4] = false
				turns[1] = true
				steps = steps + 1
				temp_steps = steps
			end

			temp_steps = temp_steps - 1

		end

	end
end

function draw()
	background("#272822")

	local x = 300
	local y = 300

	drawPixels(data,x,y)
	--print("Hola")
end