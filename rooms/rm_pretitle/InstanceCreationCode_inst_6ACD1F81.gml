x = lerp(center - length, center + length, audio_get_master_gain(0) / 1.25)
func = function (value) {
	show_debug_message(value)
	audio_master_gain(value * 1.25);	
}

visible = false;