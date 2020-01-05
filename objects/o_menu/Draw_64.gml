/// @description 

if (active) {
	draw_set_alpha(1);
	draw_set_font(menu_font);
	var _menu_height = menu_calcheight();
	var _menu_width = menu_calcwidth();

	// draw menu box
	draw_set_color(border_color);
	draw_rectangle(VIEW_W/2 - _menu_width/2 - border_width, VIEW_H/2 - _menu_height/2 - border_width, 
		VIEW_W/2 + _menu_width/2 + border_width, VIEW_H/2 + _menu_height/2 + border_width, false);

	draw_set_color(c_black);
	draw_rectangle(VIEW_W/2 - _menu_width/2, VIEW_H/2 - _menu_height/2, 
		VIEW_W/2 + _menu_width/2, VIEW_H/2 + _menu_height/2, false);

	var _topy = VIEW_H/2 - _menu_height/2 + MENU_SPACER;
	var _cenx = VIEW_W/2;
	var _lefx = _cenx  - _menu_width/2;
	//var _ritx = _cenx + _menu_width/2;

	// draw title
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(menu_color);
	if (title != undefined) {
		draw_text(_cenx, _topy, title);
		_topy += string_height(ATOZ) * title_lines + MENU_SPACER;
	}

	// draw cursor
	if (cursor != undefined && focus_cur() == id) {
		draw_set_halign(fa_left);
		draw_text(_lefx + menu_buffer()/2, _topy + string_height(ATOZ) * index, cursor);
	}

	// tool tips
	if (tooltips && focus_cur() == id) script_execute(tooltips_script);
}
