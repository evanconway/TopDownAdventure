/// @description Read Me

enum INPUT {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	ATTACK,
	INTERACT,
	BACK,
	MAP,
	START,
	SELECT,
	SIZE // not an input, used to create size of button grid
}

// grid to store buttons, 2 slots are down(0) and pressed(1)
global.input = ds_grid_create(INPUT.SIZE, 2);

/*
This object is what actually grabs input from the user. Everything else in
the game will then poll this device for information. The master object
will update this object before most other things in the game. Which kinda
makes sense because almost everything else needs to know what the user given
as input. 
*/

// true when using gamepad, false when using keyboard.
using_gamepad = false;
gamepadID = undefined;

// controller inputs stored as enum to deal with sticks
/*
It's frustrating actually, because we almost don't need to make our own big enum,
but the game maker constants don't have separate constants for positive and 
negative values on the stick axis. We need those... and since we need those, we 
can't use the other game maker constants or risk getting things mixed up :(
*/
enum GAMEPAD {
	LS_UP,
	LS_DOWN,
	LS_LEFT,
	LS_RIGHT,
	LS_CLICK,
	RS_UP,
	RS_DOWN,
	RS_LEFT,
	RS_RIGHT,
	RS_CLICK,
	DP_UP,
	DP_DOWN,
	DP_LEFT,
	DP_RIGHT,
	FACE1, // A (xbox)
	FACE2, // B (xbox)
	FACE3, // X (xbox)
	FACE4, // Y (xbox)
	TRIGGER_R,
	TRIGGER_L,
	BUMPER_R,
	BUMPER_L,
	START,
	SELECT,
	SIZE
}

// Assignment of inputs
// every input is allowed 2 button/keys options
#macro NOASSIGNMENT -1
gamepad_assignment = ds_grid_create(INPUT.SIZE, 2);
ds_grid_set(gamepad_assignment, INPUT.UP, 0, GAMEPAD.LS_UP);
ds_grid_set(gamepad_assignment, INPUT.UP, 1, GAMEPAD.DP_UP);
ds_grid_set(gamepad_assignment, INPUT.DOWN, 0, GAMEPAD.LS_DOWN);
ds_grid_set(gamepad_assignment, INPUT.DOWN, 1, GAMEPAD.DP_DOWN);
ds_grid_set(gamepad_assignment, INPUT.LEFT, 0, GAMEPAD.LS_LEFT);
ds_grid_set(gamepad_assignment, INPUT.LEFT, 1, GAMEPAD.DP_LEFT);
ds_grid_set(gamepad_assignment, INPUT.RIGHT, 0, GAMEPAD.LS_RIGHT);
ds_grid_set(gamepad_assignment, INPUT.RIGHT, 1, GAMEPAD.DP_RIGHT);
ds_grid_set(gamepad_assignment, INPUT.ATTACK, 0, GAMEPAD.FACE3);
ds_grid_set(gamepad_assignment, INPUT.ATTACK, 1, NOASSIGNMENT);
ds_grid_set(gamepad_assignment, INPUT.INTERACT, 0, GAMEPAD.FACE1);
ds_grid_set(gamepad_assignment, INPUT.INTERACT, 1, NOASSIGNMENT);
ds_grid_set(gamepad_assignment, INPUT.BACK, 0, GAMEPAD.FACE2);
ds_grid_set(gamepad_assignment, INPUT.BACK, 1, NOASSIGNMENT);
ds_grid_set(gamepad_assignment, INPUT.MAP, 0, GAMEPAD.FACE4);
ds_grid_set(gamepad_assignment, INPUT.MAP, 1, NOASSIGNMENT);
ds_grid_set(gamepad_assignment, INPUT.START, 0, GAMEPAD.START);
ds_grid_set(gamepad_assignment, INPUT.START, 1, NOASSIGNMENT);
ds_grid_set(gamepad_assignment, INPUT.SELECT, 0, GAMEPAD.SELECT);
ds_grid_set(gamepad_assignment, INPUT.SELECT, 1, NOASSIGNMENT);

deadzone = 0.5;

// keyboard inputs stored as key codes
keyboard_assignment = ds_grid_create(INPUT.SIZE, 2);
ds_grid_set(keyboard_assignment, INPUT.UP, 0, ord("W"));
ds_grid_set(keyboard_assignment, INPUT.UP, 1, vk_up);
ds_grid_set(keyboard_assignment, INPUT.DOWN, 0, ord("S"));
ds_grid_set(keyboard_assignment, INPUT.DOWN, 1, vk_down);
ds_grid_set(keyboard_assignment, INPUT.LEFT, 0, ord("A"));
ds_grid_set(keyboard_assignment, INPUT.LEFT, 1, vk_left);
ds_grid_set(keyboard_assignment, INPUT.RIGHT, 0, ord("D"));
ds_grid_set(keyboard_assignment, INPUT.RIGHT, 1, vk_right);
ds_grid_set(keyboard_assignment, INPUT.ATTACK, 0, ord("J"));
ds_grid_set(keyboard_assignment, INPUT.ATTACK, 1, NOASSIGNMENT);
ds_grid_set(keyboard_assignment, INPUT.INTERACT, 0, ord("K"));
ds_grid_set(keyboard_assignment, INPUT.INTERACT, 1, NOASSIGNMENT);
ds_grid_set(keyboard_assignment, INPUT.BACK, 0, ord("L"));
ds_grid_set(keyboard_assignment, INPUT.BACK, 1, vk_backspace);
ds_grid_set(keyboard_assignment, INPUT.MAP, 0, ord("M"));
ds_grid_set(keyboard_assignment, INPUT.MAP, 1, vk_tab);
ds_grid_set(keyboard_assignment, INPUT.START, 0, vk_escape);
ds_grid_set(keyboard_assignment, INPUT.START, 1, NOASSIGNMENT);
ds_grid_set(keyboard_assignment, INPUT.SELECT, 0, vk_enter);
ds_grid_set(keyboard_assignment, INPUT.SELECT, 1, NOASSIGNMENT);
