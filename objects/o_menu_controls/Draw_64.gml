/// @description 

// Inherit the parent event
event_inherited();

if (active) {
	var _topy = VIEW_H/2 + string_height(ATOZ) - menu_calcheight()/2 + MENU_SPACER;
	var _x = VIEW_W/2;
	draw_set_valign(fa_top);

	/*
	We're going to use a magic number to get this title centered. It's
	just not worth the effort of trying to make something nice and 
	clean.
	*/
	var _t1 = "(press ";
	var _t2 = " to clear)";
	var _as = undefined;
	if (o_input.using_gamepad) {
		_as = ds_grid_get(o_input.gamepad_assignment, INPUT.ATTACK, 0);
		if (_as != NOASSIGNMENT) {
			draw_set_halign(fa_left);
			_x -= (string_width(_t1 + _t2) + sprite_get_width(scr_controller_icon(_as)))/2;
			draw_text(_x, _topy, _t1);
			_x += string_width(_t1) + sprite_get_width(scr_controller_icon(_as));
			draw_sprite(scr_controller_icon(_as), 0, _x, _topy);
			draw_text(_x, _topy, _t2);
		}
	} else {
		_as = ds_grid_get(o_input.keyboard_assignment, INPUT.ATTACK, 0);
		if (_as != NOASSIGNMENT) {
			draw_set_halign(fa_center); 
			draw_text(_x, _topy, _t1 + choice_button_string(INPUT.ATTACK) + _t2);
		}
	}
}
