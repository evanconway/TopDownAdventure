/// @description GAME STEP

// calculate user input
with (o_input) event_user(EVENT_LOGIC);

/*
For no reason other than because we want it, we will make the game pauseable at almost
any time in the game. This includes cutscenes, hitstun, in dialogue, etc. There will be
just a few cases where we can't pause, and all of them are related to the main menu.
So, all code that prevents pausing will be here.
*/
var canpause = true;

if (room == room_mainmenu) canpause = false;
if (instance_exists(o_scene_newgame)) canpause = false;
if (instance_exists(o_scene_goto_mainmenu)) canpause = false; // not needed, but want to make intended behavior clear, see event for details

if (input_pressed(INPUT.START) && !pausemenu.active && canpause) {
	with (instance_create_depth(0, 0, LAYER_MASTER, o_event_menu_open)) menu = other.pausemenu;
} 

// THE GAME UPDATE
with (ds_stack_top(global.focus)) event_user(EVENT_LOGIC);

// pause menu logic
with (o_event_menu_open) if (menu == other.pausemenu) {
	audio_pause_all();
}
with (o_event_menu_close) if (menu == other.pausemenu) {
	audio_resume_all();
}

// resolve menus
with (o_menu) event_user(EVENT_LOGICEND)

// update camera position
with (o_camera) event_user(EVENT_LOGIC);

// set previous asix values for input
with (o_input) event_user(EVENT_LOGICEND);

// delete all events
with (o_event) instance_destroy(id);
