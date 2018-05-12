function setup()
	size(600,600)

	pixels = {}
	table.insert(pixels,pixel(100,100,0,1,"#F52644","#FD8D20"))
	table.insert(pixels,pixel(200,200,1,0,"#9AD92D","#FD8D20"))
	table.insert(pixels,pixel(240,200,1,0,"#9AD92D","#FD8D20"))
end

function interactionManagment(pair,highlight)
	for i=1,#pixels do
		if (pixels[i].id == pair) then
			pixels[i].highlight = highlight
		end
	end
end


function pixel(pX,pY,pId,pPair,pColor,pHLC)
	return {id = pId, 
			x = pX, 
			y = pY,
			pair = pPair,
			color = pColor,
			highlight = false,
			hlColor = pHLC}
end

function drawPixels(dataPixels)
	local hightlight = false
	for i = 1, #pixels do

		noStroke()

		if (not pixels[i].highlight) then 
			fill(pixels[i].color)
		else
			fill(pixels[i].hlColor)
		end

		event(CLICKED)
		if (rect(pixels[i].x,pixels[i].y,30,30)) then
			highlight = not highlight
			interactionManagment(pixels[i].pair,highlight)
		end
	end
end

function draw()
	background("#272822")
	drawPixels(pixels)
end


