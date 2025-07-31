function play_sound(index) {
	audio_stop_sound(index)
	return audio_play_sound(index, 10, false)
}