local board={}

local Resolution = { -- PSP Screen Size
	width = 480, 
	height = 272
} 

local statusbar = {
	height = 20, -- height of status bar
	currentScore = 0,
	currentCoins = 0
}
 
local colors = {
	white = Color.new(255, 255, 255),
	gray = Color.new(255/2, 255/2, 255/2),
	green = Color.new(0, 255/2, 0),
	red = Color.new(255, 0, 0)
}

local cursor = {
	yLoc = 0, -- initial cursor y location
	width = 10, -- width of cursor
	height = 70 -- height of cursor
}

local unit = { -- the "unit" that will be sent out
	yLoc = 0,
	xLoc = 20,
	released = false
}

function board.build() -- build entire board
	board.buildStatusBar() -- build status bar
	board.buildField() -- build the field 
end

function board.buildStatusBar()
	-- Draw/show Score
	score = "Score: " .. tostring(statusbar.currentScore)
	screen:print(50, statusbar.height/2 - 2, score, colors.white)

	-- Draw/Show Coins
	coins = "Coins: " .. tostring(statusbar.currentCoins)
	screen:print((Resolution.width/2) + 50, statusbar.height/2 - 2, coins, colors.white)
end

function board.buildField()
	for i=0,3 do -- 3 rows
		yFieldLoc = (i * 70) + 20
		screen:drawLine(0, yFieldLoc, Resolution.width, yFieldLoc, colors.red )
	end
end

function board.cursorActions()
	pad = Controls.read()

	if oldpad ~= pad then -- Move cursor once regardless of holding down key
		board.resetUnit()
		
		if pad:up() then -- move cursor up
	 		board.moveUp()
	 	end
	 	if pad:down() then -- move cursor down
	 		board.moveDown()
	 	end
	 	if pad:cross() then -- release a new unit
 			unit.released = true
 		end
	 	oldpad = pad -- used to check if cursor was just moved
 	end

 	if unit.released == true then
 		board.releaseUnit()
 	end

 	screen:fillRect(0, cursor.yLoc + statusbar.height, cursor.width, cursor.height, colors.white)
end

function board.releaseUnit()
	if unit.yLoc >= Resolution.width then
		unit.released = false
	end
	unit.yLoc = cursor.yLoc + (cursor.height/2) + statusbar.height -- y location of unit

	unit.xLoc = unit.xLoc + 1
	screen:print(unit.xLoc, unit.yLoc, cursor.yLoc + statusbar.height, colors.white) 
end

function board.resetUnit() -- for testing right now
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

return board -- to fake make classes in lua