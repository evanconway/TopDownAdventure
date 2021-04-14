function menu_draw_tooltips_startback() {
	// draws default select and back tooltips for menu

	draw_set_font(menu_font);
	var _menu_height = menu_calcheight();
	var _menu_width = menu_calcwidth();
	var _boty = VIEW_H/2 + _menu_height/2;
	var _cenx = VIEW_W/2;
	var _lefx = _cenx;
	var _ritx = _cenx + _menu_width/2 - MENU_SPACER;
	var _spr = undefined;
	var _c = "Cancel:";
	draw_set_valign(fa_bottom);
	if (o_input.using_gamepad) {
		// Start
		_spr = scr_controller_icon(ds_grid_get(o_input.gamepad_assignment, INPUT.START, 0));
		draw_set_halign(fa_left);
		_lefx -= (string_width(_c) + sprite_get_width(_spr))/2;
		draw_text(_lefx, _boty, _c);
		_lefx += string_width(_c) + sprite_get_width(_spr);
		draw_sprite(_spr, 0, _lefx, _boty - string_height(ATOZ));
	} else {
		// Start
		_spr = ds_grid_get(o_input.keyboard_assignment, INPUT.START, 0);
		_spr = scr_string_keycheck(_spr);
		draw_set_halign(fa_center);
		draw_text(_cenx, _boty, _c + _spr);
	}

	/*
	I wanted to make a note about text space. The default distance between fonts is so much bigger than I thought
	it would be. I don't know why I'm worrying so much about things lining up with different font sizes. The 
	resolution of the game is locked, so we don't have to worry about ui scaling. So just remember that for 
	the future, if you set valign to bottom, and draw text at the bottom of the menu, it still puts a toooon
	of space between the bottom menu border and the actual text. 
	*/



}
