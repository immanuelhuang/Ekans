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
    if self.currPokemon.x == self.trainer.x and self.currPokemon.y == self.trainer.y then
        pokemon = self.currPokemon:clone()
        table.insert(self.caughtPokemon, pokemon)
        self.caughtPokemon[tablelength(self.caughtPokemon)].x = self.caughtPokemon[tablelength(self.caughtPokemon)].x + 1
        self.currPokemon.x = math.random(20)
        self.currPokemon.y = math.random(20)
    end
end


  
function Map:render()
    push:apply('start')
    for y = 1, self.mapHeight do
        for x = 1, self.mapWidth do
            love.graphics.draw(GRASS, (x - 1) * self.tileWidth, (y - 1) * self.tileHeight)
        end
    end
    push:apply('end')
    self.currPokemon:render()
    self.trainer:render()    
end