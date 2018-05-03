local img;

function setup()
  size(250, 250);
  img = loadImage('data/Diokol.jpg');
end

function draw()
  background(255);
  imageMode(CENTER)
  image(img, 125, 125, 200, 200);
end
