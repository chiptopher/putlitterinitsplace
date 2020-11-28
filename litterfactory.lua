require("litter")

-- if you wanna install lfs you can just have it grab from the whole directory
-- without enumerating them here
local litter_assets = {
    "can.png",
    "bag.png",
    "banana.png",
    "bottle.png",
    "cigarette.png",
    "paper.png"
}

function createLitter() 
    local rand = math.random(6)
    local position = math.random(50, 1300)
    return Litter:new(position, 0, 100, 100, love.graphics.newImage("gfx/"..litter_assets[rand]))
end
