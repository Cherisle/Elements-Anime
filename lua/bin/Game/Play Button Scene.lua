require "scenery"
ui = require "loveui/ui"
local button = require "Button"

local context = ui.context()

s = {}
function s.load()
	love.window.setMode(0,0,{resizable = true,vsync = false}) 
	--setting the size to 0,0 will set it to the complete size of your screen
	
	font1 = love.graphics.setNewFont("Brushaff.otf",64)
end

function s.draw() 
	love.graphics.setFont(font1)
	love.graphics.print("You are on a new scene via Play Button",love.graphics.getWidth()/2 - (font1:getWidth("Elements & Anime")/2), 200)
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