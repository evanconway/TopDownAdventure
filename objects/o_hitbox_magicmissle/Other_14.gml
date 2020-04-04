/// @description 

with (o_event_hitbox_setdir) if (id_hitbox == other.id) {
	with (other) {
		switch (other.dir) {
			case DIR.UP:
			vel_y *= -1;
			break;
			case DIR.DOWN:
			// default, no change needed
			break;
			case DIR.LEFT:
			vel_x = vel_y * -1;
			vel_y = 0;
			break;
			case DIR.RIGHT:
			vel_x = vel_y;
			vel_y = 0;
			break;
		}
	}
}

var _delete = false;

with (o_event_hitbox_solid) if (id_hitbox == other.id) {
	audio_stop_sound(other.miss_snd_id);
	scr_play_sfx(snd_firecast1);
	scr_fx_create(other.x, other.y, o_fx_magicpop);
	_delete = true;
}

var _hit_id = id;
with (o_event_hitbox_hit) if (id_hitbox == other.id) {
	with (scr_fx_create(hit_x, hit_y, o_fx_smack_t)) time = _hit_id.freeze_frames;
	audio_stop_sound(other.miss_snd_id);
	scr_play_sfx(snd_explosion2);
	_delete = true;
}

with (o_event_hitbox_kill) if (id_hitbox == other.id) {
	scr_fx_create(hit_x, hit_y, o_fx_magicexplode);
	audio_stop_sound(other.miss_snd_id);
	scr_play_sfx(snd_explosion1);
	_delete = true;
}

if (_delete) instance_destroy(id);
