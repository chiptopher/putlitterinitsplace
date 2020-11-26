require("litter")

function createLitter() 
    local rand = math.random(6)
    local litter = nil
    local position = math.random(50, 1300)
    if     rand == 1 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("gfx/can.png"))
    elseif rand == 2 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("gfx/bag.png"))
    elseif rand == 3 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("gfx/banana.png"))
    elseif rand == 4 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("gfx/bottle.png"))
    elseif rand == 5 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("gfx/cigerette.png"))
    elseif rand == 6 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("gfx/paper.png"))
    end
    return litter
end
