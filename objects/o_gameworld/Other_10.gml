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

// run dialogues
/*
We ran into a bug where, once an interact object takes focus, the dialogues can't 
update if their logic is here. We're trying a radical idea. Dialogues are updated
discretly by whatever object needs them. Most of the time that will be interact 
objects

for (var i = 0; i < instance_number(o_dialogue); i++) {
	with (instance_find(o_dialogue, i)) event_user(EVENT_LOGIC);
}
*/

// run actor logic
for (var i = 0; i < instance_number(o_actor); i++) {
	with (instance_find(o_actor, i)) event_user(EVENT_LOGIC);
}

// update hitboxes
for (var i = 0; i < instance_number(o_hitbox); i++) {
	with (instance_find(o_hitbox, i)) event_user(EVENT_LOGIC);
}

// fx 
for (var i = 0; i < instance_number(o_fx); i++) {
	with (instance_find(o_fx, i)) event_user(EVENT_LOGIC);
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

// interacts 
/*
Does it matter where interacts do their checks and run logic? To avoid conflicts
interact will only check for activation when the gameworld is the focus object
*/
for (var i = 0; i < instance_number(o_interact); i++) {
	var _interact = instance_find(o_interact, i);
	if (focus_cur() == id) with (_interact) event_user(1);
}

// destroy killed actors
for (var i = 0; i < instance_number(o_actor); i++) {
	if (instance_find(o_actor, i).killed) instance_destroy(instance_find(o_actor, i));
}
