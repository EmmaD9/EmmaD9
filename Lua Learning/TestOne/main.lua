--tutorial from challacade for starting game structure

function love.load()

    --global variable target is a circle
    target = {}
    target.x = 650
    target.y = 100
    target.radius = 50

    score = 0
    timer = 0

    gameFont = love.graphics.newFont(40)

end

function love.update(dt)
    --number = number + 1
end

function love.draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", target.x, target.y, target.radius)

    love.graphics.setColor(1,1,1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 0, 0)
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 and distanceBetween(x, y, target.x, target.y) <= target.radius then
        score = score + 1
    end

    --or could do a nested if statement and create a local variable called mouseToTarget

end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end