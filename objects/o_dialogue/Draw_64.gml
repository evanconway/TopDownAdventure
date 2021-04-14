/// @description 

var _x = RESOLUTION_W/2;
var _y = RESOLUTION_H - height - 2; // there is a 1 pixel border around the box, hence the 2

if (state != DIALOGUE.OFF) {
	if (width_cur > 0 && height_cur > 0) {
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_rectangle(_x - floor(width_cur)/2 - 1, _y - 1, _x + floor(width_cur)/2 + 1, _y + floor(height_cur) + 1, false);
		draw_set_color(c_black);
		draw_rectangle(_x - floor(width_cur)/2, _y, _x + floor(width_cur)/2, _y + floor(height_cur), false);
	}

	if (width_cur == width && height_cur == height) {
		draw_set_font(font);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);

		var _xstart = _x - width/2 + text_offset;
		var _ystart = _y + text_offset;
		var _text_height = string_height(ATOZ);
		var _text;

		// draw strings for lines up to line_cursor
		for (var i = 0; i <= cursor_y; i++) {
			if (i != cursor_y) _text = lines[|i];
			else _text = string_copy(lines[|i], 1, floor(cursor_x)); // strings are 1 based index!!!!!
			/*  ^^^ explanation for that line:
			Strings are 1 based, yet at the start of every dialog we get to this line with a cursor_x
			value of 0. Why does it still work? It's because the script "string_copy" returns a sub
			string of lines[|i] from index 1 to cursor_x. The script is designed so that it returns an 
			empty string if the second index (cursor_x) is less than the first. 
			*/
			draw_text(_xstart, _ystart + i*_text_height, _text);
		}
	}
}
