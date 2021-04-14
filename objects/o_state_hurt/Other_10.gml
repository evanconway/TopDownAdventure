/// @description Logic

if (time_freeze > 0) {
	time_freeze--;
	with (instance_create_depth(x, y, LAYER_MASTER, o_event_actor_shader)) {
		id_actor = other.actor;
		shader = other.hurt_shader;
	}
	exit;
}
time_hurt--;
with (actor) {
	x = act_x;
	y = act_y;
	x += approach_solid_x(other.velx);
	y += approach_solid_y(other.vely);
	act_x = x;
	act_y = y;
	x = round_int(act_x);
	y = round_int(act_y);
}
