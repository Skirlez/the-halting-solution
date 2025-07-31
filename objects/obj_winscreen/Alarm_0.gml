if global.level_index == array_length(global.levels) - 1 {
	levels = instance_create_layer(x + 50, y + 80, "WinscreenButtons", obj_button, {
		text : "Levels",
		scale_x : 0.4,
		scale_y : 0.2,
		func : function () {
			room_goto(rm_levels)
		}
	})
}
else {
	next = instance_create_layer(x + 50, y + 80, "WinscreenButtons", obj_button, {
		text : "Next",
		scale_x : 0.3,
		scale_y : 0.2,
		func : function () {
			global.level_index++;
			room_restart()
		}
	})
}


stay = instance_create_layer(x - 50, y + 80, "WinscreenButtons", obj_button, {
	text : "Stay",
	scale_x : 0.3,
	scale_y : 0.2,
	func : function () {
		instance_destroy(obj_winscreen)
		global.game_state = game_states.idle;
	}
})
visible = true;