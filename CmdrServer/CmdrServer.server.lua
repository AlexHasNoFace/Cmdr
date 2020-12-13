local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cmdr = require(game.ServerScriptService.Repository.Vendor.Cmdr.Server.Cmdr)

Cmdr:RegisterHooksIn(game.ReplicatedStorage.CmdrReplicated.CmdrHooks)

Cmdr:RegisterDefaultCommands() -- This loads the default set of commands that Cmdr comes with. (Optional)
Cmdr:RegisterCommandsIn(game.ServerScriptService.Repository.Vendor.Cmdr.Commands) -- Register commands from your own folder. (Optional)
