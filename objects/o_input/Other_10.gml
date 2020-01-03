/// @description Determine User Input


// If no gamepadID has been determined, poll devices to find one.

// check all buttons
if (gamepadID == undefined) {
	for (var i = 0; i < gamepad_get_device_count(); i++) {
		for (var k = 0; k < gamepad_button_count(i); k++) {
			if (gamepad_button_check(i, k)) {
				gamepadID = i;
				k = gamepad_button_count(i);
				i = gamepad_get_device_count();
				using_gamepad = true;
			}
		}
	}
}

// check all axis, note: gamepad_axis_count(axis) is actually gamepad_axis_count(device)
if (gamepadID == undefined) {
	for (var i = 0; i < gamepad_get_device_count(); i++) {
		for (var k = 0; k < gamepad_axis_count(i); k++) {
			if (abs(gamepad_axis_value(i, k)) > deadzone) {
				gamepadID = i;
				k = gamepad_axis_count(i);
				i = gamepad_get_device_count();
				using_gamepad = true;
			}
		}
	}
}

// check if using gamepad
// check all buttons
if (gamepadID != undefined) {
	for (var i = 0; i < gamepad_button_count(gamepadID); i++) {
		if (gamepad_button_check(gamepadID, i)) {
			using_gamepad = true;
			i = gamepad_button_count(gamepadID);
		}
	}
}
// check all axis
if (gamepadID != undefined) {
	for (var i = 0; i < gamepad_axis_count(gamepadID); i++) {
		if (abs(gamepad_axis_value(gamepadID, i)) > deadzone) {
			using_gamepad = true;
			i = gamepad_axis_count(gamepadID);
		}
	}
}

// check if using keyboard
if (keyboard_check_pressed(vk_anykey)) using_gamepad = false;


// here is where we determine player input
if (using_gamepad) {
	for (var i = 0; i < INPUT.SIZE; i++) {
		var _a1 = ds_grid_get(gamepad_assignment, i, 0);
		var _a2 = ds_grid_get(gamepad_assignment, i, 1);
		var _a1_down = false;
		var _a2_down = false;
		var _a1_pressed = false;
		var _a2_pressed = false;
		if (_a1 != NOASSIGNMENT) {
			_a1_down = input_gamepad_down(_a1);
			_a1_pressed = input_gamepad_pressed(_a1, i);
		}
		if (_a2 != NOASSIGNMENT) {
			_a2_down = input_gamepad_down(_a2);
			_a2_pressed = input_gamepad_pressed(_a2, i);
		}
		ds_grid_set(global.input, i, 0, _a1_down || _a2_down);
		ds_grid_set(global.input, i, 1, _a1_pressed || _a2_pressed);
	}
} else {
	for (var i = 0; i < INPUT.SIZE; i++) {
		// if down or pressed are true for either assignment, then down/pressed are set true
		var _a1 = ds_grid_get(keyboard_assignment, i, 0);
		var _a2 = ds_grid_get(keyboard_assignment, i, 1);
		var _a1_down = false;
		var _a2_down = false;
		var _a1_pressed = false;
		var _a2_pressed = false;
		if (_a1 != NOASSIGNMENT) {
			_a1_down = keyboard_check(_a1);
			_a1_pressed = keyboard_check_pressed(_a1);
		}
		if (_a2 != NOASSIGNMENT) {
			_a2_down = keyboard_check(_a2);
			_a2_pressed = keyboard_check_pressed(_a2);
		}
		ds_grid_set(global.input, i, 0, _a1_down || _a2_down);
		ds_grid_set(global.input, i, 1, _a1_pressed || _a2_pressed);
	}
}
