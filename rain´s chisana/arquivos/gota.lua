gota= {}
function gota:load()
respawn = 0.25 --tempo de respawn da gota
criaGota = respawn
imgGota = love.graphics.newImage("imagens/pingo1.png")
chuva = {}
end

function gota:update(dt)
criaGota = criaGota-(2*dt) --atualiza o valor
	if bateu == false then
		if criaGota<0 then
			criaGota=respawn
			random = math.random(0,love.graphics.getWidth()) --posição no eixo x das gotas
			newGota = {x = random, y = 100, img = imgGota}
			table.insert(chuva,newGota)
		end

		for i, gotas in pairs(chuva) do
			gotas.y = gotas.y+(200*dt) --atualiza a velocidade da gota
		
			if gotas.y > height+55 then --qunanoo toca no chão remove da tabela
				table.remove(chuva, i)
			end
		end
	elseif bateu then
		chuva={}
	end
end

function gota:draw()
	for i,gotas in ipairs(chuva) do
		love.graphics.draw(gotas.img, gotas.x, gotas.y, 0, 0.5, 0.5, 0, 0)
	end
end