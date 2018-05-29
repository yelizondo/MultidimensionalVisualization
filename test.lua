local COLOR = {}
COLOR.__index = COLOR

--[[---------------------------------------------------------
	Register our metatable to make it accessible using FindMetaTable
-----------------------------------------------------------]]

debug.getregistry().Color = COLOR

--[[---------------------------------------------------------
	To easily create a colour table
-----------------------------------------------------------]]
function Color( r, g, b, a )
	a = a or 255
	return setmetatable( { r = math.min( tonumber(r), 255 ), g =  math.min( tonumber(g), 255 ), b =  math.min( tonumber(b), 255 ), a =  math.min( tonumber(a), 255 ) }, COLOR )
	
end

--[[---------------------------------------------------------
	Change the alpha of a color
-----------------------------------------------------------]]
function ColorAlpha( c, a )

	return Color( c.r, c.g, c.b, a )
	
end

--[[---------------------------------------------------------
	Checks if the given varible is a color object
-----------------------------------------------------------]]
function IsColor( obj )

	return getmetatable(obj) == COLOR

end


--[[---------------------------------------------------------
	Returns color as a string
-----------------------------------------------------------]]
function COLOR:__tostring()
	
	return string.format( "%d %d %d %d", self.r, self.g, self.b, self.a )
	
end

--[[---------------------------------------------------------
	Compares two colors
-----------------------------------------------------------]]
function COLOR:__eq( c )
	
	return self.r == c.r and self.g == c.g and self.b == c.b and self.a == c.a
	
end

--[[---------------------------------------------------------
	Converts a color to HSV
-----------------------------------------------------------]]
function COLOR:ToHSV()
	
	return ColorToHSV( self )
	
end

--[[---------------------------------------------------------
	Converts Color To Vector - loss of precision / alpha lost
-----------------------------------------------------------]]
function COLOR:ToVector( )

	return Vector( self.r / 255, self.g / 255, self.b / 255 )

end

function setup()
	size(300,300)

	local colores = {
		color(20,123,255,0),
		color(0,0,0,255),
		color(0,0,0,0),
		color(255,255,255,255),
		color(0,255,0,255),
		color(0,0,255,255),
		color(55,20,60,255),
		color(25,160,40,255),
		color(125,3,78,255),
		color(255,0,0,255),
		color(255,3,78,255),
		color(255,160,4,255),
		color(255,0,0,255),
		color(255,0,0,255),
		color(255,0,0,255),
		color(255,0,0,255),
		color(255,160,160,255),
		color(12,10,233,255),
		color(255,2,30,255),
		color(255,255,255,255),
	}

	print(color(20,123,255,0))
	print(#Color(20,123,255,0))
end
function draw()
	background("#282923")

end

