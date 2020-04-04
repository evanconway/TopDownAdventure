/// @description Hitstun

if (time_stun > 0) {
	actor.sprite_index = sprite_stun;
	time_stun--;
	var _vel_x = vel_x;
	var _vel_y = vel_y;
	with (actor) {
		x = act_x;
		y = act_y;
		_vel_x = approach_solid_x(_vel_x);
		_vel_y = approach_solid_y(_vel_y);
		x += _vel_x;
		y += _vel_y;
		act_x = x;
		act_y = y;
		x = round_int(x);
		y = round_int(y);
	}
} else {
	actor.sprite_index = sprite_block;
	ds_list_clear(hitboxes_blocked);
}

shield_fx_id.x = actor.x;
shield_fx_id.y = actor.y;
