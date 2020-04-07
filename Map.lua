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
    self.timer = 0
    
end

function Map:update(dt)
    local pokeNum = math.random(810)
    if self.timer % 10 == 0 then
        self.timer = self.timer - 10
        local tempX = self.trainer.x
        local tempY = self.trainer.y

        self.trainer:update(dt)
        self.currPokemon:update(dt)
        for k, v in pairs(self.caughtPokemon) do
            v:update(dt)
        end

        for k, v in pairs(self.caughtPokemon) do
            if v.x == self.trainer.x and v.y == self.trainer.y then
                gameState = 'end'
            end
        end

        if self.currPokemon.x == self.trainer.x and self.currPokemon.y == self.trainer.y then
            pokemon = self.currPokemon:clone()
            table.insert(self.caughtPokemon, tablelength(self.caughtPokemon) + 1, pokemon)
            self.caughtPokemon[tablelength(self.caughtPokemon)].x = tempX
            self.caughtPokemon[tablelength(self.caughtPokemon)].y = tempY
            table.insert(self.caughtPokemon, 1, table.remove(self.caughtPokemon, tablelength(self.caughtPokemon)))
            self.currPokemon.x = math.random(20)
            self.currPokemon.y = math.random(20)
            self.currPokemon.spritesheet = love.graphics.newImage(string.format("graphics/pokemon/%03d.png", pokeNum))
        elseif tablelength(self.caughtPokemon) ~= 0 then
            self.caughtPokemon[tablelength(self.caughtPokemon)].x = tempX
            self.caughtPokemon[tablelength(self.caughtPokemon)].y = tempY
            table.insert(self.caughtPokemon, 1, table.remove(self.caughtPokemon, tablelength(self.caughtPokemon)))
        end
        
    end
    self.timer = self.timer + 1
end


  
function Map:render()
    push:apply('start')
    for y = 1, self.mapHeight do
        for x = 1, self.mapWidth do
            love.graphics.draw(GRASS, (x - 1) * self.tileWidth, (y - 1) * self.tileHeight)
        end
    end
    push:apply('end')

    for k, v in pairs(self.caughtPokemon) do
        
        v:render()

    end

    self.currPokemon:render()
    self.trainer:render()    
end