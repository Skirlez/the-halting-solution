if global.is_html5 {
	var ratio = browser_width / browser_height;
	var desired_width;
	var desired_height
	if ratio >= (1280 / 720) {
		desired_width = round(browser_height * (1280 / 720))
		desired_height = round(browser_height)
	}
	else {
		desired_width = round(browser_width)
		desired_height = round(browser_width  * (720 / 1280))
	}
	
	if desired_width != surface_get_width(application_surface) || desired_height != surface_get_height(application_surface) {
		surface_resize(application_surface, desired_width, desired_height)
	}
	window_set_rectangle((browser_width - desired_width) / 2, (browser_height - desired_height) / 2, desired_width, desired_height);
}
else {
	if (window_get_width() > 0 && window_get_height() > 0) {
		if surface_get_width(application_surface) != window_get_width()
			|| surface_get_height(application_surface) != window_get_height()
		surface_resize(application_surface, window_get_width(), window_get_height())	
	}
}
global.frame++;

if room != rm_game
	exit;
if global.game_state == game_states.idle {
	
	if global.level_index != 0 && mouse_check_button_pressed(mb_left) && instance_exists(caret_instance) && abs(mouse_y - caret_instance.y) < 16 {
		var did_lock = false;
		for (var i = 0; i < array_length(global.program_instances); i++) {
			var inst = global.program_instances[i];
			if inst.x + 8 > mouse_x {
				if inst.lock {
					if !did_lock { 
						play_sound(snd_lock)
						inst.lock_time = 20;
						did_lock = true;
					}
				}
				else {
					caret_instance = inst;
					break;
				}
			}
		}
	}

	if keyboard_check_pressed(vk_anykey) {
		if keyboard_lastchar == "+" || keyboard_lastchar == "="
			add_command("+")
		else if keyboard_lastchar == "-" || keyboard_lastchar == "_"
			add_command("-")
		else if keyboard_lastchar == "["
			add_command("[")
		else if keyboard_lastchar == "]"
			add_command("]")
		else if keyboard_lastchar == ">" || keyboard_lastchar == "."
			add_command(">")
		else if keyboard_lastchar == "<" || keyboard_lastchar == ","
			add_command("<")
		keyboard_lastchar = "";
	}
	if keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_delete) {
		delete_command()
	}
	else if keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) {
		var dir = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
		if global.level_index != 0 && instance_exists(caret_instance) {
			var potential = instance_position(caret_instance.x + global.command_spacing * dir, caret_instance.y, obj_command)
			while instance_exists(potential) {
				if potential.lock {
					play_sound(snd_lock)
					potential.lock_time = 20;
					potential = instance_position(potential.x + global.command_spacing * dir, potential.y, obj_command)
				}
				else {
					caret_instance = potential;
					break;	
				}
			}
		}
	}
	else if keyboard_check_pressed(vk_enter) || start_brainfuck {
		global.block_tutorial_progress = false;
		start_brainfuck = false;
		instance_destroy(obj_pc)
		display_infinite_loop = 0;
		display_ended = 0;
		global.game_state = game_states.executing;
		reset_program_state()
		execution_delay = 30;
		var first_command = global.program_instances[0];
		instance_create_layer(first_command.x, first_command.y + 60, "PC", obj_pc)
		var first_slot = global.slot_instances[0];
		if !instance_exists(obj_selected_slot)
			instance_create_layer(first_slot.x, first_slot.y, "SelectedSlot", obj_selected_slot)

		program = array_create(array_length(global.program_instances) - 1)
		for (var i = 0; i < array_length(program); i++) {
			program[i] = global.program_instances[i].char;	
		}
		
	}
}
else if global.game_state == game_states.executing {
	if keyboard_check_pressed(vk_enter) || stop_brainfuck {
		global.game_state = game_states.idle;
		global.paused = false;
		stop_brainfuck = false;
	} 
	else if !global.paused || global.run_one {
		if global.run_one {
			execution_delay = 0;
		}
		execution_delay--;

		if execution_delay <= 0 {
			if global.pc >= array_length(program) {
				global.game_state = game_states.idle;
				audio_play_sound(snd_done, 10, false)
				display_ended = 240;
				global.paused = false;
				stop_brainfuck = false;
			}
			else {
				var sound;
				if execution_delay_temporal_max > 3 || global.run_one
					sound = true;
				else if instructions_per_frame_temporal_max < instructions_per_frame_max / 2 {
					sound = true;
				}
				else {
					sound = global.frame % 3 == 0;
					if global.frame % 4 == 0 {
						var explosion = instance_create_layer(irandom_range(0, room_width), irandom_range(0, room_height), "Explosions", obj_explosion)
						with (explosion) {
							image_xscale = 2;
							image_yscale = 2;
						}
						var snd = play_sound(snd_goodexplosion)
						audio_sound_pitch(snd, random_range(0.9, 1.1))
					}
					if global.amount_executed > 20000 {
						var explosion = instance_create_layer(room_width / 2, room_height / 2, "Explosions", obj_explosion)
						with (explosion) {
							image_xscale = 10;
							image_yscale = 10;
							image_speed = 0.5;
						}
						var snd = play_sound(snd_goodexplosion)
						audio_sound_pitch(snd, 0.79)
						reset_program_state()
						global.paused = false;
						global.pc = array_length(program);
						display_infinite_loop = 240;
						if global.level_index == 0 || global.level_index == 1 {
							global.game_state = game_states.idle;
						}
						else {
							global.game_state = game_states.win;
							instance_destroy(obj_slot_text)
							instance_create_layer(room_width / 2, room_height / 2, "Winscreen", obj_winscreen)
						}
						exit;
					}
				}
				var bro_forgot_to_stop_games = global.run_one
				var amount_to_run;
				if global.run_one {
					amount_to_run = 1;
					global.run_one = false;
				}
				else
					amount_to_run = floor(instructions_per_frame_temporal_max);
			
				global.amount_executed += execute_brainfuck(program, amount_to_run, sound)
				if global.pc >= array_length(program) {
					execution_delay = execution_delay_max
					global.run_one = false;
					global.paused = false;
					instructions_per_frame_temporal_max = 1;
				}
				else {
					execution_delay = execution_delay_temporal_max
					if !global.slow && !bro_forgot_to_stop_games
						execution_delay_temporal_max *= 0.95;
		
					if execution_delay_temporal_max <= 2 {
						instructions_per_frame_temporal_max *= 1.1;
						if instructions_per_frame_temporal_max > instructions_per_frame_max
							instructions_per_frame_temporal_max = instructions_per_frame_max;
				
						if instructions_per_frame_temporal_max > 10
							instructions_per_frame_temporal_max += irandom_range(-2, 2)
					}
				}
			}
		}
	}
}
else if global.game_state == game_states.win {

}





var inst = instance_position(mouse_x, mouse_y, obj_command)
if instance_exists(inst) {
	command_mouse_hovering = inst.char;
}
else {
	inst = instance_position(mouse_x, mouse_y, obj_char_button)
	if instance_exists(inst)
		command_mouse_hovering = inst.text;
	else
		command_mouse_hovering = "";
}

if global.last_slot_text_time > 0 {
	global.last_slot_text_time--;	
}