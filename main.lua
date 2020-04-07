push = require 'push'
Class = require 'class'

require 'Map'
require 'Pokemon'
require 'Trainer'

WINDOW_WIDTH = 640
WINDOW_HEIGHT = 640

VIRTUAL_WIDTH = 160
VIRTUAL_HEIGHT = 160

map = Map()


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Arbok')
    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false
    })

    largeFont = love.graphics.newFont('font.ttf', 16)

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
    if key == 'up' then
        gameState = 'play'
        map.trainer.dx = -1
        map.trainer.dy = 0
        map.trainer.direction = 'up'
        TRAINER_ANIMATION = 0
    elseif key == 'down' then
        gameState = 'play'
        map.trainer.dx = 1
        map.trainer.dy = 0
        map.trainer.direction = 'down'
        TRAINER_ANIMATION = 0
    elseif key == 'left' then
        gameState = 'play'
        map.trainer.dy = -1
        map.trainer.dx = 0
        map.trainer.direction = 'left'
        TRAINER_ANIMATION = 0
    elseif key == 'right' then
        gameState = 'play'
        map.trainer.dy = 1
        map.trainer.dx = 0
        map.trainer.direction = 'right'
        TRAINER_ANIMATION = 0
    end
    
end

function love.draw()        
    love.graphics.clear(78/255, 153/255, 43/255, 255/255)
    map:render()
    push:apply('start')
    if gameState == 'start' then
        love.graphics.setFont(largeFont)
        love.graphics.printf({{255, 255, 0, 255}, 'ARBOK'}, 0, 10, VIRTUAL_WIDTH, 'center')
    end
    push:apply('end')
end
