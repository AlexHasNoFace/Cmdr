return {
	Name = "removetools";
	Aliases = {""};
	Description = "Removes all tools from the target player(s)";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "players";
			Name = "players";
			Description = "The players to give a tool.";
		},
	};
}