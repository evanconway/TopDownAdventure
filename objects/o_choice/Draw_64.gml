/// @description 

if (menu != undefined && menu.active) {
	draw_set_alpha(draw_alpha);
	draw_set_font(menu.menu_font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text(draw_x, draw_y, name);
}
