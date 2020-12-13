return {
	Name = "team";
	Aliases = {""};
	Description = "Teams the target player(s) to the selected team.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "players";
			Name = "players";
			Description = "The player(s) to team";
		}, {
			Type = "team";
			Name = "team";
			Description = "The team that you want to change them to.";
		},
	};
}