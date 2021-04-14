/// @param button_enum
function release() {

	// forces press and down values for enum to false.

	var _input = argument[0];

	ds_grid_set(buttons, _input, 1, false);
	ds_grid_set(buttons, _input, 0, false);



}
