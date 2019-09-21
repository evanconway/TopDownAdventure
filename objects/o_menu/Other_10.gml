/// @description Logic

if (ds_list_find_value(choices, index) != undefined) {
	with (choices[|index]) event_user(0);
}


if (ds_grid_get(global.input, INPUT.UP, 1) && !ds_grid_get(global.input, INPUT.DOWN, 1)) {
	index++;
	index = clamp(index, 0, ds_list_size(choices));
}
if (ds_grid_get(global.input, INPUT.DOWN, 1) && !ds_grid_get(global.input, INPUT.UP, 1)) {
	index--;
	index = clamp(index, 0, ds_list_size(choices));
}