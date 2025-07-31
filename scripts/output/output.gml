function output(str) {
	if array_length(global.output) >= 15 {
		for (var i = 0; i < array_length(global.output) - 1; i++) {
			global.output[i] = global.output[i + 1];
		}
		global.output[14] = str;
	}
	else
		array_push(global.output, str)	
	
		
}