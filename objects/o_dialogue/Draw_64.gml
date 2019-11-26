/// @description 

if (active) {
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_rectangle(x - width/2 - 1, y - 1, x + width/2 + 1, y + height + 1, false);
	draw_set_color(c_black);
	draw_rectangle(x - width/2, y, x + width/2, y + height + 1, false);

	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);

	var _xstart = x - width/2 + text_offset;
	var _ystart = y + text_offset;
	var _text_height = string_height(ATOZ);
	var _text;

	// draw strings for lines up to line_cursor
	for (var i = 0; i <= y_cursor; i++) {
		if (i != y_cursor) _text = lines[|i];
		else _text = string_copy(lines[|i], 1, x_cursor); // strings are 1 based index!!!!!
		draw_text(_xstart, _ystart + i*_text_height, _text);
	}
}
