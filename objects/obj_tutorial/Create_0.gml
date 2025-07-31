function empty() { }

program_1 = "+++++"
program_2 = "++>++-<-"
program_3 = "+++++[-]"
program_4 = "+[+-]"

ran_programs = [0, 0, 0, 0]

stages = [
	{
		text : "Brainf*** is an extremely minimalistic programming language,\ncreated in 1993 by Urban Müller.",
		font : font_kindamedium,
		next : empty,
		previous : empty,
	},
	{
		text : "A Brainf*** program is a sequence of characters, executed one-by-one.\n",
		font : font_kindamedium,
		next : function () {
			add_commands(obj_tutorial.program_1, false)
			if !obj_tutorial.ran_programs[0] {
				global.block_tutorial_progress = true;
				obj_tutorial.ran_programs[0] = true;
			}
		},
		previous : empty,
	},
	{
		text : "Here is a simple example program.\nPress Start or the Enter key to run it.",
		font : font_kindamedium,
		next : empty,
		previous : function () {
			destroy_all_commands()
		},
	},
	{
		text : "In Brainf***, you have several number slots.\nOne is selected at a time, called the current slot.\nSlots can be any whole number between 0-255.\nYou can see your 10 slots below the program.",
		font : font_kindamedium,
		next : empty,
		previous : empty,
	},
	{
		text : "This program contains 5 of the '+' command,\nwhich increments the current slot.\nWhen this program finishes, the first slot's value is 5.",
		font : font_kindamedium,
		next : function () {
			destroy_all_commands()	
			add_commands(obj_tutorial.program_2, false)
			if !obj_tutorial.ran_programs[1] {
				global.block_tutorial_progress = true;
				obj_tutorial.ran_programs[1] = true;
			}
		},
		previous : empty,
	},
	{
		text : "Here's another program. This one contains\nthe '<' and '>' commands, which shift the slot selection left or right.\nYou can see what a command does by hovering on it.",
		font : font_kindamedium,
		next : function () {
			destroy_all_commands()
			add_commands(obj_tutorial.program_3, false)
			if !obj_tutorial.ran_programs[2] {
				global.block_tutorial_progress = true;
				obj_tutorial.ran_programs[2] = true;
			}
		},
		previous : function () {
			destroy_all_commands()
			add_commands(obj_tutorial.program_1, false)
		},
	},
	{
		text : "Most importantly, here's a program with the loop '[' and ']' commands.\nIn short, everything inside of them will be executed in a loop until the current slot hits 0.\nFor a more detailed explanation, hover over them.",
		font : font_kindamedium,
		next : function () {
			destroy_all_commands()
			add_commands(obj_tutorial.program_4, false)
			if !obj_tutorial.ran_programs[3] {
				global.block_tutorial_progress = true;
				obj_tutorial.ran_programs[3] = true;
			}
		},
		previous : function () {
			destroy_all_commands()
			add_commands(obj_tutorial.program_2, false)
		},
	},
	{
		text : "You will be given a program, and some characters you can insert.\nYour goal will be to make the program reach an INFINITE LOOP!\n(Let this program keep running)",
		font : font_kindamedium,
		next : empty,
		previous : function () {
			destroy_all_commands()
			add_commands(obj_tutorial.program_3, false)
		},
	},
	{
	text : "Important tips: You can pause executions with the pause button,\nand while paused, use the 'Run 1' button to execute commands one-by-one manually.\nYou can also use 'Don't accelerate' in settings, which makes the execution\nrun at a constant speed.",
		font : font_kindamedium,
		next : empty,
		previous : empty,
	},
	{
		text : "You may exit the tutorial using the Title button, bottom-left.\nThere is a Sandbox mode there, if you would like to\nfamiliarize yourself with the language more.\nGood luck!",
		font : font_kindamedium,
		next : empty,
		previous : function () {
			destroy_all_commands()
			add_commands(obj_tutorial.program_4, false)
		},
	}
]

stage_index = 0;


next_x_start = room_width / 2 + 80
next_y_start = 270;
display_run_text = 0;
next_button = instance_create_layer(room_width / 2, next_y_start, "Tutorial", obj_button, {
	text : "Next",
	func : function () {
		if global.block_tutorial_progress {
			obj_tutorial.display_run_text = 200;
			exit;
		}
		if global.game_state != game_states.idle {
			if global.paused {
				obj_manager.stop_brainfuck = true;
			}
			exit;
		}
		with (obj_tutorial) {
			if stage_index < array_length(stages) - 1 {
				stages[stage_index].next();
				stage_index++;
			}
		}

	},
	scale_x : 0.3,
	scale_y : 0.2,
})

previous_x_start = room_width / 2 - 80
previous_y_start = 270;

previous_button = instance_create_layer(-300, previous_y_start, "Tutorial", obj_button, {
	text : "Previous",
	func : function () {
		if global.block_tutorial_progress {
			obj_tutorial.display_run_text = 200;
			exit;
		}
		if global.game_state != game_states.idle {
			if global.paused {
				obj_manager.stop_brainfuck = true;
			}
			exit;
		}
		with (obj_tutorial) {
			if stage_index > 0 {
				stages[stage_index].previous();
				stage_index--;
			}
		}
	},
	scale_x : 0.45,
	scale_y : 0.2,
})

