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
 
end

function Trainer:update(dt)
        self.x = self.x + self.dx * dt * self.tileHeight * TRAINER_SPEED
        self.y = self.y + self.dy * dt * self.tileWidth * TRAINER_SPEED
end

function Trainer:render()
    
    love.graphics.draw(self.spritesheet, self.sprites[1], (self.y - 1) * self.tileWidth, (self.x - 1) * self.tileHeight)
    
end