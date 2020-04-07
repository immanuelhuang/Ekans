require 'Util'

local UP_1 = 7
local UP_2 = 8
local LEFT_1 = 3
local LEFT_2 = 4
local DOWN_1 = 1
local DOWN_2 = 2
local RIGHT_1 = 5
local RIGHT_2 = 6

Pokemon = Class{}

math.randomseed(os.time() + 2)

local X = math.random(10) 
local Y = math.random(20)

function Pokemon:init(map)

    self.spritesheet = love.graphics.newImage('graphics/pokemon.png')
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

    self.sprite = self.sprites[DOWN_1]

    self.timer = 0

    self.direction = 'down'
    self.animation = 0
end

function Pokemon:update(dt)
    self.x = self.x + 1 * self.dx
    self.y = self.y + 1 * self.dy
    self.animation = self.animation + 1
    if self.animation == 2 then
        self.animation = 0
    end

    if self.direction == 'up' then
        self.sprite = self.sprites[UP_1 + self.animation]
    elseif self.direction == 'down' then
        self.sprite = self.sprites[DOWN_1 + self.animation]
    elseif self.direction == 'left' then
        self.sprite = self.sprites[LEFT_1 + self.animation]
    elseif self.direction == 'right' then
        self.sprite = self.sprites[RIGHT_1 + self.animation]
    end

end

function Pokemon:render()

    love.graphics.draw(self.spritesheet, self.sprite, (self.y - 1) * self.tileWidth, (self.x - 1) * self.tileHeight)
    
end