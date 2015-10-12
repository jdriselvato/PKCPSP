local character={}

local xLoc = 20
local yLoc = 10


function character.display()
	red = Color.new(255, 0, 0)
	pad = Controls.read()
	_G.moving = false

	if pad:up() then
 		character.moveUp()
 	end
 	if pad:down() then
 		character.moveDown()
 	end
 	if pad:right() then
 		character.moveRight()
 	end
 	if pad:left() then
 		character.moveLeft()
 	end
 	if pad:cross() then
 		character.sendOff()
 	end

 	screen:fillRect(xLoc, yLoc, 10, 10, red)
end

function character.sendOff()
	for i = xLoc,272 do
 		xLoc = math.sin(i * 0.5 * math.pi)
 		_G.moving = true
 		screen:fillRect(xLoc, yLoc, 10, 10, red)
 	end
end

function character.moveUp()
	yLoc = yLoc - 1
	_G.moving = true
end

function character.moveDown()
	yLoc = yLoc + 1
	_G.moving = true
end

function character.moveRight()
	xLoc = xLoc + 1
	_G.moving = true
end

function character.moveLeft()
	xLoc = xLoc - 1
	_G.moving = true
end

return character