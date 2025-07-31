if room == rm_game {
	reset_program_state()
	global.paused = false;
	if global.level_index == 0
		instance_create_layer(x, y, "Tutorial", obj_tutorial)
	global.program_instances = create_command_instances(global.levels[global.level_index].program);
	global.slot_instances = create_slot_instances()

	create_allowed_buttons();

	global.game_state = game_states.idle
	caret_instance = global.program_instances[0];
	reset_level_state()
	
	var bg_layer = layer_get_id("Background")
	var bg = layer_background_get_id(bg_layer)
	layer_background_sprite(bg, global.constant_background_sprite)
	
	display_infinite_loop = 0;
	display_ended = 0;
}
else {
	
}
alarm[0] = 2
