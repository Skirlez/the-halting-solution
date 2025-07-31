if stage_index == 0 {
	previous_button.x = lerp(previous_button.x, -300, 0.1)
	next_button.x = lerp(next_button.x, room_width / 2, 0.1)
}
else if stage_index == array_length(stages) - 1 {
	previous_button.x = lerp(previous_button.x, room_width / 2, 0.1)
	next_button.x = lerp(next_button.x, room_width + 300, 0.1)
}
else {
	previous_button.x = lerp(previous_button.x, previous_x_start, 0.3)
	next_button.x = lerp(next_button.x, next_x_start, 0.3)
}