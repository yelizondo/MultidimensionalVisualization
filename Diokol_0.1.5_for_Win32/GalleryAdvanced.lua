local Size = 512;
local siz = Size-1;

local tension = 0.5;
local sympathy = 0.05;
local damp = 0.999;

local draggedNode = -1;

local colorray = {} --16 colors
--------------------------
local px = {}
local py = {}
local vx = {}
local vy = {}
local ax = {}
local ay = {}
----512 (size) floats-------
local width=1920
local height = 1080
local mouseX=0
local mouseY=0
---------------------------------------------------------------------------------

function setup() 
	initColors()
	size(width,height);
  	ellipseMode(RADIUS);
	fill(255, 128);

	table.insert(px,16)
	table.insert(py,height/2)
  
  for i = 2, siz --1,siz
  do
	table.insert(px,width * i / Size)
	table.insert(py,height/2 + randomGaussian() * 16)
    --px[i] = width * i / size;
    --py[i] = height/2 + randomGaussian() * 16;
  end
	px[siz] = width - 64;
	py[siz] = height/2;
	
	changeColors();
end

--------------------------------------------------------------------------------------------

function draw() 
	for i = 1, siz
	do
		table.insert(ax,(px[i-1] + px[i+1] - px[i] - px[i]) * tension + (vx[i-1] + vx[i+1] - vx[i] - vx[i]) * sympathy)
		table.insert(ay,(py[i-1] + py[i+1] - py[i] - py[i]) * tension + (vy[i-1] + vy[i+1] - vy[i] - vy[i]) * sympathy)
		--ax[i] = (px[i-1] + px[i+1] - px[i] - px[i]) * tension + (vx[i-1] + vx[i+1] - vx[i] - vx[i]) * sympathy;
		--ay[i] = (py[i-1] + py[i+1] - py[i] - py[i]) * tension + (vy[i-1] + vy[i+1] - vy[i] - vy[i]) * sympathy;
	end
	
	for i = 1, siz
	do
		table.insert(vx,)
		table.insert()
		--vx[i] = vx[i] * damp + ax[i];
		--vy[i] = vy[i] * damp + ay[i];
		px[i] = px[i]+ vx[i];
		py[i] = py[i]+vy[i];
	end
	
	if (draggedNode ~= -1) then
		px[draggedNode] = mouseX;
		py[draggedNode] = mouseY;
	end
	
	
	background(32);
	noStroke();
	
	ellipse(px[0], py[0], 16, 16);
	ellipse(px[siz], py[siz], 16, 16);
	
	
	for  i = 1, #colorray
	do
		stroke(colorray[i][1],colorray[i][2],colorray[i][3]);
		
		for node = 1,Size-i
		do
			line(px[node], py[node], px[node+i], py[node+i]);
		end
	end
end

------------------------------------------------------------------------------------------------
function mouseMoved(x,y)
	mouseX = x
	mouseY = y
 end

function mousePressed(x,y) 
	changeColors();
	
	draggedNode = -1;
	
	if (math.abs(mouseX - px[0]) < 16    and    math.abs(mouseY - py[0]) < 16) then
		draggedNode = 0;
	elseif (abs(mouseX - px[siz]) < 16    and    abs(mouseY - py[siz]) < 16) then
		draggedNode = siz;
	end
end

-------------------------------------------------------------------------------------------------

function mouseReleased(x,y) 
	draggedNode = -1;
end

-------------------------------------------------------------------------------------------------


function initColors() 
	local r = math.random(256);
	local g = math.random(256);
	local b = math.random(256);
	local desiredColors=16
	
	for i = 1,desiredColors
	do
		table.insert(colorray,{r + gauss(64), g + gauss(64), b + gauss(64), 128})
		--colorray[i] = color(r + gauss(64), g + gauss(64), b + gauss(64), 128);
	end
end



function changeColors() 
	local r = math.random(256);
	local g = math.random(256);
	local b = math.random(256);
	local desiredColors=16
	
	for i = 1, desiredColors
	do
		--table.append(colorray,{r + gauss(64), g + gauss(64), b + gauss(64), 128})
		colorray[i] = {r + gauss(64), g + gauss(64), b + gauss(64), 128}
	end
end

-------------------------------------------------------------------------------------------------

function gauss(n) 
	return randomGaussian() * n
end

function randomGaussian ()
    return  math.sqrt(-2 * math.log(math.random())) * math.cos(2 * math.pi * math.random())
end