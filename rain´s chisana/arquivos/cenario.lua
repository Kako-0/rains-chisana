cenario={}
function cenario:load( )
	fundo = love.graphics.newImage("imagens/ce1.png")
	ground={}
	ground.x = 0
	ground.y = height/1.38
	ground.img = love.graphics.newImage("imagens/123.png")

	nuvem = {}
	nuvem.x = {n1=-50, n2=365, n3=800}
	nuvem.y = -75
	nuvem.imagem = love.graphics.newImage("imagens/nuvem.png")
end

function cenario:draw()
	love.graphics.draw(fundo, 0 , 0 , 0, 1, 1, 0 , 0)
	love.graphics.draw( ground.img, ground.x, ground.y, 0, 2, 1, 0, 0 )
	love.graphics.draw(nuvem.imagem, nuvem.x.n1, nuvem.y, 0, 1.25, 1.25, 0, 0)
	love.graphics.draw(nuvem.imagem, nuvem.x.n2, nuvem.y, 0, 1.25, 1.25, 0, 0)
	love.graphics.draw(nuvem.imagem, nuvem.x.n3, nuvem.y, 0, 1.25, 1.25, 0, 0)
end