/// @description Event Handling

// this auto-resets variables when they're not needed
if (id != focus_cur()) {
	cur_alpha = 1;
	cur_alpha_time = 0;
	if (!active) index = 0;
}

// event handling

if (instance_exists(o_event_menu_closeall)) {
	active = false;
	cur_alpha = 1;
	cur_alpha_time = 0;
	index = 0;
}

if (instance_exists(o_event_menu_close) && focus_cur() == id) {
	focus_pop();
	active = false;
	cur_alpha = 1;
	cur_alpha_time = 0;
	index = 0;
}

/*
Handling close events before open events lets us do things like close all
open menus, but then open a specific one. 
*/

with (o_event_menu_active) if (menu == other) {
	other.active = active;
}

with (o_event_menu_open) if (menu == other) {
	focus_push(other);
	other.active = true;
}