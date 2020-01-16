/// @param x
/// @param y
/// @param o_fx
/// @param depth

var result = undefined;

if (argument[2] == undefined) return result;

if (argument_count > 3) {
	result = instance_create_depth(argument[0], argument[1], argument[3], argument[2]);
} else {
	result = instance_create_depth(argument[0], argument[1], LAYER_EFFECTS, argument[2]);
}

return result;