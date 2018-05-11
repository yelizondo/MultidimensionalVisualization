function setup()
	sizeX = 600
	sizeY = 600
	size(sizeX,sizeY)

	pixels = {}
end

function interactionManagment(pixelInfo)

end

function pixel(pId,pX,pY,pPair,pColor)
	return {id=pId, x=pX, y=pY,pair=pPair,color=pColor}
end

function drawPixels(dataPixels)
	for i = 1, #pixels

		event(CLICKED)
		fill(pixels[i].color)

		if (rect(pixels[i].x,pixels[i].y,10,10)) then
			interactionManagment(pixels[i].pair)
		end
	end
end

function draw()
	background("#272822")

	table.insert(pixels,pixel(100,100,0,1))
	table.insert(pixels,pixel(100,100,1,0))



end


