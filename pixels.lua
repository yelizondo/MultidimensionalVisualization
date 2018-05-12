pixels = {}

-- Objeto Pixel
function pixel(pX,pY,pId,pPair,pColor,pHLC)
	return {id = pId, 
			x = pX, 
			y = pY,
			pair = pPair,
			color = pColor,
			highlight = false,
			hlColor = pHLC}
end

-----------------------------------------------
--  Las tecnicas generan los pixeles en sus  --
--  respectivos x,y para anadirlos al table  --
-----------------------------------------------

-- Primera tecnica
function spiralShapedArrangement(data)
end

-- Segunda tecnica
function twoDArrangement(data)
end

-- Tercera tecnica
function groupingArrangement(data)
end
-----------------------------------------------


-- Recorro el table de pixels y los dibujo
-- Ademas se encarga de llamar la funcion encargada de la interaccion
function drawPixels()

end


-- Dado un pixel, busca los pixeles asociados
-- y los resalta o no
function interactionManagment(pair,highlight)
	for i=1,#pixels do
		if (pixels[i].id == pair) then
			pixels[i].highlight = highlight
		end
	end
end
