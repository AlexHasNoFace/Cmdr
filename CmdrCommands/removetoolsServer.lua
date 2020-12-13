return function(context, players, tool)
	for _, v in pairs(players) do
		for _, t in pairs(v.Backpack:GetChildren()) do
			if t.ClassName == "Tool" then
				t:Destroy()
			end
		end
		for _, u in pairs(v.Character:GetChildren()) do
			if u.ClassName == "Tool" then
				u:Destroy()
			end
		end
	end
	
	return("Removed tools from %d Player(s)"):format(#players)
end