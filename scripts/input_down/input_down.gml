/// @param input_enum
function input_down() {

	//Returns true or false if the given input_enum is down in the global input object

	return ds_grid_get(global.input, argument[0], 0);


}
