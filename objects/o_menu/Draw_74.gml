/// @description set x/y of choices

if (active) {
	draw_set_font(menu_font);
	var _menu_height = string_height(ATOZ) * (ds_list_size(choices) + 1); // +1 for buffer
	if (title != undefined) _menu_height += (1 + title_space) * string_height(ATOZ);
	if (_menu_height < height_min) _menu_height = height_min;
	
	var _menu_width = menu_calcwidth();
	if (_menu_width < width_min) _menu_width = width_min;

	var _topy = VIEW_H/2 - _menu_height/2 + string_height(ATOZ)/2; // add half string height so not too close to border
	var _leftx = VIEW_W/2;
	
	// account for title space
	_topy += (1 + title_space) * string_height(ATOZ);
	
	for (var i = 0; i < ds_list_size(choices); i++) {
		var _choice = choices[|i];
		_choice.draw_x = _leftx;
		_choice.draw_x_left = _leftx - _menu_width/2 + border_width + string_width(cursor);
		_choice.draw_x_right = _leftx + _menu_width/2 - border_width;
		_choice.draw_y = _topy + string_height(ATOZ) * i;
		if (index == i) _choice.draw_alpha = cur_alpha;
		else _choice.draw_alpha = 1;
	}
}
