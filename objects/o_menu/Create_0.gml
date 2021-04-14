/// @description Read Me
/*
Similar to our actors, we're going to have menus use "choice" objects to handle
a lot of the work of menus. This should allow us to easily add and remove
choices from menus. All the menu will do is check to see if buttons have been
pressed that change the choice option. I think we can even let the choice
objects handle "select" and "back" button presses. 

Keeping track of spacing has been kind of a mess... we will have to do
a better job with menus on our next project. But we should not be dismayed,
for this system is already a big improvement over the un-maintanable spaghetti
mess that the old project was. When it comes to dealing with spacing on this
project, the 3 places we need to look are Draw GUI Begin, Draw GUI, and the 
menu calc width/height scripts. The actions these pieces take have to be the
same. So, if there's a _topy + menu_buffer()/3 in one, it should be in all
of them, and in the same spot. 

A note about the gui layer and sub-pixels:
I was having a problem where the menus were not actually drawing to the 
resolution I specified. It turns out I was drawing at non-integer locaitons.
According to ygg from the game maker discord:
"The GUI always take advantage of all the subpixels due to the way it works"
So, when drawing to the gui layer, we can never draw non-integer values. 
Frankly the more I use gamemaker the more it becomes clear you can just never
ever predict the drawing behavior if you use non-integer values. 
*/

offset_x = 0;
offset_y = 0;

active = false; // determines whether this state runs code or not
title = undefined; // set undefined for no menu title
closeable = true; // we really only need this for the main menu
 
//for adjusting menu height calculations when we need a more than 1 line title
title_lines = 1;

#macro MENU_SPACER menu_buffer()/5

index = 0;
cursor = ">";
choices = ds_list_create(); 

menu_font = f_menu3;
menu_color = c_white;
menu_background_color = c_black
border_color = c_white;

cur_choice = undefined;
choice_color_def = border_color;
choice_color_sel = c_yellow;

width_min = 0;
height_min = 0;
border_width = 4; // menu width and height do NOT include border (and if they do, fix it)

// pulse current option
cur_alpha = 1;
cur_alpha_time = 0;
alpha_min = 0.3; // alpha max is 1
alpha_change_rate = 7;
alpha_change_amnt = 0.1;

tooltips = true; // draw tool tips
tooltips_script = menu_draw_tooltips;
tool_select = "Select:";
tool_back = "Back:";
#macro ICON_Y_OFFSET 0
