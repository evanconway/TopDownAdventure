/// @description set x/y of choices

if (active) {
	draw_set_alpha(1);
	draw_set_font(menu_font);
	var _menu_height = menu_calcheight();
	var _menu_width = menu_calcwidth();
	var _topy = VIEW_H/2 - _menu_height/2 + offset_y;
	var _cenx = VIEW_W/2 + offset_x;
	var _lefx = _cenx  - _menu_width/2 + menu_buffer();
	var _ritx = _cenx + _menu_width/2 - menu_buffer();
	
	// account for title space
	// spacer is above and below
	if (title != undefined) _topy += string_height(ATOZ) * title_lines + MENU_SPACER * 2;
	for (var i = 0; i < ds_list_size(choices); i++) {
		var _choice = choices[|i];
		_choice.draw_x = _cenx;
		_choice.draw_x_left = _lefx;
		if (cursor != undefined) _choice.draw_x_left += string_width(cursor);
		_choice.draw_x_right = _ritx;
		_choice.draw_y = _topy + string_height(ATOZ) * i;
		if (index == i) _choice.draw_alpha = cur_alpha;
		else _choice.draw_alpha = 1;
	}
}
