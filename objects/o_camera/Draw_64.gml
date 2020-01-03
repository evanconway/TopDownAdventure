/// @description Debug Info

/*
For some reason keyboard_check(ord("1")) isn't working for checking numbers.
We had to use a debug message to find out the right codes for numbers 1, 2, 
and 3 respectively. 
*/

if (global.debug_active) {
	draw_set_font(f_arial);
	draw_set_color(COLOR_DEBUG);
	draw_set_alpha(1);
	if (showdims) {
		draw_set_halign(fa_right);
		draw_set_valign(fa_top);
		var _texth = string_height(ATOZ);
		var i = 0;
		draw_text_bo(RESOLUTION_W - 1, i, "window_w: " + string(WINDOW_W));
		i += _texth;
		draw_text_bo(RESOLUTION_W - 1, i, "window_h: " + string(WINDOW_H));
		i += _texth;
		draw_text_bo(RESOLUTION_W - 1, i, "resolution_w: " + string(RESOLUTION_W));
		i += _texth;
		draw_text_bo(RESOLUTION_W - 1, i, "resolution_h: " + string(RESOLUTION_H));
		i += _texth;
		draw_text_bo(RESOLUTION_W - 1, i, "view_w: " + string(VIEW_W));
		i += _texth;
		draw_text_bo(RESOLUTION_W - 1, i, "view_h: " + string(VIEW_H));
		i += _texth;
		draw_text_bo(RESOLUTION_W - 1, i , 
			"X: " + string(camera_get_view_x(VIEW_CAMERA)) + "  Y: " + string(camera_get_view_y(VIEW_CAMERA)));
	}
	
	if (keyboard_check(ord("1"))) {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_bo(RESOLUTION_W/2, RESOLUTION_H/2, "Window");
	}

	if (keyboard_check(ord("2"))) {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color(COLOR_DEBUG);
		draw_set_alpha(1);
		draw_text_bo(RESOLUTION_W/2, RESOLUTION_H/2, "Resolution");
	}

	if (keyboard_check(ord("3"))) {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color(COLOR_DEBUG);
		draw_set_alpha(1);
		draw_text_bo(RESOLUTION_W/2, RESOLUTION_H/2, "View");
	}
}
