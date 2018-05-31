local default={
    {0,255,0},
    {127,255,0},
    {76,187,23},
    {80,200,120},
    {64,130,109}
}

local rojos={
    {255,0,0},
    {227,66,51},
    {255,26,0},
    {150,0,35},
    {128,0,0}
}

local verdes={
    {0,255,0},
    {127,255,0},
    {76,187,23},
    {80,200,120},
    {64,130,109}
}

local magentas={
    {255,0,255},
    {253,63,146},
    {197,75,140},
    {244,176,255},
    {200,162,200}
}

local azules={
    {0,255,255},
    {48,213,200},
    {135,206,255},
    {155,196,226},
    {127,255,212}
}

local cafes={
    {148,129,43},
    {204,119,34},
    {184,115,51},
    {218,138,95},
    {128,0,32}
}

function getMainColor(color)
    if (color == "ROJO") then 
        return rojos[1]
    elseif (color == "MAGENTA") then
        return magentas[1]
    elseif (color == "CAFE") then
        return cafes[1]
    elseif (color == "AZUL") then
        return azules[1]
    elseif (color == "VERDE") then
        return verdes[1]
    end
end

function getColorScales(color)
    if (color == "ROJOS") then 
        return rojos
    elseif (color == "MAGENTAS") then
        return magentas
    elseif (color == "CAFES") then
        return cafes
    elseif (color == "AZULS") then
        return azules
    elseif (color == "VERDES") then
        return verdes
    elseif (color == "DEFAULT") then
        return verdes
    end
end