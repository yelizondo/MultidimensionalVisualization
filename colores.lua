rojos={
    {255,0,0},
    {227,66,51},
    {255,26,0},
    {150,0,35},
    {128,0,0}
}

verdes={
    {0,255,0},
    {127,255,0},
    {76,187,23},
    {80,200,120},
    {64,130,109}
}

magentas={
    {255,0,255},
    {253,63,146},
    {197,75,140},
    {244,176,255},
    {200,162,200}
}

azules={
    {0,255,255},
    {48,213,200},
    {135,206,255},
    {155,196,226},
    {127,255,212}
}

cafes={
    {148,129,43},
    {204,119,34},
    {184,115,51},
    {218,138,95},
    {128,0,32}
}

function initColor(colores)
    local colors={}
    for i=1, #colores
    do
        local a=color(colores[i][1],colores[i][2],colores[i][3],255)
        table.insert(colors,a)
    end
    return colors
end