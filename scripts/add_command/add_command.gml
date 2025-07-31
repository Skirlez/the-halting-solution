function add_command(char, user_made = true) {
	if user_made { 
		if !struct_exists(global.chars_left, char) || global.chars_left[$ char] <= 0
			return;
		if global.game_state != game_states.idle
			return;
		global.chars_left[$ char]--;
	}
	with (obj_manager) {
		var caret_x = caret_instance.x;
		with (obj_command) {
			if x >= caret_x {
				x += global.command_spacing;	
			}
		}
		instance_create_layer(caret_x, caret_instance.y, "Commands", obj_command, {
			char : char,
			user_made : user_made,
		});
		
		update_program_instances();
	}
}
function add_commands(str, user_made) {
	for (var i = 1; i <= string_length(str); i++) {
		add_command(string_char_at(str, i), user_made)	
	}
}