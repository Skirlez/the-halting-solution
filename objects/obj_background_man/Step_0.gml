if global.background_disabled
	exit;
timer--;
if timer < 0 {
	timer = 350;
	var inst = instance_create_layer(room_width / 2, room_height / 2,
		"BGEffect", obj_cool_background)
	inst.image_blend = choose(c_red, c_green, c_blue, c_purple, c_orange, c_gray, c_aqua, c_yellow);
	inst.sprite_index = global.moving_background_sprite;
	/*
	var inst2 = instance_create_layer(room_width / 2, room_height / 2,
		"BGOverLines", obj_cool_background)
	inst2.sprite_index = spr_background_white_add
	inst2.image_blend = inst.image_blend
	*/
}
/*
white_timer--;
if white_timer < 0 {
	var inst = instance_create_layer(room_width / 2, room_height / 2,
		"WhiteBGEffect", obj_cool_background)
	inst.sprite_index = global.moving_background_sprite;
	inst.spd = 0.004
	white_timer = 500;
}