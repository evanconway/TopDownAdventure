function menu_draw_tooltips() {
	// draws default select and back tooltips for menu

	draw_set_font(menu_font);
	var _menu_height = menu_calcheight();
	var _menu_width = menu_calcwidth();
	var _boty = VIEW_H/2 + _menu_height/2;
	var _cenx = VIEW_W/2;
	var _lefx = _cenx  - _menu_width/2 + MENU_SPACER;
	var _ritx = _cenx + _menu_width/2 - MENU_SPACER;
	var _spr = undefined;
	draw_set_valign(fa_bottom);
	if (o_input.using_gamepad) {
		// select
		_spr = scr_controller_icon(ds_grid_get(o_input.gamepad_assignment, INPUT.UI_SELECT, 0));
		draw_set_halign(fa_left);
		draw_text(_lefx, _boty, tool_select);
		_lefx += string_width(tool_select) + sprite_get_width(_spr);
		draw_sprite(_spr, 0, _lefx, _boty - string_height(ATOZ));
		// back
		_spr = scr_controller_icon(ds_grid_get(o_input.gamepad_assignment, INPUT.UI_CANCEL, 0));
		draw_sprite(_spr, 0, _ritx, _boty - string_height(ATOZ));
		_ritx -= sprite_get_width(_spr);
		draw_set_halign(fa_right);
		draw_text(_ritx, _boty, tool_back);
	} else {
		// select
		_spr = ds_grid_get(o_input.keyboard_assignment, INPUT.UI_SELECT, 0);
		_spr = scr_string_keycheck(_spr);
		draw_set_halign(fa_left);
		draw_text(_lefx, _boty, tool_select + _spr);
		// back
		_spr = ds_grid_get(o_input.keyboard_assignment, INPUT.UI_CANCEL, 0);
		_spr = scr_string_keycheck(_spr);
		draw_set_halign(fa_right);
		draw_text(_ritx, _boty, tool_back + _spr);
	}

	/*
	I wanted to make a note about text space. The default distance between fonts is so much bigger than I thought
	it would be. I don't know why I'm worrying so much about things lining up with different font sizes. The 
	resolution of the game is locked, so we don't have to worry about ui scaling. So just remember that for 
	the future, if you set valign to bottom, and draw text at the bottom of the menu, it still puts a toooon
	of space between the bottom menu border and the actual text. 
	*/



}
