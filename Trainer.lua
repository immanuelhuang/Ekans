require 'Util'

Trainer = Class{}

TRAINER_SPEED = 0.1

math.randomseed(os.time())

local X = math.random(11, 20) 
local Y = math.random(20)

function Trainer:init(map)

    self.spritesheet = love.graphics.newImage('graphics/trainer.png')
    self.sprites = generateQuads(self.spritesheet, 32, 32)

    self.tileWidth = 32
    self.tileHeight = 32
    self.mapWidth = 20
    self.mapHeight = 20
    self.dx = 0
    self.dy = 0
    self.x = X
    self.y = Y

    self.mapWidthPixels = self.mapWidth * self.tileWidth 
    self.mapHeightPixels = self.mapHeight * self.tileHeight

    self.direction = 'left'

    self.timer = 0
 
end

function Trainer:update(dt)
    if self.timer % 15 == 0 then
        self.timer = self.timer - 15
        self.x = self.x + 1 * self.dx
        self.y = self.y + 1 * self.dy
    end
    self.timer = self.timer + 1
end

function Trainer:render()
    
    love.graphics.draw(self.spritesheet, self.sprites[1], (self.y - 1) * self.tileWidth, (self.x - 1) * self.tileHeight)
    
end