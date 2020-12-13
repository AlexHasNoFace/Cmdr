return function(context, players)
	for _, v in pairs(players) do
		local intval = Instance.new("IntValue")
		intval.Parent = game.ServerStorage.ServerBans
		intval.Name = v.Name
		intval.Value = v.UserId
		v:Kick("You've been banned from this server.")
	end
	
	return("Served banned %d player(s)"):format(#players)
end