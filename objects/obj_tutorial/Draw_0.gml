draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var stage = stages[stage_index]
draw_set_font(stage.font);
draw_text(room_width / 2, 150, stage.text);

draw_text(room_width / 2, 80, $"{stage_index + 1}/{array_length(stages)}");

if display_run_text > 0 && global.block_tutorial_progress {
	display_run_text--;	
	draw_text(room_width / 2, room_height / 2, $"Press the Start button or Enter\nto run the program.");
}