ui = require "loveui/ui"
local button = require "Button"

local context = ui.context()

function love.load()
	love.window.setMode(0,0,{resizable = true,vsync = false}) 
	--setting the size to 0,0 will set it to the complete size of your screen
	buttons = {n=3}
	buttons[1] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.3,180,80,"Play")
	buttons[2] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.5,180,80,"Settings")
	buttons[3] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.7,180,80,"Quit Game")
	background = love.graphics.newImage("NagiAsuBG.jpg")
	TileW, TileH = 33,33
	Tileset = love.graphics.newImage("Elements.jpg")
	local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
	Quads = 
	{
		love.graphics.newQuad(199, 11,TileW, TileH, tilesetW, tilesetH), -- 1 = Earth Glow
		love.graphics.newQuad(32,  0, TileW, TileH, tilesetW, tilesetH), -- 2 = box
		love.graphics.newQuad(0,  32, TileW, TileH, tilesetW, tilesetH), -- 3 = flowers
		love.graphics.newQuad(32, 32, TileW, TileH, tilesetW, tilesetH)  -- 4 = boxtop
	}
end

function love.draw() 
	--love.graphics.draw(background,0,0)
	buttons[1]:draw(buttons[1])
	buttons[2]:draw(buttons[2])
	buttons[3]:draw(buttons[3])
	--love.graphics.draw(Tileset, Quads[1], 100, 100)
end

function love.update()
	collectgarbage()
end

function love.mousepressed(x, y, button)
    if button == 1 then
		for buttonCount = 1, 3 do
			buttons[buttonCount]:clickedEvent(buttons[buttonCount],x,y)
		end
    end
end

function love.resize(w,h)
	love.graphics.clear()
	for buttonCount = 1, 3 do 
		buttons[buttonCount]:setWidth(buttons[buttonCount],w)
		buttons[buttonCount]:setHeight(buttons[buttonCount],h)		
	end
	buttons[1] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.4,180,80,"Play")
	buttons[2] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.6,180,80,"Settings")
	buttons[3] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.8,180,80,"Quit Game")
end