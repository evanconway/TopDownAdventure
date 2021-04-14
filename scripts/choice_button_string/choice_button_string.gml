/// @param button_enum
function choice_button_string(argument0) {

	// this script doesn't make sense anymore because we no longer use strings for controller icons

	var result = "No assignment";

	if (argument0 >= 0 && argument0 < INPUT.SIZE) {
		if (o_input.using_gamepad) {
			var _gpID = ds_grid_get(o_input.gamepad_assignment, argument0, 0);
			if (_gpID != NOASSIGNMENT) {
				result = scr_string_gpcheck(_gpID);
				_gpID = ds_grid_get(o_input.gamepad_assignment, argument0, 1);
				if (_gpID != NOASSIGNMENT) result += DIVIDER + scr_string_gpcheck(_gpID);
			}
		} else {
			var _kbID = ds_grid_get(o_input.keyboard_assignment, argument0, 0);
			if (_kbID != NOASSIGNMENT) {
				result = scr_string_keycheck(_kbID);
				_kbID = ds_grid_get(o_input.keyboard_assignment, argument0, 1);
				if (_kbID != NOASSIGNMENT) result += DIVIDER + scr_string_keycheck(_kbID);
			}
		}
	}

	return result;



}
