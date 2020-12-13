return function(context, number)
	context:BroadcastEvent("Countdown", number)
	return("Started countdown from " ..number)
end