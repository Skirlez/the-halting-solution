var target_scale_x = scale_x;
var target_scale_y = scale_y;
if position_meeting(mouse_x, mouse_y, id) && visible {
	if play_hover_sound {
		play_sound(snd_button_hover)
		play_hover_sound = false;
	}
	play_unhover_sound = true;
	target_scale_x *= 1.25;
	target_scale_y *= 1.25;
	if mouse_check_button_pressed(mb_left) && func != noone {
		if do_lock_sound
			play_sound(snd_lock)
		else if !silent {
			play_sound(snd_use_button)
		}
		func();	
	}
}
else {
	if play_unhover_sound {
		play_sound(snd_button_unhover)
		play_unhover_sound = false;
	}
	play_hover_sound = true;
}

image_xscale = lerp(image_xscale, target_scale_x, 0.5)
image_yscale = lerp(image_yscale, target_scale_y, 0.5)
if step != noone
	step();