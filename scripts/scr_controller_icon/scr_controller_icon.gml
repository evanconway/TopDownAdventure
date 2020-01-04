/// @param input_enum

// returns appropriate sprite icon for given input enum

var result = undefined;

switch (argument0) {
	case GAMEPAD.LS_UP:
	result = s_Lstick_up;
	break;
	case GAMEPAD.LS_DOWN:
	result = s_Lstick_down;
	break;
	case GAMEPAD.LS_LEFT:
	result = s_Lstick_left;
	break;
	case GAMEPAD.LS_RIGHT:
	result = s_Lstick_right;
	break;
	case GAMEPAD.LS_CLICK:
	result = s_Lstick_click;
	break;
	case GAMEPAD.RS_UP:
	result = s_Rstick_up;
	break;
	case GAMEPAD.RS_DOWN:
	result = s_Rstick_down;
	break;
	case GAMEPAD.RS_LEFT:
	result = s_Rstick_left;
	break;
	case GAMEPAD.RS_RIGHT:
	result = s_Rstick_right;
	break;
	case GAMEPAD.RS_CLICK:
	result = s_Rstick_click;
	break;
	case GAMEPAD.DP_UP:
	result = s_dpad_up;
	break;
	case GAMEPAD.DP_DOWN:
	result = s_dpad_down;
	break;
	case GAMEPAD.DP_LEFT:
	result = s_dpad_left;
	break;
	case GAMEPAD.DP_RIGHT:
	result = s_dpad_right;
	break;
	case GAMEPAD.FACE1:
	result = s_button_A;
	break;
	case GAMEPAD.FACE2:
	result = s_button_B;
	break;
	case GAMEPAD.FACE3:
	result = s_button_X;
	break;
	case GAMEPAD.FACE4:
	result = s_button_Y;
	break;
	case GAMEPAD.BUMPER_L:
	result = s_bumper_L;
	break;
	case GAMEPAD.BUMPER_R:
	result = s_bumper_R;
	break;
	case GAMEPAD.TRIGGER_L:
	result = s_trigger_L;
	break;
	case GAMEPAD.TRIGGER_R:
	result = s_trigger_R;
	break;
	case GAMEPAD.START:
	result = s_start;
	break;
	case GAMEPAD.SELECT:
	result = s_select;
	break;
}

return result;
