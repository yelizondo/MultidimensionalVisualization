local InitValue=0
local uistate = {
    wid = 0,
    mousex = 0,
    mousey = 0,
    mousedown = false, -- boolean
    hotitem = 0,
    activeitem = 0
}

function setup()
    size(640,480)
end

function GEN_ID()
    uistate.wid = uistate.wid + 1
    return uistate.wid
end

-- Prepare for IMGUI code
function imgui_prepare()
  uistate.wid = 0
  uistate.hotitem = 0
end

-- Finish up after IMGUI code
function imgui_finish()
  if (not uistate.mousedown) then
    uistate.activeitem = 0;
  else
        if (uistate.activeitem == 0) then
            uistate.activeitem = -1
        end
  end
end

-- Check whether current mouse position is within a rectangle
function regionhit(x, y, w, h)
    if (uistate.mousex < x or
      uistate.mousey < y or
      uistate.mousex >= x + w or
      uistate.mousey >= y + h) then
        return false
   end
    return true
end

-- Simple button IMGUI widget
function button(id, x, y)
    --   Check whether the button should be hot
    if (regionhit(x, y, 64, 48)) then
        uistate.hotitem = id
        if (uistate.activeitem==0 and uistate.mousedown) then
            uistate.activeitem = id
        end
    end
    -- Render button
    fill("#000000")
    rect(x+8, y+8, 64, 48)
    if (uistate.hotitem == id) then
        if (uistate.activeitem == id) then
            -- Button is both 'hot' and 'active'
            fill("#ffffff")
            rect(x+2, y+2, 64, 48);
        else
            -- Button is merely 'hot'
            fill("#ffffff")
            rect(x, y, 64, 48);
        end
    else
        -- button is not hot, but it may be active   
        fill("#aaaaaa") 
        rect(x, y, 64, 48);
    end
    -- If button is hot and active, but mouse button is not
    -- down, the user must have clicked the button.
    if (not uistate.mousedown and 
      uistate.hotitem == id and
      uistate.activeitem == id) then
        return true
    end
    -- Otherwise, no clicky.
    return false
end

function draw()
    background("#77")
    
    imgui_prepare()
    
    if button(GEN_ID(),50,50) then
        print("button 1 pressed !!")
    end
    
    if button(GEN_ID(),150,50) then
        print("button 2 pressed !!")
    end
    slider(GEN_ID(), 500, 40, 255)

    imgui_finish()
end

function mouseMoved(x,y)
   uistate.mousex = x
   uistate.mousey = y
end

function mousePressed(x,y)
    uistate.mousedown = true
end

function mouseReleased(x,y)
    uistate.mousedown = false
end


function slider(id, x, y, max)
    ypos = ((256 - 16) * InitValue) / max;

    -- Check for hotness
    if (regionhit(x+8, y+8, 16, 255)) then
    uistate.hotitem = id;
    if (uistate.activeitem == 0 and uistate.mousedown) then
      uistate.activeitem = id;
    end
    end

    -- Render the scrollbar
    fill("#777777")
    stroke(0)
    rect(x, y, 32, 256+16);
    
    if (uistate.activeitem == id or uistate.hotitem == id) then
        fill("#ffffff")
        rect(x+8, y+8 + ypos, 16, 16);
    else
        fill("#aaaaaa")
        rect(x+8, y+8 + ypos, 16, 16);
    end

    -- Update widget value
    if (uistate.activeitem == id) then
        local mousepos = uistate.mousey - (y + 8);
        if  mousepos < 0 then
            mousepos = 0;
        end
        if  mousepos > 255 then  
            mousepos = 255;
        end
        local v = (mousepos * max) / 255;
        if v ~= value then 
            InitValue= v;
            return 1;
        end
        return 0;
    end
end

