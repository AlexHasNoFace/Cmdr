return {
	Name = "countdown";
	Aliases = {"cd"};
	Description = "Countdown from a selected number.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "integer";
			Name = "time";
			Description = "Time to countdown from.";
		},
	};
}