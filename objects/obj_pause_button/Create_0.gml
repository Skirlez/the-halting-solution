// Inherit the parent event
event_inherited();
func = function () {
	if global.game_state == game_states.executing {
		if global.pc < array_length(global.program_instances) - 1
			global.paused = !global.paused;
	}
	else if global.game_state == game_states.idle {
		obj_manager.start_brainfuck = true;
		global.paused = true;
		global.block_tutorial_progress = false;
	}
}
