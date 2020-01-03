/*
Automatically sets width and height based on type of choice, number
of choices, font size, etc.
*/

// for now, we're just using the choice name as its width

draw_set_font(menu_font);
var _width = 0;
if (title != undefined) _width = string_width(title);

for (var i = 0; i < ds_list_size(choices); i++) {
	var _choice = choices[|i];
	var _choice_width = string_width(_choice.name) + string_width(cursor)*2; // note below
	if (_choice_width > _width) _width = _choice_width;
}

return _width;

/*
The menu width needs to be able to automatically accomadte the width of the choice as 
well as the width of the cursor. The way the menus are displayed, the choices are 
center aligned, and the cursor is left aligned. In order to ensure the cursor still 
looks nice with everything, is to make sure it fits on "both" sides of the center 
aligned choice, hence the * 2.
*/