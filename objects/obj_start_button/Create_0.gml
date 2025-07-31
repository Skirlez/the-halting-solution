// Inherit the parent event
event_inherited();
func = function () {
	with (obj_manager) {
		if global.game_state == game_states.idle {
			start_brainfuck = true;
			global.block_tutorial_progress = false;
		}
		else
			stop_brainfuck = true;
	}
}
