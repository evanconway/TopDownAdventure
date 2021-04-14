/// @description 

x += vel_x;
y += vel_y;

if (--fx_trail_time <= 0) {
	fx_trail_time = fx_trail_time_max;
	instance_create_depth(x, y, LAYER_EFFECTS + 1, fx_trail);
}

if (place_meeting(x, y, o_solid)) {
	with (instance_create_depth(x, y, LAYER_MASTER, o_event_hitbox_solid)) {
		id_hitbox = other.id;
	}
}
