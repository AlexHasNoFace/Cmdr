return function(context, players, team)
	for _, v in pairs(players) do
		v.Team = team
	end
	
	return("Teamed %d Player(s) to " ..team.Name):format(#players)
end