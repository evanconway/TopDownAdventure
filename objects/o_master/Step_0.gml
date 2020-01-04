/// @description GAME STEP

///////////////////////////////////////////////////////////////////////
// THE MASTER STEP
///////////////////////////////////////////////////////////////////////

// determine input
with (o_input) event_user(EVENT_LOGIC);

// pause menu
/*
We used a janky if else for the pause menu here because it closes 
itself regardless of being placed before or after the logic update.
It has to do with the fact that the pause menu checks for start
getting pressed to both open or close. 
*/
if (input_pressed(INPUT.START) && pause_menu != undefined && !pause_menu.active) {
	focus_push(pause_menu);
	pause_menu.active = true;
} else with (ds_stack_top(global.focus)) event_user(EVENT_LOGIC);

// we will have to create other menus once we're passed the init room.. I think?

///////////////////////////////////////////////////////////////////////
// END MASTER STEP
///////////////////////////////////////////////////////////////////////

// exit first room
if (room == 0) {
	room_goto(room_test);
}

// create pause menu once we're past initializer room
if (room != 0 && pause_menu == undefined) {
	pause_menu = instance_create_depth(x, y, LAYER_MENUS, o_menu_pause);
}