global.is_html5 = (os_browser != browser_not_a_browser)
global.levels = [
	{
		program : "",
		can_use : "",
		char_limit : {},	
	},
	{
		program : "",
		can_use : "+-[]<>.",
		char_limit : {
			"+" : 99,	
			"-" : 99,
			"[" : 99,
			"]" : 99,
			"<" : 99,
			">" : 99,
			"." : 99
		},
	},
	{
		program : "+++++[.-]",
		can_use : "+",
		char_limit : {
			"+" : 1,	
		},
	},
	{
		program : "[+",
		can_use : "+]",
		char_limit : {
			"+" : 2,
			"]" : 1,
		},
	},
	{
		program : "++[+++.]",
		can_use : "-",
		char_limit : {
			"-" : 2,	
		},
	},
	{
		program : "+>[-]",
		can_use : "<+",
		char_limit : {
			"+" : 1,
			"<" : 1,
		},
	},
	{
		program : "+[l>>][>]",
		can_use : "+-",
		char_limit : {
			"+" : 1,
			"-" : 1,
		},
	},
	{
		program : ">++>--<<[->-<]",
		can_use : "<",
		char_limit : {
			"<" : 2,
		},
	},
	{
		program : "++>++<[[l-l]>[l-l]]",
		can_use : "<>",
		char_limit : {
			">" : 1,
			"<" : 2,
		},
	},
	{
		program : "++[l-]<<[l-]<<[<>]",
		can_use : ">",
		char_limit : {
			">" : 3,
		},
	},
	{
		program : ">>l+>>>>>>>+l+[+l+l]",
		can_use : "><",
		char_limit : {
			">" : 1,
			"<" : 3,
		},
	},
]
global.level_index = 0;
global.frame = 0;

enum game_states {
	idle,
	executing,
	win,
}

execution_delay_max = 20;
instructions_per_frame_max = 200;
instructions_per_frame_temporal_max = 1;

function reset_program_state() {
	global.memory = array_create(10, 0)
	global.pointer = 0;
	global.pc = 0;
	global.output = [];
	global.amount_executed = 0;
	execution_delay = 0;
	execution_delay_temporal_max = execution_delay_max;	
	instructions_per_frame_temporal_max = 1;
}
reset_program_state()

function reset_level_state() {
	global.chars_left = struct_copy(global.levels[global.level_index].char_limit);
	global.game_state = game_states.idle;
}
reset_level_state()

global.program_x = 30;
global.program_y = room_height * 0.5;
global.slots_y = room_height * 0.65;
global.description_y = room_height * 0.715;
global.command_spacing = 40;

global.allowed_buttons_y = room_height * 0.3;

start_brainfuck = false;
stop_brainfuck = false;

create_sprites()
audio_sound_loop_start(snd_music, 8.35)
global.music = noone;
global.music_enabled = true;
global.music_gain = 0.7;

global.slow = false;
global.run_one = false;
global.paused = false;
global.block_tutorial_progress = false;

display_infinite_loop = 0;
display_ended = 0;

global.beaten = array_create(array_length(global.levels))
global.last_slot_text_time = 0;
global.background_disabled = false;