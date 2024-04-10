--[[
    This program draws an among us crewmate in rectangles that moves back and forth on the x axis
]]

--We declare variables at the top so they can be used in both update() and draw() functions
local x = 0 -- this is the x offset of the among us
local delta -- just taking the delta time value from update and storing it here

local isGoingRight = true -- controls direction of the among us


function love.load()
    -- love.window.setVsync(false)   Set vsync to false in case you don't want 60 fps limit
end


function love.update(dt)
    if x > 60 then
        isGoingRight = false
    end
    if x < 0 then
        isGoingRight = true
    end


    if isGoingRight then
        x = x + 1
    else
        x = x - 1
    end
    --The dt parameter equals the amount of time it takes for a frame in the game to finish
    delta = dt
end

-- love.graphics.setColor(red, green, blue, alpha) -- RGB values, the range goes from 0 to 1
-- love.graphics.rectangle('line' or 'fill', x value, y value, width, height)

function love.draw()
    -- This draws an among us
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle('fill', 200 + x, 200, 80, 100)
    love.graphics.rectangle('fill', 200 + x, 300, 30, 30)
    love.graphics.rectangle('fill', 250 + x, 300, 30, 30)
    love.graphics.rectangle('fill', 180 + x, 230, 20, 60)
    love.graphics.setColor(0, 1, 1)
    love.graphics.rectangle('fill', 230 + x, 230, 50, 30)


    love.graphics.print(1/delta) --1 divided by dt will return the FPS of the game
end

