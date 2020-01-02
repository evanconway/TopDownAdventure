/// @param input_enum

//Returns true or false if the given input_enum is pressed in the global input object
var result = ds_grid_get(global.input, argument[0], 1);
return result;