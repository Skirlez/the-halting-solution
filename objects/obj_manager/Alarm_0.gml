if global.music_enabled && room != rm_pretitle { 
	if !audio_is_playing(snd_music)
			global.music = audio_play_sound(snd_music, 10, true, global.music_gain)
}