/// @function press(input)
/// @description sets given input to on for controller, accounts for pressed or not
/// @param {real} enumerator choice for input
function press() {

	var _input = argument[0];

	if (!ds_grid_get(buttons, _input, 0)) ds_grid_set(buttons, _input, 1, true);
	ds_grid_set(buttons, _input, 0, true);



}
