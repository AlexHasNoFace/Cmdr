return {
	Name = "speed";
	Aliases = {"walkspeed"};
	Description = "Sets the walkspeed of the selected player.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "players";
			Name = "players";
			Description = "The players to change their walkspeed.";
		}, {
			Type = "integer";
			Name = "walkspeed";
			Description = "The walkspeed you want to set";
		},
	};
}