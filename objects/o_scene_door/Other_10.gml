/// @description 

if (room_prev == undefined) room_prev = room_start;

var _invalid = false;
if (door_start == undefined) _invalid = true;
if (door_end == undefined) _invalid = true;
if (room_start == undefined) _invalid = true;
if (room_end == undefined) _invalid = true;
if (_invalid) {
	focus_pop();
	instance_destroy(id);
	exit;
}

if (++cur_time >= time_max) {
	cur_time = 0;
	cur_alpha += alpha_change;
	if (room == room_start && cur_alpha >= alpha_max) {
		room_goto(room_end);
		cur_alpha = alpha_max;
		alpha_change *= -1; // flip fade directon
	}
	if (room == room_end && cur_alpha <= 0) {
		focus_pop();
		instance_destroy(id);
	}
}

if (room == room_end && room_prev == room_start) {
	
	with (o_player) global.player = id;
	
	scr_actor_setposition(global.player, door_end.exit_x, door_end.exit_y);
	with (global.player) {
		actdirection = other.door_end.door_dir;
		switch (actdirection) {
			case DIR.UP:
			actor_setsprite(state.sprite_back);
			break;
			case DIR.DOWN:
			actor_setsprite(state.sprite_front);
			break;
			case DIR.LEFT:
			actor_setsprite(state.sprite_left);
			break;
			case DIR.RIGHT:
			actor_setsprite(state.sprite_right);
			break;
		}
	}
}

room_prev = room;
