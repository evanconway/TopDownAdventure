/// @description 

if (global.debug_active) {
	draw_set_font(f_arial);
	draw_set_color(COLOR_DEBUG);
	draw_set_alpha(1);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_text_bo(RESOLUTION_W - 1, RESOLUTION_H + 1, "DEBUG");
	draw_set_halign(fa_left);
	draw_text_bo(1, RESOLUTION_H - 1, "FPS: " + string(fps_real));
}
