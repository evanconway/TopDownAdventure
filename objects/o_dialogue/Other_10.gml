/// @description Calculate Cursor/Chirps

if (active) {
	if (type_time++ >= type_time_max) {
		x_cursor++;
		if (x_cursor >= string_length(lines[|y_cursor])) {
			x_cursor = 1; // strings are 1 based!!!!!
			y_cursor++
			if (y_cursor >= ds_list_size(lines) - 1) {
				y_cursor = ds_list_size(lines) - 1;
				x_cursor = string_length(lines[|y_cursor]);
			}
		}
	}
} else {
	y_cursor = 0;
	x_cursor = 1; // strings are 1 based!!!!!
}
