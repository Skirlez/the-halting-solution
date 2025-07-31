function create_command_instances(program) {
	var program_x = global.program_x + 20;
	var program_instances = []
	var i;
	var lock_next = false;
	for (i = 1; i <= string_length(program); i++) {
		var char = string_char_at(program, i);
		if char == "l" {
			lock_next = true;
			continue;
		}
		var instance = instance_create_layer(program_x, global.program_y, "Commands", obj_command, {
			char,
			lock : lock_next,
		})
		lock_next = false;
		array_push(program_instances, instance)
		program_x += global.command_spacing;
	}
	
	var instance = instance_create_layer(program_x, global.program_y, "Commands", obj_command, {
		char : "e",
	});
	instance.visible = false;
	array_push(program_instances, instance)
	return program_instances;
}
