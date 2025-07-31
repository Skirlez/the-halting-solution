function create_allowed_buttons() {
	var buttons_start_x = global.program_x
	var buttons_x = buttons_start_x;
	var allowed = global.levels[global.level_index].can_use;
	for (var i = 1; i <= string_length(allowed); i++) {
		instance_create_layer(buttons_x + 0.2 * 256 / 2, global.allowed_buttons_y, "CharButtons", obj_char_button, {
			text : string_char_at(allowed, i),
			scale_x : 0.2,
			scale_y : 0.2,
			font : font_medium,
			func : function () {
				add_command(text);
			},
		})
		buttons_x += 70;
	}
	if global.level_index != 0 {
		instance_create_layer(buttons_x + 0.3 * 256 / 2, global.allowed_buttons_y, "CharButtons", obj_button, {
			text : "Erase",
			scale_x : 0.3,
			scale_y : 0.2,
			func : delete_command,
			step : function () {
				color = global.game_state == game_states.idle ? c_white : c_grey;
				image_blend = color;
				do_lock_sound = (global.game_state != game_states.idle)
			}
		})
	}
	instance_create_layer(buttons_start_x + 0.3 * 256 / 2, global.allowed_buttons_y + 60, "Buttons", obj_start_button, {
		scale_x : 0.3,
		scale_y : 0.2,
	})
	instance_create_layer(buttons_start_x + 90 + 0.3 * 256 / 2, global.allowed_buttons_y + 60, "Buttons", obj_pause_button, {
		scale_x : 0.3,
		scale_y : 0.2,
	})
	instance_create_layer(buttons_start_x + 180 + 0.3 * 256 / 2, global.allowed_buttons_y + 60, "Buttons", obj_runone_button, {
		scale_x : 0.3,
		scale_y : 0.2,
	})
	
	buttons_x += 70;
}