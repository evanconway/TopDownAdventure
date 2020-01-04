/// @description Update Gameworld

// this section deals with allowing us to change with actor the user controls. 
// assign player if possible
findplayer();

// cycle controllable actors
// "[" == 219, "]" == 221
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

// decrement freeze time (but only if no other actor freezers are active)
if (global.actors_freeze_time >= 0 && !scr_actors_frozen()) global.actors_freeze_time--;

// run dialogues
for (var i = 0; i < instance_number(o_dialogue); i++) {
	with (instance_find(o_dialogue, i)) event_user(EVENT_LOGIC);
}

// run actor logic
for (var i = 0; i < instance_number(o_actor); i++) {
	with (instance_find(o_actor, i)) event_user(EVENT_LOGIC);
}

// update hitboxes
for (var i = 0; i < instance_number(o_hitbox); i++) {
	with (instance_find(o_hitbox, i)) event_user(EVENT_LOGIC);
}

// handle always check states
for (var i = 0; i < instance_number(o_actor); i++) {
	with (instance_find(o_actor, i)) {
		for (var k = 0; k < ds_list_size(always_check); k++) {
			if (scr_actor_changestate(always_check[|k])) {
				state = always_check[|k];
				k = ds_list_size(always_check);
			}
		}
	}
}

// interacts (does it matter where I put this??)
for (var i = 0; i < instance_number(o_interact); i++) {
	with (instance_find(o_interact, i)) event_user(0);
}

// destroy killed actors
for (var i = 0; i < instance_number(o_actor); i++) {
	if (instance_find(o_actor, i).killed) instance_destroy(instance_find(o_actor, i));
}
