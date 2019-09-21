/// @description Read Me
/*
Similar to our actors, we're going to have menus use "choice" objects to handle
a lot of the work of menus. This should allow us to easily add and remove
choices from menus. All the menu will do is check to see if buttons have been
pressed that change the choice option. I think we can even let the choice
objects handle "select" and "back" button presses. 
*/

active = false; // determines whether this state runs code or not

index = 0;
choices = ds_list_create(); 

menu_font = f_menu1;
menu_color = c_red;

width_min = 50;
height_min = 50;
border_width = 1;
