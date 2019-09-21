/// @description Read Parent

// Inherit the parent event
event_inherited();

var i = 0;
ds_list_set(choices, i, scr_menu_createchoice(o_choice));
with (choices[|i++]) {
	name = "option 1";
}
ds_list_set(choices, i, scr_menu_createchoice(o_choice));
with (choices[|i++]) {
	name = "option 2";
}
ds_list_set(choices, i, scr_menu_createchoice(o_choice));
with (choices[|i++]) {
	name = "option 3";
}
ds_list_set(choices, i, scr_menu_createchoice(o_choice));
with (choices[|i++]) {
	name = "option 4";
}