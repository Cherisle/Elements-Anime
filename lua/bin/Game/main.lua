require "scenery"
_G.counter = 1

function love.load()
	scenery.load("MainMenu")
end

function love.update(dt)
	scenery.scene.update(dt)
end

function love.draw()
	scenery.scene.draw()
end