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
	var _bstring = choice_button_string(button);
	draw_text(draw_x_right, draw_y, _bstring);

}
