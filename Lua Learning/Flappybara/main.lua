-- Main Lua file for Capybara Flappy Bird game

local capy
local capySpeed = 200 -- Speed at which the capybara falls
local capyJump = -300 -- Upward velocity when the capybara "jumps"
local gravity = 500 -- Gravity force pulling the capybara down

function love.load()
    -- Load the capybara image
    capy = love.graphics.newImage("assets/capybara.png")

    -- Initialize capybara position and velocity
    capyX, capyY = 100, 200
    capyVelocityY = 0

    -- Set up game parameters
    score = 0
    isGameOver = false

    -- Load the game font
    gameFont = love.graphics.newFont(40)
end

function love.update(dt)
    if not isGameOver then
        -- Update the capybara's vertical position
        capyVelocityY = capyVelocityY + gravity * dt
        capyY = capyY + capyVelocityY * dt

        -- Check if the capybara falls below the screen
        if capyY > love.graphics.getHeight() then
            isGameOver = true
        end

        -- Make the capybara jump when the spacebar is pressed
        if love.keyboard.isDown("space") then
            capyVelocityY = capyJump
        end
    end
end

function love.draw()
    -- Draw the capybara
    love.graphics.draw(capy, capyX, capyY, 0, 0.15, 0.15)

    -- Draw the score
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 10, 10)

    -- Show "Game Over" if the game is over
    if isGameOver then
        love.graphics.printf("Game Over", 0, love.graphics.getHeight()/2 - 20, love.graphics.getWidth(), "center")
    end
end

function love.keypressed(key)
    -- Reset the game when the enter key is pressed
    if key == "return" and isGameOver then
        capyY = 200
        capyVelocityY = 0
        score = 0
        isGameOver = false
    end
end
