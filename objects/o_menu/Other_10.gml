/// @description Logic

if (active) {
	var _dirpressed = false;
	var _indexprev = index;

	if (input_pressed(INPUT.UP) && !input_pressed(INPUT.DOWN)) {
		index--;
		index = clamp(index, 0, ds_list_size(choices) - 1);
		if (index != _indexprev) _dirpressed = true;
	}

	if (input_pressed(INPUT.DOWN) && !input_pressed(INPUT.UP)) {
		index++;
		index = clamp(index, 0, ds_list_size(choices) - 1);
		if (index != _indexprev) _dirpressed = true;
	}
	
	// set alpha values for current choice
	if (_dirpressed) {
		cur_alpha = 1;
		alpha_change_amnt = abs(alpha_change_amnt);
	} else {
		cur_alpha_time++;
		if (cur_alpha_time >= alpha_change_rate) {
			cur_alpha_time = 0;
			cur_alpha -= alpha_change_amnt;
			if (cur_alpha <= alpha_min) {
				cur_alpha = alpha_min;
				alpha_change_amnt *= -1;
			}
			if (cur_alpha >= 1) {
				cur_alpha = 1;
				alpha_change_amnt *= -1;
			}
		}
	}
	
	// execute choice logic
	/*
	Note that since many choices require different inputs, input checking is
	handled by choice logic, not the menu. That's why you don't see something 
	like: "if select pressed execute choice logic"
	*/
	var _choice = ds_list_find_value(choices, index);
	if (_choice != undefined && !_dirpressed) {
		with (_choice) event_user(0);
	}
} else {
	// reset pulse variables when not active
	cur_alpha = 1;
	alpha_change_amnt = abs(alpha_change_amnt);
}
