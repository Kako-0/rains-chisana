local anim = require("arquivos/anim8")
player = {}
function player:load()
	player.x = 0
	player.y = height/1.15
	player.vel = 200
	player.w = 64
	player.h = 64
	player.hitbox = {h = (player.h+30), w = (player.w+20), x = (player.x+30), y = (player.y+10)}
	player.imagem = love.graphics.newImage("imagens/chisana.png")
	player.imagem2 = love.graphics.newImage("imagens/end.png")
	local g = anim.newGrid( 44, 54, player.imagem:getWidth(), player.imagem:getHeight(), 1 )--grid: (espaço do grid de cada imagem em x e y, tamanho total da img em x e y)
	--local g2 = anim.newGrid( 96, 96, player.imagem2:getWidth(), player.imagem2:getHeight(), 1 )
	player.anim = {}
	player.anim.SR = anim.newAnimation( g( '1-4', 1 ), 0.5 )--cria uma animação: (var grid(quants sprites, e a linha),(vel da animação))
	player.anim.R = anim.newAnimation( g( '1-4', 2 ), 0.5 )
	player.anim.L = anim.newAnimation( g( '1-4', 3 ), 0.5 )
	player.anim.SL = anim.newAnimation( g( '1-4', 4 ), 0.5 )
	--player.anim.death = anim.newAnimation( g2( '1-12', 1 ), 0.1,"pauseAtEnd")
	player.atual = player.anim.SR
end

function player:update(dt)
	player.atual:update(dt)
	--Não sair da tela
	if player.x<0 then
		player.x=0
	elseif player.x>width+440 then
		player.x=width+440
	end
	--Reseta a posição do player quando game over
	if bateu then
		player.x = 0
	end

	--Move o player
	if bateu==false then
		player.atual = player.anim.SR
		if love.keyboard.isDown("right") then
			player.x = player.x + player.vel * dt
			player.hitbox.x=player.x+30
			player.atual = player.anim.R
		elseif love.keyboard.isDown("left") then
			player.x = player.x - player.vel * dt
			player.hitbox.x=player.x+20
			player.atual = player.anim.L
		end
		function love.keyreleased(key)
   			if key == "right" then
    			player.atual = player.anim.SR
    		elseif key == "left" then
    			player.atual = player.anim.SL
    		end
		end
	--else
		--player.atual = player.anim.death
	end
end

function player:draw()
	if bateu==false then
	player.atual:draw(player.imagem, player.x, player.y, 0, 3, 3, 0, 0 )
	else
		player.atual:draw(player.imagem2, player.x, player.y, 0, 1, 1, 0, 0 )
	end

	--love.graphics.rectangle( "line", player.hitbox.x, player.hitbox.y, player.hitbox.w, player.hitbox.h )
end
