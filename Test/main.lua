function love.load()
    button = {}
    button.x = 200
    button.y = 100
    button.size = 50

    score = 0
    timer = 0

    myFont = love.graphics.newFont(40)
    gameover = false

    button.image = love.graphics.newImage("Button.png")
    button.scale = (button.size * 2) / button.image:getWidth()
end

function love.update()

end

function love.draw()
    if gameover == false then
        -- love.graphics.setColor(1, 0.1, 0.2)
        -- love.graphics.circle("fill", button.x, button.y, button.size)
        love.graphics.draw(button.image,button.x,button.y,0,button.scale,button.scale,button.image:getWidth() / 2,button.image:getHeight() / 2)

        love.graphics.setFont(myFont)
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("Score: " .. score, 0, 10, love.graphics.getWidth(), "center")
    else
       love.graphics.printf("Game Over", 0, love.graphics.getHeight() / 2 - 40, love.graphics.getWidth(), "center") 
        love.graphics.printf("Final Score: " .. score, 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), "center")
    end
end

function love.mousepressed(x, y, b, istouch)
    if b == 1 then
        if distance(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
            score = score + 1
            button.x = math.random(button.size, love.graphics.getWidth() - button.size)
            button.y = math.random(button.size + 35, love.graphics.getHeight() - button.size)

            math.random(0, 200)
         else
        gameover = true
        end
    end
end

function distance(x1, y1, x2, y2)
    return math.sqrt((y2 - y1) ^ 2 + (x2 - x1) ^ 2)
end

