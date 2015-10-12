local battle={}

local xLoc = 10
local yLoc = 10

function battle.display(state)
	if state == false then
		white = Color.new(255, 255, 255)
 		screen:fillRect(xLoc, yLoc, 460, 250, white)
 	elseif state == true then
 		-- dismiss the battle display
 	end
end

return battle