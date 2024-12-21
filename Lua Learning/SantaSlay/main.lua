-- Main lua file for Santa Slay game

local image

function love.load()
    image = love.graphics.newImage("assets/images/santa.png")
end

function love.update(dt)
    -- Add your update logic here
end

function love.draw()
    love.graphics.draw(image, 0, 0, 0.15, 0.15)
end
