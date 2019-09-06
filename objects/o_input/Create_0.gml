/// @description Read Me

enum INPUT {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	ATTACK,
	INTERACT,
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
	SELECT
}

gamepad_assignment = array_create(INPUT.SIZE);
gamepad_assignment[INPUT.UP] = GAMEPAD.LS_UP;
gamepad_assignment[INPUT.DOWN] = GAMEPAD.LS_DOWN;
gamepad_assignment[INPUT.LEFT] = GAMEPAD.LS_LEFT;
gamepad_assignment[INPUT.RIGHT] = GAMEPAD.LS_RIGHT;
gamepad_assignment[INPUT.ATTACK] = GAMEPAD.FACE1;
gamepad_assignment[INPUT.INTERACT] = GAMEPAD.FACE2;

deadzone = 0.5;

// keyboard inputs stored as key codes
keyboard_assignment = array_create(INPUT.SIZE);
keyboard_assignment[INPUT.UP] = ord("W");
keyboard_assignment[INPUT.DOWN] = ord("S");
keyboard_assignment[INPUT.LEFT] = ord("A");
keyboard_assignment[INPUT.RIGHT] = ord("D");
keyboard_assignment[INPUT.ATTACK] = ord("J");
keyboard_assignment[INPUT.INTERACT] = ord("K");
