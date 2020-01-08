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
with (o_actor) event_user(EVENT_LOGIC);

// reset state values
with (o_state) event_user(EVENT_LOGICEND);

// update hitboxes
with (o_hitbox) event_user(EVENT_LOGIC);

// fx 
with (o_fx) event_user(EVENT_LOGIC);

// handle always check states
with (o_actor) {
	for (var k = 0; k < ds_list_size(always_check); k++) {
		if (scr_actor_changestate(always_check[|k])) {
			state = always_check[|k];
			k = ds_list_size(always_check);
		}
	}
}

// interacts 
/*
Does it matter where interacts do their checks and run logic? To avoid conflicts,
interact will only check for activation when the gameworld is the focus object
*/
if (focus_cur() == global.gameworld) with (o_interact) event_user(1);

// destroy killed actors

with(o_actor) {
	if (killed) {
		if (id != global.player) instance_destroy(id);
		else if (focus_cur() == other) playerdied();
		/* We to explain that ^^^
		We want our player death scene to start after the hitstun and shader effects
		have finished. The code that removes those effects are in the actor update
		and the fx update. If we want those effects to go away, we have to wait
		for the game focus to finish with the actor freezer object, and return to
		the game world.
		*/
	}
}
