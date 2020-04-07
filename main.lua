push = require 'push'
Class = require 'class'

require 'Map'
require 'Pokemon'
require 'Trainer'

WINDOW_WIDTH = 640
WINDOW_HEIGHT = 640

VIRTUAL_WIDTH = 160
VIRTUAL_HEIGHT = 160


math.randomseed(os.time())


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Ekans')
    map = Map()
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false
    })

    largeFont = love.graphics.newFont('pokemon_font.ttf', 16)
    smallFont = love.graphics.newFont('regular_font.ttf', 8)

    gameState = 'start'
end

function love.update(dt)
    if gameState == 'play' then
        map:update(dt)
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if gameState == 'play' or gameState == 'start' then
        if key == 'up' then
            if map.trainer.direction ~= 'down' then
                gameState = 'play'
                map.trainer.dx = -1
                map.trainer.dy = 0
                map.trainer.direction = 'up'
                TRAINER_ANIMATION = 0
            end
        elseif key == 'down' then
            if map.trainer.direction ~= 'up' then
                gameState = 'play'
                map.trainer.dx = 1
                map.trainer.dy = 0
                map.trainer.direction = 'down'
                TRAINER_ANIMATION = 0
            end
        elseif key == 'left' then
            if map.trainer.direction ~= 'right' then
                gameState = 'play'
                map.trainer.dy = -1
                map.trainer.dx = 0
                map.trainer.direction = 'left'
                TRAINER_ANIMATION = 0
            end
        elseif key == 'right' then
            if map.trainer.direction ~= 'left' then
                gameState = 'play'
                map.trainer.dy = 1
                map.trainer.dx = 0
                map.trainer.direction = 'right'
                TRAINER_ANIMATION = 0
            end
        end
    elseif gameState == 'end' then
        if key == 'space' then
            love.load()
        end
    end
    
end

function love.draw()        
    love.graphics.clear(78/255, 153/255, 43/255, 255/255)
    -- love.graphics.clear(0/255, 0/255, 0/255, 255/255)

    map:render()
    push:apply('start')
    if gameState == 'start' then
        love.graphics.setFont(largeFont)
        love.graphics.printf({{255, 255, 0, 255}, 'EKANS'}, 0, 10, VIRTUAL_WIDTH, 'center')
    elseif gameState == 'end' then
        love.graphics.setFont(largeFont)
        love.graphics.printf({{255, 255, 0, 255}, 'GAME OVER'}, 0, 10, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(smallFont)
        love.graphics.printf({{255, 255, 0, 255}, 'SPACE TO RESTART'}, 0, 50, VIRTUAL_WIDTH, 'center')
    end

    push:apply('end')
end
