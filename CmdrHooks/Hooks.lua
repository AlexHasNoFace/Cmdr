local Settings = raquire(ServerScriptService.CmdrServer.CmdrSettings)

return function(registry)
	registry:RegisterHook("BeforeRun", function(context)
		if context.Executor:GetRankInGroup(Settings.GroupId) <= Settings.GroupRank then
			return "You don't have permission to run this command"
		end
	end)
end
