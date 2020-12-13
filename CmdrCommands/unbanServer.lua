local CmdrServer = game.ServerScriptService.CmdrServer
local Settings = require(CmdrServer.CmdrSettings)
local BanDB = Settings.Database

return function (context, player)
	local plr = game.Players:GetUserIdFromNameAsync(player)
	local success, err = pcall(function()
		BanDB:RemoveAsync(plr)
	end)
	
	return("Unbanned " ..player)
end