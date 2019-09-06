/// @description GAME STEP

// assign player if possible
if (global.player == undefined && ds_list_size(global.actors_list) > 0) 
	global.player = ds_list_find_value(global.actors_list, 0);

// cycle controllable actors
if (global.debug_active && (keyboard_check_pressed(219) || keyboard_check_pressed(221))) {
	var _player_index = ds_list_find_index(global.actors_list, global.player);
	if (keyboard_check_pressed(219)) { // "[" key
		if (_player_index > 0) _player_index--;
		else _player_index = ds_list_size(global.actors_list) - 1;
	}
	if (keyboard_check_pressed(221)) { // "]" key
		if (_player_index < ds_list_size(global.actors_list) - 1) _player_index++;
		else _player_index = 0;
	}
	scr_actor_resetai(global.player);
	global.player = ds_list_find_value(global.actors_list, _player_index);
	scr_actor_setplayer(global.player);
}

///////////////////////////////////////////////////////////////////////
// THE MASTER STEP
///////////////////////////////////////////////////////////////////////

// determine input
with (o_input) event_user(EVENT_LOGIC);

// run actor logic
for (var i = 0; i < ds_list_size(global.actors_list); i++) {
	with (global.actors_list[|i]) event_user(EVENT_LOGIC);
}

// set actor positions to integers
for (var i = 0; i < ds_list_size(global.actors_list); i++) {
	with (global.actors_list[|i]) {
		x = round_int(act_x);
		y = round_int(act_y);
	}
}

// update hitboxes
for (var i = 0; i < ds_list_size(global.hitboxes_list); i++) {
	with (global.hitboxes_list[|i]) event_user(EVENT_LOGIC);
}

// handle events

///////////////////////////////////////////////////////////////////////
// END MASTER STEP
///////////////////////////////////////////////////////////////////////

// exit first room
if (room == 0) {
	room_goto(room_test);
}
