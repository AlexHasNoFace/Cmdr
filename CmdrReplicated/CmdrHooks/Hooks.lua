local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Settings = require(ReplicatedStorage.CmdrReplicated.CmdrSettings)

return function(registry)
	registry:RegisterHook("BeforeRun", function(context)
        if context.Executor:GetRankInGroup(Settings.GroupId) <= Settings.GroupRank or context.Executor.UserId ~= game.CreatorId then
            return "You don't have permission to run this command"
        end
	end)
end
