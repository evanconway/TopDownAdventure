/// @description Calculate Cursor/Chirps

switch (state) {
	case DIALOGUE.OFF:
	width_cur = 0;
	height_cur = 0;
	cursor_x = 0;
	cursor_y = 0;
	// the dialogue does not automatically advance to next state, script must be called.
	break;
	case DIALOGUE.OPENING:
	/*
	We want the x and y portions of the box to expand evenly, so the we create a temporary
	expand rate for the y values that is proportionaly equal to the x values expand rate.
	*/
	if (expand_rate > 0) {
		var _y_expand = expand_rate * height / width;
		width_cur += expand_rate;
		height_cur += _y_expand;
		width_cur = clamp(width_cur, 0, width);
		height_cur = clamp(height_cur, 0, height);
		if (width_cur == width && height_cur == height) state++;
	} else {
		width_cur = width;
		height_cur = height;
		state++;
	}
	break;
	case DIALOGUE.TYPING:
	width_cur = width;
	height_cur = height;
	if (++type_time >= type_time_max) {
		type_time = 0;
		cursor_x += type_cursor_adv;
		if (cursor_x < 1) cursor_x = 1; // strings are 1 based
		scr_play_sfx(chirp);
		if (cursor_x >= string_length(lines[|cursor_y])) {
			cursor_x -= string_length(lines[|cursor_y]);
			if (cursor_x < 1) cursor_x = 1;
			cursor_y++
			if (cursor_y >= ds_list_size(lines)) {
				cursor_y = ds_list_size(lines) - 1;
				cursor_x = string_length(lines[|cursor_y]);
				state++;
			}
		}
	}
	break;
	case DIALOGUE.STATIC:
	width_cur = width;
	height_cur = height;
	cursor_y = ds_list_size(lines) - 1;
	cursor_x = string_length(lines[|cursor_y]);
	// the dialogue does not automatically advance to next state, script must be called.
	break;
	case DIALOGUE.CLOSING:
	cursor_y = 0;
	cursor_x = 0;
	if (expand_rate > 0) {
		var _y_expand = expand_rate * height / width;
		width_cur -= expand_rate;
		height_cur -= _y_expand;
		width_cur = clamp(width_cur, 0, width);
		height_cur = clamp(height_cur, 0, height);
		if (width_cur == 0 && height_cur == 0) state = DIALOGUE.OFF;
	} else {
		width_cur = 0;
		height_cur = 0;
		state = DIALOGUE.OFF;
	}
	break;
}
