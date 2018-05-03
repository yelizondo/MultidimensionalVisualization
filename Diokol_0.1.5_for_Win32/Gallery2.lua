local num =0

function setup()
  size(640, 640);
  background(0);
  fill(255, 50);
  noStroke();
  frameRate(200)
end

function draw() 
  translate(640/2, 640/2);
  rotate(radians(num*50));
  -- Play around with the values for different patterns */
  local x = math.sin(radians(num*50)) * (math.sin(num)*200);
  local y = math.cos(radians(x)) * x;
  -- Our size is dependent on x and has a max size of 10 */
  local d = math.sin(x/100) * 10;

  --[[ 
   You may be thinking of using the point function and changing the strokeweight. However because our
   d (size) variable goes into negative numbers, the program will return an error. Also ellipses without 
   stroke gives a cleaner look.
   ]]
  ellipse(x, y, d, d);
  ellipse(-x, -y, d, d);

  num=num+0.01;
end