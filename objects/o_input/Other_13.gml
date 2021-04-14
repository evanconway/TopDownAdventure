/// @description Set axis prev values

/*
This is kind of janky, and not smart programming, but whatever. Since the
enumerators for the gamepad_input and axis are the exact same for the first 8
values (the gamepad axis), we can use i for both of them.
*/

for (var i = 0; i < AXIS_PREV.SIZE; i++) {
	ds_list_set(gamepad_axisprev, i, scr_gamepad_down(i));
}
