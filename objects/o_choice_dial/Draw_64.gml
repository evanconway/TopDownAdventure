/// @description 

if (menu != undefined && menu.active) {
	draw_set_alpha(draw_alpha);
	draw_set_font(menu.menu_font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	if (menu.cur_choice == id) draw_set_color(menu.choice_color_sel);
	else draw_set_color(menu.choice_color_def);
	// attempt to create centered text using widthmax value
	draw_x -= string_width(name + dial_sep + dial_value_widthmax)/2;
	draw_text_floor(draw_x, draw_y, name + dial_sep);
	draw_x += string_width(name + dial_sep);
	if (dial_value_script != undefined) draw_text_floor(draw_x, draw_y, script_execute(dial_value_script));
}
