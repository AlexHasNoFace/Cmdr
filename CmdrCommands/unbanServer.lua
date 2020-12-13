local ServerScriptService = game:GetService("ServerScriptService")
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local Settings = require(ServerScriptService.CmdrServer.CmdrSettings)
local InfractionsDB = DataStoreService:GetDataStore(Settings.Database)

--[[

Ban Table (For Reference only)

infractions = {}
infractions.infractions = {}
infractions.timeOfBan = os.date()
infractions.adminWhoBanned = context.Executor.UserId
infractions.banMessage = message

--]]

return function(context, player)
    player = Players:GetUserIdFromNameAsync(player)
    local infractionsData

    local success, err = pcall(function()
        infractionsData = InfractionsDB:GetAsync(player)
    end)

    if success then
        if infractionsData ~= nil then
            local currentInfraction = infractionsData.infractions(#infractionsData.infractions)

            if currentInfraction[1] ~= "Ban" then
                return("Player wasn't banned")
            end

            local infraction = {"Unban", os.date(), context.Executor.UserId}
            infraction = HttpService:JSONEncode(infraction)

            table.insert(infractionsData.infractions, infraction)

            infractionsData.timeOfBan = nil
            infractionsData.adminWhoBanned = nil
            infractionsData.banMessage = nil

            infractionsData = HttpService:JSONEncode(infractionsData)

            local success, err = pcall(function()
                InfractionsDB:SetAsync(infractionsData)
            end)

            if success then
                return("Successfully unbanned " ..Players:GetNameFromUserIdAsync(player) ..".")
            end

            if err then
                return(err)
            end
        end
    end
end