require "scenery"
ui = require "loveui/ui"
local PlayerGUI = require "PlayerGUI"
local Player = require "Player"
local context = ui.context()

s = {}
function s.load()
	love.window.setMode(0,0,{resizable = true,vsync = false}) 
	--setting the size to 0,0 will set it to the complete size of your screen
	Players = {n=6}
	Players[1] = Player:new("Team 1",0,0)
	Players[2] = Player:new("Team 2",0,0)
	Players[3] = Player:new("Team 3",0,0)
	Players[4] = Player:new("Team 4",0,0)
	Players[5] = Player:new("Team 5",0,0)
	Players[6] = Player:new("Team 6",0,0)
	PlayerGUIs = {n=6}
	PlayerGUIs[1] = PlayerGUI:new(50,50,250,250,Players[1]:getLabel(Players[1]))
	PlayerGUIs[2] = PlayerGUI:new(love.graphics.getWidth() - 300,50,250,250,Players[2]:getLabel(Players[2]))
	PlayerGUIs[3] = PlayerGUI:new(50,350,250,250,Players[3]:getLabel(Players[3]))
	PlayerGUIs[4] = PlayerGUI:new(love.graphics.getWidth() - 300,350,250,250,Players[4]:getLabel(Players[4]))
	PlayerGUIs[5] = PlayerGUI:new(50,650,250,250,Players[5]:getLabel(Players[5]))
	PlayerGUIs[6] = PlayerGUI:new(love.graphics.getWidth() - 300,650,250,250,Players[6]:getLabel(Players[6]))
	--BG = love.graphics.newImage("Beachstorm.jpg")
	Nrml = love.graphics.newImage("Panels/General/Normal Panel.png")
	MoBo = love.graphics.newImage("Panels/General/Movement Boost Panel.png")
	DrwP = love.graphics.newImage("Panels/General/Draw Panel.png")
	FuSa = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Sand-Full.png")
	SULw = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandUL WaterBR.png")
	SBLw = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandBL WaterUR.png")
	SURw = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandUR WaterBL.png")
	SBRw = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandBR WaterUL.png")
	WtrP = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water Panel.png")
	WWUL = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveUL.png")
	WWUR = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveUR.png")
	WWBL = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveBL.png")
	WWBR = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveBR.png")
	Fllr = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Filler Panel.png")
	
	TileW, TileH = 60,60
	
	TileTable =
	{
     { FuSa,FuSa,FuSa,Fllr,DrwP,Nrml,Nrml,Nrml,Nrml,Nrml,Nrml,Fllr,FuSa,FuSa,FuSa },
     { FuSa,FuSa,Fllr,Nrml,FuSa,FuSa,FuSa,FuSa,FuSa,FuSa,FuSa,Nrml,Fllr,FuSa,FuSa },
     { FuSa,Fllr,Nrml,FuSa,SULw,WtrP,WtrP,WtrP,WtrP,WtrP,SURw,Fllr,Nrml,Fllr,FuSa },
     { Fllr,Nrml,FuSa,SULw,WWUL,WtrP,WtrP,WtrP,WtrP,WtrP,WWUR,SURw,Fllr,Nrml,Fllr },
     { DrwP,FuSa,SULw,WWUL,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WWUR,SURw,Fllr,Nrml },
     { Nrml,SULw,WWUL,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WWUR,SURw,Nrml },
     { Nrml,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Nrml },
     { Nrml,DrwP,Nrml,Nrml,Nrml,Nrml,MoBo,Nrml,MoBo,Nrml,Nrml,Nrml,Nrml,DrwP,Nrml },
     { Nrml,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Fllr,Nrml },           
     { Nrml,SBLw,WWBL,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WWBR,SBRw,Nrml },
     { Nrml,Fllr,SBLw,WWBL,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WtrP,WWBR,SBRw,Fllr,DrwP },
     { Fllr,Nrml,Fllr,SBLw,WWBL,WtrP,WtrP,WtrP,WtrP,WtrP,WWBR,SBRw,Fllr,Nrml,Fllr },
     { FuSa,Fllr,MoBo,Fllr,SBLw,WtrP,WtrP,WtrP,WtrP,WtrP,SBRw,Fllr,MoBo,Fllr,FuSa },
     { FuSa,FuSa,Fllr,Nrml,Fllr,FuSa,FuSa,FuSa,FuSa,FuSa,Fllr,Nrml,Fllr,FuSa,FuSa },
     { FuSa,FuSa,FuSa,Fllr,Nrml,DrwP,Nrml,Nrml,DrwP,Nrml,Nrml,Fllr,FuSa,FuSa,FuSa }
	}
	font1 = love.graphics.setNewFont("Brushaff.otf",64)
end

function s.draw() 
	--love.graphics.draw(BG, love.graphics.getWidth()/2 - 450, love.graphics.getHeight()/2 - 450)
	for rowIndex=1, #TileTable do
		local row = TileTable[rowIndex]
		for columnIndex=1, #row do
			local identifier = row[columnIndex]
			local x = love.graphics.getWidth()/2 - 450 + (columnIndex-1)*TileW
			local y = love.graphics.getHeight()/2 - 450 + (rowIndex-1)*TileH
			love.graphics.draw(identifier, x, y)
		end
	end
	PlayerGUIs[1]:isHovered(PlayerGUIs[1],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[2]:isHovered(PlayerGUIs[2],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[3]:isHovered(PlayerGUIs[3],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[4]:isHovered(PlayerGUIs[4],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[5]:isHovered(PlayerGUIs[5],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[6]:isHovered(PlayerGUIs[6],love.mouse.getX(),love.mouse.getY())
end

function s.update(dt)
	collectgarbage()
end

function love.mousepressed(x, y, button)
	if button == 2 then
		scenery.load("MainMenu")
    end
end

function love.resize(w,h)

end