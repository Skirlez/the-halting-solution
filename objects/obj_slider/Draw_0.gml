var target_scale_x = scale_x;
if dragging {
	if mouse_check_button_released(mb_left) || mouse_x < 0
		dragging = false;
	else { 
		x = clamp(mouse_x, center - length, center + length);
		if func != noone {
			func(((x - center) + length) / (2 * length))	
		}
	}
}

var target_scale_y = scale_y;
if position_meeting(mouse_x, mouse_y, id) && visible || dragging {
	if play_hover_sound {
		play_sound(snd_button_hover)
		play_hover_sound = false;
	}
	play_unhover_sound = true;
	target_scale_x *= 1.25;
	target_scale_y *= 1.25;
	if mouse_check_button_pressed(mb_left) {
		dragging = true;
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


draw_line_width(center - length, y, center + length, y, 2)
draw_self();

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(font_kindamedium)
draw_text(center, y - 30, text)