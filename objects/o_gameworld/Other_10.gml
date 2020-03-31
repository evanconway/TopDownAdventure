/// @description Update Gameworld

// this section deals with allowing us to change which actor the user controls. 
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
*/

// run actor logic
with (o_actor) event_user(EVENT_LOGIC);

// reset state values
with (o_state) event_user(EVENT_LOGICEND);

// fx 
with (o_fx) event_user(EVENT_LOGIC);

/*
29th of March, 2020
What used to be here is code updating specifically the defend state, then an update 
for all "always check" states. We are making a big change by making more things 
event driven. The defend state needed to run after the other states, and hitbox 
updates, because the state responded to the position of actors and hitboxes. But
since we are now using events from guard boxes and such, the defend state can update
along with the rest, and guard boxes are "updated" after everything else. The guard
boxes will tell the actor how to behave. 

The same logic applies for the hurt state, which was originally an "always check"
state. Now hurtboxes check if they've been hit, which drops "hurt" events.

We do still need to specially check the guard state, and hurt state, however they're
now lumped into a list of "guard_event_listeners" or "hurt_event_listeners.
*/

// update hitboxes 
with (o_hitbox) event_user(EVENT_LOGIC);

// update hurtboxes
with (o_hurtbox) event_user(EVENT_LOGIC);

// update guardboxes
with (o_guardbox) event_user(EVENT_LOGIC);

// handle guard events
with (o_state_defend) event_user(4);

// handle hurt events
with (o_state_hurt) event_user(4);

// hitbox event handling
with (o_hitbox) event_user(4);

// delete hitboxes
if (focus_cur() == global.gameworld)with (o_hitbox) event_user(2);

// interacts 
if (focus_cur() == global.gameworld) with (o_interact) event_user(1);

// doors
if (focus_cur() == global.gameworld) with (o_door) event_user(1);

// actor event handling
with (o_actor) event_user(4);

// destroy killed actors
with (o_event_actor_killed) {
	if (id_actor != global.player) instance_destroy(id_actor);
	else if (focus_cur() == global.gameworld) playerdied();
	/* We need to explain that ^^^
	We want our player death scene to start after the hitstun and shader effects
	have finished. The code that removes those effects are in the actor update
	and the fx update. If we want those effects to go away, we have to wait
	for the game focus to finish with the actor freezer object, and return to
	the game world.
	*/
}

// game freeze (hitstun)
var _freeze_time_global = 0;
with (o_event_game_freeze) {
	if (freeze_time > _freeze_time_global) _freeze_time_global = freeze_time;
}
if (_freeze_time_global > 0) {
	with (instance_create_depth(x, y, LAYER_MASTER, o_gameworld_freeze)) {
		freeze_time = _freeze_time_global;
		focus_push(id);
	}
}
