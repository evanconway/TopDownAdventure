function menu_calcheight() {
	/*
	Automatically generates height of menu
	the height of the menu is comprised of:
	the height of all choices
	the height of the title (times number of lines)
	the height of the tool tips
	then finally, if all that combined is still less than the min height, the 
	height is set to min height. 
	*/

	draw_set_font(menu_font);
	var _menu_height = string_height(ATOZ) * ds_list_size(choices);
	if (title != undefined) _menu_height += string_height(ATOZ) * title_lines + MENU_SPACER * 2;
	if (tooltips) _menu_height += string_height(ATOZ); // space for tool tips
	if (_menu_height < height_min) _menu_height = height_min;
	return _menu_height;



}
