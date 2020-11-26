GameObject = {asset = nil, x = 0, y = 0, with = 0, height = 0}

function GameObject:new(x, y, width, height, asset)
    o = {}
    o.x = x
    o.y = y
    o.width = width
    o.height = height
    o.asset = asset
    setmetatable(o, self)
    self.__index = self
    return o
end

function GameObject:draw()
    love.graphics.draw(self.asset, self.x, self.y)
end

function GameObject:overlaps(other)
    return self:withinObject(other.x,               other.y) or
           self:withinObject(other.x,               other.y + other.height) or
           self:withinObject(other.x + other.width, other.y) or
           self:withinObject(other.x + other.width, other.y + other.height)
end

function GameObject:withinObject(x, y)
    return inBounds(self.x, self.x + self.width, x) and inBounds(self.y, self.y + self.height, y)
end
