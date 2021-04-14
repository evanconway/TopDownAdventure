function scr_music_inc() {
	// increase sfx volume by 0.1

	o_sound.volume_music += o_sound.volume_inc;
	o_sound.volume_music = clamp(o_sound.volume_music, o_sound.volume_min, o_sound.volume_max);



}
