event_inherited();

if global.game_state == game_states.idle {
	text = "Start"	
}
else if global.game_state == game_states.executing {
	text = "Stop"	
}