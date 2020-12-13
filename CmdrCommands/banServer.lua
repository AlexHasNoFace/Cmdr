local DataStoreService = game:GetService("DataStoreService")
local BanDB = DataStoreService:GetDataStore("[INSERT DATABASE HERE]")

return function (context, players, message)
	for _, player in pairs(players) do
		if player.UserId == context.Executor.UserId then
			return ("You cannot ban yourself.")
		else
			local success, err = pcall(function()
				BanDB:SetAsync(player.UserId, message)
			end)
			
			if success then
				player:Kick("Banned for: " ..message)
			end
			if err then
				return(err)
			end
		end
	end

	return ("Banned %d player(s)."):format(#players)
end