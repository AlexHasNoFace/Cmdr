local DataStoreService = game:GetService("DataStoreService")
local BanDB = DataStoreService:GetDataStore("[INSERT DATABASE HERE]")

game.Players.PlayerAdded:Connect(function(plr)
	local v
	local success, err = pcall(function()
		v = BanDB:GetAsync(plr.UserId)
	end)
	
	if v ~= nil then
		plr:Kick("Banned for: " ..v)
	end
	
	for _, u in pairs(game.ServerStorage.ServerBans:GetChildren()) do
		if plr.UserId == u.Value then
			plr:Kick("Server Banned.")
		end
	end
end)