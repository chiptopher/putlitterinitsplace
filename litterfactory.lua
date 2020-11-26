require("litter")

function createLitter() 
    local rand = math.random(6)
    local litter = nil
    local position = math.random(50, 1300)
    if     rand == 1 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("assets/can.png"))
    elseif rand == 2 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("assets/bag.png"))
    elseif rand == 3 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("assets/banana.png"))
    elseif rand == 4 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("assets/bottle.png"))
    elseif rand == 5 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("assets/cigerette.png"))
    elseif rand == 6 then litter = Litter:new(position, 0, 100, 100, love.graphics.newImage("assets/paper.png"))
    end
    return litter
end
