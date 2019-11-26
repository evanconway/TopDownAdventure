/// @description Calculate Cursor/Chirps

if (typing) {
	if (type_time++ >= type_time_max) {
		type_time = 0;
		x_cursor++;
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
