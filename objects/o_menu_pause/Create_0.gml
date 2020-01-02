/// @description Read Parent

// Inherit the parent event
event_inherited();
menu_font = f_menu2;
width_min = 80;

var i = 0;
ds_list_set(choices, i, menu_createchoice(o_choice_back));
with (choices[|i++]) {
	name = "Return To Game";
}
ds_list_set(choices, i, menu_createchoice(o_choice));
with (choices[|i++]) {
	name = "option 2";
}
ds_list_set(choices, i, menu_createchoice(o_choice));
with (choices[|i++]) {
	name = "option 3";
}
ds_list_set(choices, i, menu_createchoice(o_choice));
with (choices[|i++]) {
	name = "option 4";
}
