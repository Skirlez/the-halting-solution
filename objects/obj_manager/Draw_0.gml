draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(font_medium)
if room == rm_levels {
	var sum = 0;
	for (var i = 2; i < array_length(global.beaten); i++) {
		if global.beaten[i]
			sum++;
	}
	
	if sum > 0 {
		if sum < 9 {
			var noun = sum == 1 ? "home" : "homes";
			draw_text(global.program_x + 10, 35, $"Heat has been provided\nto {sum} {noun}.")
		}
		else
			draw_text(global.program_x + 10, 35, $"Heat has been provided\nto all homes.\n\nThanks to your efforts, all homes in the village\nhave been saved from the everlasting cold...\nAt least for a good while.\n\nThank you for playing!")
	}
	else {
		draw_text(global.program_x + 10, 35, $"All the homes in the village are cold.")
	}
}	

if room != rm_game
	exit;


var out = "";
for (var i = 0; i < array_length(global.output); i++) {
	out += global.output[i] + "\n";	
}

if global.level_index != 0
	draw_text(room_width - 200, 30, "Output:\n" + out)

draw_set_font(font_big)

var executed;
if display_infinite_loop > 0 {
	display_infinite_loop--;
	if display_infinite_loop % 15 <= 8 {
		executed = "INFINITE LOOP"
	}
	else
		executed = "";
}
else if display_ended > 0 {
	display_ended--;
	executed = $"Didn't loop ({string(global.amount_executed)})"
}
else
	executed = string(global.amount_executed)

draw_text(global.program_x, 35, "Executed: " + executed)


draw_set_font(font_kindamedium)
if global.game_state == game_states.idle {
	if global.level_index != 0
		draw_sprite(spr_caret, 0, caret_instance.x, caret_instance.y)
}
if command_mouse_hovering != "" {
	var char = command_mouse_hovering;
	if char != "e" {
		var text = "";
		if char == "+"
			text = "Increment the current slot by 1"
		else if char == "-"
			text = "Decrement the current slot by 1"
		else if char == ">"
			text = "Move selected slot to the right"
		else if char == "<"
			text = "Move selected slot to the left"
		else if char == "."
			text = "Output/log current slot to the right side of the screen"
		else if char == "["
			text = "If current slot is zero, skip to matching ']' command. Proceed otherwise"
		else if char == "]"
			text = "If current slot is NOT zero, go back to matching '[' command. Proceed otherwise"
		draw_text(global.program_x + 15, global.description_y, $"{char}   {text}")
	}
}



draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if global.level_index >= 2
	draw_text(room_width / 2, 35, $"HOME {global.level_index - 1}/{array_length(global.levels) - 2}")