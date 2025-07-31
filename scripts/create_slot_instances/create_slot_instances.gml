function create_slot_instances() {
	var program_x = global.program_x + 20;
	var slot_instances = array_create(array_length(global.memory))
	for (var i = 0; i < 10; i++) {
		var instance = instance_create_layer(program_x, global.slots_y, "Slots", obj_slot, {
			slot : i,
		})
		slot_instances[i] = instance;
		program_x += 40;
	}
	return slot_instances;
}