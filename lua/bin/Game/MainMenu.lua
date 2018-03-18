ui = require "loveui/ui"
local button = require "Button"

local context = ui.context()

s = {}
function s.load()
	love.window.setMode(0,0,{resizable = true,vsync = false}) 
	--setting the size to 0,0 will set it to the complete size of your screen
	
	-- Creates/Initializes the three buttons needed in the MainMenu
	buttons = {n=3}
	buttons[1] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.380,180,80,"Play")
	buttons[2] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.480,180,80,"Settings")
	buttons[3] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.580,180,80,"Quit Game")
	
	-- Tile Width/Height of the Element Orbs, taken from one picture Tileset, cut into 6 quads
	TileW, TileH = 300,300
	Tileset = love.graphics.newImage("Elements FWTELD.png")
	local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
	Quads = 
	{
		love.graphics.newQuad(0, 0, TileW, TileH, tilesetW, tilesetH), -- 1 = Fire Orb
		love.graphics.newQuad(300, 0, TileW, TileH, tilesetW, tilesetH), -- 2 = Water Orb
		love.graphics.newQuad(600, 0, TileW, TileH, tilesetW, tilesetH), -- 3 = Terra Orb
		love.graphics.newQuad(0, 300, TileW, TileH, tilesetW, tilesetH),  -- 4 = Electric Orb
		love.graphics.newQuad(300, 300, TileW, TileH, tilesetW, tilesetH), -- 5 = Light Orb
		love.graphics.newQuad(600, 300, TileW, TileH, tilesetW, tilesetH)  -- 6 = Dark Orb
	}
	
	-- Loads the necessary fonts we intend to use within this scene
	font1 = love.graphics.setNewFont("Brushaff.otf",64)
	font2 = love.graphics.setNewFont("Etchas Italic.otf",64)
	font3 = love.graphics.setNewFont("Brushy_Cre.ttf",64)
	-- Amtrash removed as a font choice
	-- PhoneStreak removed as a font choice
	
	music = love.audio.newSource("MainMenuTrack.mp3") -- if "static" is omitted, LÖVE will stream the file from disk, good for longer music tracks
	music:play()
end

function s.draw() 
	love.graphics.draw(Tileset, Quads[1], 20, 20)
	love.graphics.draw(Tileset, Quads[2], love.graphics.getWidth()/2 - (TileW/2), 15)
	love.graphics.draw(Tileset, Quads[4], love.graphics.getWidth() - 320, 20)
	love.graphics.draw(Tileset, Quads[5], 20, love.graphics.getHeight() - 320)
	love.graphics.draw(Tileset, Quads[3], love.graphics.getWidth()/2 - (TileW/2), love.graphics.getHeight() - 320)
	love.graphics.draw(Tileset, Quads[6], love.graphics.getWidth() - 320, love.graphics.getHeight() - 320)
	
	-- Functionality call from Button.lua
	buttons[1]:isHovered(buttons[1],love.mouse.getX(),love.mouse.getY())
	buttons[2]:isHovered(buttons[2],love.mouse.getX(),love.mouse.getY())
	buttons[3]:isHovered(buttons[3],love.mouse.getX(),love.mouse.getY())
	
	--love.graphics.setFont(font1)
	--love.graphics.print("Elements & Anime",love.graphics.getWidth()/2 - (font1:getWidth("Elements & Anime")/2), 100)
	--love.graphics.setFont(font2)
	--love.graphics.print("Elements & Anime",love.graphics.getWidth()/2 - (font2:getWidth("Elements & Anime")/2), 200)
	love.graphics.setFont(font3)
	love.graphics.setColor(169,169,169,255)
	love.graphics.print("Elements & Anime v1.0",love.graphics.getWidth()/2 - (font3:getWidth("Elements & Anime v1.0")/2), 300)
	love.graphics.setColor(255,255,255,255)
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
	buttons[1] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.380,180,80,"Play")
	buttons[2] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.480,180,80,"Settings")
	buttons[3] = button:new(love.graphics.getWidth()*0.5 - 90,love.graphics.getHeight()*0.580,180,80,"Quit Game")
end