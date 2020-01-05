/// @description Read Parent

// Inherit the parent event
event_inherited();
menu_font = f_menu2;
title = "Game Paused";
border_color = c_red;

var i = 0;
ds_list_set(choices, i, menu_createchoice(o_choice_back));
with (choices[|i++]) {
	name = "Return To Game";
}
ds_list_set(choices, i, menu_createchoice(o_choice_menu));
with (choices[|i++]) {
	name = "Options";
	submenu = instance_create_depth(0, 0, depth - 1, o_menu_options);
}
ds_list_set(choices, i, menu_createchoice(o_choice));
with (choices[|i++]) {
	name = "option 3";
}
ds_list_set(choices, i, menu_createchoice(o_choice_quit));
with(choices[|i]) {
	//submenu.depth = other.depth - 1;
}
