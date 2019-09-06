/// @function down(input, controller)
/// @description returns true/false if input parameter of controller is on
/// @param {real} input from enum
/// @param {o_controller} controller option controller argument if calling outside of controller


if (argument_count == 1) return ds_grid_get(buttons, argument[0], 0);
else with (argument[1]) return ds_grid_get(buttons, argument[0], 0);
