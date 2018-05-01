local button = require "Button"

s = {}
function s.load()
	local windowWidth = 0 -- defaulted width, initialize
	local windowHeight = 0 -- defaulted height, initialize
	local resNumber = _G.resolution
	local counter = _G.counter
	if(counter == 1) then
		local mBoxButtons = {"1680x1050", "1360x768", "Filler"}
		local pressedButton = love.window.showMessageBox("Elements & Anime Settings","Select desired game resolution:",mBoxButtons,"info",false)
		if pressedButton == 1 then
			windowWidth = 1680
			windowHeight = 1050
			_G.resolution = 1
			--1680/3 = 560px width per element orb, 1050/3 = 350px height per element orb so 297.33x297.33 is fine here
			--1.23529412 scale ratio to 1360
			--1.3671875 scale ratio to 768
		elseif pressedButton == 2 then
			windowWidth = 1360
			windowHeight = 768
			_G.resolution = 2
		elseif pressedButton == 3 then
			windowWidth = 1024
			windowHeight = 768
			_G.resolution = 3
		end
		--setting the size to 0,0 will set it to the complete size of your screen
		love.window.setMode(windowWidth,windowHeight,{resizable = true,vsync = false}) 
	end
	
	if resNumber == 1 then
		windowWidth = 1680
		windowHeight = 1050
		print("took values from 1680x1050")
	elseif resNumber == 2 then
		windowWidth = 1360
		windowHeight = 768
		print("took values from 1360x768")
	elseif resNumber == 3 then
		windowWidth = 1024
		windowHeight = 768
		print("took values from 1024x768")
	else
		print("Should only be printed upon execution of the game aka ONCE")
	end
	
	print(windowWidth)
	love.window.setMode(windowWidth,windowHeight,{resizable = true,vsync = false}) 
	-- Creates/Initializes the three buttons needed in the MainMenu
	buttons = {n=3}
	
	-- Main Menu Tile WxH of Element Orbs
	FireOrb, WaterOrb, TerraOrb, ElectricOrb, LightOrb, DarkOrb = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Filler Panel.png")
	if windowWidth == 1360 and windowHeight == 768 then -- use 243x243 images
		buttons[1] = button:new(windowWidth*0.5 - 90,(windowHeight*windowHeight*0.53/1050),180,80*windowHeight/1050,"Play")
		buttons[2] = button:new(windowWidth*0.5 - 90,(windowHeight*windowHeight*0.66/1050),180,80*windowHeight/1050,"Settings")
		buttons[3] = button:new(windowWidth*0.5 - 90,(windowHeight*windowHeight*0.79/1050),180,80*windowHeight/1050,"Quit Game")
		FireOrb = love.graphics.newImage("MainMenuImages/Res 1360x768/MainMenu - FireOrb [243x243].png")
		WaterOrb = love.graphics.newImage("MainMenuImages/Res 1360x768/MainMenu - WaterOrb [243x243].png")
		TerraOrb = love.graphics.newImage("MainMenuImages/Res 1360x768/MainMenu - TerraOrb [243x243].png")
		ElectricOrb = love.graphics.newImage("MainMenuImages/Res 1360x768/MainMenu - ElectricOrb [243x243].png")
		LightOrb = love.graphics.newImage("MainMenuImages/Res 1360x768/MainMenu - LightOrb [243x243].png")
		DarkOrb = love.graphics.newImage("MainMenuImages/Res 1360x768/MainMenu - DarkOrb [243x243].png")
	else
		buttons[1] = button:new(love.graphics.getWidth()*0.5 - 90,(windowHeight*windowHeight*0.38/1050),180,80*windowHeight/1050,"Play")
		buttons[2] = button:new(love.graphics.getWidth()*0.5 - 90,(windowHeight*windowHeight*0.48/1050),180,80*windowHeight/1050,"Settings")
		buttons[3] = button:new(love.graphics.getWidth()*0.5 - 90,(windowHeight*windowHeight*0.58/1050),180,80*windowHeight/1050,"Quit Game")
	end		
	
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
	
	--music = love.audio.newSource("MainMenuTrack.mp3") -- if "static" is omitted, LÖVE will stream the file from disk, good for longer music tracks
	--music:play()
	--music:setVolume(0.5)
end

function s.draw()
	if love.graphics.getWidth() >= 1670 and love.graphics.getWidth() <= 1690 then
		font3 = love.graphics.setNewFont("Brushy_Cre.ttf",64)
		love.graphics.draw(Tileset, Quads[1], 20, 20)
		love.graphics.draw(Tileset, Quads[2], love.graphics.getWidth()/2 - (TileW/2), 15)
		love.graphics.draw(Tileset, Quads[4], love.graphics.getWidth() -(892/3)-20, 20)
		love.graphics.draw(Tileset, Quads[5], 20, love.graphics.getHeight() - (892/3)-20)
		love.graphics.draw(Tileset, Quads[3], love.graphics.getWidth()/2 - (TileW/2), love.graphics.getHeight() - (892/3)-20)
		love.graphics.draw(Tileset, Quads[6], love.graphics.getWidth() - (892/3)-20, love.graphics.getHeight() - (892/3)-20)
	elseif love.graphics.getWidth() == 1360 and love.graphics.getHeight() == 768 then
		font3 = love.graphics.setNewFont("Brushy_Cre.ttf",44)
		love.graphics.draw(FireOrb, 20, 20)
		love.graphics.draw(WaterOrb, love.graphics.getWidth()/2 - (243/2), 15)
		love.graphics.draw(TerraOrb, love.graphics.getWidth()/2 - (243/2), love.graphics.getHeight() - 243 -20)
		love.graphics.draw(ElectricOrb, love.graphics.getWidth() - 243 -20, 20)
		love.graphics.draw(LightOrb, 20, love.graphics.getHeight() - 243 - 20)
		love.graphics.draw(DarkOrb, love.graphics.getWidth() - 243 - 20, love.graphics.getHeight() - 243 -20)
	end
	
	-- Functionality call from Button.lua
	buttons[1]:isHovered(buttons[1],love.mouse.getX(),love.mouse.getY())
	buttons[2]:isHovered(buttons[2],love.mouse.getX(),love.mouse.getY())
	buttons[3]:isHovered(buttons[3],love.mouse.getX(),love.mouse.getY())
	love.graphics.setFont(font3)
	if love.graphics.getWidth() >= 1670 and love.graphics.getWidth() <= 1690 then
		love.graphics.setColor(169,169,169,255) -- set to make font gray
		love.graphics.print("Elements & Anime v1.0",love.graphics.getWidth()/2 - (font3:getWidth("Elements & Anime v1.0")/2),300)
	elseif love.graphics.getWidth() == 1360 and love.graphics.getHeight() == 768 then
		love.graphics.setColor(169,169,169,255) -- set to make font gray
		love.graphics.print("Elements & Anime v1.0",love.graphics.getWidth()/2 - (font3:getWidth("Elements & Anime v1.0")/2),240)
	end
	love.graphics.setColor(255,255,255,255) -- reset font to white
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
	if w == 1360 and h == 768 then
		buttons[1] = button:new(w*0.5 - 90,h*h*0.53/1050,180,80*h/1050,"Play")
		buttons[2] = button:new(w*0.5 - 90,h*h*0.66/1050,180,80*h/1050,"Settings")
		buttons[3] = button:new(w*0.5 - 90,h*h*0.79/1050,180,80*h/1050,"Quit Game")
	else
		buttons[1] = button:new(w*0.5 - 90,h*h*0.38/1050,180,80*h/1050,"Play")
		buttons[2] = button:new(w*0.5 - 90,h*h*0.48/1050,180,80*h/1050,"Settings")
		buttons[3] = button:new(w*0.5 - 90,h*h*0.58/1050,180,80*h/1050,"Quit Game")
	end
end