game={}
function game:load()
	ponto = 0
	tempo = 0
	bateu = false
	rain= love.audio.newSource("sons/rain.mp3", "stream")
	rain:setLooping(true)
	love.audio.play(rain)
	somgg = love.audio.newSource("sons/gg.mp3", "static")
	somgg:setLooping(false)

	cenario:load()
	player:load()
	gota:load()
	gameover:load()
end

function game:update(dt)
	tempo = tempo+1
	if tempo%50==0 then
		ponto=ponto+1
	end
	if bateu then
		tempo = 0
	end

	--reseta o jogo
	if bateu==true then
		ponto = 0
		state = "gameover"
	end

	player:update(dt)
	gota:update(dt)
end

function game:draw()
	cenario:draw()
	gota:draw()
	player:draw()

	love.graphics.setFont(fonte)
	love.graphics.print("score: "..ponto,10,10)

	if bateu==true then
		love.graphics.setColor(1,1,1, transparencia)
		love.graphics.draw(imgGameOver,width/2,height/4)		
	end
end