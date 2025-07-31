function delete_command() {
	if global.game_state != game_states.idle
		return;
	with (obj_manager) {
		var i = array_get_index(global.program_instances, caret_instance)
		if i > 0 {
			var instance_to_destroy = global.program_instances[i - 1];
			if instance_to_destroy.user_made {
				global.chars_left[$ instance_to_destroy.char]++;
				instance_destroy(global.program_instances[i - 1])
				
				var caret_x = caret_instance.x;
				with (obj_command) {
					if x >= caret_x {
						x -= global.command_spacing;	
					}
				}
				update_program_instances()
			}
		}	
	}
}