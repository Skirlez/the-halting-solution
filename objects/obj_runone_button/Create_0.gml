event_inherited();
text = "Run 1"
func = function () {
	if usable {
		global.run_one = true;
		draw_pause_timer = 0;
	}
	else {
		draw_pause_timer = 70;
	}
	
}
draw_pause_timer = 0;