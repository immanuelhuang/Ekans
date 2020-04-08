require 'Util'

local UP_1 = 14
local UP_2 = 15
local LEFT_1 = 6
local LEFT_2 = 7
local DOWN_1 = 2
local DOWN_2 = 3
local RIGHT_1 = 10
local RIGHT_2 = 11

Pokemon = Class{}

math.randomseed(os.time())

local X = math.random(10) 
local Y = math.random(20)
local pokeNum = math.random(810)

function Pokemon:init(map)

    self.spritesheet = love.graphics.newImage(string.format("graphics/pokemon/%03d.png", pokeNum))
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