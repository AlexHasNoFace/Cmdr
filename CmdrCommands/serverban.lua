return {
	Name = "serverban";
	Aliases = {""};
	Description = "Bans the target player(s) from rejoining this server.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "players";
			Name = "players";
			Description = "The player(s) to server ban.";
		},
	};
}