function love.load()
  -- the height of a meter our worlds will be 64px
  love.physics.setMeter(64)
  -- create a world for the bodies to exist in with horizontal gravity
  -- of 0 and vertical gravity of 9.81
  world = love.physics.newWorld(0, 9.81*64, true)

  objects = {} -- table to hold all our physical objects

  -- let's create the ground
  objects.ground = {}
  -- remember, the shape (the rectangle we create next) anchors to the
  -- body from its center, so we have to move it to (650/2, 650-50/2)
  objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2)
  -- make a rectangle with a width of 650 and a height of 50
  objects.ground.shape = love.physics.newRectangleShape(650, 50)
  -- attach shape to body
  objects.ground.fixture = love.physics.newFixture(objects.ground.body,
                                                   objects.ground.shape)

  -- let's create a ball
  objects.ball = {}
  -- place the body in the center of the world and make it dynamic, so
  -- it can move around
  objects.ball.body = love.physics.newBody(world, 650/2, 650/2, "dynamic")
  -- the ball's shape has a radius of 20
  objects.ball.shape = love.physics.newCircleShape(20)
  -- Attach fixture to body and give it a density of 1.
  objects.ball.fixture = love.physics.newFixture(objects.ball.body,
                                                 objects.ball.shape, 1)
  objects.ball.fixture:setRestitution(0.9) -- let the ball bounce

  -- let's create a couple blocks to play around with
  objects.block1 = {}
  objects.block1.body = love.physics.newBody(world, 200, 550, "dynamic")
  objects.block1.shape = love.physics.newRectangleShape(0, 0, 50, 100)
  -- A higher density gives it more mass.
  objects.block1.fixture = love.physics.newFixture(objects.block1.body,
                                                   objects.block1.shape, 5)

  objects.block2 = {}
  objects.block2.body = love.physics.newBody(world, 200, 400, "dynamic")
  objects.block2.shape = love.physics.newRectangleShape(0, 0, 100, 50)
  objects.block2.fixture = love.physics.newFixture(objects.block2.body,
                                                   objects.block2.shape, 2)

  -- initial graphics setup
  -- set the background color to a nice blue
  love.graphics.setBackgroundColor(0.41, 0.53, 0.97)
  love.window.setMode(650, 650) -- set the window dimensions to 650 by 650
end


function love.update(dt)
  world:update(dt) -- this puts the world into motion

  -- here we are going to create some keyboard events
  -- press the right arrow key to push the ball to the right
  if love.keyboard.isDown("right") then
    objects.ball.body:applyForce(400, 0)
  -- press the left arrow key to push the ball to the left
  elseif love.keyboard.isDown("left") then
    objects.ball.body:applyForce(-400, 0)
  -- press the up arrow key to set the ball in the air
  elseif love.keyboard.isDown("up") then
    objects.ball.body:setPosition(650/2, 650/2)
    -- we must set the velocity to zero to prevent a potentially large
    -- velocity generated by the change in position
    objects.ball.body:setLinearVelocity(0, 0)
  end
end

function love.draw()
  -- set the drawing color to green for the ground
  love.graphics.setColor(0.28, 0.63, 0.05)
  -- draw a "filled in" polygon using the ground's coordinates
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(
                           objects.ground.shape:getPoints()))

  -- set the drawing color to red for the ball
  love.graphics.setColor(0.76, 0.18, 0.05)
  love.graphics.circle("fill", objects.ball.body:getX(),
                       objects.ball.body:getY(), objects.ball.shape:getRadius())

  -- set the drawing color to grey for the blocks
  love.graphics.setColor(0.20, 0.20, 0.20)
  love.graphics.polygon("fill", objects.block1.body:getWorldPoints(
                           objects.block1.shape:getPoints()))
  love.graphics.polygon("fill", objects.block2.body:getWorldPoints(
                           objects.block2.shape:getPoints()))
end