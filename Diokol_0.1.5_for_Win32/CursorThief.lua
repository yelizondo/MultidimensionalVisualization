local Thief = {} -- Class Point

local celebrate = 30;
local wait = 10;
local mousecursor; --Image
local sweatdrop;--Image
local heart;--Image


function Thief:new(x,y)
    p={posx = x,
    posy=y,
    state=0,
    animate=false,
    reach=0,
    stretch=0}
	setmetatable(p,self)
	self.__index = self
	return p
end

function Thief:run(x,y)
    wait=wait-1
	if (wait == 0) then
        wait = 10;
        self.animate = not animate;
    end
    self.action();
    self.render();
end

function Thief:action()
	if (mouseX + mouseY > 0) {
        switch (state) {
          case 0: { // Jumping
            switch (reach) {
              case 0: { // Nothing
                if (dist(mouseX + 5, mouseY + 10, posx, posy) < 40) state = 3; // Cursor is caught
                else if (mouseX < posx - 15) state = 1;
                else if (mouseX > posx + 15) state = 2;
                else if (round(random(100)) == 5) { stretch = 0; reach = 1; }
                break;
              }
              case 1: { // Reaching up >:3
                if (dist(mouseX + 5, mouseY + 10, posx, stretch + posy - 10) < 20) reach = 3;
                else if ((abs(stretch) + 30) > height - mouseY - 10) reach = 2;
                else stretch--;
                break;
              }
              case 2: { // So close...
                if (dist(mouseX + 5, mouseY + 10, posx, stretch + posy - 10) < 20) reach = 3;
                else if (stretch < 0) stretch++;
                else { reach = 0; stretch = 0; }
                break;
              }
              case 3: { // Woot!
                if (stretch < 0) stretch++;
                else { reach = 0; stretch = 0; state = 3; }
                break;
              }
            }
            break;
          }
          case 1: { // Chase left
            posx += (mouseX - posx)*0.02;
            if (dist(mouseX + 5, mouseY + 10, posx, posy) < 40) state = 3; // Cursor is caught
            else if (mouseX <= posx + 15 && mouseX >= posx - 15) state = 0;
            else if (mouseX > posx + 15) state = 2;
            break;
          }
          case 2: { // Chase right
            posx += (mouseX - posx)*0.02;
            if (dist(mouseX + 5, mouseY + 10, posx, posy) < 40) state = 3; // Cursor is caught
            else if (mouseX <= posx + 15 && mouseX >= posx - 15) state = 0;
            else if (mouseX < posx - 15) state = 1;
            break;
          }
          case 3: { // Hide cursor
            if (posx > width + 50) { state = 0; celebrate = 10; }
            else posx += 2;
            break;
          }
        }
      }
    }
end

PPoint = function(x,y) -- Prototype Point
	local self
	self = {x=x,y=y}
	self.move = function(x,y)
		self.x = x
		self.y = y
	end
	mt = {
		__tostring = function()
			return self.x .. ',' .. self.y
		end
	}
	setmetatable(self, mt)
   return self
end