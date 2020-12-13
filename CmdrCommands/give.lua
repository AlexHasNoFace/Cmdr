return {
	Name = "give";
	Aliases = {"tool"};
	Description = "Gives the target player(s) the selected tool.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "players";
			Name = "players";
			Description = "The player(s) to give a tool.";
		}, {
			Type = "tools";
			Name = "tool";
			Description = "The tool to give. (Must be the full name.)";
		},
	};
}