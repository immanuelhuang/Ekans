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
end

function love.update(dt)
    map:update(dt)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'up' then
        map.trainer.dx = -1
        map.trainer.dy = 0
    elseif key == 'down' then
        map.trainer.dx = 1
        map.trainer.dy = 0
    elseif key == 'left' then
        map.trainer.dy = -1
        map.trainer.dx = 0
    elseif key == 'right' then
        map.trainer.dy = 1
        map.trainer.dx = 0
    end
end

function love.draw()
    love.graphics.clear(97/255, 138/255, 61/255, 255/255)
    map:render()
end
