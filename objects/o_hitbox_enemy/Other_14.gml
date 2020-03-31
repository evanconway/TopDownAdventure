/// @description 

with (o_event_hitbox_hit) if (id_hitbox == other.id) {
	scr_fx_create(hit_x, hit_y, other.hit_fx);
	scr_play_sfx(other.hit_snd);
}
