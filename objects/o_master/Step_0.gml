/// @description GAME STEP

///////////////////////////////////////////////////////////////////////
// THE MASTER STEP
///////////////////////////////////////////////////////////////////////

// determine input
with (o_input) event_user(EVENT_LOGIC);

with (global.focus) event_user(EVENT_LOGIC);

// we will have to create other menus once we're passed the init room.. I think?

for (var i = 0; i < instance_number(o_menu); i++) {
	with (instance_find(o_menu, i)) event_user(EVENT_LOGIC);
}

// pause menu
if (pause_menu != undefined && input_pressed(INPUT.START)) {
	scr_menu_toggleactivate(pause_menu);
}

///////////////////////////////////////////////////////////////////////
// END MASTER STEP
///////////////////////////////////////////////////////////////////////

// exit first room
if (room == 0) {
	room_goto(room_test);
}
