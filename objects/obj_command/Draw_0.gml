draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(font_big)

if user_made
	draw_set_color(c_lime)	
else
	draw_set_color(c_white);
draw_text(x, y, char)
if user_made
	draw_set_color(c_white);
	
if lock && global.game_state == game_states.idle {
	var y_offset = 0;
	if lock_time > 0 {
		y_offset = dsin(lock_time * 25) * 10;
		lock_time--;	
	}
	draw_sprite_ext(spr_lock, 0, x - 20, y + 5 + y_offset, 0.25, 0.25, 0, c_white, 1)
}