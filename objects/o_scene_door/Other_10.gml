/// @description 

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

if (room == room_end) {
	findplayer();
	scr_actor_setposition(global.player, door_end.exit_x, door_end.exit_y);
	focus_pop();
	instance_destroy(id);
} else room_goto(room_end);
