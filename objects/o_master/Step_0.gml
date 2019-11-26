/// @description GAME STEP

// assign player if possible
if (global.player == undefined && instance_number(o_actor) > 0) 
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

if (global.actors_freeze_time >= 0 && !scr_actors_frozen()) global.actors_freeze_time--;


// run dialogues
for (var i = 0; i < instance_number(o_dialogue); i++) {
	with (instance_find(o_dialogue, i)) event_user(EVENT_LOGIC);
}

// run actor logic
for (var i = 0; i < ds_list_size(global.actors_list); i++) {
	with (global.actors_list[|i]) event_user(EVENT_LOGIC);
}

// update hitboxes
for (var i = 0; i < instance_number(o_hitbox); i++) {
	with (instance_find(o_hitbox, i)) event_user(EVENT_LOGIC);
}

// handle always check states
for (var i = 0; i < ds_list_size(global.actors_list); i++) {
	with (global.actors_list[|i]) {
		for (var k = 0; k < ds_list_size(always_check); k++) {
			if (scr_actor_changestate(always_check[|k])) {
				global.actors_list[|i].state = always_check[|k];
				k = ds_list_size(always_check);
			}
		}
	}
}

// destroy killed actors
for (var i = 0; i < instance_number(o_actor); i++) {
	if (instance_find(o_actor, i).killed) instance_destroy(instance_find(o_actor, i));
}

// menus
if (room != 0) {
	// create pause menu once we're past initializer room
	if (pause_menu == undefined) pause_menu = instance_create_layer(x, y, LAYER_MENUS, o_menu_pause);
}

for (var i = 0; i < instance_number(o_menu); i++) {
	with (instance_find(o_menu, i)) event_user(EVENT_LOGIC);
}

// pause menu
if (pause_menu != undefined && ds_grid_get(global.input, INPUT.START, 1)) {
	if (pause_menu.active) {
		pause_menu.active = false;
		ds_list_delete(global.actor_freezers, ds_list_find_index(global.actor_freezers, pause_menu));
	} else {
		pause_menu.active = true;
		ds_list_add(global.actor_freezers, pause_menu);
	}
}

///////////////////////////////////////////////////////////////////////
// END MASTER STEP
///////////////////////////////////////////////////////////////////////

// exit first room
if (room == 0) {
	room_goto(room_test);
}
