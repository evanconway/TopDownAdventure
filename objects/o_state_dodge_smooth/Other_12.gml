/// @description Remain

remain = true;
if (stage == DODGE.DONE) {
	remain = false;
	actor.act_alpha = 1;
	// Set logged button presses
	for (var i = 0; i < ds_list_size(dodge_buffer_buttons); i++) {
		if (ds_list_find_value(dodge_buffer_pressed, i)) {
			/*
			Remember that the indexes of the two lists are in parallel. To
			the enum of the button pressed, we have to use the value stored
			in buttons at the same index as pressed that is true.
			*/
			var _button_enum = ds_list_find_value(dodge_buffer_buttons, i);
			with (actor.ai.controller) {
				release(_button_enum); // fixes bug where holding button cancels buffered input
				press(_button_enum);
			}
		}
		ds_list_set(dodge_buffer_pressed, i, false);
	}
}
