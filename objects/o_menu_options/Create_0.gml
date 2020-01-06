/// @description 

// Inherit the parent event
event_inherited();
title = "Options";
border_color = c_blue;

var i = 0;
ds_list_set(choices, i, menu_createchoice(o_choice_menu));
with (choices[|i++]) {
	name = "Controls";
	submenu = instance_create_depth(0, 0, depth - 1, o_menu_controls);
}
ds_list_set(choices, i, menu_createchoice(o_choice_dial));
with (choices[|i++]) {
	name = "Screen";
	dial_increase_script = scr_window_inc;
	dial_decrease_script = scr_window_dec;
	dial_value_script = scr_window_string;
	dial_value_widthmax = "9999x9999";
}
ds_list_set(choices, i, menu_createchoice(o_choice_dial));
with (choices[|i++]) {
	name = "SFX Volume";
	dial_increase_script = scr_sfx_inc;
	dial_decrease_script = scr_sfx_dec;
	dial_value_script = scr_sfx_string;
	dial_value_widthmax = "10";
}
ds_list_set(choices, i, menu_createchoice(o_choice_dial));
with (choices[|i++]) {
	name = "Music Volume";
	dial_increase_script = scr_music_inc;
	dial_decrease_script = scr_music_dec;
	dial_value_script = scr_music_string;
	dial_value_widthmax = "10";
}
