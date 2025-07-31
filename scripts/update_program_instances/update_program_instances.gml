function update_program_instances() {
	var array = []
	with (obj_command) {
		array_push(array, id)
	}
	// array_sort is broken on chrome?? here's some bullshit bubble sort
	for (var i = 0; i < array_length(array) - 1; i++) {
		for (var j = 0; j < array_length(array) - i - 1; j++) {
			if array[j].x > array[j + 1].x {
				var temp = array[j + 1]
				array[j + 1] = array[j]
				array[j] = temp;
			}
		}
	}
	
	global.program_instances = array;
}

