/// @description Calculate Cursor/Chirps

/*
We want the x and y portions of the box to expand evenly, so the we create a temporary
expand rate for the y values that is proportionaly equal to the x values expand rate.
*/

if (!scr_actors_frozen()) {
	var _y_expand = expand_rate * height / width;
	if (active) {
		if (width_cur < width) width_cur += expand_rate;
		if (height_cur < height) height_cur += _y_expand;
		if (width_cur > width) width_cur = width;
		if (height_cur > height) height_cur = height;
	} else {
		if (width_cur > 0) width_cur -= expand_rate;
		if (height_cur > 0) height_cur -= _y_expand;
		if (width_cur < 0) width_cur = 0;
		if (height_cur < 0) height_cur = 0;
	}

	if (typing && width_cur >= width && height_cur >= height) {
		if (type_time++ >= type_time_max) {
			type_time = 0;
			x_cursor++;
			scr_play_sfx(chirp);
			if (x_cursor >= string_length(lines[|y_cursor])) {
				x_cursor = 1; // strings are 1 based!!!!!
				y_cursor++
				if (y_cursor >= ds_list_size(lines)) {
					y_cursor = ds_list_size(lines) - 1;
					x_cursor = string_length(lines[|y_cursor]);
					typing = false;
				}
			}
		}
	}
}
