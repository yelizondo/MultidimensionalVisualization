Class = {}

function Class:new()
	p = {}
	setmetatable(p,self)
	self.__index = self
	return p
end

function Class:printH()
	return 9
end

function Class:test()
	print("holas")
	print(self.printH())
end

a = Class:new()
a:test()
