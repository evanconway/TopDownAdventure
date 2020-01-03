/// @param assignment
/// @param input

// returns true if given assignment is down

var result = false;

var _axison = -1; // -1 for no axis found, 0 for axis found but false, 1 for found and on
		
// switch for just axis
switch (argument[0]) {
	case GAMEPAD.LS_UP:
		_axison = gamepad_axis_value(o_input.gamepadID, gp_axislv) < o_input.deadzone * -1;
	break;
	case GAMEPAD.LS_DOWN:
		_axison = gamepad_axis_value(o_input.gamepadID, gp_axislv) > o_input.deadzone;
	break;
	case GAMEPAD.LS_LEFT:
		_axison = gamepad_axis_value(o_input.gamepadID, gp_axislh) < o_input.deadzone * -1;
	break;
	case GAMEPAD.LS_RIGHT:
		_axison = gamepad_axis_value(o_input.gamepadID, gp_axislh) > o_input.deadzone;
	break;
	case GAMEPAD.RS_UP:
		_axison = gamepad_axis_value(o_input.gamepadID, gp_axisrv) < o_input.deadzone * -1;
	break;
	case GAMEPAD.RS_DOWN:
		_axison = gamepad_axis_value(o_input.gamepadID, gp_axisrv) > o_input.deadzone;
	break;
	case GAMEPAD.RS_LEFT:
		_axison = gamepad_axis_value(o_input.gamepadID, gp_axisrh) < o_input.deadzone * -1;
	break;
	case GAMEPAD.RS_RIGHT:
		_axison = gamepad_axis_value(o_input.gamepadID, gp_axisrh) > o_input.deadzone;
	break;
}
if (_axison > 0 && !ds_grid_get(global.input, argument[1], 0)) result = true;

switch (argument[0]) {
	case GAMEPAD.DP_UP:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_padu);
	break;
	case GAMEPAD.DP_DOWN:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_padd);
	break;
	case GAMEPAD.DP_LEFT:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_padl);
	break;
	case GAMEPAD.DP_RIGHT:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_padr);
	break;
	case GAMEPAD.FACE1:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_face1);
	break;
	case GAMEPAD.FACE2:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_face2);
	break;
	case GAMEPAD.FACE3:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_face3);
	break;
	case GAMEPAD.FACE4:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_face4);
	break;
	case GAMEPAD.TRIGGER_L: // ( guess game maker doesn't see triggers as axis???
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_shoulderlb);
	break;
	case GAMEPAD.TRIGGER_R:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_shoulderrb);
	break;
	case GAMEPAD.BUMPER_L:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_shoulderl);
	break;
	case GAMEPAD.BUMPER_R:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_shoulderr);
	break;
	case GAMEPAD.LS_CLICK:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_stickl);
	break;
	case GAMEPAD.RS_CLICK:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_stickr);
	break;
	case GAMEPAD.SELECT:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_select);
	break;
	case GAMEPAD.START:
		result = gamepad_button_check_pressed(o_input.gamepadID, gp_start);
	break;
}

return result;
