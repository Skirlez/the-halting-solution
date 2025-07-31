func = function () {
	with (obj_background_man) {
		global.background_disabled = !global.background_disabled
		other.state = global.background_disabled;
		if global.background_disabled
			instance_destroy(obj_cool_background)
		else
			timer = 0;
	}
}

other.state = global.background_disabled;
with (inst_7ECD40E0) {
	other.visible = state;
}