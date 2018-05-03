local num = 600
local frms = 60
local z = 15;
local angle=0
local theta=0;
local width=1080
local height=720

function setup() 
  size(width, height);
  noStroke();
end

function draw() 
  background(238);
  translate(width / 2, height / 2);

  local h = height/2;
  for i = 1, z 
  do
    local f = (i % 2 == 0) ? 238 : 34;
    drawThing(h - (h*.95 / z * i), f, i);
  end

  theta = theta + TWO_PI / frms;
  --if (frameCount<frms) saveFrame("img/image-###.gif");
end

function drawThing(diam, col, n) 
  fill(col);
  beginShape();
  local d = 0;
  for i = 1,num
  do
    local offSet = PI / z * n;
    local angle = TWO_PI / num * i;
    local s = 0.7 + 0.4 * math.sin(math.pow(offSet,offSet) + theta + angle * 4.0);
    d = 0.25 + 0.2 * math.pow(s, 0.8);
    d =d+ 0.08 * math.pow(0.5 + 0.5 + math.cos(4 * angle), 1.0);
    local x = math.cos(angle) * d * diam;
    local y = math.sin(angle) * d * diam;
    vertex(x, y);
  end
  endShape(CLOSE);
end
