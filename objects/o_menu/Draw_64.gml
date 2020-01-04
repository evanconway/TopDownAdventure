/// @description 

if (active) {
	draw_set_alpha(1);
	draw_set_font(menu_font);
	var _buffer = string_height(ATOZ) / 2; // for space from border
	var _menu_height = menu_calcheight();
	var _menu_width = menu_calcwidth();

	draw_set_color(menu_color);
	draw_rectangle(VIEW_W/2 - _menu_width/2 - border_width, VIEW_H/2 - _menu_height/2 - border_width, 
		VIEW_W/2 + _menu_width/2 + border_width, VIEW_H/2 + _menu_height/2 + border_width, false);
	
	draw_set_color(c_black);
	draw_rectangle(VIEW_W/2 - _menu_width/2, VIEW_H/2 - _menu_height/2, 
		VIEW_W/2 + _menu_width/2, VIEW_H/2 + _menu_height/2, false);

	var _topy = VIEW_H/2 - _menu_height/2 + _buffer;
	var _cenx = VIEW_W/2;
	var _lefx = _cenx  - _menu_width/2 + _buffer;
	var _ritx = _cenx + _menu_width/2 - _buffer;
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	
	// draw title
	if (title != undefined) {
		draw_text(_cenx, _topy, title);
		_topy += (1 + title_space) * string_height(ATOZ);
	}
	
	// draw cursor
	if (cursor != undefined) {
		draw_set_halign(fa_left);
		draw_text(_lefx, _topy + string_height(ATOZ) * index, cursor);
	}
	
	// tool tips
	if (tooltips) {
		_topy += string_height(ATOZ) * ds_list_size(choices);
		var _spr = undefined; // only used for gamepad
		if (o_input.using_gamepad) {
			// select
			_spr = scr_controller_icon(ds_grid_get(o_input.gamepad_assignment, INPUT.INTERACT, 0));
			if (_spr == undefined) _spr = scr_controller_icon(ds_grid_get(o_input.gamepad_assignment, INPUT.SELECT, 0))
			draw_set_halign(fa_left);
			draw_text(_lefx, _topy, tool_select);
			_lefx += string_width(tool_select) + sprite_get_width(_spr);
			draw_sprite(_spr, 0, _lefx, _topy + ICON_Y_OFFSET);
			// back
			_spr = scr_controller_icon(ds_grid_get(o_input.gamepad_assignment, INPUT.BACK, 0));
			if (_spr == undefined) _spr = scr_controller_icon(ds_grid_get(o_input.gamepad_assignment, INPUT.START, 0))
			draw_sprite(_spr, 0, _ritx, _topy + ICON_Y_OFFSET);
			_ritx -= sprite_get_width(_spr);
			draw_set_halign(fa_right);
			draw_text(_ritx, _topy, tool_back);
		} else {
		
		}
	}
}
