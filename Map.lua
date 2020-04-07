Map = Class{}

function Map:init()

    self.tileWidth = 16
    self.tileHeight = 16
    self.mapWidth = 10
    self.mapHeight = 10

    self.mapWidthPixels = self.mapWidth * self.tileWidth
    self.mapHeightPixels = self.mapHeight * self.tileHeight

    self.pokemon = Pokemon(self)
    self.trainer = Trainer(self)
end

function Map:update(dt)
    self.trainer:update(dt)
end

function Map:render()
    -- push:apply('start')
    -- local grass = love.graphics.newImage("graphics/grass.png")

    -- for y = 1, self.mapHeight do
    --     for x = 1, self.mapWidth do
    --         love.graphics.draw(grass, (x - 1) * self.tileWidth, (y - 1) * self.tileHeight)
    --     end
    -- end
    -- push:apply('end')

    self.pokemon:render()
    self.trainer:render()
    love.graphics.print(self.trainer.x, 0, 10)
    love.graphics.print(self.pokemon.x, 0, 20)
    if self.pokemon.x == self.trainer.x and self.pokemon.y == self.trainer.y then
        love.graphics.print("COLLIDED!!!", 50, 50)
    end

end