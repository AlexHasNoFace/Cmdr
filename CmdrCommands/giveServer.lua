return function(context, players, tool)
	for _, v in pairs(players) do
		local vtool = tool:Clone()
		vtool.Parent = v.Backpack
	end
	
	return("Gave " ..tool .." to %d Player(s)"):format(#players)
end