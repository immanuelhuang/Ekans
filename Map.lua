Map = Class{}

GRASS = love.graphics.newImage("graphics/grass.png")

math.randomseed(os.time())

function Map:init()

    self.tileWidth = 16
    self.tileHeight = 16
    self.mapWidth = 10
    self.mapHeight = 10

    self.mapWidthPixels = self.mapWidth * self.tileWidth
    self.mapHeightPixels = self.mapHeight * self.tileHeight

    self.currPokemon = Pokemon(self)
    self.caughtPokemon = {}
    self.trainer = Trainer(self)
    
end

function Map:update(dt)
    self.trainer:update(dt)
    self.currPokemon:update(dt)
    for k, v in pairs(self.caughtPokemon) do
        v:update(dt)
    end
    if self.currPokemon.x == self.trainer.x and self.currPokemon.y == self.trainer.y then
        pokemon = self.currPokemon:clone()
        table.insert(self.caughtPokemon, pokemon)
        self.caughtPokemon[tablelength(self.caughtPokemon)].x = self.caughtPokemon[tablelength(self.caughtPokemon)].x + 1
        self.currPokemon.x = math.random(20)
        self.currPokemon.y = math.random(20)
    end
end


  
function Map:render()
    -- push:apply('start')
    -- for y = 1, self.mapHeight do
    --     for x = 1, self.mapWidth do
    --         love.graphics.draw(GRASS, (x - 1) * self.tileWidth, (y - 1) * self.tileHeight)
    --     end
    -- end
    -- push:apply('end')
    for k, v in pairs(self.caughtPokemon) do
        v.direction = self.trainer.direction
        if self.trainer.direction == 'up' then
            v.x = self.trainer.x + k
            v.y = self.trainer.y
        elseif self.trainer.direction == 'down' then
            v.x = self.trainer.x - k
            v.y = self.trainer.y
        elseif self.trainer.direction == 'right' then
            v.x = self.trainer.x
            v.y = self.trainer.y - k
        elseif self.trainer.direction == 'left' then
            v.x = self.trainer.x
            v.y = self.trainer.y + k
        end
        v:render()
    end
    self.currPokemon:render()
    self.trainer:render()    
end