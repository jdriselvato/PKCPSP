-- Set up CPU Speed
-- System.setCpuSpeed(333)
-- System.usbDiskModeActivate()

-- Load helper scripts
local board = require("board") -- load the board
local character = require("character") -- not used yet
local battle = require("battle") -- not used yet

-- local variables
local pad = Controls.read()

--///## MAIN ###\\--

while not pad:start() do
	-- System.draw()
	screen:clear()

	board.build() -- build game board

	board.cursorActions() -- handles cursor movement on the board
 	-- character.display()

 	-- battle.display( _G.moving )
	-- System.endDraw()
	
	-- System.showFPS()
	--screen.waitVblankStart()
	screen.flip()
end

--System.quit() -- Quit the application after the main loop breaks
