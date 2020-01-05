/// @description 

// Inherit the parent event
event_inherited();
menu_font = f_menu2;
title = "Options";
border_color = c_blue;

var i = 0;
ds_list_set(choices, i, menu_createchoice(o_choice_menu));
with (choices[|i++]) {
	name = "Controls";
	submenu = instance_create_depth(0, 0, depth - 1, o_menu_controls);
}
ds_list_set(choices, i, menu_createchoice(o_choice));
with (choices[|i++]) {
	name = "Screen";
}
ds_list_set(choices, i, menu_createchoice(o_choice));
with (choices[|i++]) {
	name = "Sound";
}
//ds_list_set(choices, i, menu_createchoice(o_choice_back));
