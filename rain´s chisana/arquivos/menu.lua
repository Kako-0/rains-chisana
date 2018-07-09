local anim = require("arquivos/anim8")
menu={}
function menu:load()
	quad = {}
	quad.x = 395
	quad.y = {n1=395, n2=425}
	quad.w = 55
	quad.h = 25
	point={}
	point.x=width/1.25
	point.y=425
	point.w=55
	point.h=25
	imgFire = love.graphics.newImage("imagens/fr1.png")
	local g = anim.newGrid( 85, 101, imgFire:getWidth(), imgFire:getHeight(), 1 )
	fire = anim.newAnimation( g( '1-3', 1, '1-3', 2, '1-3', 3 ), 0.1 )
	state = "menu"
	transparencia = 0
end

function menu:update(dt )
	fire:update(dt)
	if love.keyboard.isDown("up") then
		point.y=395
	elseif love.keyboard.isDown("down") then
		point.y=425	
	end
	if point.y == quad.y.n2 then
		if love.keyboard.isDown("return") then
			love.event.quit()
		end
	elseif point.y == quad.y.n1 then
		if love.keyboard.isDown("return") then
			state = "Start"
			
		end
	end
end

function menu:draw()
		love.graphics.setColor(1,1,1)
		love.graphics.setFont(fonte)
		love.graphics.print("Start", width/1.25, 400)

		love.graphics.setColor(1,1,1)
		love.graphics.setFont(fonte)
		love.graphics.print("Quit", width/1.25, 430)

		love.graphics.setColor(1,1,1)
		love.graphics.setFont(fonte)
		love.graphics.print("Rain´s Chisana", width/2, 300, s0, 5, 5)

		fire:draw(imgFire, width/1.25, height/4, 0, 1, 1, 0, 0 )
		love.graphics.rectangle("line",point.x,point.y,point.w,point.h)
end