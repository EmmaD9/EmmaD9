--tutorial from challacade for starting game structure

function love.load()

    --global variable target is a circle
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 50

    score = 0
    timer = 0

end

function love.update(dt)
    --number = number + 1
end

function love.draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", target.x, target.y, target.radius)

    love.graphics.print(score, 0, 0)
end