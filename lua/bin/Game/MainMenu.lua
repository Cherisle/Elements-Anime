ui = require "loveui/ui"
local button = require "Button"

local context = ui.context()

s = {}
function s.load()
	love.window.setMode(0,0,{resizable = true,vsync = false}) 
	--setting the size to 0,0 will set it to the complete size of your screen
	buttons = {n=3}
	buttons[1] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.3,180,80,"Play")
	buttons[2] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.5,180,80,"Settings")
	buttons[3] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.7,180,80,"Quit Game")
	
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
	
	font1 = love.graphics.setNewFont("Brushaff.otf",64)
	font2 = love.graphics.setNewFont("Etchas Italic.otf",64)
	font3 = love.graphics.setNewFont("Brushy_Cre.ttf",64)
	-- Amtrash removed as a font choice
	-- PhoneStreak removed as a font choice
	
	music = love.audio.newSource("We Go Back.mp3") -- if "static" is omitted, LÖVE will stream the file from disk, good for longer music tracks
	music:play()
end

function s.draw() 
	--love.graphics.draw(background,0,0)
	buttons[1]:isHovered(buttons[1],love.mouse.getX(),love.mouse.getY())
	buttons[2]:isHovered(buttons[2],love.mouse.getX(),love.mouse.getY())
	buttons[3]:isHovered(buttons[3],love.mouse.getX(),love.mouse.getY())
	--love.graphics.draw(Tileset, Quads[1], 100, 100)
	love.graphics.setFont(font1)
	love.graphics.print("Elements & Anime",love.graphics.getWidth()/2 - (font1:getWidth("Elements & Anime")/2), 50)
	love.graphics.setFont(font2)
	love.graphics.print("Elements & Anime",love.graphics.getWidth()/2 - (font2:getWidth("Elements & Anime")/2), 125)
	love.graphics.setFont(font3)
	love.graphics.print("Elements & Anime",love.graphics.getWidth()/2 - (font3:getWidth("Elements & Anime")/2), 225)
end

function s.update(dt)
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