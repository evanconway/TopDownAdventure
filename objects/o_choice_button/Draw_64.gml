/// @description 

if (menu != undefined && menu.active) {
	depth = menu.depth - 1;
	draw_set_alpha(draw_alpha);
	draw_set_font(menu.menu_font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text(draw_x_left, draw_y, name);
	draw_set_halign(fa_right);
	if (o_input.using_gamepad) {
		var _as1 = ds_grid_get(o_input.gamepad_assignment, button, 0);
		var _as2 = ds_grid_get(o_input.gamepad_assignment, button, 1);
		if (_as2 != NOASSIGNMENT) {
			draw_sprite(scr_controller_icon(_as2), 0, draw_x_right, draw_y);
			draw_x_right -= ICON_WIDTH;
			draw_text(draw_x_right, draw_y, DIVIDER);
			draw_x_right -= string_width(DIVIDER);
		}
		draw_sprite(scr_controller_icon(_as1), 0, draw_x_right, draw_y);
	}
	else draw_text(draw_x_right, draw_y, choice_button_string(button));
}
