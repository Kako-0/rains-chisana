gameover={}
function gameover:load( )
	quad2 = {}
	quad2.x = width/4
	quad2.y = 600
	quad2.w = 55
	quad2.h = 25
	point2={}
	point2.x=(width/1.15)-10
	point2.y=600
	point2.w=55
	point2.h=25
	imgGameOver = love.graphics.newImage("imagens/go.jpg")
end

function gameover:update(dt)

	--[[if love.keyboard.isDown("left") then
		point2.x=quad.x2.n1+5
		point2.w = 90
	elseif love.keyboard.isDown("right") then
		point2.x=quad.x2.n2-5
		point2.w=55	
	end]]
	if point2.y == quad2.y then
		if love.keyboard.isDown("return") then
			love.event.quit()
		end
	end
end

function gameover:draw()
		love.graphics.setColor(1,1,1)
		love.graphics.draw(imgGameOver,width/2, height/5)		
		love.graphics.setColor(1,1,1)
		love.graphics.setFont(fonte)
		love.graphics.print("Exit", width/1.15, quad2.y)

		--[[love.graphics.setColor(1,1,1)
		love.graphics.setFont(fonte)
		love.graphics.print("menu", width, quad.y2)]]

		love.graphics.rectangle("line",point2.x,point2.y,point2.w,point2.h)
		--love.graphics.rectangle("line",quad.x,quad.y.n2,quad.w,quad.h)
end