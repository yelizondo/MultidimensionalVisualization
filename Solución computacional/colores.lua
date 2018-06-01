local default = {
    min = "#1F2326",
    max = "#C7CBD1"
}

local rojos = {
    min = "#f96d6d",
    max = "#ba0000",
    background = "#ff0000"
}

local verdes = {
    min = "#9eff9e",
    max = "#00c100",
    background = "#00ff00"
}

local magentas = {
    min = "#ff96ff",
    max = "#cc00cc",
    background = "#ff00ff"
}

local azules = {
    min = "#568fea",
    max = "#004cc6",
    background = "#0000ff"
}

local cafes = {
    min = "#d8c777",
    max = "#7f6900",
    background = "#94812b"
}

function getColorScales(color)
    if (color == "ROJOS") then 
        return rojos
    elseif (color == "MAGENTAS") then
        return magentas
    elseif (color == "CAFES") then
        return cafes
    elseif (color == "AZULES") then
        return azules
    elseif (color == "VERDES") then
        return verdes
    elseif (color == "DEFAULT") then
        return default
    end
end