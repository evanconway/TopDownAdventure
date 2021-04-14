/// @description 

with (o_event_hitbox_hit) if (id_hitbox == other.id) {
	scr_fx_create(hit_x, hit_y, o_fx_smack);
	scr_play_sfx(snd_hurt4);
}
