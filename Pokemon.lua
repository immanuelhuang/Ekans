require 'Util'

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

    self.mapWidthPixels = self.mapWidth * self.tileWidth
    self.mapHeightPixels = self.mapHeight * self.tileHeight

end

function Pokemon:render()

    love.graphics.draw(self.spritesheet, self.sprites[1], (X - 1) * self.tileWidth, (Y - 1) * self.tileHeight)
    
end