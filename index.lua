--//## Set up CPU Speed
--//System.setCpuSpeed(333)
-- System.usbDiskModeActivate()

local board = require("board")
local character = require("character")
local battle = require("battle")

--///## MAIN ###\\--

while true do
	pad = Controls.read()
	if pad:start() then break end

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
