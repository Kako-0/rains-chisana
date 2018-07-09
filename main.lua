require("arquivos/menu")
require("arquivos/game")
require("arquivos/cenario")
require("arquivos/player")
require("arquivos/gota")
require("arquivos/gameover")

width = love.graphics.getWidth()
height = love.graphics.getHeight()

function love.load()
	love.window.setFullscreen(true)
	
	fonte = love.graphics.newImageFont("imagens/Fonte.png", " abcdefghijklmnopqrstuvwxyz".."ABCDEFGHIJKLMNOPQRSTUVWXYZ0".."123456789.,!?-+/():;%&`'*#=[]\"")
	
	
	menu:load()
	
	game:load()
end

function love.update(dt)

	if state=="menu" then
		menu:update(dt)
	end
	if state=="Start" then
		game:update(dt)
		pingouAqui()
		love.audio.play(rain)
	end
	if state=="gameover" then
		gameover:update(dt)
		love.audio.pause(rain)
		somgg:play()
	end

end

function love.draw()
	if state=="menu" then
		menu.draw()
	end
	if state=="Start" then
		game:draw()
	end
	if state=="gameover" then
		gameover:draw()
	end
end 

function pingouAqui()
	for i,gotas in pairs(chuva) do
		if chegapingo(gotas.x,gotas.y,imgGota:getWidth(),imgGota:getHeight(), player.hitbox.x, player.hitbox.y, player.hitbox.w, player.hitbox.h) then
			bateu = true
		end
	end
end

function chegapingo(x1,y1,w1,h1,x2,y2,w2,h2)
	return x1<x2+w2 and x2<x1+w1 and y1<y2+h2 and y2<y1+h1
end