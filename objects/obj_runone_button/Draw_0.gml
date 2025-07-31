event_inherited()
if draw_pause_timer > 0 {
	draw_pause_timer--;
	draw_text(x, y + 40, "You must pause first!")
	if global.paused
		draw_pause_timer = 0;
}