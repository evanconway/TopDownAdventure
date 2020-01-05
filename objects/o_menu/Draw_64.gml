/// @description 

if (active) {
	draw_set_alpha(1);
	draw_set_font(menu_font);
	var _menu_height = menu_calcheight();
	var _menu_width = menu_calcwidth();

	var _x1;
	var _y1;
	var _x2;
	var _y2;

	// draw menu box
	draw_set_color(border_color);
	_x1 = VIEW_W/2 - _menu_width/2 - border_width;
	_y1 = VIEW_H/2 - _menu_height/2 - border_width;
	_x2 = VIEW_W/2 + _menu_width/2 + border_width;
	_y2 = VIEW_H/2 + _menu_height/2 + border_width;
	draw_rectangle(floor(_x1), floor(_y1), floor(_x2), floor(_y2), false);

	draw_set_color(c_black);
	_x1 = VIEW_W/2 - _menu_width/2;
	_y1 = VIEW_H/2 - _menu_height/2;
	_x2 = VIEW_W/2 + _menu_width/2;
	_y2 = VIEW_H/2 + _menu_height/2;
	draw_rectangle(floor(_x1), floor(_y1), floor(_x2), floor(_y2), false);

	var _topy = VIEW_H/2 - _menu_height/2 + MENU_SPACER;
	var _cenx = VIEW_W/2;
	var _lefx = _cenx  - _menu_width/2;
	//var _ritx = _cenx + _menu_width/2;

	// draw title
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(menu_color);
	if (title != undefined) {
		draw_text_floor(_cenx, _topy, title);
		_topy += string_height(ATOZ) * title_lines + MENU_SPACER;
	}

	// draw cursor
	if (cursor != undefined && focus_cur() == id) {
		draw_set_halign(fa_left);
		draw_text_floor(_lefx + menu_buffer()/2, _topy + string_height(ATOZ) * index, cursor);
	}

	// tool tips
	if (tooltips && focus_cur() == id) script_execute(tooltips_script);
}
