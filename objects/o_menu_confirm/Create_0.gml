/// @description Inherit Parent

event_inherited();
menu_font = f_menu2_small;
title = "Are you sure?";
width_min = 100;
ds_list_add(choices, menu_createchoice(o_choice_yes));
with (choices[|0]) name = "Yes";
ds_list_add(choices, menu_createchoice(o_choice_back));
with (choices[|1]) name = "No";

yes_pressed = false;
