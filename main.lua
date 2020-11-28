require("litterfactory")
require("gameobject")
table = require('table')

timeSinceLastSpawn = 0

holding = nil
score = 0
threshold = 1.15
gameOver = false

function love.load()
    love.window.setTitle('Put Litter in Its Place')
    math.randomseed(os.time())
    love.window.setMode(1344, 768)
    trashCan = GameObject:new(495, 425, 130, 137, love.graphics.newImage("gfx/trash_can.png"))
    trashPerson = love.graphics.newImage("gfx/litter_guy.png")
    litter = {}
    table.insert(litter, 1, createLitter())
    love.graphics.setBackgroundColor(108/255, 137/255, 167/255)
    font = love.graphics.newFont(25)
    love.graphics.setFont(font)
end


function love.draw()
    trashCan:draw()
    love.graphics.draw(trashPerson, 545, 200)

    for i = 1, #litter do
        litter[i]:draw()
    end
    if not gameOver then 
        love.graphics.print("Don't let the litter touch the ground!\nLitter put in its place: " .. score, 100, 600)
    else
        love.graphics.print("Your score was: " .. score, 100, 600)
    end
end


function love.update(delta)
    if not gameOver then
        timeSinceLastSpawn = timeSinceLastSpawn + delta

        if timeSinceLastSpawn > threshold then
            table.insert(litter, 1, createLitter())
            timeSinceLastSpawn = 0
        end

        for i = 1, #litter do
            litter[i]:update(delta)
        end
    end
    if gameOver then
        litter = {}
    end

end

function love.mousepressed(x, y)
    if not gameOver then
        for i = 1, #litter do
            local grabbed = litter[i]:grab(x, y)
            if grabbed then holding = litter[i] end
        end
    end
end

function love.mousereleased(x, y)
    if not gameOver then
        if holding then
            holding.grabbed = false
            local holding_position = -1
            if trashCan:overlaps(holding) then 
                for i = 1, #litter do
                    if holding == litter[i] then holding_position = i end
                end
            end
            holding = nil
            table.remove(litter, holding_position)
            score = score + 1
        end
    end
end

function love.mousemoved(x, y, dx, dy)
    if not gameOver then
        if holding then
            holding:move(dx, dy)
        end
    end
end

