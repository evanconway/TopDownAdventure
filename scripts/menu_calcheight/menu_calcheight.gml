/*
Automatically generates height based on type of choice, number
of choices, font size, etc.
*/
draw_set_font(menu_font);
var _menu_height = string_height(ATOZ) * (ds_list_size(choices) + 1); // +1 for buffer
if (title != undefined) _menu_height += (1 + title_space) * string_height(ATOZ);
if (tooltips) _menu_height += string_height(ATOZ); // space for tool tips
if (_menu_height < height_min) _menu_height = height_min;
return _menu_height;
