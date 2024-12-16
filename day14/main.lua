love.graphics.setDefaultFilter("nearest", "nearest")

local santa = {}
local platforms = {}
local gravity = 800
local jumpHeight = -300

function love.load()
    love.window.setTitle("Santa Platformer")
    love.window.setMode(800, 600)

    santa.image = love.graphics.newImage("assets/santa.png")
    santa.x = 100
    santa.y = 400
    santa.width = santa.image:getWidth()
    santa.height = santa.image:getHeight()
    santa.dx = 0
    santa.dy = 0
    santa.grounded = false

    local ground = {x = 0, y = 550, width = 800, height = 50, image = love.graphics.newImage("assets/ground.png")}
    table.insert(platforms, ground)

    background = love.graphics.newImage("assets/background.png")
end

function love.update(dt)
    if not santa.grounded then
        santa.dy = santa.dy + gravity * dt
    end

    santa.x = santa.x + santa.dx * dt
    santa.y = santa.y + santa.dy * dt

    santa.grounded = false
    for _, platform in ipairs(platforms) do
        if santa.y + santa.height >= platform.y
            and santa.x + santa.width > platform.x
            and santa.x < platform.x + platform.width then
            santa.grounded = true
            santa.dy = 0
            santa.y = platform.y - santa.height
        end
    end

    santa.dx = 0
    if love.keyboard.isDown("left") then
        santa.dx = -200
    elseif love.keyboard.isDown("right") then
        santa.dx = 200
    end

    if love.keyboard.isDown("space") and santa.grounded then
        santa.dy = jumpHeight
        santa.grounded = false
    end
end

function love.draw()
    love.graphics.draw(background, 0, 0)

    love.graphics.draw(santa.image, santa.x, santa.y)

    for _, platform in ipairs(platforms) do
        love.graphics.draw(platform.image, platform.x, platform.y, 0, platform.width / platform.image:getWidth(), platform.height / platform.image:getHeight())
    end
end
