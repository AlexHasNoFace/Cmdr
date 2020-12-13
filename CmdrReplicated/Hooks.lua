local ServerScriptService = game:GetService("ServerScriptService")
local Settings = require(ServerScriptService.CmdrServer.CmdrSettings)

return function(registry)
	registry:RegisterHook("BeforeRun", function(context)
		if context.Executor:GetRankInGroup(Settings.GroupId) >= Settings.GroupRank or context.Executor.UserId == -1 then
			return "You don't have permission to run this command"
		end
	end)
end
