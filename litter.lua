require("bounds")
require("gameobject")

litterWidth = 100
litterHeight = 100
local pixel_per_second = 100
floorLocation = 525

Litter = GameObject:new()

function Litter:new (x, y, width, height, asset)
    o = GameObject:new(x, y, width, height, asset)
    setmetatable(o, self)
    self.__index = self
    self.grabbed = false
    return o
end

function Litter:update(delta) 
    if not self.grabbed then
        self:move(0, (pixel_per_second * delta))
        if self.y > floorLocation then
            self.y = floorLocation 
            gameOver = true
        end
    end
end


function Litter:grab(x, y)
    self.grabbed = self:withinObject(x, y)
    return self.grabbed
end

function Litter:move(dx, dy)
    self.x = self.x + dx
    self.y = self.y + dy
end
