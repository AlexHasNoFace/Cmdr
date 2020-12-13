local DataStoreService = game:GetService("DataStoreService")
local BanDB = DataStoreService:GetDataStore("AustralianFederalPoliceCriminalBanDatabase")

return function (context, player)
	local plr = game.Players:GetUserIdFromNameAsync(player)
	local success, err = pcall(function()
		BanDB:RemoveAsync(plr)
	end)
	
	return("Unbanned " ..player)
end