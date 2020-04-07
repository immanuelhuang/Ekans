require 'Util'

Trainer = Class{}

local START = 1
local UP_1 = 2
local UP_2 = 3
local LEFT_1 = 5
local LEFT_2 = 6
local DOWN_1 = 8
local DOWN_2 = 9
local RIGHT_1 = 11
local RIGHT_2 = 12

TRAINER_ANIMATION = 0

local X = 12
local Y = 15

function Trainer:init(map)

    self.spritesheet = love.graphics.newImage('graphics/trainer.png')
    self.sprites = generateQuads(self.spritesheet, 32, 32)

    self.tileWidth = 32
    self.tileHeight = 32
    self.mapWidth = 20
    self.mapHeight = 20
    self.dx = -1
    self.dy = 0
    self.x = X
    self.y = Y

    self.mapWidthPixels = self.mapWidth * self.tileWidth 
    self.mapHeightPixels = self.mapHeight * self.tileHeight

    self.direction = 'up'
    self.sprite = self.sprites[START]

    self.timer = 0
 
end

function Trainer:update(dt)

    self.x = self.x + 1 * self.dx
    self.y = self.y + 1 * self.dy
    TRAINER_ANIMATION = TRAINER_ANIMATION + 1
    if TRAINER_ANIMATION == 2 then
        TRAINER_ANIMATION = 0
    end


    if self.direction == 'up' then
        self.sprite = self.sprites[UP_1 + TRAINER_ANIMATION]
    elseif self.direction == 'down' then
        self.sprite = self.sprites[DOWN_1 + TRAINER_ANIMATION]
    elseif self.direction == 'left' then
        self.sprite = self.sprites[LEFT_1 + TRAINER_ANIMATION]
    elseif self.direction == 'right' then
        self.sprite = self.sprites[RIGHT_1 + TRAINER_ANIMATION]
    end

end

function Trainer:render()
    
    love.graphics.draw(self.spritesheet, self.sprite, (self.y - 1) * self.tileWidth, (self.x - 1) * self.tileHeight)
    
end