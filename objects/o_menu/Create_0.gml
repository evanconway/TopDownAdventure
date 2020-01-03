/// @description Read Me
/*
Similar to our actors, we're going to have menus use "choice" objects to handle
a lot of the work of menus. This should allow us to easily add and remove
choices from menus. All the menu will do is check to see if buttons have been
pressed that change the choice option. I think we can even let the choice
objects handle "select" and "back" button presses. 
*/

active = false; // determines whether this state runs code or not

title = "MENU"; // set undefined for no menu title
title = undefined;
title_space = 0.25; // distance between title and rest of menu

index = 0;
cursor = " > ";
choices = ds_list_create(); 

menu_font = f_menu1;
menu_color = c_white;

width_min = 0;
height_min = 0;
border_width = 1;

// pulse current option
cur_alpha = 1;
cur_alpha_time = 0;
alpha_min = 0.3; // alpha max is 1
alpha_change_rate = 7;
alpha_change_amnt = 0.1;
