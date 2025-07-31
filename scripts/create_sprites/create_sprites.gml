function create_sprites() {
	create_constant_background()
	create_moving_background()
	
	
}
function create_constant_background() {
	var surf = surface_create(
			room_width,
			room_height)
	surface_set_target(surf)
	draw_clear_alpha(c_black, 0)
	
	draw_set_color(c_black)
	for (var i = 0; i < room_width / 2; i += 80) {
		var hori = i;
		var verti = i * (9 / 16)
		draw_rectangle_good_big(hori, verti, room_width - hori, room_height - verti)
	}
	surface_reset_target();
	global.constant_background_sprite = sprite_create_from_surface(surf, 0, 0,
		room_width,
		room_height,
		false, false,
		0, 0)
		
	draw_set_color(c_white)	
	surface_free(surf)
}

function create_moving_background() {
	var after = 1200;
	var surf = surface_create(
			room_width + after,
			room_height + after)
	
	surface_set_target(surf)
	draw_clear_alpha(c_black, 0)
	draw_set_alpha(0)
	

	for (var i = 0; i < after / 2; i++) {
		draw_set_alpha(i / (after / 1.7))
		draw_rectangle_good(i, i, room_width + after - i, room_height + after - i)
	}
	var base = (after / 2) / (after / 1.7);
	var start = after / 2;
	var end_ = after / 1.5;
	for (var i = start; i < end_; i++) {
		var t = (i - start) / (end_ - start)
		draw_set_alpha(base - t)
		draw_rectangle_good(i, i, room_width + after - i, room_height + after - i)
	}
	draw_set_alpha(1)
	surface_reset_target();

	global.moving_background_sprite = sprite_create_from_surface(surf, 0, 0,
		room_width + after,
		room_height + after,
		false, false,
		(room_width + after) / 2, (room_height + after) / 2)

	/*
	var nineslice = sprite_nineslice_create();

	nineslice.enabled = true;
	nineslice.left = after / 2;
	nineslice.right = after / 2;
	nineslice.top = after / 2;
	nineslice.bottom = after / 2;
	sprite_set_nineslice(background_sprite, nineslice)
	*/

	surface_free(surf)
}