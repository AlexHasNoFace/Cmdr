return function(context, players, speed)
	for _, v in pairs(players) do
		v.Character.Humanoid.WalkSpeed = speed
	end
	return ("Gave " ..speed .." walkspeed to %d player(s)"):format(#players)
end