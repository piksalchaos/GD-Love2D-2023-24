--[[
    This LOVE2D program will have two rectangles. One of the rectangle will move
    by WASD keys, and will print a message on the screen whenever it overlaps the
    other rectangle.
]]

-- just declaring variables above the load function so they can be accessed by
-- the other functions. If you don't, then the variables will be in the global
-- scope, which is a bad thing. 
local rect1
local rect2
local speed

function love.load()
    -- declaring tables representing the two rectangles
    rect1 = {
        x = 50,
        y = 50,
        width = 100,
        height = 100
    }
    
    rect2 = {
        x = 300,
        y = 300,
        width = 100,
        height  = 100
    }
    -- represents speed of rect1 in pixels a second
    speed = 120
end


function love.update(dt)
    if love.keyboard.isScancodeDown('a') then
        rect1.x = rect1.x - speed * dt
    end
    if love.keyboard.isScancodeDown('d') then
        rect1.x = rect1.x + speed * dt
    end
    if love.keyboard.isScancodeDown('s') then
        rect1.y = rect1.y + speed * dt
    end
    if love.keyboard.isScancodeDown('w') then
        rect1.y = rect1.y - speed * dt
    end
end



function love.draw()
    love.graphics.rectangle('line', rect1.x, rect1.y, rect1.width, rect1.height)
    love.graphics.rectangle('line', rect2.x, rect2.y, rect2.width, rect2.height)

    -- This if statement is stupidly long, but it basically checks if rect1 is
    -- overlapping rect2 using math 
    if rect1.x > rect2.x - rect1.width
    and rect1.x < rect2.x + rect2.width
    and rect1.y > rect2.y - rect1.height
    and rect1.y < rect2.y + rect2.height then
        love.graphics.print("OMG THEY'RE TOUCHING OMG")
    end
end

