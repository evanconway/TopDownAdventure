/// @description 

with (o_event_guard) {
	if (id_guardbox == other) {
		scr_play_sfx(snd_bonk);
		scr_fx_create(other.x, other.y, o_fx_smack_blue, LAYER_EFFECTS);
	}
}
