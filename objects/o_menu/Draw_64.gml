/// @description 

if (active) {
	draw_set_alpha(1);
	draw_set_font(menu_font);

	var _menu_height = string_height(ATOZ) * (ds_list_size(choices) + 1); // +1 for buffer
	if (title != undefined) _menu_height += (1 + title_space) * string_height(ATOZ);
	if (_menu_height < height_min) _menu_height = height_min;
	
	var _menu_width = menu_calcwidth();
	if (_menu_width < width_min) _menu_width = width_min;

	draw_set_color(menu_color);
	draw_rectangle(VIEW_W/2 - _menu_width/2 - border_width, VIEW_H/2 - _menu_height/2 - border_width, 
		VIEW_W/2 + _menu_width/2 + border_width, VIEW_H/2 + _menu_height/2 + border_width, false);
	
	draw_set_color(c_black);
	draw_rectangle(VIEW_W/2 - _menu_width/2, VIEW_H/2 - _menu_height/2, 
		VIEW_W/2 + _menu_width/2, VIEW_H/2 + _menu_height/2, false);

	var _topy = VIEW_H/2 - _menu_height/2 + string_height(ATOZ)/2;
	var _leftx = VIEW_W/2;
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	
	// draw title
	if (title != undefined) {
		draw_text(_leftx, _topy, title);
		_topy += (1 + title_space) * string_height(ATOZ);
	}
	
	// draw cursor
	draw_set_halign(fa_left);
	draw_text(_leftx - _menu_width/2 + border_width, _topy + string_height(ATOZ) * index, cursor);
}
