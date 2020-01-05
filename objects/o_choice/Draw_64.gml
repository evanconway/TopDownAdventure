/// @description 

if (menu != undefined && menu.active) {
	draw_set_alpha(draw_alpha);
	draw_set_font(menu.menu_font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	if (menu.cur_choice == id) draw_set_color(menu.choice_color_sel);
	else draw_set_color(menu.choice_color_def);
	draw_text_floor(draw_x, draw_y, name);
}
