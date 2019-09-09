/// @description Logic

time_hurt--;

with (actor) {
	x = act_x;
	y = act_y;
	x += approach_wall_x(other.velx);
	y += approach_wall_y(other.vely);
	act_x = x;
	act_y = y;
	x = round_int(act_x);
	y = round_int(act_y);
}
