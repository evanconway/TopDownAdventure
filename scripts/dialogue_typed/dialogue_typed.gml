function dialogue_typed() {
	// returns true if the dialogue box has finished typing its text

	var result = true;

	if (y_cursor != ds_list_size(lines) - 1) result = false;
	if (x_cursor != string_length(lines[|y_cursor])) result = false;
	if (typing) result = false;

	return result;



}
