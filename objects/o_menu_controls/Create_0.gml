/// @description 

// Inherit the parent event
event_inherited();
menu_font = f_menu2_small;
title = "Controls";

menu_color = c_green;
border_width = 2;

var i = 0;
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Up";
	button = INPUT.UP;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Down";
	button = INPUT.DOWN;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Left";
	button = INPUT.LEFT;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Right";
	button = INPUT.RIGHT;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Interact";
	button = INPUT.INTERACT;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Attack";
	button = INPUT.ATTACK;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Action 1";
	button = INPUT.BACK;
}
ds_list_set(choices, i, menu_createchoice(o_choice_button));
with (choices[|i++]) {
	name = "Action 2";
	button = INPUT.MAP;
}
ds_list_set(choices, i, menu_createchoice(o_choice_back));
