/// @description Logic

// Inherit the parent event
event_inherited();

// just copy o_input
with (controller) {
	for (var i = 0; i < INPUT.SIZE; i++) {
		ds_grid_set(buttons, i, 0, ds_grid_get(global.input, i, 0));
		ds_grid_set(buttons, i, 1, ds_grid_get(global.input, i, 1));
	}
}

/*
The code here created the strangets bugs ever. Perhaps I'll come back to 
it sometime, though by then the things this relies on may all be gone. 
TLDR: _booolean would get set true when pressing up but _array[0] and
_array[1] wouldn't. 

var _array = undefined;
var _buttons = controller.buttons;
var _booolean = undefined;

_booolean = keyboard_check_pressed(INPUT_UP);
if (_booolean) {
	show_debug_message("_bool is true");
}

_array = controller.buttons[INPUT.UP];
_array[0] = keyboard_check(INPUT_UP);
_array[1] = keyboard_check_pressed(INPUT_UP);


_array = controller.buttons[INPUT.DOWN];
_array[0] = keyboard_check(INPUT_DOWN);
_array[1] = keyboard_check_pressed(INPUT_DOWN);
_array = controller.buttons[INPUT.LEFT];
_array[0] = keyboard_check(INPUT_LEFT);
_array[1] = keyboard_check_pressed(INPUT_LEFT);
_array = controller.buttons[INPUT.RIGHT];
_array[0] = keyboard_check(INPUT_RIGHT);
_array[1] = keyboard_check_pressed(INPUT_RIGHT);
_array = controller.buttons[INPUT.ATTACK];
_array[0] = keyboard_check(INPUT_ATTACK);
_array[1] = keyboard_check_pressed(INPUT_ATTACK);
_array = controller.buttons[INPUT.INTERACT];
_array[0] = keyboard_check(INPUT_INTERACT);
_array[1] = keyboard_check_pressed(INPUT_INTERACT);


By the gods.... we tried to make controllers work 2D arrays instead of a bunch of 
variables, but no. I have never seen such illogical bugs before. We're just going
to use a bunch of variables instead. We'll leave the old code here though, and 
everywhere 2D arrays were referenced, just in case we somehow figure it out. Gosh,
we need to learn when to cut our losses sooner. 

with (controller) {
	_array = buttons[INPUT.UP];
	_array[0] = keyboard_check(INPUT_UP);
	_array[1] = keyboard_check_pressed(INPUT_UP);
	_array = buttons[INPUT.DOWN];
	_array[0] = keyboard_check(INPUT_DOWN);
	_array[1] = keyboard_check_pressed(INPUT_DOWN);
	_array = buttons[INPUT.LEFT];
	_array[0] = keyboard_check(INPUT_LEFT);
	_array[1] = keyboard_check_pressed(INPUT_LEFT);
	_array = buttons[INPUT.RIGHT];
	_array[0] = keyboard_check(INPUT_RIGHT);
	_array[1] = keyboard_check_pressed(INPUT_RIGHT);
	_array = buttons[INPUT.ATTACK];
	_array[0] = keyboard_check(INPUT_ATTACK);
	_array[1] = keyboard_check_pressed(INPUT_ATTACK);
	_array = buttons[INPUT.INTERACT];
	_array[0] = keyboard_check(INPUT_INTERACT);
	_array[1] = keyboard_check_pressed(INPUT_INTERACT);
}
*/
