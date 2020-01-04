/// @description set x/y of choices

if (active) {
	draw_set_alpha(1);
	draw_set_font(menu_font);
	var _buffer = string_height(ATOZ) / 2; // for space from border
	var _menu_height = menu_calcheight();
	var _menu_width = menu_calcwidth();
	var _topy = VIEW_H/2 - _menu_height/2 + _buffer;
	var _cenx = VIEW_W/2;
	var _lefx = _cenx  - _menu_width/2 + _buffer;
	var _ritx = _cenx + _menu_width/2 - _buffer;
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	
	// account for title space
	_topy += (1 + title_space) * string_height(ATOZ);
	
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
