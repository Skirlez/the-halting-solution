if array_length(global.program_instances) == 0 {
	exit;
}
var ind = min(global.pc, array_length(global.program_instances) - 1)
var target_instance = global.program_instances[ind];
x = lerp(x, target_instance.x, 0.5);
y = lerp(y, target_instance.y + 40, 0.5);
visible = global.game_state == game_states.executing
