local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local Settings = require(ReplicatedStorage.CmdrReplicated.CmdrSettings)
local InfractionsDB = DataStoreService:GetDataStore(Settings.Database)

--[[

Ban Table (For Reference only)

infractions = {}
infractions.infractions = {}
infractions.timeOfBan = os.date()
infractions.adminWhoBanned = context.Executor.UserId
infractions.banMessage = message

--]]

return function(context, player, message)
    if context.Executor.UserId == player.UserId then
        return("You cannot ban yourself.")
    else

        local infractionsData -- Declare the Infractions Data for use outside of the pcall function

        local success, err = pcall(function()
            infractionsData = InfractionsDB:GetAsync(player.UserId) -- Retrieve the data from the database
        end)

        if infractionsData ~= nil then
            infractionsData = HttpService:JSONDecode(infractionsData) -- Decode the data if there is any
        else
            infractionsData = {}
            infractionsData.infractions = {}
        end

        if success then -- Check for success

            if infractionsData.banMessage ~= nil then -- Checks whether to see the player has been banned before (Players can bypass bans, I've seen it first hand)
                local infraction = {"Ban", infractionsData.timeOfBan, infractionsData.adminWhoBanned, infractionsData.banMessage} -- Add the previous infraction info

                table.insert(infractionsData.infractions, #t+1, infraction) -- Insert it to the Infractions table
            end

            infractionsData.timeOfBan = os.date() -- Get Current Date
            infractionsData.adminWhoBanned = context.Executor.UserId -- Store the Admin UserId
            infractionsData.banMessage = message -- Get the ban message

            infractionsData = HttpService:JSONEncode(infractionsData) -- Encode it

            local success, err = pcall(function()
                InfractionsDB:SetAsync(player.UserId, infractionsData)
            end)
            
            if success then
                player:Kick("Banned for: " ..message)
                return("Banned " ..player.Name .." for " ..message ..". Current Date = " ..os.date())
            end

            if err then
                return(err)
            end
        else
            error(err)
        end
    end
end