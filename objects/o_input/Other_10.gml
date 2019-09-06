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
		
		var _axison = -1; // -1 for no axis found, 0 for axis found but false, 1 for found and on
		var _down = ds_grid_get(global.input, i, 0); // set pressed if already down
		
		// switch for just axis
		switch (gamepad_assignment[i]) {
			case GAMEPAD.LS_UP:
				_axison = gamepad_axis_value(gamepadID, gp_axislv) < deadzone * -1;
			break;
			case GAMEPAD.LS_DOWN:
				_axison = gamepad_axis_value(gamepadID, gp_axislv) > deadzone;
			break;
			case GAMEPAD.LS_LEFT:
				_axison = gamepad_axis_value(gamepadID, gp_axislh) < deadzone * -1;
			break;
			case GAMEPAD.LS_RIGHT:
				_axison = gamepad_axis_value(gamepadID, gp_axislh) > deadzone;
			break;
			case GAMEPAD.RS_UP:
				_axison = gamepad_axis_value(gamepadID, gp_axisrv) < deadzone * -1;
			break;
			case GAMEPAD.RS_DOWN:
				_axison = gamepad_axis_value(gamepadID, gp_axisrv) > deadzone;
			break;
			case GAMEPAD.RS_LEFT:
				_axison = gamepad_axis_value(gamepadID, gp_axisrh) < deadzone * -1;
			break;
			case GAMEPAD.RS_RIGHT:
				_axison = gamepad_axis_value(gamepadID, gp_axisrh) > deadzone;
			break;
		}
		if (_axison >= 0) {
			if (!_down && _axison) ds_grid_set(global.input, i, 1, true);
			if (_down && _axison) ds_grid_set(global.input, i, 1, false);
			ds_grid_set(global.input, i, 0, _axison);	
		}
		
		switch (gamepad_assignment[i]) {
			case GAMEPAD.DP_UP:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_padu));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_padu));
			break;
			case GAMEPAD.DP_DOWN:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_padd));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_padd));
			break;
			case GAMEPAD.DP_LEFT:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_padl));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_padl));
			break;
			case GAMEPAD.DP_RIGHT:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_padr));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_padr));
			break;
			case GAMEPAD.FACE1:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_face1));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_face1));
			break;
			case GAMEPAD.FACE2:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_face2));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_face2));
			break;
			case GAMEPAD.FACE3:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_face3));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_face3));
			break;
			case GAMEPAD.FACE4:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_face4));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_face4));
			break;
			case GAMEPAD.TRIGGER_L: // ( guess game maker doesn't see triggers as axis???
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_shoulderlb));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_shoulderlb));
			break;
			case GAMEPAD.TRIGGER_R:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_shoulderrb));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_shoulderrb));
			break;
			case GAMEPAD.BUMPER_L:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_shoulderl));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_shoulderl));
			break;
			case GAMEPAD.BUMPER_R:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_shoulderr));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_shoulderr));
			break;
			case GAMEPAD.LS_CLICK:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_stickl));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_stickl));
			break;
			case GAMEPAD.RS_CLICK:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_stickr));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_stickr));
			break;
			case GAMEPAD.SELECT:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_select));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_select));
			break;
			case GAMEPAD.START:
				ds_grid_set(global.input, i, 0, gamepad_button_check(gamepadID, gp_start));
				ds_grid_set(global.input, i, 1, gamepad_button_check_pressed(gamepadID, gp_start));
			break;
		}
	}
} else {
	for (var i = 0; i < INPUT.SIZE; i++) {
		ds_grid_set(global.input, i, 0, keyboard_check(keyboard_assignment[i]));
		ds_grid_set(global.input, i, 1, keyboard_check_pressed(keyboard_assignment[i]));
	}
}
