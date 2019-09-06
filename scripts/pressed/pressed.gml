/// @function pressed(input, controller)
/// @description returns true/falst if input parameter of controller is pressed
/// @param {real} input from enum
/// @param {o_controller} controller option argument if called outside of controller

if (argument_count == 1) return ds_grid_get(buttons, argument[0], 1);
else with (argument[1]) return ds_grid_get(buttons, argument[0], 1);
