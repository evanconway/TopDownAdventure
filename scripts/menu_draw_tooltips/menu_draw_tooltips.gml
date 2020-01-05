// draws default select and back tooltips for menu

draw_set_font(menu_font);
var _menu_height = menu_calcheight();
var _menu_width = menu_calcwidth();
var _boty = VIEW_H/2 + _menu_height/2;
var _cenx = VIEW_W/2;
var _lefx = _cenx  - _menu_width/2 + MENU_SPACER;
var _ritx = _cenx + _menu_width/2 - MENU_SPACER;
var _spr = undefined;
if (o_input.using_gamepad) {
	// select
	_spr = scr_controller_icon(ds_grid_get(o_input.gamepad_assignment, INPUT.INTERACT, 0));
	if (_spr == undefined) _spr = scr_controller_icon(ds_grid_get(o_input.gamepad_assignment, INPUT.SELECT, 0));
	draw_set_halign(fa_left);
	draw_set_valign(fa_center); // see note at bottom
	var _va = sprite_get_height(_spr) / 2;
	draw_text(_lefx, _boty - _va, tool_select);
	_lefx += string_width(tool_select) + sprite_get_width(_spr);
	draw_sprite(_spr, 0, _lefx, _boty - sprite_get_height(_spr));
	// back
	_spr = scr_controller_icon(ds_grid_get(o_input.gamepad_assignment, INPUT.BACK, 0));
	if (_spr == undefined) _spr = scr_controller_icon(ds_grid_get(o_input.gamepad_assignment, INPUT.START, 0));
	draw_sprite(_spr, 0, _ritx, _boty - sprite_get_height(_spr));
	_ritx -= sprite_get_width(_spr);
	draw_set_halign(fa_right);
	draw_text(_ritx, _boty - _va, tool_back);
} else {
	draw_set_valign(fa_bottom);
	// select
	_spr = ds_grid_get(o_input.keyboard_assignment, INPUT.INTERACT, 0);
	if (_spr != NOASSIGNMENT) _spr = scr_string_keycheck(_spr);
	else _spr = scr_string_keycheck(ds_grid_get(o_input.keyboard_assignment, INPUT.SELECT, 0));
	draw_set_halign(fa_left);
	draw_text(_lefx, _boty, tool_select + _spr);
	// back
	_spr = ds_grid_get(o_input.keyboard_assignment, INPUT.BACK, 0);
	if (_spr != NOASSIGNMENT) _spr = scr_string_keycheck(_spr);
	else _spr = scr_string_keycheck(ds_grid_get(o_input.keyboard_assignment, INPUT.START, 0));
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
