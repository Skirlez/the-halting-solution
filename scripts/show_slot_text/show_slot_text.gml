function show_slot_text(pointer, text) {
	instance_destroy(obj_slot_text)
	var slot = global.slot_instances[pointer]
	
	var offset_x;
	var offset_y;
	if global.last_slot_text_time == 0 {
		offset_x = 0;
		offset_y = 0;
	}
	else {
		offset_x = irandom_range(-10, 10)
		offset_y = irandom_range(-8, -2);
	}
	
	global.last_slot_text_time = 10;
	instance_create_layer(slot.x + offset_x, slot.y - 24 + offset_y, slot.layer, obj_slot_text, {
		text	
	})
}