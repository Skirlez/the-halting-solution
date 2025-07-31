x = lerp(center - length, center + length, global.music_gain / 1.25)
func = function (value) {
	global.music_gain = value * 1.25;
	if audio_is_playing(global.music)
		audio_sound_gain(global.music, global.music_gain, 0)
}

visible = false;