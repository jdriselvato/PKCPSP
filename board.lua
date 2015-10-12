local board={}

local Resolution = { width = 480, height = 272 } -- PSP Screen Size

local statusbar = {height = 20}

local white = Color.new(255, 255, 255)
local gray = Color.new(255/2, 255/2, 255/2)

local cursor = {
	yLoc = 0,
	width = 10,
	height = 70
}

local unit = {
	yLoc = 0,
	xLoc = 20
}



function board.build()
	for i=0,3 do
		screen:drawLine(0, (i * 70) + 20, Resolution.width, (i * 70) + 20, white )
	end
end

function board.cursorActions()
	pad = Controls.read()

	if oldpad ~= pad then -- One at at time
		board.resetUnit()
		
		if pad:up() then
	 		board.moveUp()
	 	end
	 	if pad:down() then
	 		board.moveDown()
	 	end
	 	oldpad = pad
 	end

 	if pad:cross() then
 		board.releaseUnit()
 	end

 	screen:fillRect(0, cursor.yLoc + statusbar.height, cursor.width, cursor.height, gray)
end

function board.releaseUnit()
	unit.yLoc = cursor.yLoc + (cursor.height/2) + statusbar.height -- y location of unit

	unit.xLoc = unit.xLoc + 1
	screen:print(unit.xLoc, unit.yLoc, cursor.yLoc + statusbar.height, white) 
end

function board.resetUnit()
	unit.xLoc = 20
end

function board.moveUp()
	if cursor.yLoc > statusbar.height then -- keeps cursor in the game field
		cursor.yLoc = cursor.yLoc - 70
	end
end

function board.moveDown()
	if cursor.yLoc ~= 140 then -- keeps cursor in the game field
		cursor.yLoc = cursor.yLoc + 70
	end

end


return board