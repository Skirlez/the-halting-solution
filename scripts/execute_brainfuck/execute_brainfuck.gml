function execute_brainfuck(program, amount, sound = false) {	
	var program_length = array_length(program);
	var i = global.pc;
	var pointer = global.pointer;
	var memory = global.memory;
	var count = 0;
	while (i < program_length && count < amount) {
		var command = program[i];
		count++;
		switch (command) {
			case "+":
				memory[pointer]++;
				if memory[pointer] >= 256 {
					memory[pointer] = 0;
					show_slot_text(pointer, "Overflow!")
				}
				i++;
				if sound
					play_sound(snd_increase)
				break;
			case "-":
				memory[pointer]--;
				if memory[pointer] < 0 {
					memory[pointer] = 255;
					show_slot_text(pointer, "Underflow!")	
				}
				i++;
				if sound
					play_sound(snd_decrease)
				break;
			case "<": 
				if pointer > 0
					pointer--;
				if sound
					play_sound(snd_slide_left)
				i++;
				break;
			case ">":
				if pointer < array_length(memory) - 1
					pointer++;
				if sound
					play_sound(snd_slide_right)
				i++;
				break;
			case "[":
				if (memory[pointer] == 0) {
					var j = i + 1;
					var stack = 1;
					while (j < program_length) {
						if (program[j] == "[")
							stack++;
						else if (program[j] == "]") {
							stack--;
							if (stack == 0)
								break;
						}
						j++;
					}
					if (stack != 0) {
						j = array_length(program) - 1;
					}
					if sound
						play_sound(snd_brackets_back)
					i = j + 1;
				}
				else {
					i++;
					if sound
						play_sound(snd_brackets_pass)		
				}
				break;
			case "]":
				if (memory[pointer] != 0) {
					var j = i - 1;
					var stack = 1;
					while (j > 0) {
						if (program[j] == "]")
							stack++;
						else if (program[j] == "[") {
							stack--;
							if (stack == 0)
								break;
						}
						j--;
					}
					if (stack != 0) {
						j = array_length(program) - 1;
					}
					i = j + 1;
					if sound
						play_sound(snd_brackets_back)
				}
				else {
					i++;
					if sound
						play_sound(snd_brackets_pass)	
				}
				break;
			case ".":
				output(string(memory[pointer]))
				if sound
					play_sound(snd_output)
				i++;
		}
		sound = false;
	}
	global.pc = i;
	global.pointer = pointer;
	return count;
}

