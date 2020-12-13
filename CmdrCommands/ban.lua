return {
	Name = "ban";
	Aliases = {"pban"};
	Description = "Permanantly bans the target player from the game.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "player";
			Name = "player";
			Description = "The player you wish to ban.";
		}, {
			Type = "string";
			Name = "message";
			Description = "The ban message.";
		},
	};
}