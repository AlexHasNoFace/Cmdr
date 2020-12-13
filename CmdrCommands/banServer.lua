local CmdrServer = game.ServerScriptService.CmdrServer
local Settings = require(CmdrServer.CmdrSettings)
local BanDB = Settings.Database

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