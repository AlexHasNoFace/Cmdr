return {
	Name = "ban";
	Aliases = {"pban"};
	Description = "Permanantly bans the target player(s) from the game.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "players";
			Name = "players";
			Description = "The player(s) you wish to ban.";
		}, {
			Type = "string";
			Name = "message";
			Description = "The ban message.";
		},
	};
}