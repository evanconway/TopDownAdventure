// Inherit the parent event
event_inherited();
title = undefined;
menu_background_color = undefined;
border_color = undefined;
tooltips = false;
offset_y = 30;
closeable = false;
var i = 0;
ds_list_set(choices, i, menu_createchoice(o_choice_newgame));
with (choices[|i++]) {
	name = "New Game";
}
ds_list_set(choices, i, menu_createchoice(o_choice));
with (choices[|i++]) {
	name = "Continue";
}
ds_list_set(choices, i, menu_createchoice(o_choice_menu));
with (choices[|i++]) {
	name = "Options";
	submenu = instance_create_depth(0, 0, depth - 1, o_menu_options);
}
ds_list_set(choices, i, menu_createchoice(o_choice_quit));
